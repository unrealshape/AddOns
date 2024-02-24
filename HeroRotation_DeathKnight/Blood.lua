--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroDBC
local DBC = HeroDBC.DBC
-- HeroLib
local HL         = HeroLib
local Cache      = HeroCache
local Unit       = HL.Unit
local Player     = Unit.Player
local Target     = Unit.Target
local Pet        = Unit.Pet
local Spell      = HL.Spell
local Item       = HL.Item
-- HeroRotation
local HR         = HeroRotation
local Cast       = HR.Cast
local CDsON      = HR.CDsON
local AoEON      = HR.AoEON
local SmallCDsON = HeroRotationCharDB.Toggles[4]
local Opener = HeroRotationCharDB.Toggles[5]
local StopAutoSwap = HeroRotationCharDB.Toggles[12]
local QAMZ = HeroRotationCharDB.Toggles[13]
local QDeathgrip = HeroRotationCharDB.Toggles[14]
local UsePots = not HeroRotationCharDB.Toggles[15]
local QAsphyxiate = HeroRotationCharDB.Toggles[16]
local QGorefiends = HeroRotationCharDB.Toggles[80]
local QControlUndead = HeroRotationCharDB.Toggles[81]
local HoldDRW = HeroRotationCharDB.Toggles[82]
local QBloodBoil = HeroRotationCharDB.Toggles[84]
local HoldWeapon = HeroRotationCharDB.Toggles[17]
local HoldRaiseAlly = HeroRotationCharDB.Toggles[85]
local HoldAbomLimb = HeroRotationCharDB.Toggles[18]
local HoldDnd = HeroRotationCharDB.Toggles[83]
local HoldAMS = not HeroRotationCharDB.Toggles[183]
local AutoTaunt = HeroRotationCharDB.Toggles[72]
local TargetInMeleeRange;

local HealthstoneUsed = false
local QuakingR = 0
-- lua
local mathmin    = math.min
--- ============================ CONTENT ===========================
--- ======= APL LOCALS =======
-- luacheck: max_line_length 9999

-- Define S/I for spell and item arrays
local S = Spell.DeathKnight.Blood
local I = Item.DeathKnight.Blood

-- Create table to exclude above trinkets from On Use function
local OnUseExcludes = {
  --  I.TrinketName:ID(),
}

-- Rotation Var
local ShouldReturn
local VarDeathStrikeDumpAmt
local VarHeartStrikeRP
local VarHeartStrikeRPDRW
local IsTanking
local EnemiesMelee
local EnemiesMeleeCount
local HeartStrikeCount
local UnitsWithoutBloodPlague
local ghoul = HL.GhoulTable
local PoolforBS
local PoolforRes
local MagicDamageIncoming = 2
local LastTimeMagic = 999999
local amount = 2

-- GUI Settings
local Everyone = HR.Commons.Everyone
local Settings = {
  General = HR.GUISettings.General,
  Commons = HR.GUISettings.APL.DeathKnight.Commons,
  Blood = HR.GUISettings.APL.DeathKnight.Blood
}

-- Stun Interrupts List
local StunInterrupts = {
  {S.Asphyxiate, "Cast Asphyxiate (Interrupt)", function () return true; end},
}
local shouldcast = 0
local MOshouldcast = 0

local SuperstrainEquipped = Player:HasLegendaryEquipped(30)
local PhearomonesEquipped = Player:HasLegendaryEquipped(31)
local DeadliestCoilEquipped = Player:HasLegendaryEquipped(45)
local CrimsonRuneWeaponEquipped = Player:HasLegendaryEquipped(35)
  
HL:RegisterForEvent(function()
  equip = Player:GetEquipment()
  trinket1 = Item(0)
  trinket2 = Item(0)
  if equip[13] then
    trinket1 = Item(equip[13])
  end
  if equip[14] then
    trinket2 = Item(equip[14])
  end
  SuperstrainEquipped = Player:HasLegendaryEquipped(30)
  PhearomonesEquipped = Player:HasLegendaryEquipped(31)
  DeadliestCoilEquipped = Player:HasLegendaryEquipped(45)
  CrimsonRuneWeaponEquipped = Player:HasLegendaryEquipped(35)
end, "PLAYER_EQUIPMENT_CHANGED")

--Functions
local EnemyRanges = {5, 8, 10, 30, 40, 100}
local TargetIsInRange = {}
local function ComputeTargetRange()
  for _, i in ipairs(EnemyRanges) do
    if i == 8 or 5 then TargetIsInRange[i] = Target:IsInMeleeRange(i) end
    TargetIsInRange[i] = Target:IsInRange(i)
  end
end

local function num(val)
  if val then return 1 else return 0 end
end

local function bool(val)
  return val ~= 0
end

local function UnitsWithoutAggro(enemies)
  local WithoutAggro = 0
  if enemies ~= nil then
	  for _, CycleUnit in pairs(enemies) do
		if not Player:IsTanking(CycleUnit) and CycleUnit:GUID() ~= Target:GUID() and CycleUnit:AffectingCombat() then
		  WithoutAggro = WithoutAggro + 1
		end
	  end
  end
  return WithoutAggro
end
	
local function UnitsWithoutBP(enemies)
  local WithoutBPCount = 0
  if enemies ~= nil then
	  for _, CycleUnit in pairs(enemies) do
		if not CycleUnit:DebuffUp(S.BloodPlagueDebuff) then
		  WithoutBPCount = WithoutBPCount + 1
		end
	  end
  end
  return WithoutBPCount
end

local function EvaluateTargetIfFilterSoulReaper(TargetUnit)
  -- target_if=min:dot.soul_reaper.remains
  return (TargetUnit:DebuffRemains(S.SoulReaperDebuff))
end

local function EvaluateCycleGrowl(TargetUnit)
	if ((not Player:IsTanking(TargetUnit) and AutoTaunt) and (TargetUnit:AffectingCombat()) and TargetUnit:GUID() == Unit("mouseover"):GUID() and TargetUnit:NPCID() ~= 118044 and TargetUnit:IsInMeleeRange(30)) then
  		MOshouldcast = 156222
		return true
	elseif ((not Player:IsTanking(TargetUnit) and AutoTaunt) and (TargetUnit:AffectingCombat()) and TargetUnit:GUID() == Target:GUID() and TargetUnit:NPCID() ~= 118044 and TargetUnit:IsInMeleeRange(30)) then
  		shouldcast = 56222
		return true
	elseif ((not Player:IsTanking(TargetUnit) and AutoTaunt) and (TargetUnit:AffectingCombat()) and TargetUnit:NPCID() ~= 118044 and TargetUnit:IsInMeleeRange(30)) then
		return true
	end	
end

