--- ============================ HEADER ============================
--- ======= LOCALIZE =======
-- Addon
local addonName, addonTable = ...
-- HeroDBC
local DBC = HeroDBC.DBC
-- HeroLib
local HL = HeroLib
local Cache = HeroCache
local Unit = HL.Unit
local Player = Unit.Player
local Target = Unit.Target
local Spell = HL.Spell
local MultiSpell = HL.MultiSpell
local Item = HL.Item
-- HeroRotation
local HR = HeroRotation
local AoEON = HR.AoEON
local CDsON = HR.CDsON
local SmallCDsOn = HeroRotationCharDB.Toggles[4]
local Opener = HeroRotationCharDB.Toggles[5]
local StopAutoSwap = HeroRotationCharDB.Toggles[12]
local UsePots = not HeroRotationCharDB.Toggles[15]
local HoldVanish = HeroRotationCharDB.Toggles[21]
local HoldKillingSpree = HeroRotationCharDB.Toggles[52]
local QCheapShot = HeroRotationCharDB.Toggles[22]
local QKidneyShot = HeroRotationCharDB.Toggles[23]
local QBlind = HeroRotationCharDB.Toggles[24]
local QSap = HeroRotationCharDB.Toggles[25]
local QFeint = HeroRotationCharDB.Toggles[27]
local QGouge = HeroRotationCharDB.Toggles[50]
local BRmeleeOnly = HeroRotationCharDB.Toggles[51]
local QGraplingHook = HeroRotationCharDB.Toggles[53]
local QRacial = HeroRotationCharDB.Toggles[30]
local HoldShiv = HeroRotationCharDB.Toggles[54]
local QBladeFlurry = HeroRotationCharDB.Toggles[190]
local Mouseover = Unit.MouseOver;

local QuakingR = 0
-- Trinket Item Objects
local equip = Player:GetEquipment()
local trinket1 = Item(0)
local trinket2 = Item(0)

--Trinket Detection
local TopTrinketID = GetInventoryItemID("player", 13)
local BotTrinketID = GetInventoryItemID("player", 14)
if equip[13] then
  trinket1 = Item(equip[13])
end
if equip[14] then
  trinket2 = Item(equip[14])
end
local WhiteList = { 324736, 228318, 178658, 333227, 334800, 334967, 324737, 326450, 334470, 320703, 320012, 324085,
                    333241, 331510, 344739, 368477, 368396, 355057, 356133, 342139, 353706, 355782, 327155, 158337 }
-- Lua
local mathmin = math.min
local mathmax = math.max
local mathabs = math.abs

--Resets
local starttime = nil
local endtime = nil

local ARCD
local VCD
local GSCD
local SDCD

--- ============================ CONTENT ============================
--- ======= APL LOCALS =======
-- Commons
local Everyone = HR.Commons.Everyone
local Rogue = HR.Commons.Rogue

-- GUI Settings
local Settings = {
  General = HR.GUISettings.General,
  Commons = HR.GUISettings.APL.Rogue.Commons,
  Commons2 = HR.GUISettings.APL.Rogue.Commons2,
  Outlaw = HR.GUISettings.APL.Rogue.Outlaw,
}

-- Define S/I for spell and item arrays
local S = Spell.Rogue.Outlaw
local I = Item.Rogue.Outlaw

-- Create table to exclude above trinkets from On Use function
local OnUseExcludes = {
  I.ManicGrieftorch:ID(),
  I.DragonfireBombDispenser:ID(),
  I.BeaconToTheBeyond:ID()
}



-- Rotation Var
local Enemies30y, EnemiesBF, EnemiesBFCount
local ShouldReturn; -- Used to get the return string
local BladeFlurryRange = 6
local BetweenTheEyesDMGThreshold
local EffectiveComboPoints, ComboPoints, ComboPointsDeficit
local Energy, EnergyRegen, EnergyDeficit, EnergyTimeToMax, EnergyMaxOffset
local Interrupts = {
  { S.Blind, "Cast Blind (Interrupt)", function() return true end },
}
local shouldcast = Rogue.ReturnSpell()
local MOshouldcast = Rogue.ReturnSpellMO()

-- Utils
local function num(val)
  if val then return 1 else return 0 end
end

-- bladeflurry_condition_underhandedupperhand
local function UnderhandedUpperhandConditionFeature ()
  return (Player:BuffUp(S.SliceandDice) or Player:BuffUp(S.AdrenalineRush))
end

-- Stable Energy Prediction
local PrevEnergyTimeToMaxPredicted, PrevEnergyPredicted = 0, 0
local function EnergyTimeToMaxStable (MaxOffset)
  local EnergyTimeToMaxPredicted = Player:EnergyTimeToMaxPredicted(nil, MaxOffset)
  if EnergyTimeToMaxPredicted < PrevEnergyTimeToMaxPredicted
    or (EnergyTimeToMaxPredicted - PrevEnergyTimeToMaxPredicted) > 0.5 then
    PrevEnergyTimeToMaxPredicted = EnergyTimeToMaxPredicted
  end
  return PrevEnergyTimeToMaxPredicted
end
local function EnergyPredictedStable ()
  local EnergyPredicted = Player:EnergyPredicted()
  if EnergyPredicted > PrevEnergyPredicted
    or (EnergyPredicted - PrevEnergyPredicted) > 9 then
    PrevEnergyPredicted = EnergyPredicted
  end
  return PrevEnergyPredicted
end

--- ======= ACTION LISTS =======
local RtB_BuffsList = {
  S.Broadside,
  S.BuriedTreasure,
  S.GrandMelee,
  S.RuthlessPrecision,
  S.SkullandCrossbones,
  S.TrueBearing
}

-- Get the number of Roll the Bones buffs currently on
local function RtB_Buffs ()
  if not Cache.APLVar.RtB_Buffs then
    Cache.APLVar.RtB_Buffs = {}
    Cache.APLVar.RtB_Buffs.Total = 0
    Cache.APLVar.RtB_Buffs.Normal = 0
    Cache.APLVar.RtB_Buffs.Shorter = 0
    Cache.APLVar.RtB_Buffs.Longer = 0
    local RtBRemains = Rogue.RtBRemains()
    for i = 1, #RtB_BuffsList do
      local Remains = Player:BuffRemains(RtB_BuffsList[i])
      if Remains > 0 then
        Cache.APLVar.RtB_Buffs.Total = Cache.APLVar.RtB_Buffs.Total + 1
        if Remains == RtBRemains then
          Cache.APLVar.RtB_Buffs.Normal = Cache.APLVar.RtB_Buffs.Normal + 1
        elseif Remains > RtBRemains then
          Cache.APLVar.RtB_Buffs.Longer = Cache.APLVar.RtB_Buffs.Longer + 1
        else
          Cache.APLVar.RtB_Buffs.Shorter = Cache.APLVar.RtB_Buffs.Shorter + 1
        end
      end
    end
  end
  return Cache.APLVar.RtB_Buffs.Total
end

-- RtB rerolling strategy, return true if we should reroll
local function RtB_Reroll ()
  if not Cache.APLVar.RtB_Reroll then
    -- 1+ Buff
    if Settings.Outlaw.RolltheBonesLogic == "1+ Buff" then
      Cache.APLVar.RtB_Reroll = (RtB_Buffs() <= 0) and true or false
      -- Broadside
    elseif Settings.Outlaw.RolltheBonesLogic == "Broadside" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.Broadside)) and true or false
      -- Buried Treasure
    elseif Settings.Outlaw.RolltheBonesLogic == "Buried Treasure" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.BuriedTreasure)) and true or false
      -- Grand Melee
    elseif Settings.Outlaw.RolltheBonesLogic == "Grand Melee" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.GrandMelee)) and true or false
      -- Skull and Crossbones
    elseif Settings.Outlaw.RolltheBonesLogic == "Skull and Crossbones" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.SkullandCrossbones)) and true or false
      -- Ruthless Precision
    elseif Settings.Outlaw.RolltheBonesLogic == "Ruthless Precision" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.RuthlessPrecision)) and true or false
      -- True Bearing
    elseif Settings.Outlaw.RolltheBonesLogic == "True Bearing" then
      Cache.APLVar.RtB_Reroll = (not Player:BuffUp(S.TrueBearing)) and true or false
      -- SimC Default
    else
      Cache.APLVar.RtB_Reroll = false
      RtB_Buffs()
      -- # Default Roll the Bones reroll rule: reroll for any buffs that aren't Buried Treasure, excluding Grand Melee in single target
      -- actions+=/variable,name=rtb_reroll,value=rtb_buffs.will_lose=
      -- (rtb_buffs.will_lose.buried_treasure+rtb_buffs.will_lose.grand_melee&spell_targets.blade_flurry<2&raid_event.adds.in>10)
      if RtB_Buffs() <= 2 and Player:BuffUp(S.BuriedTreasure) and Player:BuffDown(S.GrandMelee) and EnemiesBFCount < 2 then
        Cache.APLVar.RtB_Reroll = true
      end

      -- # Crackshot builds without T31 should reroll for True Bearing (or Broadside without Hidden Opportunity) if we won't lose over 1 buff
      -- actions+=/variable,name=rtb_reroll,if=talent.crackshot&talent.hidden_opportunity&!set_bonus.tier31_4pc,value=
      -- (!rtb_buffs.will_lose.true_bearing&talent.hidden_opportunity|!rtb_buffs.will_lose.broadside&!talent.hidden_opportunity)&rtb_buffs.will_lose<=1
      if S.Crackshot:IsAvailable() and S.HiddenOpportunity:IsAvailable() and not Player:HasTier(31, 4)
        and (not Player:BuffUp(S.TrueBearing) and S.HiddenOpportunity:IsAvailable() or not Player:BuffUp(S.Broadside) and not S.HiddenOpportunity:IsAvailable()) and RtB_Buffs() <= 1 then
        Cache.APLVar.RtB_Reroll = true
      end

      -- # Crackshot builds with T31 should reroll if we won't lose over 1 buff (2 with Loaded Dice)
      -- actions+=/variable,name=rtb_reroll,if=talent.crackshot&set_bonus.tier31_4pc,value=
      -- (rtb_buffs.will_lose<=1+buff.loaded_dice.up)&(talent.hidden_opportunity|!buff.broadside.up)
      if S.Crackshot:IsAvailable() and Player:HasTier(31, 4)
      and (RtB_Buffs() <= 1 + num(Player:BuffUp(S.LoadedDiceBuff))) then
        Cache.APLVar.RtB_Reroll = true
      end

      -- # Hidden Opportunity builds without Crackshot should reroll for Skull and Crossbones or any 2 buffs excluding Grand Melee in single target
      -- actions+=/variable,name=rtb_reroll,if=!talent.crackshot&talent.hidden_opportunity,value=!rtb_buffs.will_lose.skull_and_crossbones
      -- &(rtb_buffs.will_lose<2+rtb_buffs.will_lose.grand_melee&spell_targets.blade_flurry<2&raid_event.adds.in>10)
      if not S.Crackshot:IsAvailable() and S.HiddenOpportunity:IsAvailable() and not Player:BuffUp(S.SkullandCrossbones)
        and (RtB_Buffs() < 2 + num(Player:BuffUp(S.GrandMelee)) and EnemiesBFCount < 2) then
        Cache.APLVar.RtB_Reroll = true
      end

      -- # Additional reroll rules if all active buffs will not be rolled away and we don't already have 5+ buffs
      -- actions+/variable,name=rtb_reroll,value=variable.rtb_reroll|rtb_buffs.normal=0&rtb_buffs.longer>=1&rtb_buffs<5&rtb_buffs.max_remains<=39
      if Cache.APLVar.RtB_Reroll and (Cache.APLVar.RtB_Buffs.Longer == 0 or Cache.APLVar.RtB_Buffs.Normal == 0) and Cache.APLVar.RtB_Buffs.Longer >= 1 and RtB_Buffs() < 5 and Rogue.RtBRemains() <= 39
      and not Player:StealthUp(true, true) then
        Cache.APLVar.RtB_Reroll = true
      end

      -- # Avoid rerolls when we will not have time remaining on the fight or add wave to recoup the opportunity cost of the global
      -- actions+=/variable,name=rtb_reroll,op=reset,if=!(raid_event.adds.remains>12|raid_event.adds.up
      -- &(raid_event.adds.in-raid_event.adds.remains)<6|target.time_to_die>12)|fight_remains<12
      if Target:FilteredTimeToDie("<", 12) or HL.BossFilteredFightRemains("<", 12) then
        Cache.APLVar.RtB_Reroll = false
      end
    end
  end

  return Cache.APLVar.RtB_Reroll
