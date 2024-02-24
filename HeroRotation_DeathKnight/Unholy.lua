local a, b = ...
local c = HeroDBC.DBC; local d = HeroLib; local e = HeroCache; local f = d.Unit; local g = f.Player; local h = f.Target; local i =
f.Boss; local j = f.Pet; local k = d.Spell; local l = d.Item; local m = HeroRotation; local n = m.Cast; local o = m
.CDsON; local p = m.AoEON; local q = HeroRotationCharDB.Toggles[4]
local r = HeroRotationCharDB.Toggles[5]
local s = HeroRotationCharDB.Toggles[10]
local t = HeroRotationCharDB.Toggles[11]
local u = HeroRotationCharDB.Toggles[12]
local v = HeroRotationCharDB.Toggles[13]
local w = HeroRotationCharDB.Toggles[14]
local x = not HeroRotationCharDB.Toggles[15]
local y = HeroRotationCharDB.Toggles[16]
local z = HeroRotationCharDB.Toggles[17]
local A = HeroRotationCharDB.Toggles[18]
local function B(C) if C then return 1 else return 0 end end; local function D(C) return C ~= 0 end; local E = table
.insert; local GetTime = GetTime; local F = math.max; local G = 0; local H = 0; local I = HeroRotationCharDB.Toggles[3]
local J = k.DeathKnight.Unholy; local K = l.DeathKnight.Unholy; local L = {}
local M = g:GetEquipment()
local N = M[13] and l(M[13]) or l(0)
local O = M[14] and l(M[14]) or l(0)
local P; local Q; local R = m.Commons.Everyone; local S = { General = m.GUISettings.General, Commons = m.GUISettings.APL
.DeathKnight.Commons, Commons2 = m.GUISettings.APL.DeathKnight.Commons2, Unholy = m.GUISettings.APL.DeathKnight.Unholy }
local s = S.Unholy.DisableAotD; local T; local U; local V; local W; local X; local Y; local Z; local a0, a1; local a2, a3; local a4, a5; local a6 =
J.ClawingShadows:IsAvailable() and J.ClawingShadows or J.ScourgeStrike; local a7 = J.Defile:IsAvailable() and J.Defile or
J.DeathAndDecay; local a8; local a9 = 11111; local aa = 11111; local ab = d.GhoulTable; local ac, ad, ae; local af, ag; local ah; local ai = { { J.Asphyxiate, "Cast Asphyxiate (Interrupt)", function() return true end } }
d:RegisterForEvent(function()
    M = g:GetEquipment()
    N = M[13] and l(M[13]) or l(0)
    O = M[14] and l(M[14]) or l(0)
end, "PLAYER_EQUIPMENT_CHANGED")
d:RegisterForEvent(function()
    a9 = 11111; aa = 11111
end, "PLAYER_REGEN_ENABLED")
d:RegisterForEvent(
function()
    a6 = J.ClawingShadows:IsAvailable() and J.ClawingShadows or J.ScourgeStrike; a7 = J.Defile:IsAvailable() and J
    .Defile or J.DeathAndDecay
end, "SPELLS_CHANGED", "LEARNED_SPELL_IN_TAB")
local function aj() if J.ClawingShadows:IsAvailable() then G = 207311 else G = 55090 end end; local function ak() return
    g:HealthPercentage() < S.Commons.UseDeathStrikeHP or
    g:HealthPercentage() < S.Commons.UseDarkSuccorHP and g:BuffUp(J.DeathStrikeBuff) end; local function al(am)
    local an = 0; for _, ao in pairs(am) do if ao:DebuffDown(J.VirulentPlagueDebuff) then an = an + 1 end end; return an
end; local function ap(am)
    local aq = {}
    for ar in pairs(am) do if not f:IsInBossList(am[ar]["UnitNPCID"]) then E(aq, am[ar]) end end; return d.FightRemains(
    aq)