-- if=target.time_to_pct_35<5&active_enemies>=2&target.time_to_die>(dot.soul_reaper.remains+5)
local function EvaluateTargetIfSoulReaper(TargetUnit)
	if ((TargetUnit:TimeToX(35) < 35 and TargetUnit:TimeToDie() > (TargetUnit:DebuffRemains(S.SoulReaperDebuff) + 5)) and (TargetUnit:AffectingCombat()) and TargetUnit:GUID() == Unit("mouseover"):GUID() and TargetUnit:NPCID() ~= 118044 and TargetUnit:IsInMeleeRange(30)) then
  		MOshouldcast = 1343294
		return true
	elseif ((TargetUnit:TimeToX(35) < 35 and TargetUnit:TimeToDie() > (TargetUnit:DebuffRemains(S.SoulReaperDebuff) + 5)) and (TargetUnit:AffectingCombat()) and TargetUnit:GUID() == Target:GUID() and TargetUnit:NPCID() ~= 118044 and TargetUnit:IsInMeleeRange(30)) then
  		shouldcast = 343294
		return true
	elseif ((TargetUnit:TimeToX(35) < 35 and TargetUnit:TimeToDie() > (TargetUnit:DebuffRemains(S.SoulReaperDebuff) + 5)) and (TargetUnit:AffectingCombat()) and TargetUnit:NPCID() ~= 118044 and TargetUnit:IsInMeleeRange(30)) then
		return true
	end	
end

local function Precombat()
  -- flask
  -- food
  -- augmentation
  -- snapshot_stats
  if Everyone.TargetIsValid() then
    -- Manually added: Openers
    -- if S.DeathsCaress:IsReady() and not TargetInMeleeRange then
      -- if Cast(S.DeathsCaress, nil, nil, not Target:IsSpellInRange(S.DeathsCaress)) then shouldcast = 195292 return "deaths_caress precombat 2"; end
    -- end
    if S.Marrowrend:IsReady() and TargetInMeleeRange then
      if Cast(S.Marrowrend) then shouldcast = 195182 return "marrowrend precombat 4"; end
    end
    if S.BloodBoil:IsCastable() and TargetInMeleeRange then
      if Cast(S.BloodBoil,nil,nil,not Target:IsInMeleeRange(10)) then shouldcast = 50842 return "blood_boil precombat 6"; end
    end
  end
end

local function Defensives()
    if S.DeathStrike:IsReady() and (Settings.Commons.UseDefensives) and TargetInMeleeRange and not PoolforRes and Player:HealthPercentage() < Settings.Commons.UseDeathStrikeHP then
      if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike defensives 4"; end
    end
    if Player:HealthPercentage() < Settings.Commons.PhialHP and (Settings.Commons.UseDefensives) and I.PhialofSerenity:IsReady() and I.PhialofSerenity:CooldownRemains() <= 0 and Player:BuffDown(S.ShroudofPurgatory) then
		  if HR.Cast(I.PhialofSerenity, nil) then shouldcast = 55 return "PhialofSerenity HP"; end
    end
    if Player:HealthPercentage() < Settings.Commons.HealthstoneHP and (Settings.Commons.UseDefensives)  and I.Healthstone:IsReady() and I.Healthstone:CooldownRemains() <= 0 and Player:BuffDown(S.ShroudofPurgatory) then
		  if HR.Cast(I.Healthstone, nil) then shouldcast = 40 return "Healthstone HP"; end
    end
	  if Player:HealthPercentage() < Settings.Commons.HealPotHP and (Settings.Commons.UseDefensives) and I.CosmicHealPot:IsReady() and I.CosmicHealPot:CooldownRemains() <= 0 and Player:BuffDown(S.ShroudofPurgatory) then
		  if HR.Cast(I.CosmicHealPot, nil) then shouldcast = 45 return "CosmicHealPot HP"; end
    end
    if Player:HealthPercentage() < Settings.Commons.HealPotHP and (Settings.Commons.UseDefensives) and I.HealPot:IsReady() and I.HealPot:CooldownRemains() <= 0 and Player:BuffDown(S.ShroudofPurgatory) then
		  if HR.Cast(I.HealPot, nil) then shouldcast = 41 return "HealPot HP"; end
    end
	
  if S.AntiMagicShell:IsReady() and (Settings.Commons.UseDefensives) and Player:HealthPercentage() <= Settings.Commons.AntiMagicShellHP and HoldAMS then
    if Cast(S.AntiMagicShell, nil, nil) then shouldcast = 48707 return "AntiMagic Shell defensives 18"; end
  end
  -- Rune Tap Emergency
  if S.RuneTap:IsReady() and (Settings.Commons.UseDefensives) and IsTanking and Player:HealthPercentage() <= Settings.Blood.RuneTapThreshold and Player:Rune() >= 3 and S.RuneTap:Charges() >= 1 and Player:BuffDown(S.RuneTapBuff) then
    if Cast(S.RuneTap, nil) then shouldcast = 194679 return "rune_tap defensives 2"; end
  end
  -- Active Mitigation
  if Everyone.ActiveMitigationNeeded() and TargetInMeleeRange and S.Marrowrend:TimeSinceLastCast() > 0.5 and S.DeathStrike:TimeSinceLastCast() > 0.5 then
    if S.DeathStrike:IsReady()  and (Settings.Commons.UseDefensives) and not PoolforRes and Player:BuffStack(S.BoneShieldBuff) > 7 then
      if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike defensives 4"; end
    end
    if S.Marrowrend:IsReady() and TargetInMeleeRange and Player:BuffStack(S.BoneShieldBuff) >= 8 then
      if Cast(S.Marrowrend, nil, nil, not Target:IsSpellInRange(S.Marrowrend)) then shouldcast = 195182 return "marrowrend defensives 6"; end
    end
	-- Moving back to drw_up_venthyr and standard. Leaving this commented out for now, in case we want to revert.
    --if S.Tombstone:IsReady() and Player:BuffStack(S.BoneShieldBuff) >= 7 then
    --  if Cast(S.Tombstone, nil) then shouldcast = 219808 return "tombstone defensives 8"; end
    --end
    if S.DeathStrike:IsReady()  and (Settings.Commons.UseDefensives) and TargetInMeleeRange and not PoolforRes  then
      if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike defensives 10"; end
    end
  end
  -- Bone Shield
  if S.Marrowrend:IsReady() and TargetInMeleeRange and (Player:BuffRemains(S.BoneShieldBuff) <= 6 or (Target:TimeToDie() < 5 and Player:BuffRemains(S.BoneShieldBuff) < 10 and EnemiesMeleeCount == 1)) then
    if Cast(S.Marrowrend, nil, nil, not Target:IsSpellInRange(S.Marrowrend)) then shouldcast = 195182 return "marrowrend defensives 12"; end
  end
  -- Vampiric Blood
  if S.VampiricBlood:IsCastable()  and (Settings.Commons.UseDefensives) and IsTanking and Player:HealthPercentage() <= Settings.Blood.VampiricBloodThreshold and Player:BuffDown(S.IceboundFortitudeBuff) then
    if Cast(S.VampiricBlood, nil) then shouldcast = 55233 return "vampiric_blood defensives 14"; end
  end
  --Lichborne
  if S.Lichborne:IsReady()  and (Settings.Commons.UseDefensives) and Player:HealthPercentage() <= Settings.Commons.LichborneHP then
    if Cast(S.Lichborne, nil, nil) then shouldcast = 49039 return "Lichborne defensives 18"; end
  end
  --DeathPact
  if S.DeathPact:IsAvailable()  and (Settings.Commons.UseDefensives) and S.DeathPact:IsReady() and Player:HealthPercentage() <= Settings.Commons.DeathPactHP then
    if Cast(S.DeathPact, nil, nil) then shouldcast = 48743 return "DeathPact defensives 18"; end
  end
  -- Icebound Fortitude
  if S.IceboundFortitude:IsCastable()  and (Settings.Commons.UseDefensives) and IsTanking and Player:HealthPercentage() <= Settings.Blood.IceboundFortitudeThreshold and Player:BuffDown(S.VampiricBloodBuff) then
    if Cast(S.IceboundFortitude, nil) then shouldcast = 48792 return "icebound_fortitude defensives 16"; end
  end
  -- Healing
  if S.DeathStrike:IsReady()  and (Settings.Commons.UseDefensives) and TargetInMeleeRange and not PoolforRes  and Player:HealthPercentage() <= 50 + (Player:RunicPower() > 90 and 20 or 0) and not Player:HealingAbsorbed() then
    if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike defensives 18"; end
  end