end

-- # Use finishers if at -1 from max combo points, or -2 in Stealth with Crackshot
local function Finish_Condition ()
  -- actions+=/variable,name=finish_condition,value=effective_combo_points>=cp_max_spend-1-(stealthed.all&talent.crackshot)
  return EffectiveComboPoints >= Rogue.CPMaxSpend()-1-num((Player:StealthUp(true, true)) and S.Crackshot:IsAvailable())
end

-- # Ensure we want to cast Ambush prior to triggering a Stealth cooldown
local function Ambush_Condition ()
  -- actions+=/variable,name=ambush_condition,value=(talent.hidden_opportunity|combo_points.deficit>=2+talent.improved_ambush+buff.broadside.up)&energy>=50
  return (S.HiddenOpportunity:IsAvailable() or ComboPointsDeficit >=2 + num(S.ImprovedAmbush:IsAvailable()) + num(Player:BuffUp(S.Broadside))) and Energy >= 50
end

-- Determine if we are allowed to use Vanish offensively in the current situation
local function Vanish_DPS_Condition ()
  -- You can vanish if we've set the UseDPSVanish setting, and we're either not tanking or we're solo but the DPS vanish while solo flag is set).
  return Settings.Commons.VanishOffensive and CDsON() and not (Everyone.IsSoloMode() and Player:IsTanking(Target))
end

local function Vanish_Opportunity_Condition ()
  -- actions.stealth_cds=variable,name=vanish_opportunity_condition,value=!talent.shadow_dance&talent.fan_the_hammer.rank+talent.quick_draw+talent.audacity<talent.count_the_odds+talent.keep_it_rolling
  return not S.ShadowDanceTalent:IsAvailable()
    and S.FanTheHammer:TalentRank() + num(S.QuickDraw:IsAvailable()) + num(S.Audacity:IsAvailable()) < num(S.CountTheOdds:IsAvailable()) + num(S.KeepItRolling:IsAvailable())
end

local function Shadow_Dance_Condition ()
  -- # Hidden Opportunity builds without Crackshot use Dance if Audacity and Opportunity are not active
  -- actions.stealth_cds+=/variable,name=shadow_dance_condition,value=buff.between_the_eyes.up
  -- &(!talent.hidden_opportunity|!buff.audacity.up&(talent.fan_the_hammer.rank<2|!buff.opportunity.up))&!talent.crackshot
  return Player:BuffUp(S.BetweentheEyes) and (not S.HiddenOpportunity:IsAvailable() or Player:BuffDown(S.AudacityBuff)
    and (S.FanTheHammer:TalentRank() < 2 or Player:BuffDown(S.Opportunity))) and not S.Crackshot:IsAvailable()
end


local function StealthCDs ()
  -- # Hidden Opportunity builds without Crackshot use Vanish if Audacity is not active and when under max Opportunity stacks
  -- actions.stealth_cds+=/vanish,if=talent.hidden_opportunity&!talent.crackshot&!buff.audacity.up&(variable.vanish_opportunity_condition|buff.opportunity.stack<buff.opportunity.max_stack)&variable.ambush_condition
  if not HoldVanish and Settings.Commons.VanishOffensive and VCD
  and S.Vanish:IsReady() and Vanish_DPS_Condition() and S.HiddenOpportunity:IsAvailable() and not S.Crackshot:IsAvailable() and not Player:BuffUp(S.Audacity)
    and (Vanish_Opportunity_Condition() or Player:BuffStack(S.Opportunity) < 6) and Ambush_Condition() then
      if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast Vanish (HO)" end
    end
  
    -- # Crackshot builds or builds without Hidden Opportunity use Vanish at finish condition
    -- actions.stealth_cds+=/vanish,if=(!talent.hidden_opportunity|talent.crackshot)&variable.finish_condition
    if S.Vanish:IsReady() and VCD and Vanish_DPS_Condition() and (not S.HiddenOpportunity:IsAvailable() or S.Crackshot:IsAvailable()) and Finish_Condition() and not HoldVanish and VCD and Settings.Commons.VanishOffensive then
      if HR.Cast(S.Vanish, nil) then shouldcast = 1856 return "Cast Vanish (Finish)" end
    end

      -- # Crackshot builds use Dance at finish condition
  -- actions.stealth_cds+=/shadow_dance,if=talent.crackshot&variable.finish_condition
    -- synecdoche note: DPS gain in testing to hold off on shadow dance if vanish is coming up in the next 6 seconds to avoid wasting vanish CDR
  if S.ShadowDance:IsReady() and S.Crackshot:IsAvailable() and Finish_Condition()
  and (S.Vanish:CooldownRemains() >= 6 or not Settings.Commons.VanishOffensive) and not Player:StealthUp(true, false) and SDCD then
    if HR.Cast(S.ShadowDance, nil) then shouldcast = 185313 return "Cast Shadow Dance" end
  end

  -- actions.stealth_cds+=/shadow_dance,if=!talent.keep_it_rolling&variable.shadow_dance_condition&buff.slice_and_dice.up
  -- &(variable.finish_condition|talent.hidden_opportunity)&(!talent.hidden_opportunity|!cooldown.vanish.ready)
  if S.ShadowDance:IsReady() and not S.KeepItRolling:IsAvailable() and Shadow_Dance_Condition() and Player:BuffUp(S.SliceandDice)
  and (Finish_Condition() or S.HiddenOpportunity:IsAvailable()) and (not S.HiddenOpportunity:IsAvailable() or not S.Vanish:IsReady()) and SDCD then
    if HR.Cast(S.ShadowDance, nil) then shouldcast = 185313 return "Cast Shadow Dance" end
  end

  -- # Keep it Rolling builds without Crackshot use Dance at finish condition but hold it for an upcoming Keep it Rolling
  -- actions.stealth_cds+=/shadow_dance,if=talent.keep_it_rolling&variable.shadow_dance_condition
  -- &(cooldown.keep_it_rolling.remains<=30|cooldown.keep_it_rolling.remains>120&(variable.finish_condition|talent.hidden_opportunity))
  if S.ShadowDance:IsReady() and S.KeepItRolling:IsAvailable() and Shadow_Dance_Condition()
  and (S.KeepItRolling:CooldownRemains() <= 30 or S.KeepItRolling:CooldownRemains() >= 120 and (Finish_Condition() or S.HiddenOpportunity:IsAvailable())) and SDCD then
    if HR.Cast(S.ShadowDance, nil) then shouldcast = 185313 return "st Shadow Dance KiR without Crackshot" end
  end

  -- actions.stealth_cds+=/shadowmeld,if=talent.crackshot&variable.finish_condition|!talent.crackshot&(talent.count_the_odds&variable.finish_condition|talent.hidden_opportunity)
  if S.Shadowmeld:IsAvailable() and S.Shadowmeld:IsReady() and Settings.Commons.Racials then
    if S.Crackshot:IsAvailable() and Finish_Condition() or not S.Crackshot:IsAvailable() and (S.CountTheOdds:IsAvailable() and Finish_Condition() or S.HiddenOpportunity:IsAvailable()) then
      if HR.Cast(S.Shadowmeld, nil) then shouldcast = 58984 return "Cast Shadowmeld" end
    end
  end
end

local function CDs ()
  -- # Cooldowns Use Adrenaline Rush if it is not active and the finisher condition is not met, but Crackshot builds can refresh it with 2cp or lower inside stealth
  -- actions.cds=adrenaline_rush,if=!buff.adrenaline_rush.up&(!variable.finish_condition|!talent.improved_adrenaline_rush)
  -- |stealthed.all&talent.crackshot&talent.improved_adrenaline_rush&combo_points<=2
  if ARCD and S.AdrenalineRush:IsCastable()
  and (not Player:BuffUp(S.AdrenalineRush) and (not Finish_Condition() or not S.ImprovedAdrenalineRush:IsAvailable()) or (Player:StealthUp(true, true)
  and S.Crackshot:IsAvailable() and S.ImprovedAdrenalineRush:IsAvailable() and ComboPoints <= 2)) then
    if HR.Cast(S.AdrenalineRush, nil) then shouldcast = 13750 return "Cast Adrenaline Rush" end
  end

  -- # Maintain Blade Flurry on 2+ targets, and on single target with Underhanded during Adrenaline Rush
  -- action.cds+=/blade_flurry,if=(spell_targets>=2-talent.underhanded_upper_hand&!stealthed.all&buff.adrenaline_rush.up)&buff.blade_flurry.remains<gcd
  if S.BladeFlurry:IsReady() then
    if (EnemiesBFCount >= 2-num(S.UnderhandedUpperhand:IsAvailable() and not Player:StealthUp(true, true) and Player:BuffUp(S.AdrenalineRush)))
      and Player:BuffRemains(S.BladeFlurry) < Player:GCD() then
      if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Cast Blade Flurry" end
    end
  end

  -- # With Deft Maneuvers, use Blade Flurry on cooldown at 5+ targets, or at 3-4 targets if missing combo points equal to the amount given
  -- action.cds/blade_flurry,if=talent.deft_maneuvers&!variable.finish_condition&(spell_targets>=3
  -- &combo_points.deficit=spell_targets+buff.broadside.up|spell_targets>=5)
  if S.BladeFlurry:IsReady() then
    if S.DeftManeuvers:IsAvailable() and not Finish_Condition() and (EnemiesBFCount >=3
      and ComboPointsDeficit == EnemiesBFCount + num(Player:BuffUp(S.Broadside)) or EnemiesBFCount >= 5) then
        if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Cast Blade Flurry" end
    end
  end