end; local function as(at) return at:DebuffStack(J.FesteringWoundDebuff) end; local function au(at) return at
    :DebuffRemains(J.SoulReaper) end; local function av(at) return J.BurstingSores:IsAvailable() and
    at:DebuffUp(J.FesteringWoundDebuff) and
    (g:BuffDown(J.DeathAndDecayBuff) and J.DeathAndDecay:CooldownDown() and g:Rune() < 3 or g:BuffUp(J.DeathAndDecayBuff) and g:Rune() == 0) end; local function aw(
    at) return not J.BurstingSores:IsAvailable() and at:DebuffStack(J.FesteringWoundDebuff) >= 4 or
    g:HasTier(31, 2) and at:DebuffStack(J.FesteringWoundDebuff) >= 1 end; local function ax(at) return at:DebuffStack(J
    .FesteringWoundDebuff) >= 4 end; local function ay(at) return at:DebuffStack(J.FesteringWoundDebuff) < 4 end; local function az(
    at) if at:DebuffStack(J.FesteringWoundDebuff) < 4 and at:GUID() == f("mouseover"):GUID() and S.Unholy.TargetSwap == "Mouseover" then
        H = 185948; return true
    elseif at:DebuffStack(J.FesteringWoundDebuff) < 4 and S.Unholy.TargetSwap == "AutoSwap" and at:GUID() ~= h:GUID() and not u then
        H = 999; return true
    elseif at:DebuffStack(J.FesteringWoundDebuff) < 4 and at:GUID() == h:GUID() then
        G = 85948; return true
    elseif at:DebuffStack(J.FesteringWoundDebuff) < 4 then return true end end; local function aA(at) return at
    :DebuffStack(J.FesteringWoundDebuff) >= 4 end; local function aB(at) return (at:TimeToX(35) < 5 or at:HealthPercentage() <= 35) and
    at:TimeToDie() > at:DebuffRemains(J.SoulReaper) + 5 end; local function aC(at) if (at:DebuffStack(J.FesteringWoundDebuff) <= 2 or j:BuffUp(J.DarkTransformation)) and at:GUID() == f("mouseover"):GUID() and S.Unholy.TargetSwap == "Mouseover" then
        H = 1207289; return true
    elseif (at:DebuffStack(J.FesteringWoundDebuff) <= 2 or j:BuffUp(J.DarkTransformation)) and S.Unholy.TargetSwap == "AutoSwap" and at:GUID() ~= h:GUID() and not u then
        H = 999; return true
    elseif (at:DebuffStack(J.FesteringWoundDebuff) <= 2 or j:BuffUp(J.DarkTransformation)) and at:GUID() == h:GUID() then
        G = 207289; return true
    elseif at:DebuffStack(J.FesteringWoundDebuff) <= 2 or j:BuffUp(J.DarkTransformation) then return true end end; local function aD(
    at) return at:DebuffStack(J.FesteringWoundDebuff) >= 4 and a7:CooldownRemains() < 3 end; local function aE(at) return
    at:DebuffStack(J.FesteringWoundDebuff) >= 1 end; local function aF(at) return at:TimeToDie() >
    at:DebuffRemains(J.VirulentPlagueDebuff) and
    (at:DebuffRefreshable(J.VirulentPlagueDebuff) or J.Superstrain:IsAvailable() and (at:DebuffRefreshable(J.FrostFeverDebuff) or at:DebuffRefreshable(J.BloodPlagueDebuff))) and
    (not J.UnholyBlight:IsAvailable() or J.UnholyBlight:IsAvailable() and J.UnholyBlight:CooldownRemains() > 15 / (B(J.Superstrain:IsAvailable()) * 3 + B(J.Plaguebringer:IsAvailable()) * 2 + B(J.EbonFever:IsAvailable()) * 2)) end; local function aG()
    if J.RaiseDead:IsCastable() then if n(J.RaiseDead, nil, nil) then
            G = 46584; return "raise_dead precombat 2 displaystyle"
        end end; if J.ArmyoftheDead:IsReady() and not K.Fyralath:IsEquipped() and not s then if n(J.ArmyoftheDead, nil, nil) then
            G = 42650; return "army_of_the_dead precombat 4"
        end end; if J.Outbreak:IsReady() then if n(J.Outbreak, nil, nil, not h:IsSpellInRange(J.Outbreak)) then
            G = 77575; return "outbreak precombat 6"
        end end; if J.FesteringStrike:IsReady() then if n(J.FesteringStrike, nil, nil, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike precombat 8"
        end end
end; local function aH()
    if J.Epidemic:IsReady() and (not X or aa < 10) then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
            G = 207317; return "epidemic aoe 2"
        end end; if a6:IsReady() and W then if R.CastTargetIf(a6, ac, "max", as, nil, not h:IsSpellInRange(a6)) then
            aj()
            return "wound_spender aoe 4"
        end end; if J.FesteringStrike:IsReady() and not W then if R.CastTargetIf(J.FesteringStrike, ac, "max", as, nil, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike aoe 6"
        end end; if J.DeathCoil:IsReady() and (not X and not J.Epidemic:IsAvailable()) then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil aoe 8"
        end end
end; local function aI()
    if J.Epidemic:IsReady() and ((g:Rune() < 1 or J.BurstingSores:IsAvailable() and J.FesteringWoundDebuff:AuraActiveCount() == 0 or not J.BurstingSores:IsAvailable()) and not X and (ae >= 6 or g:RunicPowerDeficit() < 30 or g:BuffStack(J.FestermightBuff) == 20)) then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
            G = 207317; return "epidemic aoe_burst 2"
        end end; if a6:IsReady() then if R.CastTargetIf(a6, ac, "max", as, aE, not h:IsSpellInRange(a6)) then
            aj()
            return "wound_spender aoe_burst 4"
        end end; if J.Epidemic:IsReady() and (not X or aa < 10) then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
            G = 207317; return "epidemic aoe_burst 6"
        end end; if J.DeathCoil:IsReady() and (not X and not J.Epidemic:IsAvailable()) then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil aoe_burst 8"
        end end; if a6:IsReady() then if n(a6, nil, nil, not h:IsSpellInRange(a6)) then
            aj()
            return "wound_spender aoe_burst 10"
        end end
end; local function aJ()
    if J.VileContagion:IsReady() and a7:CooldownRemains() < 3 then if R.CastTargetIf(J.VileContagion, ac, "max", as, aD, not h:IsSpellInRange(J.VileContagion)) then
            G = 390279; return "vile_contagion aoe_cooldowns 2"
        end end; if J.SummonGargoyle:IsReady() then if n(J.SummonGargoyle, nil) then
            G = 49206; return "summon_gargoyle aoe_cooldowns 4"
        end end; if not A and J.AbominationLimb:IsCastable() and (g:Rune() < 2 or a8 > 10 or not J.Festermight:IsAvailable() or g:BuffUp(J.FestermightBuff) and g:BuffRemains(J.FestermightBuff) < 12) then if n(J.AbominationLimb, nil, nil, not h:IsInRange(20)) then
            G = 315443; return "abomination_limb aoe_cooldowns 6"
        end end; if J.Apocalypse:IsReady() then if R.CastTargetIf(J.Apocalypse, ac, "min", as, av, not h:IsInMeleeRange(5)) then
            G = 275699; return "apocalypse aoe_cooldowns 8"
        end end; if J.Apocalypse:IsReady() then if R.CastTargetIf(J.Apocalypse, ac, "max", as, aw, not h:IsInMeleeRange(5)) then
            G = 275699; return "apocalypse aoe_cooldowns 9 " .. G
        end end; if J.UnholyAssault:IsCastable() then if R.CastTargetIf(J.UnholyAssault, ac, "min", as, aC, not h:IsInMeleeRange(5), nil) then
            G = 207289; return "unholy_assault aoe_cooldowns 10"
        end end; if J.RaiseDead:IsCastable() then if n(J.RaiseDead, nil, nil) then
            G = 46584; return "raise_dead aoe_cooldowns 12 displaystyle"
        end end; if J.DarkTransformation:IsReady() and (a7:CooldownRemains() < 10 and J.InfectedClaws:IsAvailable() and (J.FesteringWoundDebuff:AuraActiveCount() < ae or not J.VileContagion:IsAvailable()) or not J.InfectedClaws:IsAvailable()) then if n(J.DarkTransformation, nil) then
            G = 63560; return "dark_transformation aoe_cooldowns 14"
        end end; if J.EmpowerRuneWeapon:IsCastable() and j:BuffUp(J.DarkTransformation) then if n(J.EmpowerRuneWeapon, nil) then
            G = 47568; return "empower_rune_weapon aoe_cooldowns 16"
        end end; if J.SacrificialPact:IsReady() and (j:BuffDown(J.DarkTransformation) and J.DarkTransformation:CooldownRemains() > 6 or aa < g:GCD()) then if n(J.SacrificialPact, nil) then
            G = 237574; return "sacrificial_pact aoe_cooldowns 18"
        end end
end; local function aK()
    if a7:IsReady() and (not J.BurstingSores:IsAvailable() or J.FesteringWoundDebuff:AuraActiveCount() == ae or J.FesteringWoundDebuff:AuraActiveCount() >= 8) then if n(a7, nil) then
            G = 43265; return "any_dnd aoe_setup 2"
        end end; if J.FesteringStrike:IsReady() and (J.FesteringWoundDebuff:AuraActiveCount() < ae and J.BurstingSores:IsAvailable()) then if R.CastTargetIf(J.FesteringStrike, ac, "min", as, nil, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike aoe_setup 4"
        end end; if J.Epidemic:IsReady() and (not X or aa < 10) then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
            G = 207317; return "epidemic aoe_setup 6"
        end end; if J.FesteringStrike:IsReady() and J.FesteringWoundDebuff:AuraActiveCount() < ae then if R.CastTargetIf(J.FesteringStrike, ac, "min", as, nil, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike aoe_setup 8"
        end end; if J.FesteringStrike:IsReady() and J.Apocalypse:CooldownRemains() < U then if R.CastTargetIf(J.FesteringStrike, ac, "max", as, ay, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike aoe_setup 10"
        end end; if J.DeathCoil:IsReady() and (not X and not J.Epidemic:IsAvailable()) then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil aoe_setup 12"
        end end
end; local function aL()
    if J.SummonGargoyle:IsCastable() and (g:BuffUp(J.CommanderoftheDeadBuff) or not J.CommanderoftheDead:IsAvailable()) then if n(J.SummonGargoyle, nil) then
            G = 49206; return "summon_gargoyle cooldowns 2"
        end end; if J.RaiseDead:IsCastable() then if n(J.RaiseDead, nil, nil) then
            G = 46584; return "raise_dead cooldowns 4 displaystyle"
        end end; if J.DarkTransformation:IsReady() and J.Apocalypse:CooldownRemains() < 5 then if n(J.DarkTransformation, nil) then
            G = 63560; return "dark_transformation cooldowns 6"
        end end; if J.Apocalypse:IsReady() and Y then if R.CastTargetIf(J.Apocalypse, ac, "max", as, ax, not h:IsInMeleeRange(5), nil) then
            G = 275699; return "apocalypse cooldowns 8"
        end end; if J.EmpowerRuneWeapon:IsCastable() and (Y and (a4 and a5 <= 23 or not J.SummonGargoyle:IsAvailable() and J.ArmyoftheDamned:IsAvailable() and a2 and a0 or not J.SummonGargoyle:IsAvailable() and not J.ArmyoftheDamned:IsAvailable() and j:BuffUp(J.DarkTransformation) or not J.SummonGargoyle:IsAvailable() and j:BuffUp(J.DarkTransformation)) or aa <= 21) then if n(J.EmpowerRuneWeapon, nil) then
            G = 47568; return "empower_rune_weapon cooldowns 10"
        end end; if not A and J.AbominationLimb:IsCastable() and (g:Rune() < 3 and Y) then if n(J.AbominationLimb, nil) then
            G = 315443; return "abomination_limb cooldowns 12"
        end end; if J.UnholyAssault:IsReady() and Y then if R.CastTargetIf(J.UnholyAssault, ac, "min", as, nil, not h:IsInMeleeRange(5), nil) then
            G = 207289; return "unholy_assault cooldowns 14"
        end end; if J.SoulReaper:IsReady() and (ae == 1 and (h:TimeToX(35) < 5 or h:HealthPercentage() <= 35) and h:TimeToDie() > 5) then if n(J.SoulReaper, nil, nil, not h:IsSpellInRange(J.SoulReaper)) then
            G = 343294; return "soul_reaper cooldowns 16"
        end end; if J.SoulReaper:IsReady() and ae >= 2 then if R.CastTargetIf(J.SoulReaper, ac, "min", au, aB, not h:IsSpellInRange(J.SoulReaper)) then
            G = 343294; return "soul_reaper cooldowns 18"
        end end
end; local function aM()
    if J.Apocalypse:IsReady() and (a8 >= 4 and (g:BuffUp(J.CommanderoftheDeadBuff) and a5 < 23 or not J.CommanderoftheDead:IsAvailable())) then if n(J.Apocalypse, nil, nil, not h:IsInMeleeRange(5)) then
            G = 275699; return "apocalypse garg_setup 2"
        end end; if J.SoulReaper:IsReady() and (ae == 1 and (h:TimeToX(35) < 5 or h:HealthPercentage() <= 35) and h:TimeToDie() > 5) then if n(J.SoulReaper, nil, nil, not h:IsInMeleeRange(5)) then
            G = 343294; return "soul_reaper garg_setup 6"
        end end; if a7:IsReady() and (g:BuffDown(J.DeathAndDecayBuff) and a8 > 1) then if n(a7, nil) then
            G = 43265; return "any_dnd garg_setup 6"
        end end; if J.SummonGargoyle:IsCastable() and o() and (g:BuffUp(J.CommanderoftheDeadBuff) or not J.CommanderoftheDead:IsAvailable() and g:RunicPower() >= 40) then if n(J.SummonGargoyle, nil) then
            G = 49206; return "summon_gargoyle garg_setup 8"
        end end; if o() and (a4 and a5 <= 23) then
        if J.EmpowerRuneWeapon:IsCastable() then if n(J.EmpowerRuneWeapon, nil) then
                G = 47568; return "empower_rune_weapon garg_setup 10"
            end end; if J.UnholyAssault:IsCastable() then if n(J.UnholyAssault, nil, nil, not h:IsInMeleeRange(5)) then
                G = 207289; return "unholy_assault garg_setup 12"
            end end
    end; if S.Commons.Enabled.Potions then
        local aN = R.PotionSelected()
        if aN then if aN:IsReady() and (30 >= a5 and a4 or (not J.SummonGargoyle:IsAvailable() or J.SummonGargoyle:CooldownRemains() > 60 or J.SummonGargoyle:CooldownUp()) and (j:BuffUp(J.DarkTransformation) and 30 >= j:BuffRemains(J.DarkTransformation) or a2 and a3 <= 30 or a0 and a1 <= 30)) then if n(aN, nil, S.Commons.DisplayStyle.Potions) then
                    G = 50; return "potion garg_setup 14"
                end end end
    end; if J.DarkTransformation:IsReady() and (J.CommanderoftheDead:IsAvailable() and g:RunicPower() > 40 or not J.CommanderoftheDead:IsAvailable()) then if n(J.DarkTransformation, nil) then
            G = 63560; return "dark_transformation garg_setup 16"
        end end; if J.FesteringStrike:IsReady() and (a8 == 0 or not J.Apocalypse:IsAvailable() or g:RunicPower() < 40 and not a4) then if n(J.FesteringStrike, nil, nil, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike garg_setup 20"
        end end; if J.DeathCoil:IsReady() and g:Rune() <= 1 then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil garg_setup 22"
        end end
end; local function aO()
    if S.Commons.Enabled.Potions then
        local aN = R.PotionSelected()
        if aN then if aN:IsReady() and (30 >= a5 and a4 or (not J.SummonGargoyle:IsAvailable() or J.SummonGargoyle:CooldownRemains() > 60 or J.SummonGargoyle:CooldownUp()) and (j:BuffUp(J.DarkTransformation) and 30 >= j:BuffRemains(J.DarkTransformation) or a2 and a3 <= 30 or a0 and a1 <= 30) or aa <= 30) then if n(aN, nil, S.Commons.DisplayStyle.Potions) then
                    G = 50; return "potion high_prio_actions 2"
                end end end
    end; if J.ArmyoftheDead:IsReady() and (J.SummonGargoyle:IsAvailable() and J.SummonGargoyle:CooldownRemains() < 2 or not J.SummonGargoyle:IsAvailable() or aa < 35) and not s then if n(J.ArmyoftheDead, nil, nil) then
            G = 42650; return "army_of_the_dead high_prio_actions 4"
        end end; if J.DeathCoil:IsReady() and ((ae <= 3 or not J.Epidemic:IsAvailable()) and (a4 and J.CommanderoftheDead:IsAvailable() and g:BuffUp(J.CommanderoftheDeadBuff) and J.Apocalypse:CooldownRemains() < 5 and g:BuffRemains(J.CommanderoftheDeadBuff) > 26 or h:DebuffUp(J.DeathRotDebuff) and h:DebuffRemains(J.DeathRotDebuff) < g:GCD())) then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil high_prio_actions 6"
        end end; if J.Epidemic:IsReady() and (ae >= 4 and (J.CommanderoftheDead:IsAvailable() and g:BuffUp(J.CommanderoftheDeadBuff) and J.Apocalypse:CooldownRemains() < 5 or h:DebuffUp(J.DeathRotDebuff) and h:DebuffRemains(J.DeathRotDebuff) < g:GCD())) then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
            G = 207317; return "epidemic high_prio_actions 8"
        end end; if a6:IsReady() and ((J.Apocalypse:CooldownRemains() > U + 3 or J.UnholyAssault:CooldownUp() or ae >= 3) and J.Plaguebringer:IsAvailable() and (J.Superstrain:IsAvailable() or J.UnholyBlight:IsAvailable()) and g:BuffRemains(J.PlaguebringerBuff) < g:GCD()) then if n(a6, nil, nil, not h:IsSpellInRange(a6)) then
            aj()
            return "wound_spender high_prio_actions 10"
        end end; if J.UnholyBlight:IsReady() and (Y and ((not J.Apocalypse:IsAvailable() or J.Apocalypse:CooldownDown() or not J.SummonGargoyle:IsAvailable()) and J.Morbidity:IsAvailable() or not J.Morbidity:IsAvailable()) or Z or aa < 21) then if n(J.UnholyBlight, nil, nil, not h:IsInRange(8)) then
            G = 115989; return "unholy_blight high_prio_actions 12"
        end end; if J.Outbreak:IsReady() then if R.CastCycle(J.Outbreak, ac, aF, not h:IsSpellInRange(J.Outbreak)) then
            G = 77575; return "outbreak high_prio_actions 14"
        end end; if J.ArmyoftheDead:IsReady() and (K.Fyralath:IsEquipped() and (J.SummonGargoyle:IsAvailable() and J.SummonGargoyle:CooldownRemains() < 2 or not J.SummonGargoyle:IsAvailable() or aa < 35)) and not s then if n(J.ArmyoftheDead, nil, nil) then
            G = 42650; return "army_of_the_dead high_prio_actions 16"
        end end
end; local function aP()
    if J.ArcaneTorrent:IsCastable() and (g:RunicPowerDeficit() > 20 and (J.SummonGargoyle:CooldownRemains() < g:GCD() or not J.SummonGargoyle:IsAvailable() or a4 and g:Rune() < 2 and a8 < 1)) then if n(J.ArcaneTorrent, nil, nil, not h:IsInRange(8)) then
            G = 28730; return "arcane_torrent racials 2"
        end end; if J.BloodFury:IsCastable() and (J.BloodFury:BaseDuration() + 3 >= a5 and a4 or (not J.SummonGargoyle:IsAvailable() or J.SummonGargoyle:CooldownRemains() > 60) and (a2 and a3 <= J.BloodFury:BaseDuration() + 3 or a0 and a1 <= J.BloodFury:BaseDuration() + 3 or ae >= 2 and g:BuffUp(J.DeathAndDecayBuff)) or aa <= J.BloodFury:BaseDuration() + 3) then if n(J.BloodFury, nil) then
            G = 20572; return "blood_fury racials 4"
        end end; if J.Berserking:IsCastable() and (J.Berserking:BaseDuration() + 3 >= a5 and a4 or (not J.SummonGargoyle:IsAvailable() or J.SummonGargoyle:CooldownRemains() > 60) and (a2 and a3 <= J.Berserking:BaseDuration() + 3 or a0 and a1 <= J.Berserking:BaseDuration() + 3 or ae >= 2 and g:BuffUp(J.DeathAndDecayBuff)) or aa <= J.Berserking:BaseDuration() + 3) then if n(J.Berserking, nil) then
            G = 26297; return "berserking racials 6"
        end end; if J.LightsJudgment:IsCastable() and (g:BuffUp(J.UnholyStrengthBuff) and (not J.Festermight:IsAvailable() or g:BuffRemains(J.FestermightBuff) < h:TimeToDie() or g:BuffRemains(J.UnholyStrengthBuff) < h:TimeToDie())) then if n(J.LightsJudgment, nil, nil, not h:IsSpellInRange(J.LightsJudgment)) then
            G = 255647; return "lights_judgment racials 8"
        end end; if J.AncestralCall:IsCastable() and (18 >= a5 and a4 or (not J.SummonGargoyle:IsAvailable() or J.SummonGargoyle:CooldownRemains() > 60) and (a2 and a3 <= 18 or a0 and a1 <= 18 or ae >= 2 and g:BuffUp(J.DeathAndDecayBuff)) or aa <= 18) then if n(J.AncestralCall, nil) then
            G = 274738; return "ancestral_call racials 10"
        end end; if J.ArcanePulse:IsCastable() and (ae >= 2 or g:Rune() <= 1 and g:RunicPowerDeficit() >= 60) then if n(J.ArcanePulse, nil, nil, not h:IsInRange(8)) then
            G = 260364; return "arcane_pulse racials 12"
        end end; if J.Fireblood:IsCastable() and (J.Fireblood:BaseDuration() + 3 >= a5 and a4 or (not J.SummonGargoyle:IsAvailable() or J.SummonGargoyle:CooldownRemains() > 60) and (a2 and a3 <= J.Fireblood:BaseDuration() + 3 or a0 and a1 <= J.Fireblood:BaseDuration() + 3 or ae >= 2 and g:BuffUp(J.DeathAndDecayBuff)) or aa <= J.Fireblood:BaseDuration() + 3) then if n(J.Fireblood, nil) then
            G = 265221; return "fireblood racials 14"
        end end; if J.BagofTricks:IsCastable() and (ae == 1 and (g:BuffUp(J.UnholyStrengthBuff) or d.FilteredFightRemains(ac, "<", 5))) then if n(J.BagofTricks, nil, nil, not h:IsSpellInRange(J.BagofTricks)) then
            G = 312411; return "bag_of_tricks racials 16"
        end end
end; local function aQ()
    if J.DeathCoil:IsReady() and (not VarEpidemicPriority and (not X and VarSpendRP or aa < 10)) then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil st 2"
        end end; if J.Epidemic:IsReady() and (VarEpidemicPriority and (not X and VarSpendRP or aa < 10)) then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
            G = 207317; return "epidemic st 4"
        end end; if a7:IsReady() and (g:BuffDown(J.DeathAndDecayBuff) and (ae >= 2 or J.UnholyGround:IsAvailable() and (a0 and a1 >= 13 or a4 and a5 > 8 or a2 and a3 > 8 or not W and a8 >= 4) or J.Defile:IsAvailable() and (a4 or a0 or a2 or j:BuffUp(J.DarkTransformation))) and (J.FesteringWoundDebuff:AuraActiveCount() == ae or ae == 1)) then if n(a7, nil) then
            G = 43265; return "any_dnd st 6"
        end end; if a6:IsReady() and (W or ae >= 2 and g:BuffUp(J.DeathAndDecayBuff)) then if n(a6, nil, nil, not h:IsSpellInRange(a6)) then
            aj()
            return "wound_spender st 8"
        end end; if J.FesteringStrike:IsReady() and not W then if R.CastTargetIf(J.FesteringStrike, ac, "min", as, az, not h:IsInMeleeRange(5)) then
            G = 85948; return "festering_strike st 10"
        end end; if J.DeathCoil:IsReady() then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
            G = 47541; return "death_coil st 12"
        end end; if a6:IsReady() and not W then if R.CastTargetIf(a6, ac, "max", as, az, not h:IsSpellInRange(a6)) then
            aj()
            return "wound_spender st 14"
        end end
end; local function aR()
    if S.Commons.Enabled.Items and K.Fyralath:IsEquippedAndReady() and (J.MarkofFyralathDebuff:AuraActiveCount() >= ae and (ae < 5 or ae > 21 or aa < 4) and (a8 > 2 or d.CombatTime() > 15)) then if n(K.Fyralath, nil, nil, not h:IsInRange(25)) then
            G = 16; return "fyralath_the_dreamrender trinkets 1"
        end end; local aS = g:GetUseableTrinkets(L)
    if aS and o() and (J.Apocalypse:CooldownDown() or j:BuffUp(J.DarkTransformation)) then if aS then if m.Cast(aS, nil, nil) then if aS:ID() == GetInventoryItemID("player", 13) and S.Commons.Enabled.TopTrinket then
                    G = 30; return "Generic use_items for " .. aS:Name()
                elseif aS:ID() == GetInventoryItemID("player", 14) and S.Commons.Enabled.BottomTrinket then
                    G = 31; return "Generic use_items for " .. aS:Name()
                end end end end
end; local function aT()
    VarEpidemicPriority = J.ImprovedDeathCoil:IsAvailable() and not J.CoilofDevastation:IsAvailable() and ae >= 3 or
    J.CoilofDevastation:IsAvailable() and ae >= 4 or not J.ImprovedDeathCoil:IsAvailable() and ae >= 2; T = ae >= 3 or
    J.SummonGargoyle:CooldownRemains() > 1 and (J.Apocalypse:CooldownRemains() > 1 or not J.Apocalypse:IsAvailable()) or
    not J.SummonGargoyle:IsAvailable() or d.CombatTime() > 20; U = J.Apocalypse:CooldownRemains() < 10 and a8 <= 4 and
    J.UnholyAssault:CooldownRemains() > 10 and 7 or 2; if not a4 and J.Festermight:IsAvailable() and g:BuffUp(J.FestermightBuff) and g:BuffRemains(J.FestermightBuff) / (5 * g:GCD()) >= 1 then V =
        a8 >= 1 else V = a8 >= 3 - B(J.InfectedClaws:IsAvailable()) end; W = (J.Apocalypse:CooldownRemains() > U or not J.Apocalypse:IsAvailable()) and
    (V or a8 >= 1 and J.UnholyAssault:CooldownRemains() < 20 and J.UnholyAssault:IsAvailable() and Y or h:DebuffUp(J.RottenTouchDebuff) and a8 >= 1 or a8 > 4 or g:HasTier(31, 4) and (ab:ApocMagusActive() or ab:ArmyMagusActive()) and a8 >= 1) or
    aa < 5 and a8 >= 1; X = J.VileContagion:IsAvailable() and J.VileContagion:CooldownRemains() < 3 and g:RunicPower() <
    60 and not Y; Y = ae == 1 or not p()
    Z = ae >= 2 and p()
    VarSpendRP = (not J.RottenTouch:IsAvailable() or J.RottenTouch:IsAvailable() and h:DebuffDown(J.RottenTouchDebuff) or g:RunicPowerDeficit() < 20) and
    (not g:HasTier(31, 4) or g:HasTier(31, 4) and not (ab:ApocMagusActive() or ab:ArmyMagusActive()) or g:RunicPowerDeficit() < 20 or g:Rune() < 3) and
    (J.ImprovedDeathCoil:IsAvailable() and (ae == 2 or J.CoilofDevastation:IsAvailable()) or g:Rune() < 3 or a4 or g:BuffUp(J.SuddenDoomBuff) or J.Apocalypse:CooldownRemains() < 10 and a8 > 3 or not W and a8 >= 4)
end; local function aU()
    Q = ak()
    ac = g:GetEnemiesInMeleeRange(8)
    af = g:GetEnemiesInMeleeRange(10)
    TopTrinketID, _ = GetInventoryItemID("player", 13)
    BotTrinketID, _ = GetInventoryItemID("player", 14)
    if p() then
        ad = #ac; ag = #ac
    else
        ad = 1; ag = 1
    end; ah = al(af)
    a0 = J.Apocalypse:TimeSinceLastCast() <= 15; a1 = a0 and 15 - J.Apocalypse:TimeSinceLastCast() or 0; a2 = J
    .ArmyoftheDead:TimeSinceLastCast() <= 30; a3 = a3 and 30 - J.ArmyoftheDead:TimeSinceLastCast() or 0; if R.TargetIsValid() or g:AffectingCombat() then if IsInRaid() and UnitExists("boss1") then
            a9 = d.BossFightRemains(nil, true)
            aa = a9; if aa == 11111 then aa = d.FightRemains(Enemies10yd, false) end
        end end; r = HeroRotationCharDB.Toggles[5]
    q = HeroRotationCharDB.Toggles[4]
    s = HeroRotationCharDB.Toggles[10]
    t = HeroRotationCharDB.Toggles[11]
    u = HeroRotationCharDB.Toggles[12]
    v = HeroRotationCharDB.Toggles[13]
    w = HeroRotationCharDB.Toggles[14]
    x = not HeroRotationCharDB.Toggles[15]
    y = HeroRotationCharDB.Toggles[16]
    z = HeroRotationCharDB.Toggles[17]
    A = HeroRotationCharDB.Toggles[18]
    if not I then
        H = 0; G = 0
    end; if H > 0 then H = 0 end; if G > 0 then G = 0 end
end; local function aV()
    ac = g:GetEnemiesInMeleeRange(5)
    if not I then
        H = 0; G = 0
    end; if H > 0 then H = 0 end; if G > 0 then G = 0 end; P = aU()
    if m.QueuedCast() then
        G = m.QueuedCast()
        return "Custom Queue " .. k(G):ID()
    end; if m.GUISettings.General.OpenerReset > 0 and not HeroRotationCharDB.Toggles[5] then
        starttime = GetTime()
        endtime = starttime + m.GUISettings.General.OpenerReset
    elseif m.GUISettings.General.OpenerReset > 0 and endtime ~= nil and GetTime() > endtime and HeroRotationCharDB.Toggles[5] then
        HeroRotationCharDB.Toggles[5] = not HeroRotationCharDB.Toggles[5]
        m.ToggleIconFrame:UpdateButtonText(5)
        m.Print("Opener is now " .. (HeroRotationCharDB.Toggles[5] and "|cff00ff00enabled|r." or "|cffff0000disabled|r."))
    end; if v and J.AntiMagicZone:IsUsableP() and g:AffectingCombat() and J.AntiMagicZone:CooldownRemains(BypassRecovery) <= 0 then if n(J.AntiMagicZone, nil, nil, nil) then
            G = 145629; return "queue AMZ"
        end elseif (not J.AntiMagicZone:IsUsableP() or J.AntiMagicZone:CooldownRemains() > 0 or not g:AffectingCombat()) and v then
        HeroRotationCharDB.Toggles[13] = not HeroRotationCharDB.Toggles[13]
        m.Print("Anti-Magic Zone Queue is now " ..
        (HeroRotationCharDB.Toggles[13] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if w and J.DeathGrip:IsUsableP() and J.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and R.TargetIsValid() and f("mouseover"):GUID() ~= nil then if n(J.DeathGrip, nil, nil, nil) then
            H = 149576; return "queue DeathGrip MO"
        end elseif w and J.DeathGrip:IsUsableP() and J.DeathGrip:CooldownRemains(BypassRecovery) <= 0 and R.TargetIsValid() then if n(J.DeathGrip, nil, nil, nil) then
            G = 49576; return "queue DeathGrip"
        end elseif (not J.DeathGrip:IsUsableP() or J.DeathGrip:CooldownRemains() > 0 or not R.TargetIsValid()) and w then
        HeroRotationCharDB.Toggles[14] = not HeroRotationCharDB.Toggles[14]
        m.Print("Death Grip Queue is now " .. (HeroRotationCharDB.Toggles[14] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if y and J.Asphyxiate:IsUsableP() and J.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and f("mouseover"):GUID() ~= nil then if n(J.Asphyxiate, nil, nil, nil) then
            H = 1221562; return "queue Asphyxiate MO"
        end elseif y and J.Asphyxiate:IsUsableP() and J.Asphyxiate:CooldownRemains(BypassRecovery) <= 0 and R.TargetIsValid() then if n(J.Asphyxiate, nil, nil, nil) then
            G = 221562; return "queue Asphyxiate"
        end elseif (not J.Asphyxiate:IsUsableP() or J.Asphyxiate:CooldownRemains() > 0) and y then
        HeroRotationCharDB.Toggles[16] = not HeroRotationCharDB.Toggles[16]
        m.Print("Asphyxiate Queue is now " .. (HeroRotationCharDB.Toggles[16] and "|cff00ff00on|r." or "|cffff0000off|r."))
    end; if g:IsChanneling(k(324631)) then if n(J.PoolResources, nil, nil, nil) then
            H = 161999; return "Raise Ally MO"
        end end; if J.RaiseDead:IsCastable() then if n(J.RaiseDead, nil, nil) then
            G = 46584; return "raise_dead precombat 2 displaystyle"
        end end; ac = g:GetEnemiesInMeleeRange(8)
    af = h:GetEnemiesInSplashRange(10)
    if p() then
        ad = #ac; ag = h:GetEnemiesInSplashRangeCount(10)
    else
        ad = 1; ag = 1
    end; ae = F(ad, ag)
    if R.TargetIsValid() or g:AffectingCombat() then
        a9 = d.BossFightRemains()
        aa = a9; if aa == 11111 then aa = d.FightRemains(ac, false) end; ah = al(af)
        a0 = J.Apocalypse:TimeSinceLastCast() <= 15; a1 = a0 and 15 - J.Apocalypse:TimeSinceLastCast() or 0; a2 = J
        .ArmyoftheDead:TimeSinceLastCast() <= 30; a3 = a2 and 30 - J.ArmyoftheDead:TimeSinceLastCast() or 0; a4 = ab
        :gargactive()
        a5 = ab:gargremains()
        a8 = h:DebuffStack(J.FesteringWoundDebuff)
    end; if R.TargetIsValid() and g:AffectingCombat() then
        if not g:AffectingCombat() then
            local P = aG()
            if P then return P end
        end; if J.DeathStrike:IsReady() and g:HealthPercentage() < S.Commons.UseDeathStrikeHP then if n(J.DeathStrike) then
                G = 49998; return "death_strike low hp or proc"
            end end; if g:HealthPercentage() < S.Commons.HealthstoneHP and S.Commons.UseDefensives and K.Healthstone:IsReady() and K.Healthstone:CooldownRemains() <= 0 and g:BuffDown(J.ShroudofPurgatory) then if m.Cast(K.Healthstone, nil) then
                G = 40; return "Healthstone HP"
            end end; if g:HealthPercentage() < S.Commons.HealPotHP and S.Commons.UseDefensives and K.CosmicHealPot:IsReady() and K.CosmicHealPot:CooldownRemains() <= 0 and g:BuffDown(J.ShroudofPurgatory) then if m.Cast(K.CosmicHealPot, nil) then
                G = 41; return "CosmicHealPot HP"
            end end; if g:HealthPercentage() < S.Commons.HealPotHP and S.Commons.UseDefensives and K.HealPot:IsReady() and K.HealPot:CooldownRemains() <= 0 and g:BuffDown(J.ShroudofPurgatory) then if m.Cast(K.HealPot, nil) then
                G = 41; return "HealPot HP"
            end end; if ad == 0 then
            if J.Outbreak:IsReady() and ah > 0 then if n(J.Outbreak, nil, nil, not h:IsSpellInRange(J.Outbreak)) then
                    G = 77575; return "outbreak out_of_range"
                end end; if J.Epidemic:IsReady() and p() and J.VirulentPlagueDebuff:AuraActiveCount() > 1 and not X then if n(J.Epidemic, nil, nil, not h:IsInRange(30)) then
                    G = 207317; return "epidemic out_of_range"
                end end; if J.DeathCoil:IsReady() and J.VirulentPlagueDebuff:AuraActiveCount() < 2 and not X then if n(J.DeathCoil, nil, nil, not h:IsSpellInRange(J.DeathCoil)) then
                    G = 47541; return "death_coil out_of_range"
                end end
        end; aT()
        local P = aO()
        if P then return P end; if S.Commons.Enabled.Trinkets or S.Commons.Enabled.Items then
            local P = aR()
            if P then return P end
        end; if o() then
            local P = aP()
            if P then return P end
        end; if o() and not T then
            local P = aM()
            if P then return P end; if m.CastAnnotated(J.Pool, false, "WAIT") then return "Pool for GargSetup()" end
        end; if o() and Y then
            local P = aL()
            if P then return P end
        end; if p() and o() and Z then
            local P = aJ()
            if P then return P end
        end; if p() then
            if Z and a7:CooldownRemains() < 10 and g:BuffDown(J.DeathAndDecayBuff) then
                local P = aK()
                if P then return P end
            end; if ae >= 4 and g:BuffUp(J.DeathAndDecayBuff) then
                local P = aI()
                if P then return P end
            end; if ae >= 4 and (a7:CooldownRemains() > 10 and g:BuffDown(J.DeathAndDecayBuff) or not Z) then
                local P = aH()
                if P then return P end
            end
        end; if ae <= 3 then
            local P = aQ()
            if P then return P end
        end; if m.CastAnnotated(J.Pool, false, "WAIT") then return "pool_resources" end
    end
end; function ReturnSpell() if G == 0 then return 0 else return G end end; function ReturnSpellMO() if H == 0 then return 0 else return
        H end end; local function aW()
    J.VirulentPlagueDebuff:RegisterAuraTracking()
    J.FesteringWoundDebuff:RegisterAuraTracking()
    J.MarkofFyralathDebuff:RegisterAuraTracking()
    m.Print("Unholy DK rotation has been updated for patch 10.2.5.")
    m.Print("Unholy DK rotation is currently a work in progress, but has been updated for patch 10.1.5.", s)
end; m.SetAPL(252, aV, aW)