end

local function Racials()
  -- blood_fury,if=cooldown.dancing_rune_weapon.ready&(!cooldown.blooddrinker.ready|!talent.blooddrinker.enabled)
  if S.BloodFury:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() and ((S.DancingRuneWeapon:CooldownUp() or HoldDRW) and (not S.Blooddrinker:IsReady() or not S.Blooddrinker:IsAvailable()))  then
	if Cast(S.BloodFury, nil) then shouldcast = 20572 return "blood_fury main 2"; end
  end
  -- berserking
  if S.Berserking:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() then
	if Cast(S.Berserking, nil) then shouldcast = 26297 return "berserking main 4"; end
  end
  -- arcane_pulse,if=active_enemies>=2|rune<1&runic_power.deficit>60
  if S.ArcanePulse:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() and (EnemiesMeleeCount >= 2 or Player:Rune() < 1 and Player:RunicPowerDeficit() > 60) then
	if Cast(S.ArcanePulse, nil, nil, not Target:IsInRange(10)) then shouldcast = 260364 return "arcane_pulse main 6"; end
  end
  -- lights_judgment,if=buff.unholy_strength.up
  if S.LightsJudgment:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() and (Player:BuffUp(S.UnholyStrengthBuff)) then
	if Cast(S.LightsJudgment, nil, nil, not Target:IsSpellInRange(S.LightsJudgment)) then shouldcast = 255647 return "lights_judgment main 8"; end
  end
  -- ancestral_call
  if S.AncestralCall:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() then
	if Cast(S.AncestralCall, nil) then shouldcast = 274738 return "ancestral_call main 10"; end
  end
  -- fireblood
  if S.Fireblood:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() then
	if Cast(S.Fireblood, nil) then shouldcast = 265221 return "fireblood main 12"; end
  end
  -- bag_of_tricks
  if S.BagofTricks:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() then
	if Cast(S.BagofTricks, nil, nil, not Target:IsSpellInRange(S.BagofTricks)) then shouldcast = 312411 return "bag_of_tricks main 14"; end
  end
  -- arcane_torrent,if=runic_power.deficit>20
  if S.ArcaneTorrent:IsCastable() and TargetInMeleeRange and Settings.Commons.Enabled.Racials and CDsON() and Player:RunicPowerDeficit() > 20 then
	if Cast(S.ArcaneTorrent, nil, nil, nil) then shouldcast = 155145 return "ArcaneTorrent main 14"; end
  end
end