--[[   HR.Print("BF R=" .. tostring(S.BladeFlurry:IsReady()),", DM A=" .. tostring(S.DeftManeuvers:IsAvailable())," EneC=" .. tostring(EnemiesBFCount >= 4))
  if S.BladeFlurry:IsReady() and S.DeftManeuvers:IsAvailable() and EnemiesBFCount >= 4 then
    HR.Print("NOW ITS USING")
    if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Cast Blade Flurry BypassRecovery" end
  end ]]

  -- roll_the_bones,if=variable.rtb_reroll|rtb_buffs=0|rtb_buffs.max_remains<=2&set_bonus.tier31_4pc|rtb_buffs.max_remains<=7&(cooldown.shadow_dance.ready|cooldown.vanish.ready)
  -- Use Roll the Bones if reroll conditions are met, or with no buffs, or 2s before buffs expire with T31, or 7s before buffs expire with Vanish/Dance ready
  if S.RolltheBones:IsReady() then
    if (RtB_Reroll() or RtB_Buffs() == 0 or (Rogue.RtBRemains() <= 3 and Player:HasTier(31, 4)) or Rogue.RtBRemains() <= 7 and (S.ShadowDance:CooldownRemains() <= 3 or S.Vanish:CooldownRemains() <= 3)
    and not Player:StealthUp(true, true)) then
            if HR.Cast(S.RolltheBones) then shouldcast = 315508 return "Cast Roll the Bones" end
    end
  end

  -- # Use Keep it Rolling with at least 3 buffs (4 with T31)
  -- actions.cds+=/keep_it_rolling,if=!variable.rtb_reroll&rtb_buffs>=3+set_bonus.tier31_4pc&(buff.shadow_dance.down|rtb_buffs>=6)
  if S.KeepItRolling:IsReady() and not RtB_Reroll() and RtB_Buffs() >= 3 + num(Player:HasTier(31, 4)) and (Player:BuffDown(S.ShadowDance) or RtB_Buffs() >= 6) then
    if HR.Cast(S.KeepItRolling, nil) then shouldcast = 381989 return "Cast Keep it Rolling" end
  end

  --actions.cds+=/ghostly_strike,if=effective_combo_points<cp_max_spend
  if S.GhostlyStrike:IsAvailable() and S.GhostlyStrike:IsReady() and EffectiveComboPoints < 7 then
    if HR.Cast(S.GhostlyStrike, nil, nil, not Target:IsSpellInRange(S.GhostlyStrike)) then shouldcast = 196937 return "Cast Ghostly Strike" end
  end

  -- # Use Sepsis to trigger Crackshot or if the target will survive its DoT
  -- actions.cds+=/sepsis,if=talent.crackshot&cooldown.between_the_eyes.ready&variable.finish_condition&!stealthed.all
  -- |!talent.crackshot&target.time_to_die>11&buff.between_the_eyes.up|fight_remains<11
  if CDsON() and S.Sepsis:IsAvailable() and S.Sepsis:IsReady() then
    if S.Crackshot:IsAvailable() and S.BetweentheEyes:IsReady() and Finish_Condition() and not Player:StealthUp(true, true)
      or not S.Crackshot:IsAvailable() and Target:FilteredTimeToDie(">", 11) and Player:BuffUp(S.BetweentheEyes) or HL.BossFilteredFightRemains("<", 11) then
      if HR.Cast(S.Sepsis, nil, nil, not Target:IsSpellInRange(S.Sepsis)) then shouldcast = 328305 return "Cast Sepsis" end
    end
  end

  -- actions.cds+=/call_action_list,name=stealth_cds,if=!stealthed.all&(!talent.crackshot|cooldown.between_the_eyes.ready)
  if not Player:StealthUp(true, true) and (not S.Crackshot:IsAvailable() or S.BetweentheEyes:IsReady()) then
    ShouldReturn = StealthCDs()
    if ShouldReturn then return ShouldReturn end
  end

  -- actions.cds+=/thistle_tea,if=!buff.thistle_tea.up&(energy.base_deficit>=100|fight_remains<charges*6)
  if CDsON() and S.ThistleTea:IsCastable() and not Player:BuffUp(S.ThistleTea)
    and (EnergyDeficit >= 100 or HL.BossFilteredFightRemains("<", S.ThistleTea:Charges()*6)) then
    if HR.Cast(S.ThistleTea, nil) then shouldcast = 381623 return "Cast Thistle Tea" end
  end

    -- # Use Blade Rush at minimal energy outside of stealth
  -- actions.cds+=/blade_rush,if=energy.base_time_to_max>4&!stealthed.all
  if S.BladeRush:IsCastable() and EnergyTimeToMax > 4 and not Player:StealthUp(true, true) then
    if HR.Cast(S.BladeRush, nil, nil, not Target:IsSpellInRange(S.BladeRush)) then shouldcast = 271877 return "Cast Blade Rush" end
  end

  -- actions.cds+=/potion,if=buff.bloodlust.react|fight_remains<30|buff.adrenaline_rush.up
    if Settings.Commons.Enabled.Potions then
      local PotionSelected = Everyone.PotionSelected()
      if PotionSelected then
        if PotionSelected:IsReady() and CDsON() and UsePots
          and ((Player:BloodlustUp() and HR.GUISettings.General.HoldPotforBL)
          or
          (
            (Player:BloodlustUp() or HL.BossFightRemains() <= 30 or Player:BuffUp(S.AdrenalineRush)) and
              not HR.GUISettings.General.HoldPotforBL)) then
          if HR.Cast(PotionSelected, nil) then shouldcast = 50 return "potion cooldowns 2"; end
        end
      end
    end

  -- actions.cds+=/blood_fury
  if S.BloodFury:IsCastable() then
    if HR.Cast(S.BloodFury, nil) then shouldcast = 20572 return "Cast Blood Fury" end
  end

  -- actions.cds+=/berserking
  if S.Berserking:IsCastable() then
    if HR.Cast(S.Berserking, nil) then shouldcast = 26297 return "Cast Berserking" end
  end

  -- actions.cds+=/fireblood
  if S.Fireblood:IsCastable() then
    if HR.Cast(S.Fireblood, nil) then shouldcast = 265221 return "Cast Fireblood" end
  end

  -- actions.cds+=/ancestral_call
  if S.AncestralCall:IsCastable() then
    if HR.Cast(S.AncestralCall, nil) then shouldcast = 274738 return "Cast Ancestral Call" end
  end

  if Settings.Commons.Enabled.BottomTrinket or Settings.Commons.Enabled.TopTrinket then
    if I.ManicGrieftorch:IsEquippedAndReady() then
      if Player:GCDRemains() > Player:GCD()-0.1 and not Player:StealthUp(true, true) and Player:BuffUp(S.BetweentheEyes) or
        HL.BossFilteredFightRemains("<=", 5) then
        if HR.Cast(I.ManicGrieftorch, nil, nil) then
          if I.BalefireBranch:ID() == TopTrinketID then
            shouldcast = 24 
            return "Manic Grieftorch top";
          elseif I.ManicGrieftorch:ID() == BotTrinketID then
            shouldcast = 30 
            return "Manic Grieftorch bop";
          end	
        end
      end
    end

    -- actions.cds+=/use_item,name=dragonfire_bomb_dispenser,use_off_gcd=1,if=(!trinket.1.is.dragonfire_bomb_dispenser&trinket.1.cooldown.remains>10
    -- |trinket.2.cooldown.remains>10)|cooldown.dragonfire_bomb_dispenser.charges>2|fight_remains<20|!trinket.2.has_cooldown|!trinket.1.has_cooldown
    if I.DragonfireBombDispenser:IsEquippedAndReady() then
      if (not trinket1:ID() == I.DragonfireBombDispenser:ID() and trinket1:CooldownRemains() > 10 or
        trinket2:CooldownRemains() > 10) or HL.BossFilteredFightRemains("<", 20) or not trinket2:HasCooldown() or not trinket1:HasCooldown() then
          if HR.Cast(I.DragonfireBombDispenser, nil, nil) then
            if I.DragonfireBombDispenser:ID() == TopTrinketID then
              shouldcast = 24 
              return "Dragonfire Bomb Dispenser top";
            elseif I.DragonfireBombDispenser:ID() == BotTrinketID then
              shouldcast = 30 
              return "Dragonfire Bomb Dispenser bop";
            end	
          end
        end
    end

  -- actions.cds+=/use_item,name=beacon_to_the_beyond,use_off_gcd=1,if=gcd.remains>gcd.max-0.1&!stealthed.all&buff.between_the_eyes.up|fight_remains<=5
    if I.BeaconToTheBeyond:IsEquippedAndReady() then
      if not Player:StealthUp(true, true) and Player:BuffUp(S.BetweentheEyes)
        or HL.BossFilteredFightRemains("<", 5) then
          if HR.Cast(I.DragonfireBombDispenser, nil, nil) then
            if I.DragonfireBombDispenser:ID() == TopTrinketID then
              shouldcast = 24 
              return "Beacon top";
            elseif I.DragonfireBombDispenser:ID() == BotTrinketID then
              shouldcast = 30 
              return "Beacon bop";
            end	
          end
      end
    end  

    -- # Default conditions for usable items.
    local TrinketToUse = Player:GetUseableTrinkets(OnUseExcludes)
    TrinketToUse = Player:GetUseableTrinkets(OnUseExcludes)
    if TrinketToUse and (CDsON() and not Player:StealthUp(true, true) or HL.BossFilteredFightRemains("<", 10)) then
      if TrinketToUse and (Player:BuffUp(S.BetweentheEyes) or HL.BossFilteredFightRemains("<", 20) or TrinketToUse:HasStatAnyDps()) then
        if HR.Cast(TrinketToUse, nil, nil) then
          if TrinketToUse:ID() == GetInventoryItemID("player", 13) and Settings.Commons.Enabled.TopTrinket then
            shouldcast = 24
            return "Generic use_items for " .. TrinketToUse:Name();
          elseif TrinketToUse:ID() == GetInventoryItemID("player", 14) and Settings.Commons.Enabled.BottomTrinket then
            shouldcast = 25
            return "Generic use_items for " .. TrinketToUse:Name();
          end
        end
      end
    end
  end
end

local function Stealth()
	-- actions.stealth=blade_flurry,if=talent.subterfuge&talent.hidden_opportunity&spell_targets>=2&buff.blade_flurry.remains<gcd
	if S.BladeFlurry:IsReady() and S.BladeFlurry:IsCastable() and AoEON() and S.Subterfuge:IsAvailable() and S.HiddenOpportunity:IsAvailable() and EnemiesBFCount >= 2
  and Player:BuffRemains(S.BladeFlurry) <= Player:GCD() and (S.AdrenalineRush:IsReady() or Player:BuffUp(S.AdrenalineRush)) then
    if Settings.Outlaw.GCDasOffGCD.BladeFlurry then
      if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Cast Blade Flurry" end
    else
     if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Cast Blade Flurry" end
    end
	end

	-- actions.stealth+=/cold_blood,if=variable.finish_condition
	if S.ColdBlood:IsCastable() and Player:BuffDown(S.ColdBlood) and Target:IsSpellInRange(S.Dispatch) and Finish_Condition() then
		if HR.Cast(S.ColdBlood, nil) then shouldcast = 382245 return "Cast Cold Blood" end
	end

	-- actions.stealth+=/between_the_eyes,if=variable.finish_condition&talent.crackshot
  if S.BetweentheEyes:IsCastable() and Target:IsSpellInRange(S.BetweentheEyes) and Finish_Condition() and S.Crackshot:IsAvailable()
  and (not Player:BuffUp(S.Shadowmeld) or Player:StealthUp(true, false)) then
    if HR.CastPooling(S.BetweentheEyes) then shouldcast = 315341 return "Cast Between the Eyes" end
	end

	-- actions.stealth+=/dispatch,if=variable.finish_condition
	if S.Dispatch:IsCastable() and Target:IsSpellInRange(S.Dispatch) and Finish_Condition() then
		if HR.CastPooling(S.Dispatch) then shouldcast = 2098 return "Cast Dispatch" end
	end

	-- # 2 Fan the Hammer Crackshot builds can consume Opportunity in stealth with max stacks, Broadside, and low CPs, or with Greenskins active
	-- actions.stealth+=/pistol_shot,if=talent.crackshot&talent.fan_the_hammer.rank>=2&buff.opportunity.stack>=6
	-- &(buff.broadside.up&combo_points<=1|buff.greenskins_wickers.up)
	if S.PistolShot:IsCastable() and Target:IsSpellInRange(S.PistolShot) and S.Crackshot:IsAvailable() and S.FanTheHammer:TalentRank() >= 2 and Player:BuffStack(S.Opportunity) >= 6
		and (Player:BuffUp(S.Broadside) and ComboPoints <= 1 or Player:BuffUp(S.GreenskinsWickersBuff)) then
		if HR.CastPooling(S.PistolShot) then shouldcast = 185763 return "Cast Pistol Shot" end
	end

	-- actions.stealth+=/ambush,if=talent.hidden_opportunity
	if S.Ambush:IsCastable() and Target:IsSpellInRange(S.Ambush) and S.HiddenOpportunity:IsAvailable() then
		if HR.CastPooling(S.Ambush) then shouldcast = 8676 return "Cast Ambush" end
	end