local function DRWUp()
  -- tombstone,if=buff.bone_shield.stack>5&rune>=2&runic_power.deficit>=30&runeforge.crimson_rune_weapon&((talent.shattering_bone&death_and_decay.ticking)|!talent.shattering_bone)
  if S.Tombstone:IsReady() and SmallCDsON and TargetInMeleeRange 
  and (Player:BuffStack(S.BoneShieldBuff) > 5 and Player:Rune() >= 2 and Player:RunicPowerDeficit() >= 30 and ((S.ShatteringBone:IsAvailable() and Player:BuffUp(S.DeathAndDecayBuff)) or not S.ShatteringBone:IsAvailable())) then
    if Cast(S.Tombstone, nil) then shouldcast = 219808 return "tombstone drw_up 2"; end
  end
  -- empower_rune_weapon,if=rune<6&runic_power.deficit>5
  if S.EmpowerRuneWeapon:IsReady() and CDsON() and (Player:Rune() < 6 and Player:RunicPowerDeficit() > 5) then
    if Cast(S.EmpowerRuneWeapon, nil, nil, not Target:IsInRange(10)) then shouldcast = 47568 return "EmpowerRuneWeapon drw_up 11"; end
  end
  -- custom
  if S.AbominationLimb:IsCastable() and TargetInMeleeRange and (CDsON()) and not HoldAbomLimb and not Settings.Blood.UseAbomLimbDefensive then
    if Cast(S.AbominationLimb, nil, nil, not Target:IsInRange(10)) then shouldcast = 315443 return "abomination_limb standard 16"; end
  end
  -- marrowrend,if=buff.bone_shield.stack<5&buff.dancing_rune_weapon.remains<gcd
  if S.Marrowrend:IsReady() and TargetInMeleeRange and (Player:BuffStack(S.BoneShieldBuff) < 5 and Player:BuffRemains(S.DancingRuneWeaponBuff) < Player:GCD()) then
    if Cast(S.Marrowrend, nil, nil, not Target:IsSpellInRange(S.Marrowrend)) then shouldcast = 195182 return "marrowrend drw_up 2"; end
  end  
  -- marrowrend,if=(buff.bone_shield.remains<=rune.time_to_3|(buff.bone_shield.stack<2&buff.abomination_limb.up))&runic_power.deficit>20
  if S.Marrowrend:IsReady() and TargetInMeleeRange
  and ((Player:BuffRemains(S.BoneShieldBuff) <= Player:RuneTimeToX(3) or (Player:BuffStack(S.BoneShieldBuff) < 2 and Player:BuffUp(S.AbominationLimbBuff))) and Player:RunicPowerDeficit() > 20) then
    if Cast(S.Marrowrend, nil, nil, not TargetInMeleeRange) then return "marrowrend drw_up 6"; end
  end  
  -- deaths_caress,if=buff.bone_shield.remains<=rune.time_to_3&rune<=1
  if S.DeathsCaress:IsReady() and not TargetInMeleeRange and (Player:BuffRemains(S.BoneShieldBuff) <= Player:RuneTimeToX(3) and Player:Rune() <= 1) then
    if Cast(S.DeathsCaress, nil, nil, not Target:IsSpellInRange(S.DeathsCaress)) then shouldcast = 195292 return "deaths_caress drw_up 2"; end
  end
  -- death_strike,if=buff.coagulopathy.remains<=gcd|buff.icy_talons.remains<=gcd
  if S.DeathStrike:IsReady() and TargetInMeleeRange and (Player:RunicPower() >= Settings.Blood.MinimumRP + 45) and not PoolforRes  and not PoolforBS and (Player:BuffRemains(S.CoagulopathyBuff) <= Player:GCD() or Player:BuffRemains(S.IcyTalonsBuff) <= Player:GCD()) then
    if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike drw_up 6"; end
  end  
  -- soul_reaper,if=active_enemies=1&target.time_to_pct_35<5&target.time_to_die>(dot.soul_reaper.remains+5)
  if S.SoulReaper:IsReady() and (EnemiesMeleeCount == 1 and Target:TimeToX(35) < 5 and Target:TimeToDie() > (Target:DebuffRemains(S.SoulReaperDebuff) + 5)) then
    if Cast(S.SoulReaper, nil, nil, not TargetInMeleeRange) then shouldcast = 343294 return "soul_reaper drw_up 12"; end
  end
  -- soul_reaper,target_if=min:dot.soul_reaper.remains,if=target.time_to_pct_35<5&active_enemies>=2&target.time_to_die>(dot.soul_reaper.remains+5)
  if S.SoulReaper:IsReady() and (EnemiesMeleeCount >= 2) then
    if Everyone.CastTargetIf(S.SoulReaper, EnemiesMelee, "min", EvaluateTargetIfFilterSoulReaper, EvaluateTargetIfSoulReaper, not TargetInMeleeRange) then return "soul_reaper drw_up 14"; end
  end
  -- death_and_decay,if=!death_and_decay.ticking&(talent.sanguine_ground|talent.unholy_ground)
  if S.DeathAndDecay:IsCastable()  and TargetInMeleeRange and not HoldDnd and not Player:IsMoving() 
  and (Player:BuffDown(S.DeathAndDecayBuff) and (S.SanguineGround:IsAvailable() or S.UnholyGround:IsAvailable())) then
    if Cast(S.DeathAndDecay, nil, nil, not Target:IsInRange(30)) then shouldcast = 43265 return "death_and_decay drw_up 14"; end
  end
  -- blood_boil,if=((charges>=2&rune<=1)|dot.blood_plague.remains<=2)|(spell_targets.blood_boil>5&charges_fractional>=1.1)&!(covenant.venthyr&buff.swarming_mist.up)
  if S.BloodBoil:IsCastable() and (EnemiesMeleeCount > 2 and S.BloodBoil:ChargesFractional() >= 1.1) then
    if Cast(S.BloodBoil, nil, nil, not Target:IsInMeleeRange(10)) then shouldcast = 50842 return "blood_boil drw_up 4"; end
  end 
  -- variable,name=heart_strike_rp_drw,value=(25+spell_targets.heart_strike*talent.heartbreaker.enabled*2)
  VarHeartStrikeRPDRW = (25 + HeartStrikeCount * num(S.Heartbreaker:IsAvailable()) * 2)
  -- death_strike,if=runic_power.deficit<=variable.heart_strike_rp_drw
  if S.DeathStrike:IsReady() and TargetInMeleeRange and (Player:RunicPower() >= Settings.Blood.MinimumRP + 45) and not PoolforRes  and not PoolforBS and (Player:RunicPowerDeficit() <= VarHeartStrikeRPDRW) then
    if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike drw_up 6"; end
  end  
  -- consumption
  if S.Consumption:IsCastable() and TargetInMeleeRange then
    if Cast(S.Consumption, nil, nil, not Target:IsSpellInRange(S.Consumption)) then shouldcast = 274156 return "consumption standard 24"; end
  end
  -- death_and_decay,if=!death_and_decay.ticking&(spell_targets.death_and_decay==3&buff.crimson_scourge.up)|spell_targets.death_and_decay>=4
  if S.DeathAndDecay:IsCastable() and TargetInMeleeRange and not HoldDnd and not Player:IsMoving() 
  and (Player:BuffDown(S.DeathAndDecayBuff) and ((EnemiesMeleeCount == 3 and Player:BuffUp(S.CrimsonScourgeBuff)) or EnemiesMeleeCount >= 4)) then
    if Cast(S.DeathAndDecay, nil, nil, not Target:IsInRange(30)) then shouldcast = 43265 return "death_and_decay drw_up 18"; end
  end
  -- blood_boil,if=charges_fractional>=1.1&buff.hemostasis.stack<5
  if S.BloodBoil:IsReady() and (S.BloodBoil:ChargesFractional() >= 1.1 and Player:BuffStack(S.HemostasisBuff) < 5) then
    if Cast(S.BloodBoil, nil, nil, not Target:IsInMeleeRange(10)) then shouldcast = 50842 return "blood_boil drw_up 24"; end
  end
  -- heart_strike,if=rune.time_to_2<gcd|runic_power.deficit>=variable.heart_strike_rp_drw
  if S.HeartStrike:IsReady()  and TargetInMeleeRange and (Player:RuneTimeToX(2) < Player:GCD() or Player:RunicPowerDeficit() >= VarHeartStrikeRPDRW) then
    if Cast(S.HeartStrike, nil, nil, not Target:IsSpellInRange(S.HeartStrike)) then shouldcast = 206930 return "heart_strike drw_up 18"; end
  end
end

local function Standard()
  -- tombstone,if=buff.bone_shield.stack>5&rune>=2&runic_power.deficit>=30&((talent.shattering_bone&death_and_decay.ticking)|!talent.shattering_bone)
  if S.Tombstone:IsCastable() and SmallCDsON 
  and (Player:BuffStack(S.BoneShieldBuff) > 5 and Player:Rune() >= 2 and Player:RunicPowerDeficit() >= 30 and ((S.ShatteringBone:IsAvailable() and Player:BuffUp(S.DeathAndDecayBuff)) or not S.ShatteringBone:IsAvailable())) then
    if Cast(S.Tombstone, nil) then shouldcast = 219808 return "tombstone standard 1"; end
  end
  -- abomination_limb,if=buff.bone_shield.stack<6
  if S.AbominationLimb:IsCastable() and TargetInMeleeRange and (CDsON()) and not HoldAbomLimb 
  and ((Settings.Blood.UseAbomLimbDefensive and Player:BuffStack(S.BoneShieldBuff) < 6) or not Settings.Blood.UseAbomLimbDefensive) then
    if Cast(S.AbominationLimb, nil, nil, not Target:IsInRange(10)) then shouldcast = 315443 return "abomination_limb standard 16"; end
  end
  -- marrowrend,if=buff.bone_shield.remains<=rune.time_to_3|buff.bone_shield.remains<=(gcd+cooldown.blooddrinker.ready*talent.blooddrinker.enabled*4)|buff.bone_shield.stack<6&runic_power.deficit>20&!(talent.insatiable_blade&cooldown.dancing_rune_weapon.remains<buff.bone_shield.remains)
  if S.Marrowrend:IsReady() and TargetInMeleeRange and (Player:BuffRemains(S.BoneShieldBuff) <= Player:RuneTimeToX(3) or Player:BuffRemains(S.BoneShieldBuff) <= (Player:GCD() + num(S.Blooddrinker:CooldownUp()) * num(S.Blooddrinker:IsAvailable()) * 4) or (Player:BuffStack(S.BoneShieldBuff) < 6 and Player:RunicPowerDeficit() > 20 and not (S.InsatiableBlade:IsAvailable() and S.DancingRuneWeapon:CooldownRemains() < Player:BuffRemains(S.BoneShieldBuff)))) then
	if Cast(S.Marrowrend, nil, nil, not Target:IsSpellInRange(S.Marrowrend)) then shouldcast = 195182 return "marrowrend standard 6"; end
  end
  -- deaths_caress,if=buff.bone_shield.remains<=rune.time_to_3&rune<=1
  if S.DeathsCaress:IsReady() and not TargetInMeleeRange and (Player:BuffRemains(S.BoneShieldBuff) <= Player:RuneTimeToX(3) and Player:Rune() <= 1) then
    if Cast(S.DeathsCaress, nil, nil, not Target:IsSpellInRange(S.DeathsCaress)) then shouldcast = 195292 return "deaths_caress standard 2"; end
  end
  -- death_strike,if=buff.coagulopathy.remains<=gcd|buff.icy_talons.remains<=gcd
  if S.DeathStrike:IsReady() and TargetInMeleeRange and (Player:RunicPower() >= Settings.Blood.MinimumRP + 45) and not PoolforRes  and not PoolforBS and (Player:BuffRemains(S.CoagulopathyBuff) <= Player:GCD() or Player:BuffRemains(S.IcyTalonsBuff) <= Player:GCD()) then
    if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike standard 8"; end
  end
  -- death_and_decay,if=!death_and_decay.ticking&(talent.sanguine_ground|talent.unholy_ground)
  if S.DeathAndDecay:IsCastable() and TargetInMeleeRange and not HoldDnd and not Player:IsMoving() and (Player:BuffDown(S.DeathAndDecayBuff) and (S.SanguineGround:IsAvailable() or S.UnholyGround:IsAvailable())) then
    if Cast(S.DeathAndDecay, nil, nil, not Target:IsInRange(30)) then shouldcast = 43265 return "death_and_decay drw_up 14"; end
  end
  -- bonestorm,if=runic_power>=100
  if S.Bonestorm:IsReady() and TargetInMeleeRange and not PoolforRes and (Player:RunicPower() >= Settings.Blood.BonestormPower)  and SmallCDsON then
    if Cast(S.Bonestorm, nil, nil, not Target:IsInRange(10)) then shouldcast = 194844 return "bonestorm standard 14"; end
  end 
  -- soul_reaper,if=active_enemies=1&target.time_to_pct_35<5&target.time_to_die>(dot.soul_reaper.remains+5)
  if S.SoulReaper:IsReady() and (EnemiesMeleeCount == 1 and Target:TimeToX(35) < 5 and Target:TimeToDie() > (Target:DebuffRemains(S.SoulReaperDebuff) + 5)) then
    if Cast(S.SoulReaper, nil, nil, not TargetInMeleeRange) then shouldcast = 343294 return "soul_reaper standard 12"; end
  end
  -- soul_reaper,target_if=min:dot.soul_reaper.remains,if=target.time_to_pct_35<5&active_enemies>=2&target.time_to_die>(dot.soul_reaper.remains+5)
  if S.SoulReaper:IsReady() and (EnemiesMeleeCount >= 2) then
    if Everyone.CastTargetIf(S.SoulReaper, EnemiesMelee, "min", EvaluateTargetIfFilterSoulReaper, EvaluateTargetIfSoulReaper, not TargetInMeleeRange) then return "soul_reaper standard 14"; end
  end  
  -- death_strike,if=runic_power.deficit<=variable.death_strike_dump_amount&!(talent.bonestorm.enabled&cooldown.bonestorm.remains<2)
  if S.DeathStrike:IsReady()  and TargetInMeleeRange and not PoolforRes and not PoolforBS
  and (Player:RunicPower() >= Settings.Blood.MinimumRP + 45) and (Player:RunicPowerDeficit() <= VarDeathStrikeDumpAmt and not (S.Bonestorm:IsAvailable() and S.Bonestorm:CooldownRemains() < 2)) then
    if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike standard 16"; end
  end 
  -- blood_boil,if=charges_fractional>=1.8&(buff.hemostasis.stack<=(5-spell_targets.blood_boil)|spell_targets.blood_boil>2)
  if S.BloodBoil:IsCastable() and (S.BloodBoil:ChargesFractional() >= 1.8 and (Player:BuffStack(S.HemostasisBuff) <= (5 - EnemiesMeleeCount) or EnemiesMeleeCount > 2)) then
    if Cast(S.BloodBoil, nil, nil, not  Target:IsInMeleeRange(10)) then shouldcast = 50842 return "blood_boil standard 10"; end
  end
  -- death_and_decay,if=buff.crimson_scourge.up&talent.relish_in_blood.enabled&runic_power.deficit>10
  if S.DeathAndDecay:IsReady() and TargetInMeleeRange and not HoldDnd and not Player:IsMoving() and Player:BuffDown(S.DeathAndDecayBuff) and ((Player:BuffUp(S.CrimsonScourgeBuff) and S.RelishinBlood:IsAvailable()) and Player:RunicPowerDeficit() > 10) then
    if Cast(S.DeathAndDecay, nil, nil, not Target:IsInRange(30)) then shouldcast = 43265 return "death_and_decay standard 12"; end
  end
  -- variable,name=heart_strike_rp,value=(15+spell_targets.heart_strike*talent.heartbreaker.enabled*2)
  VarHeartStrikeRP = (15 + EnemiesMeleeCount * num(S.Heartbreaker:IsAvailable()) * 2)
  -- death_strike,if=(runic_power.deficit<=variable.heart_strike_rp)|target.time_to_die<10
  if S.DeathStrike:IsReady()  and TargetInMeleeRange and (Player:RunicPower() >= Settings.Blood.MinimumRP + 45) and not PoolforRes  and not PoolforBS and ((Player:RunicPowerDeficit() <= VarHeartStrikeRP) or Target:TimeToDie() < 10) then
    if Cast(S.DeathStrike, nil, nil, not Target:IsSpellInRange(S.DeathStrike)) then shouldcast = 49998 return "death_strike standard 28"; end
  end 
  -- death_and_decay,if=!death_and_decay.ticking&spell_targets.death_and_decay>=3
  if S.DeathAndDecay:IsReady() and TargetInMeleeRange and not HoldDnd and not Player:IsMoving() 
  and Player:BuffDown(S.DeathAndDecayBuff) and (EnemiesMeleeCount >= 3) then
    if Cast(S.DeathAndDecay, nil, nil, not Target:IsInRange(30)) then shouldcast = 43265 return "death_and_decay standard 18"; end
  end
  -- heart_strike,if=rune.time_to_4<gcd
  if S.HeartStrike:IsReady() and TargetInMeleeRange and (Player:RuneTimeToX(4) < Player:GCD()) then
    if Cast(S.HeartStrike, nil, nil, not Target:IsSpellInRange(S.HeartStrike)) then shouldcast = 206930 return "heart_strike standard 2"; end
  end
  -- consumption
  if S.Consumption:IsCastable() and TargetInMeleeRange then
    if Cast(S.Consumption, nil, nil, not Target:IsSpellInRange(S.Consumption)) then shouldcast = 274156 return "consumption standard 24"; end
  end
  -- death_and_decay,if=buff.crimson_scourge.up|talent.rapid_decomposition.enabled
  if S.DeathAndDecay:IsReady() and TargetInMeleeRange and not HoldDnd and not Player:IsMoving() 
  and Player:BuffDown(S.DeathAndDecayBuff) and (Player:BuffUp(S.CrimsonScourgeBuff) or S.RapidDecomposition:IsAvailable()) then
    if Cast(S.DeathAndDecay, nil, nil, not Target:IsInRange(30)) then shouldcast = 43265 return "death_and_decay standard 22"; end
  end
  -- blood_boil,if=charges_fractional>=1.1
  if S.BloodBoil:IsCastable() and (S.BloodBoil:ChargesFractional() >= 1.1) then
    if Cast(S.BloodBoil, nil, nil, not  Target:IsInMeleeRange(10)) then shouldcast = 50842 return "blood_boil standard 26"; end
  end
  -- heart_strike,if=(rune>1&(rune.time_to_3<gcd|buff.bone_shield.stack>7))
  if S.HeartStrike:IsReady() and TargetInMeleeRange and (Player:Rune() > 1 and (Player:RuneTimeToX(3) < Player:GCD() or Player:BuffStack(S.BoneShieldBuff) > 7)) then
	if Cast(S.HeartStrike, nil, nil, not Target:IsSpellInRange(S.HeartStrike)) then shouldcast = 206930 return "heart_strike standard 20"; end
  end