end

local function Finish ()
	-- # Finishers Use Between the Eyes to keep the crit buff up, but on cooldown if Improved/Greenskins/T30, and avoid overriding Greenskins
	-- actions.finish=between_the_eyes,if=!talent.crackshot
	-- &(buff.between_the_eyes.remains<4|talent.improved_between_the_eyes|talent.greenskins_wickers|set_bonus.tier30_4pc)
	-- &!buff.greenskins_wickers.up
	if S.BetweentheEyes:IsCastable() and Target:IsSpellInRange(S.BetweentheEyes) and not S.Crackshot:IsAvailable()
		and (Player:BuffRemains(S.BetweentheEyes) < 4 or S.ImprovedBetweenTheEyes:IsAvailable() or S.GreenskinsWickers:IsAvailable()
    or Player:HasTier(30, 4)) and Player:BuffDown(S.GreenskinsWickers) then
		if HR.CastPooling(S.BetweentheEyes) then shouldcast = 315341 return "Cast Between the Eyes" end
	end

	-- #Crackshot builds use Between the Eyes outside of Stealth if Vanish or Dance will not come off cooldown within the next cast
	-- actions.finish+=/between_the_eyes,if=talent.crackshot&(cooldown.vanish.remains>45&cooldown.shadow_dance.remains>12)
	if S.BetweentheEyes:IsCastable() and Target:IsSpellInRange(S.BetweentheEyes) and S.Crackshot:IsAvailable()
  and (S.Vanish:CooldownRemains() > 45 and S.ShadowDance:CooldownRemains() > 15) then
		if HR.CastPooling(S.BetweentheEyes) then shouldcast = 315341 return "Cast Between the Eyes" end
	end

	-- actions.finish+=/slice_and_dice,if=buff.slice_and_dice.remains<fight_remains&refreshable
	-- Note: Added Player:BuffRemains(S.SliceandDice) == 0 to maintain the buff while TTD is invalid (it's mainly for Solo, not an issue in raids)
	if S.SliceandDice:IsCastable() and (HL.FilteredFightRemains(EnemiesBF, ">", Player:BuffRemains(S.SliceandDice), true) or Player:BuffRemains(S.SliceandDice) == 0)
		and Player:BuffRemains(S.SliceandDice) < (1 + ComboPoints) * 1.8 then
		if HR.CastPooling(S.SliceandDice) then shouldcast = 315496 return "Cast Slice and Dice" end
	end

	-- actions.finish+=/killing_spree,if=debuff.ghostly_strike.up|!talent.ghostly_strike
	if S.KillingSpree:IsCastable() and Target:IsSpellInRange(S.KillingSpree) and (Target:DebuffUp(S.GhostlyStrike) or not S.GhostlyStrike:IsAvailable()) then
		if HR.Cast(S.KillingSpree) then shouldcast = 51690 return "Cast Killing Spree" end
	end

  if S.ColdBlood:IsCastable() and Player:BuffDown(S.ColdBlood) and Target:IsSpellInRange(S.Dispatch) then
    if HR.Cast(S.ColdBlood, nil) then shouldcast = 382245 return "Cast Cold Blood" end
  end
  -- actions.finish+=/dispatch
  if S.Dispatch:IsCastable() and Target:IsSpellInRange(S.Dispatch) then
    if HR.CastPooling(S.Dispatch) then shouldcast = 2098 return "Cast Dispatch" end
  end
end

local function Build ()
	-- actions.build+=/echoing_reprimand
	if CDsON() and S.EchoingReprimand:IsReady() then
		if HR.Cast(S.EchoingReprimand, nil, nil) then shouldcast = 323547 return "Cast Echoing Reprimand" end
	end

	-- actions.build+=/ambush,if=talent.hidden_opportunity&buff.audacity.up
  if S.Ambush:IsCastable() and S.HiddenOpportunity:IsAvailable() and Player:BuffUp(S.AudacityBuff) then
    if HR.CastPooling(S.SSAudacity, nil, not Target:IsSpellInRange(S.Ambush)) then shouldcast = 8676 return "Cast Ambush (High-Prio Buffed)" end
  end

	-- # With Audacity + Hidden Opportunity + Fan the Hammer, consume Opportunity to proc Audacity any time Ambush is not available
	-- actions.build+=/pistol_shot,if=talent.fan_the_hammer&talent.audacity&talent.hidden_opportunity&buff.opportunity.up&!buff.audacity.up
	if S.FanTheHammer:IsAvailable() and S.Audacity:IsAvailable() and S.HiddenOpportunity:IsAvailable() and Player:BuffUp(S.Opportunity) and Player:BuffDown(S.AudacityBuff) then
		if HR.CastPooling(S.PistolShot, nil, not Target:IsSpellInRange(S.PistolShot)) then shouldcast = 185763 return "Cast Pistol Shot (Audacity)" end
	end

  -- # With Fan the Hammer, consume Opportunity as a higher priority if at max stacks or if it will expire
	-- actions.build+=/pistol_shot,if=talent.fan_the_hammer&buff.opportunity.up&(buff.opportunity.stack>=buff.opportunity.max_stack|buff.opportunity.remains<2)
	if S.FanTheHammer:IsAvailable() and Player:BuffUp(S.Opportunity) and (Player:BuffStack(S.Opportunity) >= 6 or Player:BuffRemains(S.Opportunity) < 2) then
		if HR.CastPooling(S.PistolShot, nil, not Target:IsSpellInRange(S.PistolShot)) then shouldcast = 185763 return "Cast Pistol Shot (FtH Dump)" end
	end

  -- # With Fan the Hammer, consume Opportunity if it will not overcap CPs, or with 1 CP at minimum
  -- actions.build+=/pistol_shot,if=talent.fan_the_hammer&buff.opportunity.up&(combo_points.deficit>=(1+(talent.quick_draw+buff.broadside.up)
  -- *(talent.fan_the_hammer.rank+1))|combo_points<=talent.ruthlessness)
  if S.FanTheHammer:IsAvailable() and Player:BuffUp(S.Opportunity) and (ComboPointsDeficit>=(1+(num(S.QuickDraw:IsAvailable())+num(Player:BuffUp(S.Broadside)))
  *(S.FanTheHammer:TalentRank()+1)) or ComboPoints <= num(S.Ruthlessness:IsAvailable())) then
		if HR.CastPooling(S.PistolShot, nil, not Target:IsSpellInRange(S.PistolShot)) then shouldcast = 185763 return "Cast Pistol Shot" end
	end

	-- #If not using Fan the Hammer, then consume Opportunity based on energy, when it will exactly cap CPs, or when using Quick Draw
  -- actions.build+=/pistol_shot,if=!talent.fan_the_hammer&buff.opportunity.up&(energy.base_deficit>energy.regen*1.5|combo_points.deficit<=1+buff.broadside.up
  -- |talent.quick_draw.enabled|talent.audacity.enabled&!buff.audacity.up)
  if not S.FanTheHammer:IsAvailable() and Player:BuffUp(S.Opportunity) and (EnergyTimeToMax > 1.5 or ComboPointsDeficit <= 1 + num(Player:BuffUp(S.Broadside))
    or S.QuickDraw:IsAvailable() or S.Audacity:IsAvailable() and Player:BuffDown(S.AudacityBuff)) then		
      if HR.CastPooling(S.PistolShot, nil, not Target:IsSpellInRange(S.PistolShot)) then shouldcast = 185763 return "Cast Pistol Shot" end
	end

  -- actions.build+=/sinister_strike
  if S.SinisterStrike:IsCastable() and Target:IsSpellInRange(S.SinisterStrike) then
    if HR.CastPooling(S.SinisterStrike, nil, not Target:IsSpellInRange(S.SinisterStrike))  then shouldcast = 193315 return "Cast Sinister Strike" end
  end
end

local function Reset()
  Opener = HeroRotationCharDB.Toggles[5]
  SmallCDsOn = HeroRotationCharDB.Toggles[4]
  StopAutoSwap = HeroRotationCharDB.Toggles[12]
  UsePots = not HeroRotationCharDB.Toggles[15]
  HoldVanish = HeroRotationCharDB.Toggles[21]
  QCheapShot = HeroRotationCharDB.Toggles[22]
  QKidneyShot = HeroRotationCharDB.Toggles[23]
  QBlind = HeroRotationCharDB.Toggles[24]
  QSap = HeroRotationCharDB.Toggles[25]
  QFeint = HeroRotationCharDB.Toggles[27]
  QGouge = HeroRotationCharDB.Toggles[50]
  BRmeleeOnly = HeroRotationCharDB.Toggles[51]
  HoldKillingSpree = HeroRotationCharDB.Toggles[52]
  QGraplingHook = HeroRotationCharDB.Toggles[53]
  QRacial = HeroRotationCharDB.Toggles[30]
  HoldShiv = HeroRotationCharDB.Toggles[54]
  QBladeFlurry = HeroRotationCharDB.Toggles[190]


  TopTrinketID = GetInventoryItemID("player", 13)
  BotTrinketID = GetInventoryItemID("player", 14)
  if not Settings.Commons.Enabled.TopTrinket and not Settings.Commons.Enabled.BottomTrinket then
    OnUseExcludes = { --  I.TrinketName:ID(),
      TopTrinketID,
      BotTrinketID,
    }
  elseif not Settings.Commons.Enabled.TopTrinket and Settings.Commons.Enabled.BottomTrinket then
    OnUseExcludes = { --  I.TrinketName:ID(),
      TopTrinketID,
    }
  elseif not Settings.Commons.Enabled.BottomTrinket and Settings.Commons.Enabled.TopTrinket then
    OnUseExcludes = { --  I.TrinketName:ID(),
      BotTrinketID,
    }
  end

  ARCD = false
  VCD = false
  GSCD = false
  SDCD = false

    if ((Settings.Outlaw.AdrenalineRushCD == "CDs" and CDsON()) or 
        (Settings.Outlaw.AdrenalineRushCD == "Small CDs" and (SmallCDsOn)) or 
        (Settings.Outlaw.AdrenalineRushCD == "Always")) then
        ARCD = true
    end

    if ((Settings.Outlaw.VanishCD == "CDs" and CDsON()) or 
        (Settings.Outlaw.VanishCD == "Small CDs" and (SmallCDsOn)) or 
        (Settings.Outlaw.VanishCD == "Always")) then
        VCD = true
    end
    if ((Settings.Outlaw.GhostlyStrikeCD == "CDs" and CDsON()) or 
        (Settings.Outlaw.GhostlyStrikeCD == "Small CDs" and (SmallCDsOn)) or 
        (Settings.Outlaw.GhostlyStrikeCD == "Always")) then
        GSCD = true
    end
    if ((Settings.Outlaw.ShadowDanceCD == "CDs" and CDsON()) or 
        (Settings.Outlaw.ShadowDanceCD == "Small CDs" and (SmallCDsOn)) or 
        (Settings.Outlaw.ShadowDanceCD == "Always")) then
        SDCD = true
    end

  QuakingR = 0
  --Quaking
  for i = 1, 20 do
    if select(10, UnitDebuff("player", i)) == 240447 then
      if select(6, UnitDebuff("player", i)) ~= nil then
        QuakingR = (select(6, UnitDebuff("player", i)) - (GetTime()))
      end
    end
  end

end
EnemiesBF = Player:GetEnemiesInRange(BladeFlurryRange, S.SinisterStrike)



--- ======= MAIN =======
local function APL ()
  local Xxx = HR.Common.Everyone

  local instance = Xxx.WhiteList()

  -- Prints "secret"
  --print(instance.getPrivateProperty())
  -- Local Update
  BladeFlurryRange = S.AcrobaticStrikes:IsAvailable() and 9 or 6
  ComboPoints = Player:ComboPoints()
  EffectiveComboPoints = Rogue.EffectiveComboPoints(ComboPoints)
  ComboPointsDeficit = Player:ComboPointsDeficit()
  EnergyMaxOffset = Player:BuffUp(S.AdrenalineRush, nil, true) and -50 or 0 -- For base_time_to_max emulation
  Energy = EnergyPredictedStable()
  EnergyRegen = Player:EnergyRegen()
  EnergyTimeToMax = EnergyTimeToMaxStable(EnergyMaxOffset) -- energy.base_time_to_max
  EnergyDeficit = Player:EnergyDeficitPredicted(nil, EnergyMaxOffset) -- energy.base_deficit

  -- Unit Update
  if AoEON() then
    Enemies30y = Player:GetEnemiesInRange(30) -- Serrated Bone Spike cycle
    EnemiesBF = Player:GetEnemiesInRange(BladeFlurryRange)
    EnemiesBFCount = #EnemiesBF
  else
    EnemiesBFCount = 1
  end

  ShouldReturn = Reset()
  if HR.QueuedCast() then shouldcast = HR.QueuedCast() return "Custom Queue " .. Spell(shouldcast):ID() end

  if ShouldReturn then
    return ShouldReturn
  end

  if MOshouldcast > 0 then
    MOshouldcast = 0
  end

  if shouldcast > 0 then
    shouldcast = 0
  end

  shouldcast = Rogue.ReturnSpell()
  MOshouldcast = Rogue.ReturnSpellMO()
  --Resets
  if HR.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[5] then
    starttime = GetTime()
    endtime = starttime + (HR.GUISettings.General.OpenerReset)
  elseif HR.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and
    HeroRotationCharDB.Toggles[5] then
    HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5];
    HR.ToggleIconFrame:UpdateButtonText(5);
    HR.Print("Opener is now " .. (HeroRotationCharDB.Toggles[5] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."));
  end

  --Queues
  if (QGraplingHook and S.GrapplingHook:IsUsableP() and S.GrapplingHook:CooldownRemains(BypassRecovery) <= 0) then
    if HR.Cast(S.GrapplingHook, nil, nil, nil) then
      shouldcast = 195457
      return "queue Grappling Hook";
    end
  elseif ((not S.GrapplingHook:IsUsableP() or S.GrapplingHook:CooldownRemains() > 0) and QGraplingHook) then
    HeroRotationCharDB.Toggles[53] = not HeroRotationCharDB.Toggles[53];
    HR.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[53] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (
    QCheapShot and S.CheapShot:IsUsableP() and S.CheapShot:CooldownRemains(BypassRecovery) <= 0 and
      (Player:StealthUp(true, true) or Player:BuffUp(S.VanishBuff)) and
      (Target:IsInRange(8) or Unit("mouseover"):IsInRange(8))) then
    if HR.Cast(S.CheapShot, nil, nil, nil) then
      if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.CheapShot) then
        MOshouldcast = 18335
        return "queue Cheap Shot MO";
      else
        shouldcast = 1833
        return "queue Cheap Shot";
      end
    end
  elseif ((not S.CheapShot:IsUsableP() or S.CheapShot:CooldownRemains() > 0) and QCheapShot) then
    HeroRotationCharDB.Toggles[22] = not HeroRotationCharDB.Toggles[22];
    HR.Print("Cheap Shot Queue is now " .. (HeroRotationCharDB.Toggles[22] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (
    QKidneyShot and S.KidneyShot:IsUsableP() and S.KidneyShot:CooldownRemains(BypassRecovery) <= 0 and
      (Target:IsInRange(8) or Unit("mouseover"):IsInRange(8))) then
    if HR.Cast(S.KidneyShot, nil, nil, nil) then
      if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.KidneyShot) then
        MOshouldcast = 4085
        return "queue Kidney Shot MO";
      else
        shouldcast = 408
        return "queue Kidney Shot";
      end
    end
  elseif ((not S.KidneyShot:IsUsableP() or S.KidneyShot:CooldownRemains() > 0) and QKidneyShot) then
    HeroRotationCharDB.Toggles[23] = not HeroRotationCharDB.Toggles[23];
    HR.Print("Kidney Shot Queue is now " .. (HeroRotationCharDB.Toggles[23] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (
    QBlind and S.Blind:IsUsableP() and S.Blind:CooldownRemains(BypassRecovery) <= 0 and
      (Target:IsInRange(15) or Unit("mouseover"):IsInRange(15))) then
    if HR.Cast(S.Blind, nil, nil, nil) then
      if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Blind) then
        MOshouldcast = 20945
        return "queue Blind MO";
      end
    end
  elseif ((not S.Blind:IsUsableP() or S.Blind:CooldownRemains() > 0) and QBlind) then
    HeroRotationCharDB.Toggles[24] = not HeroRotationCharDB.Toggles[24];
    HR.Print("Blind Queue is now " .. (HeroRotationCharDB.Toggles[24] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (
    QSap and S.Sap:IsUsableP() and S.Sap:CooldownRemains(BypassRecovery) <= 0 and Player:StealthUp(true, true) and
      (Target:IsInRange(10) or Unit("mouseover"):IsInRange(10))) then
    if HR.Cast(S.Sap, nil, nil, nil) then
      if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Sap) then
        MOshouldcast = 67705
        return "queue Sap MO";
      else
        shouldcast = 6770
        return "queue Sap";
      end
    end
  elseif ((not S.Sap:IsUsableP() or S.Sap:CooldownRemains() > 0 or not Player:StealthUp(true, true)) and QSap) then
    HeroRotationCharDB.Toggles[25] = not HeroRotationCharDB.Toggles[25];
    HR.Print("Sap Queue is now " .. (HeroRotationCharDB.Toggles[25] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end


  if (QFeint and S.Feint:IsUsableP() and S.Feint:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat() and not Player:PrevGCD(1,S.Feint)) then
    if HR.Cast(S.Feint, nil, nil, nil) then
      shouldcast = 202
      return "queue Feint";
    end
  elseif ((not S.Feint:IsUsableP() or S.Feint:CooldownRemains() > 0 or not Player:AffectingCombat()) and QFeint) then
    HeroRotationCharDB.Toggles[27] = not HeroRotationCharDB.Toggles[27];
    HR.Print("Feint Queue is now " .. (HeroRotationCharDB.Toggles[27] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (
    BRmeleeOnly and S.BladeRush:IsUsableP() and S.BladeRush:CooldownRemains(BypassRecovery) <= 0 and
      Player:AffectingCombat()) then
    if HR.Cast(S.BladeRush, nil, nil, not Target:IsSpellInRange(S.BladeRush)) then
      shouldcast = 271877
      return "queue BladeRush";
    end
  elseif (
    (not S.BladeRush:IsUsableP() or S.BladeRush:CooldownRemains() > 0 or not Player:AffectingCombat()) and BRmeleeOnly
  ) then
    HeroRotationCharDB.Toggles[51] = not HeroRotationCharDB.Toggles[51];
    HR.Print("BladeRush que is now " .. (HeroRotationCharDB.Toggles[51] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QGouge and S.Gouge:IsUsableP() and S.Gouge:CooldownRemains(BypassRecovery) <= 0) then
    if HR.Cast(S.Gouge, nil, nil, nil) then
      if Unit("mouseover"):GUID() ~= nil and Unit("mouseover"):IsSpellInRange(S.Gouge) then
        MOshouldcast = 17765
        return "queue Gouge MO";
      elseif Unit("target"):IsSpellInRange(S.Gouge) then
        shouldcast = 1776
        return "queue Gouge";
      end
    end
  elseif ((not S.Gouge:IsUsableP() or S.Gouge:CooldownRemains() > 0 or not Player:AffectingCombat()) and QGouge) then
    HeroRotationCharDB.Toggles[50] = not HeroRotationCharDB.Toggles[50];
    HR.Print("Gouge Queue is now " .. (HeroRotationCharDB.Toggles[50] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end
  
  if (
    QBladeFlurry and S.BladeFlurry:IsUsableP() and S.BladeFlurry:CooldownRemains(BypassRecovery) <= 0 and
      Player:AffectingCombat()) then
    if HR.Cast(S.BladeFlurry, nil, nil, nil) then
      shouldcast = 13877
      return "queue BladeFlurry";
    end
  elseif (
    (not S.BladeFlurry:IsUsableP() or S.BladeFlurry:CooldownRemains() > 0 or not Player:AffectingCombat()) and QBladeFlurry
  ) then
    HeroRotationCharDB.Toggles[190] = not HeroRotationCharDB.Toggles[190];
    HR.Print("BladeFlurry que is now " .. (HeroRotationCharDB.Toggles[190] and "|cff00ff00on|r." or "|cffff0000off|r."));
  end

  if (QRacial) then
    if (
      S.ArcaneTorrent:IsAvailable() and S.ArcaneTorrent:IsUsableP() and
        S.ArcaneTorrent:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
      if HR.Cast(S.ArcaneTorrent, nil, nil, nil) then
        shouldcast = 155145
        return "queue ArcaneTorrent Queue";
      end
    elseif (
      S.LightsJudgment:IsAvailable() and S.LightsJudgment:IsUsableP() and
        S.LightsJudgment:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
      if HR.Cast(S.LightsJudgment, nil, nil, nil) then
        shouldcast = 255647
        return "queue LightsJudgment Queue";
      end
    elseif (
      S.BagofTricks:IsAvailable() and S.BagofTricks:IsUsableP() and S.BagofTricks:CooldownRemains(BypassRecovery) <= 0
        and Player:AffectingCombat()) then
      if HR.Cast(S.BagofTricks, nil, nil, nil) then
        shouldcast = 312411
        return "queue BagofTricks Queue";
      end
    elseif (
      S.BloodFury:IsAvailable() and S.BloodFury:IsUsableP() and S.BloodFury:CooldownRemains(BypassRecovery) <= 0 and
        Player:AffectingCombat()) then
      if HR.Cast(S.BloodFury, nil, nil, nil) then
        shouldcast = 20572
        return "queue BloodFury Queue";
      end
    elseif (
      S.Berserking:IsAvailable() and S.Berserking:IsUsableP() and S.Berserking:CooldownRemains(BypassRecovery) <= 0 and
        Player:AffectingCombat()) then
      if HR.Cast(S.Berserking, nil, nil, nil) then
        shouldcast = 26297
        return "queue Berserking Queue";
      end
    elseif (
      S.Fireblood:IsAvailable() and S.Fireblood:IsUsableP() and S.Fireblood:CooldownRemains(BypassRecovery) <= 0 and
        Player:AffectingCombat()) then
      if HR.Cast(S.Fireblood, nil, nil, nil) then
        shouldcast = 265221
        return "queue Fireblood Queue";
      end
    elseif (
      S.AncestralCall:IsAvailable() and S.AncestralCall:IsUsableP() and
        S.AncestralCall:CooldownRemains(BypassRecovery) <= 0 and Player:AffectingCombat()) then
      if HR.Cast(S.AncestralCall, nil, nil, nil) then
        shouldcast = 274738
        return "queue AncestralCall Queue";
      end
    elseif (
      (
        (
          S.ArcaneTorrent:IsAvailable() and
            (
              not S.ArcaneTorrent:IsUsableP() or S.ArcaneTorrent:CooldownRemains() > 0 or
                not Player:AffectingCombat())) or
          (
            S.LightsJudgment:IsAvailable() and
              (
                not S.LightsJudgment:IsUsableP() or S.LightsJudgment:CooldownRemains() > 0 or
                  not Player:AffectingCombat())) or
          (
            S.BagofTricks:IsAvailable() and
              (
                not S.BagofTricks:IsUsableP() or S.BagofTricks:CooldownRemains() > 0 or not Player:AffectingCombat()
              )) or
          (
            S.BloodFury:IsAvailable() and
              (not S.BloodFury:IsUsableP() or S.BloodFury:CooldownRemains() > 0 or not Player:AffectingCombat()))
          or
          (
            S.Berserking:IsAvailable() and
              (not S.Berserking:IsUsableP() or S.Berserking:CooldownRemains() > 0 or not Player:AffectingCombat())
          ) or
          (
            S.Fireblood:IsAvailable() and
              (not S.Fireblood:IsUsableP() or S.Fireblood:CooldownRemains() > 0 or not Player:AffectingCombat()))
          or
          (
            S.AncestralCall:IsAvailable() and
              (
                not S.AncestralCall:IsUsableP() or S.AncestralCall:CooldownRemains() > 0 or
                  not Player:AffectingCombat())))
        and QRacial) then
      HeroRotationCharDB.Toggles[30] = not HeroRotationCharDB.Toggles[30];
      HR.Print("Arcane Torrent Queue is now " ..
        (HeroRotationCharDB.Toggles[30] and "|cff00ff00on|r." or "|cffff0000off|r."));
    end
  end
    --    function Commons.HandleIncorporeal(Spell, TargetTyp, Range, Immovable)
  if Everyone.HandleIncorporeal(S.Blind,Mouseover,15,false) then
    if HR.Cast(S.Blind) then MOshouldcast = 20945 return "blind MO" end
  end

  if Everyone.Interrupt(S.Kick,Target) then
    if HR.Cast(S.Kick) then shouldcast = 1766 return "Cast Kick" end
  end
  if Everyone.Interrupt(S.Kick,Mouseover) then
    if HR.Cast(S.Kick) then MOshouldcast = 111766 return "Cast Kick MO"  end
  end
  if Everyone.IntteruptWithStun(S.CheapShot,Target) then
    if HR.Cast(S.Kick) then shouldcast = 1833 return "Cast Cheap Shot" end
  end
  if Everyone.IntteruptWithStun(S.CheapShot,Mouseover) then
    if HR.Cast(S.Kick) then MOshouldcast = 18335 return "Cast Cheap Shot MO" end
  end
  if Everyone.IntteruptWithStun(S.KidneyShot,Target) then
    if HR.Cast(S.Kick) then shouldcast = 408 return "Cast Kidney Shot" end
  end
  if Everyone.IntteruptWithStun(S.KidneyShot,Mouseover) then
    if HR.Cast(S.Kick) then MOshouldcast = 4085 return "Cast Kidney Shot MO" end
  end
  if Everyone.IntteruptWithStun(S.Blind,Target) then
    if HR.Cast(S.Kick) then shouldcast = 2094 return "Cast Blind" end
  end
  if Everyone.IntteruptWithStun(S.Blind,Mouseover) then
    if HR.Cast(S.Kick) then MOshouldcast = 20945 return "Cast Blind MO" end
  end

  
  if Player:IsChanneling(Spell(324631)) then
    if HR.Cast(S.PoolEnergy, nil, nil, nil) then shouldcast = 99999 return "channeling Fleashcraft"; end
  end

  -- Defensives
  -- Crimson Vial
  ShouldReturn = Rogue.CrimsonVial()
  if ShouldReturn then return ShouldReturn end
  -- Feint
  ShouldReturn = Rogue.Feint()
  if ShouldReturn then return ShouldReturn end
  --Evasion
  ShouldReturn = Rogue.Evasion()
  if ShouldReturn then return ShouldReturn end

  if Player:HealthPercentage() < Settings.Commons.PhialHP and I.PhialofSerenity:IsReady() and
    I.PhialofSerenity:CooldownRemains() <= 0 then
    if HR.Cast(I.PhialofSerenity, nil) then shouldcast = 55 return "PhialofSerenity HP"; end
  end
  if Player:HealthPercentage() < Settings.Commons.HealthstoneHP and I.Healthstone:IsReady() and
    I.Healthstone:CooldownRemains() <= 0 then
    if HR.Cast(I.Healthstone, nil) then shouldcast = 40 return "Healthstone HP"; end
  end
  if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.CosmicHealPot:IsReady() and
    I.CosmicHealPot:CooldownRemains() <= 0 then
    if HR.Cast(I.CosmicHealPot, nil) then shouldcast = 45 return "CosmicHealPot HP"; end
  end
  if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.HealPotL:IsReady() and
    I.HealPotL:CooldownRemains() <= 0 then
    if HR.Cast(I.HealPotL, nil) then shouldcast = 41 return "HealPot LOW HP"; end
  end
  if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.HealPotM:IsReady() and
    I.HealPotM:CooldownRemains() <= 0 then
    if HR.Cast(I.HealPotM, nil) then shouldcast = 41 return "HealPot MEDIUM HP"; end
  end
  if Player:HealthPercentage() < Settings.Commons.HealPotHP and I.HealPotH:IsReady() and
    I.HealPotH:CooldownRemains() <= 0 then
    if HR.Cast(I.HealPotH, nil) then shouldcast = 41 return "HealPot HIGH HP"; end
  end
  --explosives
  if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 120651) then
    if S.PistolShot:IsCastable() and Unit("mouseover"):IsInMeleeRange(20) then
      if HR.Cast(S.PistolShot, nil) then MOshouldcast = 1185763 return "explosive MO Pistol"; end
    end
  end

  if S.PistolShot:IsCastable() and Unit("target"):IsInMeleeRange(40) and string.find(UnitGUID("target"), 120651) then
    if HR.Cast(S.PistolShot, nil) then shouldcast = 185763 return "explosive Tar Pistol"; end
  end

  --incoporeal
  if UnitExists("mouseover") and string.find(UnitGUID("mouseover"), 204560) then
    if S.Blind:IsCastable() and Unit("mouseover"):IsInMeleeRange(20) then
      if HR.Cast(S.Blind, nil) then MOshouldcast = 20945 return "blind MO incorporeal affix"; end
    end
  end

  -- enrage dispel
  -- 412695 dragon
  --WhiteList 
  --local A= Everyone.getWhiteList()

  if UnitExists("target") and S.Shiv:IsReady() and not HoldShiv then
    if UnitCanAttack("player", "target") and UnitAffectingCombat("target") and UnitIsDead("target") ~= true then
      for i = 0, 10 do
        local _, _, stacks, type, duration, expirationTime, _, _, _, id = UnitBuff("target", i);
        for _, j in pairs(instance) do
          if j == id and (expirationTime - duration) + (500 / 1000) <= GetTime() then
            if HR.Cast(S.Shiv, nil) then shouldcast = 5938 return "Shiv Enrage"; end
          end
        end
      end
    end
  end

  -- Poisons
  local PoisonRefreshTime = Player:AffectingCombat() and 180 or 900
  local PoisonRemains
  if not Player:AffectingCombat() then
    -- Lethal Poison
    if Spell(8679):IsAvailable() and Settings.Commons.LethalPoison == "Wound Poison" then
      PoisonRemains = Player:BuffRemains(Spell(8679))
      if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(8679)) then
        if HR.Cast(Spell(8679)) then shouldcast = 203 return "Wound Poison Refresh" end
      end
    elseif Spell(2823):IsAvailable() and Settings.Commons.LethalPoison == "Deadly Poison" then
      PoisonRemains = Player:BuffRemains(Spell(2823))
      if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(2823)) then
        if HR.Cast(Spell(2823)) then shouldcast = 208 return "Deadly Poison Refresh" end
      end
    elseif Spell(315584):IsAvailable() and Settings.Commons.LethalPoison == "Instant Poison" then
      PoisonRemains = Player:BuffRemains(Spell(315584))
      if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(315584)) then
        if HR.Cast(Spell(315584)) then shouldcast = 205 return "Instant Poison Refresh" end
      end
    end
  end

  -- Non-Lethal Poisons
  PoisonRemains = Player:BuffRemains(Spell(381637))
  --print(Spell(381637):IsAvailable() and Settings.Commons.NonLethalPoison == "Atrophic Poison"
  if Spell(381637):IsAvailable() and Settings.Commons.NonLethalPoison == "Atrophic Poison" then
    --print(PoisonRemains < PoisonRefreshTime, Player:IsCasting(Spell(381637)))
    if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(Spell(381637)) then
      if HR.Cast(Spell(381637)) then shouldcast = 381637 return "Antropic Poison Refresh" end
    end
  elseif Spell(5761):IsAvailable() and Settings.Commons.NonLethalPoison == "Numbing Poison" then
    PoisonRemains = Player:BuffRemains(Spell(5761))
    if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(NumbingPoison) then
      if HR.Cast(Spell(5761)) then shouldcast = 204 return "Numbing Poison Refresh" end
    end
  elseif Spell(3408):IsAvailable() and Settings.Commons.NonLethalPoison == "Crippling Poison" then
    PoisonRemains = Player:BuffRemains(Spell(3408))
    if PoisonRemains < PoisonRefreshTime and not Player:IsCasting(NumbingPoison) then
      if HR.Cast(Spell(3408)) then shouldcast = 206 return "Crippling Poison Refresh" end
    end
  end

  -- Stealth
  if not Player:BuffUp(S.VanishBuff) and not Player:AffectingCombat() and not Player:StealthUp(true, true) then
    ShouldReturn = Rogue.Stealth(S.Stealth)
    if ShouldReturn then return ShouldReturn end
  end

  -- Out of Combat
  if not Player:AffectingCombat() and S.Vanish:TimeSinceLastCast() > 1 then
    -- actions.precombat+=/blade_flurry,precombat_seconds=4,if=talent.underhanded_upper_hand
    -- Blade Flurry Breaks Stealth so must be done first
    if S.BladeFlurry:IsReady() and Player:BuffDown(S.BladeFlurry) and S.UnderhandedUpperhand:IsAvailable() and not Player:StealthUp(true, true)
    and (S.AdrenalineRush:IsReady() or Player:BuffUp(S.AdrenalineRush)) then
      if HR.Cast(S.BladeFlurry) then shouldcast = 13877 return "Blade Flurry (Opener)" end
    end

    -- Stealth
    if not Player:StealthUp(true, false) then
      ShouldReturn = Rogue.Stealth(Rogue.StealthSpell())
      if ShouldReturn then return ShouldReturn end
    end
    -- Flask
    -- Food
    -- Rune
    -- PrePot w/ Bossmod Countdown
    -- Opener
    if Everyone.TargetIsValid() and (not Player:AffectingCombat() and Opener) then
      -- Precombat CDs
      -- actions.precombat+=/marked_for_death,precombat_seconds=10,if=raid_event.adds.in>25
      if CDsON() and S.MarkedforDeath:IsCastable() and ComboPointsDeficit >= Rogue.CPMaxSpend() - 1 and
        Target:NPCID() ~= 170234 then
        if Settings.Commons.STMfDAsDPSCD then
          if HR.Cast(S.MarkedforDeath, nil) then shouldcast = 137619 return "Cast Marked for Death (OOC)" end
        else
          if HR.Cast(S.MarkedforDeath, nil) then shouldcast = 137619 return "Cast Marked for Death (OOC)" end
        end
      end
      -- actions.precombat+=/adrenaline_rush,precombat_seconds=3,if=talent.improved_adrenaline_rush
      if S.AdrenalineRush:IsReady() and ARCD and S.ImprovedAdrenalineRush:IsAvailable() and ComboPoints <= 2 and not S.LoadedDiceBuff:IsAvailable() and ComboPoints <= 2 then
        if HR.Cast(S.AdrenalineRush) then shouldcast = 13750 return "Cast Adrenaline Rush (Opener)" end
      end
      -- actions.precombat+=/roll_the_bones,precombat_seconds=2
      -- Use same extended logic as a normal rotation for between pulls
      if S.RolltheBones:IsReady() and not Player:DebuffUp(S.Dreadblades) and (RtB_Buffs() == 0 or RtB_Reroll()) then
        if HR.Cast(S.RolltheBones) then shouldcast = 315508 return "Cast Roll the Bones (Opener)" end
      end
      -- actions.precombat+=/adrenaline_rush,precombat_seconds=3,if=talent.improved_adrenaline_rush
      if S.AdrenalineRush:IsReady() and ARCD and S.ImprovedAdrenalineRush:IsAvailable() and ComboPoints <= 2 then
        if HR.Cast(S.AdrenalineRush) then shouldcast = 13750 return "Cast Adrenaline Rush (Opener)" end
      end
      -- actions.precombat+=/slice_and_dice,precombat_seconds=1
      if S.SliceandDice:IsReady() and Player:BuffRemains(S.SliceandDice) < (1 + ComboPoints) * 1.8 then
        if HR.CastPooling(S.SliceandDice) then shouldcast = 315496 return "Cast Slice and Dice (Opener)" end
      end
      if (Player:StealthUp(true, false) or Player:BuffUp(S.VanishBuff)) then
        ShouldReturn = Stealth()
        if ShouldReturn then return "Stealth (Opener): " .. ShouldReturn end
        if S.KeepItRolling:IsAvailable() and S.GhostlyStrike:IsReady() and S.EchoingReprimand:IsAvailable() then
          if HR.Cast(S.GhostlyStrike, nil, nil, not Target:IsSpellInRange(S.GhostlyStrike)) then shouldcast = 196937 return "Cast Ghostly Strike KiR (Opener)" end
        end
        if S.Ambush:IsCastable() and S.HiddenOpportunity:IsAvailable() then
          if HR.Cast(S.Ambush, nil, nil, not Target:IsSpellInRange(S.Ambush))  then shouldcast = 8676 return "Cast Ambush (Opener)" end
        else
          if S.SinisterStrike:IsCastable() then
            if HR.Cast(S.SinisterStrike, nil, nil, not Target:IsSpellInRange(S.SinisterStrike)) then shouldcast = 193315 return "Cast Sinister Strike (Opener)" end
          end
        end
      elseif Finish_Condition() then
        ShouldReturn = Finish()
        if ShouldReturn then return "Finish (Opener): " .. ShouldReturn end
      end
      if S.SinisterStrike:IsCastable() then
        if HR.Cast(S.SinisterStrike) then shouldcast = 193315 return "Cast Sinister Strike (Opener)" end
      end
    end
    return
  end

  -- In Combat

  -- Fan the Hammer Combo Point Prediction
  if S.FanTheHammer:IsAvailable() and S.PistolShot:TimeSinceLastCast() < Player:GCDRemains() then
    ComboPoints = mathmax(ComboPoints, Rogue.FanTheHammerCP())
    EffectiveComboPoints = Rogue.EffectiveComboPoints(ComboPoints)
    ComboPointsDeficit = Player:ComboPointsDeficit()
  end

        --(not Player:AffectingCombat() or Opener) 
  if Everyone.TargetIsValid() and (Player:AffectingCombat() or Opener or Player:BuffUp(S.VanishBuff) or Player:BuffUp(S.VanishBuff) or Player:BuffUp(S.VanishBuff2)) and not Target:DebuffUp(Spell(6770)) then
    -- # Higher priority Stealth list for Count the Odds or true Stealth/Vanish that will break in a single global

	--ToT logic
	local start1,duration1,_= GetSpellCooldown(57934)
	if Settings.Commons.AutoToT then
		if (start1 + duration1 - GetTime()) <= 0 and S.TricksoftheTrade:IsAvailable() and S.TricksoftheTrade:CooldownRemains(BypassRecovery) <= 0 
    and UnitExists("focus") and not Unit("focus"):IsDeadOrGhost() and (UnitInParty("focus") or UnitInRaid("focus")) then
			if HR.Cast(S.TricksoftheTrade) then shouldcast = 207 return "ToT Focus" end
		end
	end

    -- actions+=/call_action_list,name=cds
    ShouldReturn = CDs()
    if ShouldReturn then return "CDs: " .. ShouldReturn end

    -- actions+=/call_action_list,name=stealth,if=stealthed.all
    if Player:StealthUp(true, true) or Player:BuffUp(S.VanishBuff) or Player:BuffUp(S.Shadowmeld) then
      ShouldReturn = Stealth()
      if ShouldReturn then return "Stealth: " .. ShouldReturn end
    end

    -- actions+=/run_action_list,name=finish,if=variable.finish_condition
    if Finish_Condition() then
      ShouldReturn = Finish()
      if ShouldReturn then return "Finish: " .. ShouldReturn end
      -- run_action_list forces the return
      HR.Cast(S.PoolEnergy)
      return "Finish Pooling"
    end
    -- actions+=/call_action_list,name=build
    ShouldReturn = Build()
    if ShouldReturn then return "Build: " .. ShouldReturn end

    -- actions+=/arcane_torrent,if=energy.deficit>=15+energy.regen
    if S.ArcaneTorrent:IsCastable() and Settings.Commons.Enabled.Racials and CDsON()
      and Target:IsSpellInRange(S.SinisterStrike) and EnergyDeficit > 15 + EnergyRegen then
      if HR.Cast(S.ArcaneTorrent, nil) then shouldcast = 155145 return "Cast Arcane Torrent" end
    end
    -- actions+=/arcane_pulse
    if S.ArcanePulse:IsCastable() and Settings.Commons.Enabled.Racials and CDsON()
      and Target:IsSpellInRange(S.SinisterStrike) then
      if HR.Cast(S.ArcanePulse) then shouldcast = 260364 return "Cast Arcane Pulse" end
    end
    -- actions+=/lights_judgment
    if S.LightsJudgment:IsCastable() and Settings.Commons.Enabled.Racials and CDsON()
      and Target:IsInMeleeRange(5) then
      if HR.Cast(S.LightsJudgment, nil) then shouldcast = 255647 return "Cast Lights Judgment" end
    end
    -- actions+=/bag_of_tricks
    if S.BagofTricks:IsCastable() and Settings.Commons.Enabled.Racials and CDsON()
      and Target:IsInMeleeRange(5) then
      if HR.Cast(S.BagofTricks, nil) then shouldcast = 312411 return "Cast Bag of Tricks" end
    end
    -- OutofRange Pistol Shot
    if S.PistolShot:IsCastable() and Target:IsSpellInRange(S.PistolShot) and not Target:IsInRange(BladeFlurryRange) and not Player:StealthUp(true, true)
      and EnergyDeficit < 25 and (ComboPointsDeficit >= 1 or EnergyTimeToMax <= 1.2) then
      if HR.Cast(S.PistolShot) then shouldcast = 185763 return "Cast Pistol Shot (OOR)" end
    end

    -- Generic Pooling suggestion
    if not Target:IsSpellInRange(S.Dispatch) then
      if HR.CastAnnotated(S.PoolEnergy, false, "OOR") then shouldcast = 999999 return "Pool Energy (OOR)" end
    else
      if HR.Cast(S.PoolEnergy) then shouldcast = 999999 return "Pool Energy" end
    end
  end
end

local function Init()
  	-- turns off opener on load
    if HeroRotationCharDB.Toggles[5] then
      HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5];
      HR.ToggleIconFrame:UpdateButtonText(5);
    end
end

function ReturnSpellOut()
  if shouldcast == 0 then
    return 0
  else
    return shouldcast
  end
end

function ReturnSpellMOOut()
  if MOshouldcast == 0 then
    return 0
  else
    return MOshouldcast
  end
end

HR.SetAPL(260, APL, Init)

--- ======= SIMC =======
-- Last Update: 2023-01-31

-- # Executed before combat begins. Accepts non-harmful actions only.
-- actions.precombat=apply_poison
-- actions.precombat+=/flask
-- actions.precombat+=/augmentation
-- actions.precombat+=/food

-- # Snapshot raid buffed stats before combat begins and pre-potting is done.
-- actions.precombat+=/snapshot_stats
-- actions.precombat+=/blade_flurry,precombat_seconds=4,if=talent.underhanded_upper_hand
-- actions.precombat+=/adrenaline_rush,precombat_seconds=3,if=talent.improved_adrenaline_rush
-- actions.precombat+=/roll_the_bones,precombat_seconds=2
-- actions.precombat+=/slice_and_dice,precombat_seconds=1
-- actions.precombat+=/stealth

-- # Executed every time the actor is available.
-- # Restealth if possible (no vulnerable enemies in combat)
-- actions=stealth

-- # Interrupt on cooldown to allow simming interactions with that
-- actions+=/kick

-- # Default Roll the Bones reroll rule: reroll for any buffs that aren't Buried Treasure, excluding Grand Melee in single target
-- actions+=/variable,name=rtb_reroll,value=rtb_buffs.will_lose=(rtb_buffs.will_lose.buried_treasure+rtb_buffs.will_lose.grand_melee&spell_targets.blade_flurry<2&raid_event.adds.in>10)

-- # Crackshot builds without T31 should reroll for True Bearing (or Broadside without Hidden Opportunity) if we won't lose over 1 buff
-- actions+=/variable,name=rtb_reroll,if=talent.crackshot&talent.hidden_opportunity&!set_bonus.tier31_4pc,value=(!rtb_buffs.will_lose.true_bearing&talent.hidden_opportunity|!rtb_buffs.will_lose.broadside&!talent.hidden_opportunity)&rtb_buffs.will_lose<=1

-- # Crackshot builds with T31 should reroll if we won't lose over 1 buff (2 with Loaded Dice), and if Broadside is not active for builds without Hidden Opportunity
-- actions+=/variable,name=rtb_reroll,if=talent.crackshot&set_bonus.tier31_4pc,value=(rtb_buffs.will_lose<=1+buff.loaded_dice.up)&(talent.hidden_opportunity|!buff.broadside.up)

-- # Hidden Opportunity builds without Crackshot should reroll for Skull and Crossbones or any 2 buffs excluding Grand Melee in single target
-- actions+=/variable,name=rtb_reroll,if=!talent.crackshot&talent.hidden_opportunity,value=!rtb_buffs.will_lose.skull_and_crossbones&(rtb_buffs.will_lose<2+rtb_buffs.will_lose.grand_melee&spell_targets.blade_flurry<2&raid_event.adds.in>10)

-- # Additional reroll rules if all active buffs will not be rolled away and we don't already have 5+ buffs
-- actions+/variable,name=rtb_reroll,value=variable.rtb_reroll|rtb_buffs.normal=0&rtb_buffs.longer>=1&rtb_buffs<5&rtb_buffs.max_remains<=39

-- # Avoid rerolls when we will not have time remaining on the fight or add wave to recoup the opportunity cost of the global
-- actions+=/variable,name=rtb_reroll,op=reset,if=!(raid_event.adds.remains>12|raid_event.adds.up&(raid_event.adds.in-raid_event.adds.remains)<6|target.time_to_die>12)|fight_remains<12

-- # Ensure we want to cast Ambush prior to triggering a Stealth cooldown
-- actions+=/variable,name=ambush_condition,value=(talent.hidden_opportunity|combo_points.deficit>=2+talent.improved_ambush+buff.broadside.up)&energy>=50

-- # Use finishers if at -1 from max combo points, or -2 in Stealth with Crackshot
-- actions+=/variable,name=finish_condition,value=effective_combo_points>=cp_max_spend-1-(stealthed.all&talent.crackshot)

-- # With multiple targets, this variable is checked to decide whether some CDs should be synced with Blade Flurry
-- actions+=/variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.remains>gcd

-- # Higher priority Stealth list for Count the Odds or true Stealth/Vanish that will break in a single global
-- actions+=/call_action_list,name=cds
-- actions+=/call_action_list,name=stealth,if=stealthed.all
-- actions+=/run_action_list,name=finish,if=variable.finish_condition
-- actions+=/call_action_list,name=build
-- actions+=/arcane_torrent,if=energy.base_deficit>=15+energy.regen
-- actions+=/arcane_pulse
-- actions+=/lights_judgment
-- actions+=/bag_of_tricks


-- # Builders
-- actions.build=echoing_reprimand

-- # High priority Ambush for Hidden Opportunity builds
-- actions.build+=/ambush,if=talent.hidden_opportunity&buff.audacity.up

-- # With Audacity + Hidden Opportunity + Fan the Hammer, consume Opportunity to proc Audacity any time Ambush is not available
-- actions.build+=/pistol_shot,if=talent.fan_the_hammer&talent.audacity&talent.hidden_opportunity&buff.opportunity.up&!buff.audacity.up

-- # Use Greenskins Wickers buff immediately with Opportunity unless running Fan the Hammer
-- actions.build+=/pistol_shot,if=buff.greenskins_wickers.up&(!talent.fan_the_hammer&buff.opportunity.up|buff.greenskins_wickers.remains<1.5)

-- #With Fan the Hammer, consume Opportunity at max stacks or if it will expire
-- actions.build+=/pistol_shot,if=talent.fan_the_hammer&buff.opportunity.up&(buff.opportunity.stack>=buff.opportunity.max_stack|buff.opportunity.remains<2)

-- # With Fan the Hammer, consume Opportunity based on CP deficit, and 2 Fan the Hammer Crackshot builds can briefly hold stacks for an upcoming stealth cooldown
-- actions.build+=/pistol_shot,if=talent.fan_the_hammer&buff.opportunity.up&combo_points.deficit>((1+talent.quick_draw)*talent.fan_the_hammer.rank)&(!cooldown.vanish.ready&!cooldown.shadow_dance.ready|stealthed.all|!talent.crackshot|talent.fan_the_hammer.rank<=1)

-- #If not using Fan the Hammer, then consume Opportunity based on energy, when it will exactly cap CPs, or when using Quick Draw
-- actions.build+=/pistol_shot,if=!talent.fan_the_hammer&buff.opportunity.up&(energy.base_deficit>energy.regen*1.5|combo_points.deficit<=1+buff.broadside.up|talent.quick_draw.enabled|talent.audacity.enabled&!buff.audacity.up)

-- actions.build+=/sinister_strike



-- # Cooldowns
-- # Cooldowns Use Adrenaline Rush if it is not active and at 2cp if Improved, but Crackshot builds can refresh it in stealth
-- actions.cds=adrenaline_rush,if=(!buff.adrenaline_rush.up|stealthed.all&talent.crackshot&talent.improved_adrenaline_rush)&(combo_points<=2|!talent.improved_adrenaline_rush)

-- # Maintain Blade Flurry on 2+ targets, and on single target with Underhanded, or on cooldown at 5+ targets with Deft Maneuvers
-- actions.cds+=/blade_flurry,if=(spell_targets>=2-talent.underhanded_upper_hand&!stealthed.rogue)&buff.blade_flurry.remains<gcd|talent.deft_maneuvers&spell_targets>=5&!variable.finish_condition

-- # Use Roll the Bones if reroll conditions are met, or just before buffs expire based on T31 and upcoming stealth cooldowns
-- actions.cds+=/roll_the_bones,if=variable.rtb_reroll|rtb_buffs.max_remains<=set_bonus.tier31_4pc+(cooldown.shadow_dance.remains<=1|cooldown.vanish.remains<=1)*6

-- # Use Keep it Rolling with at least 3 buffs (4 with T31)
-- actions.cds+=/keep_it_rolling,if=!variable.rtb_reroll&rtb_buffs>=3+set_bonus.tier31_4pc&(buff.shadow_dance.down|rtb_buffs>=6)

--actions.cds+=/ghostly_strike

-- # Use Sepsis to trigger Crackshot or if the target will survive its DoT
-- actions.cds+=/sepsis,if=talent.crackshot&cooldown.between_the_eyes.ready&variable.finish_condition&!stealthed.all|!talent.crackshot&target.time_to_die>11&buff.between_the_eyes.up|fight_remains<11

-- # Use Blade Rush at minimal energy outside of stealth
-- actions.cds+=/blade_rush,if=energy.base_time_to_max>4&!stealthed.all

-- actions.cds+=/call_action_list,name=stealth_cds,if=!stealthed.all

-- actions.cds+=/thistle_tea,if=!buff.thistle_tea.up&(energy.base_deficit>=100|fight_remains<charges*6)

-- actions.cds+=/potion,if=buff.bloodlust.react|fight_remains<30|buff.adrenaline_rush.up

-- actions.cds+=/blood_fury
-- actions.cds+=/berserking
-- actions.cds+=/fireblood
-- actions.cds+=/ancestral_call


-- # Default conditions for usable items.
-- actions.cds+=/use_item,name=manic_grieftorch,use_off_gcd=1,if=gcd.remains>gcd.max-0.1&!stealthed.all&buff.between_the_eyes.up&(!talent.ghostly_strike|debuff.ghostly_strike.up|spell_targets.blade_flurry>2)|fight_remains<=5
-- actions.cds+=/use_item,name=dragonfire_bomb_dispenser,use_off_gcd=1,if=(!trinket.1.is.dragonfire_bomb_dispenser&trinket.1.cooldown.remains>10|trinket.2.cooldown.remains>10)|cooldown.dragonfire_bomb_dispenser.charges>2|fight_remains<20|!trinket.2.has_cooldown|!trinket.1.has_cooldown
-- actions.cds+=/use_item,name=beacon_to_the_beyond,use_off_gcd=1,if=gcd.remains>gcd.max-0.1&!stealthed.all&buff.between_the_eyes.up&(!talent.ghostly_strike|debuff.ghostly_strike.up|spell_targets.blade_flurry>2)|fight_remains<=5
-- actions.cds+=/use_item,name=use_item,name=stormeaters_boon,if=spell_targets.blade_flurry>desired_targets|raid_event.adds.in>60|fight_remains<10
-- actions.cds+=/use_item,name=windscar_whetstone,if=spell_targets.blade_flurry>desired_targets|raid_event.adds.in>60|fight_remains<7
-- actions.cds+=/use_items,slots=trinket1,if=buff.between_the_eyes.up|trinket.1.has_stat.any_dps|fight_remains<=20
-- actions.cds+=/use_items,slots=trinket2,if=buff.between_the_eyes.up|trinket.2.has_stat.any_dps|fight_remains<=20

-- # Finishers
-- # Finishers Use Between the Eyes to keep the crit buff up, but on cooldown if Improved/Greenskins/T30, and avoid overriding Greenskins
-- actions.finish=between_the_eyes,if=!talent.crackshot&(buff.between_the_eyes.remains<4|talent.improved_between_the_eyes|talent.greenskins_wickers|set_bonus.tier30_4pc)&!buff.greenskins_wickers.up

-- #Crackshot builds use Between the Eyes outside of Stealth if Vanish or Dance will not come off cooldown within the next cast
-- actions.finish+=/between_the_eyes,if=talent.crackshot&(cooldown.vanish.remains>45&cooldown.shadow_dance.remains>12)

-- actions.finish+=/slice_and_dice,if=buff.slice_and_dice.remains<fight_remains&refreshable
-- actions.finish+=/killing_spree,if=debuff.ghostly_strike.up|!talent.ghostly_strike
-- actions.finish+=/cold_blood
-- actions.finish+=/dispatch


-- # Stealth
-- actions.stealth=blade_flurry,if=talent.subterfuge&talent.hidden_opportunity&spell_targets>=2&buff.blade_flurry.remains<gcd
-- actions.stealth+=/cold_blood,if=variable.finish_condition
-- actions.stealth+=/between_the_eyes,if=variable.finish_condition&talent.crackshot
-- actions.stealth+=/dispatch,if=variable.finish_condition

-- # 2 Fan the Hammer Crackshot builds can consume Opportunity in stealth with max stacks, Broadside, and low CPs, or with Greenskins active
-- actions.stealth+=/pistol_shot,if=talent.crackshot&talent.fan_the_hammer.rank>=2&buff.opportunity.stack>=6&(buff.broadside.up&combo_points<=1|buff.greenskins_wickers.up)

-- actions.stealth+=/ambush,if=talent.hidden_opportunity


-- # Stealth Cooldowns
-- actions.stealth_cds=variable,name=vanish_opportunity_condition,value=!talent.shadow_dance&talent.fan_the_hammer.rank+talent.quick_draw+talent.audacity<talent.count_the_odds+talent.keep_it_rolling

-- # Hidden Opportunity builds without Crackshot use Vanish if Audacity is not active and when under max Opportunity stacks
-- actions.stealth_cds+=/vanish,if=talent.hidden_opportunity&!talent.crackshot&!buff.audacity.up&(variable.vanish_opportunity_condition|buff.opportunity.stack<buff.opportunity.max_stack)&variable.ambush_condition

-- # Crackshot builds or builds without Hidden Opportunity use Vanish at finish condition
-- actions.stealth_cds+=/vanish,if=(!talent.hidden_opportunity|talent.crackshot)&variable.finish_condition

-- # Crackshot builds use Dance at finish condition
-- actions.stealth_cds+=/shadow_dance,if=talent.crackshot&variable.finish_condition



-- # Keep it Rolling builds without Crackshot use Dance at finish condition but hold it for an upcoming Keep it Rolling
-- actions.stealth_cds+=/shadow_dance,if=talent.keep_it_rolling&variable.shadow_dance_condition&(cooldown.keep_it_rolling.remains<=30|cooldown.keep_it_rolling.remains>120&(variable.finish_condition|talent.hidden_opportunity))

-- actions.stealth_cds+=/shadowmeld,if=talent.crackshot&variable.finish_condition|!talent.crackshot&(talent.count_the_odds&variable.finish_condition|talent.hidden_opportunity)