end

local function Reset()

	Opener = HeroRotationCharDB.Toggles[5]
	SmallCDsON = HeroRotationCharDB.Toggles[4]
	StopAutoSwap = HeroRotationCharDB.Toggles[12]
	QAMZ = HeroRotationCharDB.Toggles[13]
	QDeathgrip = HeroRotationCharDB.Toggles[14]
	UsePots = not HeroRotationCharDB.Toggles[15]
	QAsphyxiate = HeroRotationCharDB.Toggles[16]
	QGorefiends = HeroRotationCharDB.Toggles[80]
	QControlUndead = HeroRotationCharDB.Toggles[81]
	HoldDRW = HeroRotationCharDB.Toggles[82]
	AutoTaunt = HeroRotationCharDB.Toggles[72]
	HoldDnd = HeroRotationCharDB.Toggles[83]
	QBloodBoil = HeroRotationCharDB.Toggles[84]
	HoldWeapon = HeroRotationCharDB.Toggles[17]
	HoldRaiseAlly = HeroRotationCharDB.Toggles[85]
	HoldAbomLimb = HeroRotationCharDB.Toggles[18]
  HoldAMS = not HeroRotationCharDB.Toggles[183]

	
	PoolforBS = false
	PoolforRes = false
	
	if S.Bonestorm:IsAvailable() and CDsON() and S.Bonestorm:CooldownRemains() <= 0 and S.Bonestorm:IsCastable() then
		PoolforBS = true
	end
	
	QuakingR = 0
	--Quaking
	for i=1,20 do
		if select(10, UnitDebuff("player", i)) == 240447 then
			if select(6, UnitDebuff("player", i)) ~= nil then
				QuakingR = (select(6, UnitDebuff("player", i)) - (GetTime()))
			end
		end
	end
	
end

--- ======= ACTION LISTS =======
local function APL()
  TargetInMeleeRange = Target:IsSpellInRange(S.HeartStrike)
  -- Get Enemies Count
  --Enemies10y          = Player:GetEnemiesInRange(10)
  EnemiesMelee      = Player:GetEnemiesInMeleeRange(10)
  if AoEON() then
    --EnemiesMelee      = Player:GetEnemiesInMeleeRange(8)
    EnemiesMeleeCount = #EnemiesMelee
    --EnemiesMeleeCount   = #Enemies10y
	Enemies40y 		  = Player:GetEnemiesInRange(40, S.DarkCommand)

  else
    EnemiesMeleeCount = 1
  end

  -- Check Units without Blood Plague
  --UnitsWithoutBloodPlague = UnitsWithoutBP(Enemies10y)
  UnitsWithoutBloodPlague = UnitsWithoutBP(EnemiesMelee)

  -- HeartStrike is limited to 5 targets maximum
  HeartStrikeCount = mathmin(EnemiesMeleeCount, Player:BuffUp(S.DeathAndDecayBuff) and 5 or 2)


  -- Are we actively tanking?
  
  IsTanking = Player:IsTankingAoE(8) or Player:IsTanking(Target)
  
  -- Extras
  TopTrinketID,_ = GetInventoryItemID("player", 13)
  BotTrinketID,_ = GetInventoryItemID("player", 14)
  ActiveMitigationNeeded = Player:ActiveMitigationNeeded()
  MissingAggro = UnitsWithoutAggro(EnemiesMelee)


  if not BotOn then
	MOshouldcast = 0
	shouldcast = 0
  end
  
	if MOshouldcast > 0 then
		MOshouldcast = 0
	end
	
	if shouldcast > 0 then
		shouldcast = 0
	end

  ShouldReturn = Reset()
  if HR.QueuedCast() then shouldcast = HR.QueuedCast() return "Custom Queue "..Spell(shouldcast):ID() end

  --Resets
  if HR.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[6] then
	starttime = GetTime()
	endtime = starttime + (HR.GUISettings.General.OpenerReset)
  elseif HR.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[6] then
	HeroRotationCharDB.Toggles[6] = not HeroRotationCharDB.Toggles[6];
	HR.ToggleIconFrame:UpdateButtonText(6);
	HR.Print("Opener is now "..(HeroRotationCharDB.Toggles[6] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."));
  end

  --Dont cancel Fleshcraft
  if Player:IsChanneling(Spell(324631)) then
      if HR.CastAnnotated(S.Pool, false, "WAIT") then shouldcast = 99999 return "Pool During Blooddrinker"; end
  end
  
  if not Player:AffectingCombat() then
	HealthstoneUsed = false
  end

  -- call precombat
  if not Player:AffectingCombat() and Everyone.TargetIsValid() and Opener then
    local ShouldReturn = Precombat(); if ShouldReturn then return ShouldReturn; end
  end
  
  if (not UnitIsEnemy("player","mouseover") and UnitIsPlayer("mouseover") and UnitIsDead("mouseover")) and not HoldRaiseAlly then
		if S.RaiseAlly:IsCastable() and Player:RunicPower() >= 30 then
			if Cast(S.RaiseAlly, nil) then MOshouldcast = 161999 return "RaiseAlly MO"; end
		elseif S.RaiseAlly:CooldownRemains(BypassRecovery) <= 0 and (Player:RunicPower() < 30) then
			PoolforRes = true
		end
  end

	--explosives
	if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) and Unit("mouseover"):IsInMeleeRange(10) then
	  if S.HeartStrike:IsCastable() then
	      if Cast(S.HeartStrike, nil) then MOshouldcast = 1206930 return "explosive MO HeartStrike"; end
	  end
    end
    if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) and Unit("mouseover"):IsInMeleeRange(10) then
	  if S.DeathStrike:IsCastable() then
	      if Cast(S.DeathStrike, nil) then MOshouldcast = 149998 return "explosive MO DeathStrike"; end
	  end
    end
	
    if UnitExists("target") and string.find(UnitGUID("target"), 120651) and TargetInMeleeRange then
		if S.HeartStrike:IsCastable() then
	      if Cast(S.HeartStrike, nil) then shouldcast = 206930 return "explosive  HeartStrike"; end
		end
    end
	if UnitExists("target") and string.find(UnitGUID("target"), 120651) and TargetInMeleeRange then
		if S.DeathStrike:IsCastable() then
	      if Cast(S.DeathStrike, nil) then shouldcast = 49998 return "explosive  DeathStrike"; end
		end
    end

  if Everyone.TargetIsValid() then
	  if S.DarkCommand:IsReady() and Player:AffectingCombat() and (not Player:IsTanking(Target) and AutoTaunt) then
		  if Cast(S.DarkCommand, nil) then shouldcast = 56222 return "DarkCommand bear 3"; end
	  end
	  
	  if S.DarkCommand:IsReady() then
		if Everyone.CastCycle(S.DarkCommand, Enemies40y, EvaluateCycleGrowl, not Target:IsSpellInRange(S.DarkCommand)) then return "DarkCommand 4"; end
	  end
  end
  
  --Queues
  if (QAsphyxiate and S.Asphyxiate:IsUsableP() and S.Asphyxiate:CooldownRemains(BypassRecovery) <= 0) then
	if HR.Cast(S.Asphyxiate, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Asphyxiate) then
			MOshouldcast = 1221562 return "queue Asphyxiate MO"; 
		else 			
			shouldcast = 221562 return "queue Asphyxiate"; end
	end
  elseif ((not S.Asphyxiate:IsUsableP() or S.Asphyxiate:CooldownRemains() > 0) and QAsphyxiate) then
	  HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16];
      HR.Print("Asphyxiate Queue is now "..(HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QBloodBoil and S.BloodBoil:IsUsableP() and S.BloodBoil:CooldownRemains(BypassRecovery) <= 0 and not Player:PrevGCD(1, S.BloodBoil)) then
	if HR.Cast(S.BloodBoil, nil, nil, nil) then 
			shouldcast = 50842 return "queue BloodBoil";
	end
  elseif ((not S.BloodBoil:IsUsableP() or S.BloodBoil:CooldownRemains() > 0 or Player:PrevGCD(1, S.BloodBoil)) and QBloodBoil) then
	  HeroRotationCharDB.Toggles[84] = not HeroRotationCharDB.Toggles[84];
      HR.Print("Blood Boil Queue is now "..(HeroRotationCharDB.Toggles[84] and "|cff00ff00on|r." or "|cffff0000off|r."));  	
  end
  
  if (QDeathgrip and S.DeathGrip:IsUsableP() and S.DeathGrip:CooldownRemains(BypassRecovery) <= 0) then
	if HR.Cast(S.DeathGrip, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.DeathGrip) then
			MOshouldcast = 149576 return "queue DeathGrip MO"; 
		else 			
			shouldcast = 49576 return "queue DeathGrip"; end
	end
  elseif ((not S.DeathGrip:IsUsableP() or S.DeathGrip:CooldownRemains() > 0) and QDeathgrip) then
	  HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14];
      HR.Print("DeathGrip Queue is now "..(HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QGorefiends and S.GorefiendsGrasp:IsUsableP() and S.GorefiendsGrasp:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
	if HR.Cast(S.GorefiendsGrasp, nil, nil, nil) then 		
		shouldcast = 108199 return "queue Gorefiends Grasp";
	end
  elseif ((not S.GorefiendsGrasp:IsUsableP() or S.GorefiendsGrasp:CooldownRemains() > 0 or not Player:AffectingCombat()) and QGorefiends) then
	  HeroRotationCharDB.Toggles[80] = not HeroRotationCharDB.Toggles[80];
      HR.Print("Gorefiend's Grasp Queue is now "..(HeroRotationCharDB.Toggles[80] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  

  if (QAMZand and S.AntiMagicZone:IsAvailable() and S.AntiMagicZone:IsUsableP() and S.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
	if HR.Cast(S.AntiMagicZone, nil, nil, nil) then 		
		shouldcast = 51052 return "queue Anti Magic Zone";
	end
  elseif ((not S.AntiMagicZone:IsUsableP() or S.AntiMagicZone:CooldownRemains() > 0 or not Player:AffectingCombat()) and QAMZ) then
	  HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13];
      HR.Print("Anti-Magic Zone Queue is now "..(HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end  

  if (QControlUndead and S.ControlUndead:IsUsableP() and S.ControlUndead:CooldownRemains(BypassRecovery) <= 0 and not Player:PrevGCD(1,S.ControlUndead)) then
	if HR.Cast(S.ControlUndead, nil, nil, nil) then 
		if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsInRange(30) then
			MOshouldcast = 1111673 return "queue ControlUndead MO"; 
		else 			
			shouldcast = 111673 return "queue ControlUndead"; end
	end
  elseif ((not S.ControlUndead:IsUsableP() or S.ControlUndead:CooldownRemains() > 0 or Player:PrevGCD(1,S.ControlUndead)) and QControlUndead) then
	  HeroRotationCharDB.Toggles[81] = not HeroRotationCharDB.Toggles[81];
      HR.Print("Control Undead Queue is now "..(HeroRotationCharDB.Toggles[81] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end
  
  if Everyone.TargetIsValid() and Player:AffectingCombat() then
	-- Defensives
	if true then
		local ShouldReturn = Defensives(); if ShouldReturn then return ShouldReturn; end
	end

	-- Display Pool icon if PoolDuringBlooddrinker is true
	if Player:IsChanneling(S.Blooddrinker) and Player:BuffUp(S.BoneShieldBuff) and UnitsWithoutBloodPlague == 0 and not Player:ShouldStopCasting() and Player:CastRemains() > 0.2 then
	  if HR.CastAnnotated(S.Pool, false, "WAIT") then shouldcast = 99999 return "Pool During Blooddrinker"; end
	end
	-- auto_attack
	-- variable,name=death_strike_dump_amount,value=70
	VarDeathStrikeDumpAmt = 70

	-- potion,if=buff.dancing_rune_weapon.up	
	if Settings.Commons.Enabled.Potions then
	local PotionSelected = Everyone.PotionSelected()
		if PotionSelected then
		  if PotionSelected:IsReady() and CDsON() and UsePots 
		  and ((Player:BloodlustUp() and HR.GUISettings.General.HoldPotforBL) or 
		  (not HR.GUISettings.General.HoldPotforBL and Player:BuffUp(S.DancingRuneWeaponBuff))) then
			if Cast(PotionSelected, nil) then shouldcast = 50 return "potion cooldowns 2"; end
		  end
		end
	end
	
	-- use_items
	if ((Settings.Commons.Enabled.TopTrinket or Settings.Commons.Enabled.BottomTrinket)) then
		local TrinketToUse = Player:GetUseableTrinkets(OnUseExcludes)
		if TrinketToUse then
		  if Cast(TrinketToUse, nil, nil) then
			if TrinketToUse:ID() == TopTrinketID  and Settings.Commons.Enabled.TopTrinket and ((Settings.Blood.TopTrinketHP <= 0 and CDsON()) or Settings.Blood.TopTrinketHP > Player:HealthPercentage()) then
				shouldcast = 24 
				return "top trinket 1"; 
			elseif TrinketToUse:ID() == BotTrinketID  and Settings.Commons.Enabled.BottomTrinket  and ((Settings.Blood.BotTrinketHP <= 0 and CDsON()) or Settings.Blood.BotTrinketHP > Player:HealthPercentage()) then
				shouldcast = 30 
				return "top trinket 2"; 
			end
		  end
		end
	end
	--actions.trinkets+=/use_item,name=gavel_of_the_first_arbiter
	if I.GaveloftheFirstArbiter:IsEquippedAndReady() and Target:IsInRange(30) and CDsON() and not HoldWeapon then
	 if Cast(I.GaveloftheFirstArbiter, nil, nil, not Target:IsInRange(30)) then shouldcast = 16 return "gavel_of_the_first_arbiter trinkets 4"; end
	end

	--Custom BB for aggro
	if S.BloodBoil:IsCastable() and TargetInMeleeRange and not UnitExists("boss1") and MissingAggro > 0 then
		if Cast(S.BloodBoil) then shouldcast = 50842 return "blood_boil for aggro 6"; end
	end
	-- raise_dead
	if CDsON() and not Pet:DebuffUp(Spell(111673)) and S.RaiseDead:IsCastable() then
		if Cast(S.RaiseDead, nil, nil) then shouldcast = 46585 return "raise_dead main 24"; end
	end
	-- deaths_caress,if=!buff.bone_shield.up
	if S.DeathsCaress:IsReady() and not TargetInMeleeRange and (Player:BuffDown(S.BoneShieldBuff)) then
		if Cast(S.DeathsCaress, nil, nil, not Target:IsSpellInRange(S.DeathsCaress)) then shouldcast = 195292 return "deaths_caress drw_up 2"; end
	end
	-- blooddrinker,if=!buff.dancing_rune_weapon.up
  if S.Blooddrinker:IsReady() and (Player:BuffDown(S.DancingRuneWeaponBuff)) then
		if Cast(S.Blooddrinker, nil, nil, not Target:IsSpellInRange(S.Blooddrinker)) then shouldcast = 206931 return "blooddrinker main 20"; end
	end
	-- call_action_list,name=racials
	if (true) then
		local ShouldReturn = Racials(); if ShouldReturn then return ShouldReturn; end
	end
	-- sacrificial_pact,if=!buff.dancing_rune_weapon.up&(pet.ghoul.remains<2|target.time_to_die<gcd)
	if S.SacrificialPact:IsReady() and S.RaiseDead:TimeSinceLastCast() <= 60  and ghoul.active() and (Player:BuffDown(S.DancingRuneWeaponBuff) and (ghoul.remains() < 2 or Target:TimeToDie() < Player:GCD())) then
		if Cast(S.SacrificialPact, nil) then shouldcast = 237574 return "sacrificial_pact covenants 8"; end
	end
	-- blood_tap,if=(rune<=2&rune.time_to_4>gcd&charges_fractional>=1.8)|rune.time_to_3>gcd
	if S.BloodTap:IsCastable() and ((Player:Rune() <= 2 and Player:RuneTimeToX(4) > Player:GCD() and S.BloodTap:ChargesFractional() >= 1.8) or (Player:RuneTimeToX(3) > Player:GCD())) then
		if Cast(S.BloodTap) then shouldcast = 221699 return "blood_tap main 12"; end
	end
	-- marrowrend,if=buff.bone_shield.remains<gcd
	if S.Marrowrend:IsReady() and TargetInMeleeRange and (Player:BuffRemains(S.BoneShieldBuff) < Player:GCD() + 0.5) then
		if Cast(S.Marrowrend) then shouldcast = 195182 return "marrowrend main 14"; end
	end  
	-- deaths_caress,if=buff.bone_shield.remains<gcd|!buff.bone_shield.up
	if S.DeathsCaress:IsReady() and not TargetInMeleeRange and (Player:BuffRemains(S.BoneShieldBuff) < Player:GCD() + 0.5 or Player:BuffDown(S.BoneShieldBuff)) then
		if Cast(S.DeathsCaress, nil, nil, not Target:IsSpellInRange(S.DeathsCaress)) then shouldcast = 195292 return "deaths_caress main 16"; end
	end  
	-- dancing_rune_weapon,if=!buff.dancing_rune_weapon.up
	if S.DancingRuneWeapon:IsCastable() and TargetInMeleeRange and not HoldDRW and CDsON() and (Player:BuffDown(S.DancingRuneWeaponBuff)) then
		if Cast(S.DancingRuneWeapon, nil) then shouldcast = 49028 return "dancing_rune_weapon main 14"; end
	end
	-- run_action_list,name=drw_up,if=buff.dancing_rune_weapon.up
	if (Player:BuffUp(S.DancingRuneWeaponBuff)) then
		local ShouldReturn = DRWUp(); if ShouldReturn then return ShouldReturn; end
	end
	-- call_action_list,name=standard
	if (true) then
		local ShouldReturn = Standard(); if ShouldReturn then return ShouldReturn; end
	end
	-- Pool if nothing else to do
	if HR.CastAnnotated(S.Pool, false, "WAIT") then return "Wait/Pool Resources"; end
  end
end

local function Init()
    if HeroRotationCharDB.Toggles[5] then
	  HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5];
	  HR.ToggleIconFrame:UpdateButtonText(5);
	end
end

function ReturnSpell1()
	if shouldcast == 0 then
		return 0
	else
		return shouldcast
	end
end
	
function ReturnSpellMO1()
	if MOshouldcast == 0 then
		return 0
	else
		return MOshouldcast
	end
end

HR.SetAPL(250, APL, Init)