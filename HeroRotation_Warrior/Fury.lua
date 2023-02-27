local a, b = ...
local c = HeroDBC.DBC;
local d = HeroLib;
local e = HeroCache;
local f = d.Unit;
local g = f.Player;
local h = f.Target;
local i = d.Spell;
local j = d.Item;
local k = HeroRotation;
local l = k.Cast;
local m = k.CDsON;
local n = k.AoEON;
local o = HeroRotationCharDB.Toggles[4]
local p = HeroRotationCharDB.Toggles[5]
local q = HeroRotationCharDB.Toggles[15]
local r = HeroRotationCharDB.Toggles[12]
local s = GetInventoryItemID("player", 13)
local t = GetInventoryItemID("player", 14)
local u = i.Warrior.Fury;
local v = j.Warrior.Fury;
local w = {}
local x;
local y = 0;
local z = 0;
local A, B, C;
local D;
local E = k.Commons.Everyone;
local F = { General = k.GUISettings.General, Commons = k.GUISettings.APL.Warrior.Commons,
    Fury = k.GUISettings.APL.Warrior.Fury }
local G = { { u.StormBolt, "Cast Storm Bolt (Interrupt)", function() return true end } }
local function H(I) if I then return 1 else return 0 end end
;
local function J(I) return I ~= 0 end
;
local function K()
    if u.BerserkerStance:IsCastable() and g:BuffDown(u.BerserkerStance, true) then if l(u.BerserkerStance) then
            z = u.BerserkerStance:ID()
            return "berserker_stance precombat 2"
        end end
    ;
    if u.Charge:IsReady() and p and not D and F.Fury.UseCharge then if l(u.Charge, nil) then
            z = u.Charge:ID()
            return "charge precombat 12"
        end end
    ;
    if u.Avatar:IsCastable() and not u.TitansTorment:IsAvailable() then if l(u.Avatar, nil) then
            z = u.Avatar:ID()
            return "avatar precombat 6"
        end end
    ;
    if u.Recklessness:IsCastable() and not u.RecklessAbandon:IsAvailable() then if l(u.Recklessness, nil) then
            z = u.Recklessness:ID()
            return "recklessness precombat 8"
        end end
    ;
    if u.Bloodthirst:IsCastable() and D then if l(u.Bloodthirst, nil, nil, not D) then
            z = u.Bloodthirst:ID()
            return "bloodthirst precombat 10"
        end end
end
;
local function L()
    if m() and u.Recklessness:IsCastable() and (C > 1 or d.FightRemains() < 12) then if l(u.Recklessness, nil) then
            z = u.Recklessness:ID()
            return "recklessness multi_target 2"
        end end
    ;
    if m() and u.OdynsFury:IsCastable() and C > 1 and u.TitanicRage:IsAvailable() and (g:BuffDown(u.MeatCleaverBuff) or g:BuffUp(u.AvatarBuff) or g:BuffUp(u.RecklessnessBuff)) then if l(u.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            z = u.OdynsFury:ID()
            return "odyns_fury multi_target 4"
        end end
    ;
    if u.Whirlwind:IsCastable() and C > 1 and u.ImprovedWhilwind:IsAvailable() and g:BuffDown(u.MeatCleaverBuff) then if l(u.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            z = u.Whirlwind:ID()
            return "whirlwind multi_target 6"
        end end
    ;
    if u.Execute:IsReady() and g:BuffUp(u.AshenJuggernautBuff) and g:BuffRemains(u.AshenJuggernautBuff) < g:GCD() then if l(u.Execute, nil, nil, not D) then z =
            u.Execute:ID() "execute multi_target 8" end end
    ;
    if m() and u.ThunderousRoar:IsCastable() and x then if l(u.ThunderousRoar, nil, nil, not h:IsInMeleeRange(12)) then
            z = u.ThunderousRoar.ID()
            return "thunderous_roar multi_target 10"
        end end
    ;
    if m() and u.OdynsFury:IsCastable() and C > 1 and x then if l(u.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            z = u.OdynsFury:ID()
            return "odyns_fury multi_target 12"
        end end
    ;
    if u.CrushingBlow:IsCastable() and u.WrathandFury:IsAvailable() and x then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow multi_target 14"
        end end
    ;
    if u.Execute:IsReady() and x then if l(u.Execute, nil, nil, not D) then
            z = 280735;
            return "execute multi_target 16"
        end end
    ;
    if m() and u.OdynsFury:IsCastable() and x then if l(u.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            z = u.OdynsFury:ID()
            return "odyns_fury multi_target 18"
        end end
    ;
    if u.Rampage:IsReady() and (g:BuffUp(u.RecklessnessBuff) or g:BuffRemains(u.EnrageBuff) < g:GCD() or g:Rage() > 110 and u.OverwhelmingRage:IsAvailable() or g:Rage() > 80 and not u.OverwhelmingRage:IsAvailable()) then if l(u.Rampage, nil, nil, not D) then
            z = u.Rampage:ID()
            return "rampage multi_target 20"
        end end
    ;
    if u.Execute:IsReady() then if l(u.Execute, nil, nil, not D) then
            z = 280735;
            return "execute multi_target 22"
        end end
    ;
    if u.Bloodbath:IsCastable() and x and u.RecklessAbandon:IsAvailable() and not u.WrathandFury:IsAvailable() then if l(u.Bloodbath, nil, nil, not D) then z =
            u.Bloodbath:ID() "bloodbath multi_target 24" end end
    ;
    if u.Bloodthirst:IsCastable() and (not x or u.Annihilator:IsAvailable() and g:BuffDown(u.RecklessnessBuff)) then if l(u.Bloodthirst, nil, nil, not D) then
            z = u.Bloodthirst:ID()
            return "bloodthirst multi_target 26"
        end end
    ;
    if u.Onslaught:IsReady() and (not u.Annihilator:IsAvailable() and x or u.Tenderize:IsAvailable()) then if l(u.Onslaught, nil, nil, not D) then
            z = u.Onslaught:ID()
            return "onslaught multi_target 28"
        end end
    ;
    if u.RagingBlow:IsCastable() and u.RagingBlow:Charges() > 1 and u.WrathandFury:IsAvailable() then if l(u.RagingBlow, nil, nil, not D) then
            z = u.RagingBlow:ID()
            return "raging_blow multi_target 30"
        end end
    ;
    if u.CrushingBlow:IsCastable() and u.CrushingBlow:Charges() > 1 and u.WrathandFury:IsAvailable() then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow multi_target 32"
        end end
    ;
    if u.Bloodbath:IsCastable() and (not x or not u.WrathandFury:IsAvailable()) then if l(u.Bloodbath, nil, nil, not D) then z =
            u.Bloodbath:ID() "bloodbath multi_target 34" end end
    ;
    if u.CrushingBlow:IsCastable() and x and u.RecklessAbandon:IsAvailable() then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow multi_target 36"
        end end
    ;
    if u.Bloodthirst:IsCastable() and not u.WrathandFury:IsAvailable() then if l(u.Bloodthirst, nil, nil, not D) then
            z = u.Bloodthirst:ID()
            return "bloodthirst multi_target 38"
        end end
    ;
    if u.RagingBlow:IsCastable() and u.RagingBlow:Charges() > 1 then if l(u.RagingBlow, nil, nil, not D) then
            z = u.RagingBlow:ID()
            return "raging_blow multi_target 40"
        end end
    ;
    if u.Rampage:IsReady() then if l(u.Rampage, nil, nil, not D) then
            z = u.Rampage:ID()
            return "rampage multi_target 42"
        end end
    ;
    if u.Slam:IsReady() and u.Annihilator:IsAvailable() then if l(u.Slam, nil, nil, not D) then
            z = u.Slam:ID()
            return "slam multi_target 44"
        end end
    ;
    if u.Bloodbath:IsCastable() then if l(u.Bloodbath, nil, nil, not D) then z = u.Bloodbath:ID() "bloodbath multi_target 46" end end
    ;
    if u.RagingBlow:IsCastable() then if l(u.RagingBlow, nil, nil, not D) then
            z = u.RagingBlow:ID()
            return "raging_blow multi_target 48"
        end end
    ;
    if u.CrushingBlow:IsCastable() then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow multi_target 50"
        end end
    ;
    if u.Whirlwind:IsCastable() then if l(u.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            z = u.Whirlwind:ID()
            return "whirlwind multi_target 52"
        end end
end
;
local function M()
    if u.Whirlwind:IsCastable() and C > 1 and u.ImprovedWhilwind:IsAvailable() and g:BuffDown(u.MeatCleaverBuff) then if l(u.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            z = u.Whirlwind:ID()
            return "whirlwind single_target 2"
        end end
    ;
    if u.Execute:IsReady() and g:BuffUp(u.AshenJuggernautBuff) and g:BuffRemains(u.AshenJuggernautBuff) < g:GCD() then if l(u.Execute, nil, nil, not D) then
            z = u.Execute:ID()
            return "execute single_target 4"
        end end
    ;
    if m() and u.ThunderousRoar:IsCastable() and x then if l(u.ThunderousRoar, nil, nil, not h:IsInMeleeRange(12)) then
            z = u.ThunderousRoar:ID()
            return "thunderous_roar single_target 6"
        end end
    ;
    if m() and u.OdynsFury:IsCastable() and x and (u.DancingBlades:IsAvailable() and g:BuffRemains(u.DancingBladesBuff) < 5 or not u.DancingBlades:IsAvailable()) then if l(u.OdynsFury, nil, nil, not h:IsInMeleeRange(12)) then
            z = u.OdynsFury:ID()
            return "odyns_fury single_target 8"
        end end
    ;
    if u.Rampage:IsReady() and u.AngerManagement:IsAvailable() and (g:BuffUp(u.RecklessnessBuff) or g:BuffRemains(u.EnrageBuff) < g:GCD() or g:RagePercentage() > 85) then if l(u.Rampage, nil, nil, not D) then
            z = u.Rampage:ID()
            return "rampage single_target 10"
        end end
    ;
    if u.Execute:IsReady() and x then if l(u.Execute, nil, nil, not D) then
            z = u.Execute:ID()
            return "execute single_target 12"
        end end
    ;
    if u.Onslaught:IsReady() and (x or u.Tenderize:IsAvailable()) then if l(u.Onslaught, nil, nil, not D) then
            z = u.Onslaught:ID()
            return "onslaught single_target 14"
        end end
    ;
    if u.CrushingBlow:IsCastable() and u.WrathandFury:IsAvailable() and x then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow single_target 16"
        end end
    ;
    if u.Rampage:IsReady() and u.RecklessAbandon:IsAvailable() and (g:BuffUp(u.RecklessnessBuff) or g:BuffRemains(u.EnrageBuff) < g:GCD() or g:RagePercentage() > 85) then if l(u.Rampage, nil, nil, not D) then
            z = u.Rampage:ID()
            return "rampage single_target 18"
        end end
    ;
    if u.Rampage:IsReady() and u.AngerManagement:IsAvailable() then if l(u.Rampage, nil, nil, not D) then
            z = u.Rampage:ID()
            return "rampage single_target 20"
        end end
    ;
    if u.Execute:IsReady() then if l(u.Execute, nil, nil, not D) then z = u.Execute:ID() "execute single_target 22" end end
    ;
    if u.Bloodbath:IsCastable() and x and u.RecklessAbandon:IsAvailable() and not u.WrathandFury:IsAvailable() then if l(u.Bloodbath, nil, nil, not D) then
            z = u.Bloodbath:ID()
            return "bloodbath single_target 24"
        end end
    ;
    if u.Bloodthirst:IsCastable() and (not x or u.Annihilator:IsAvailable() and g:BuffDown(u.RecklessnessBuff)) then if l(u.Bloodthirst, nil, nil, not D) then
            z = u.Bloodthirst:ID()
            return "bloodthirst single_target 26"
        end end
    ;
    if u.RagingBlow:IsCastable() and u.RagingBlow:Charges() > 1 and u.WrathandFury:IsAvailable() then if l(u.RagingBlow, nil, nil, not D) then
            z = u.RagingBlow:ID()
            return "raging_blow single_target 28"
        end end
    ;
    if u.CrushingBlow:IsCastable() and u.CrushingBlow:Charges() > 1 and u.WrathandFury:IsAvailable() then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow single_target 30"
        end end
    ;
    if u.Bloodbath:IsCastable() and (not x or not u.WrathandFury:IsAvailable()) then if l(u.Bloodbath, nil, nil, not D) then z =
            u.Bloodbath:ID() "bloodbath single_target 32" end end
    ;
    if u.CrushingBlow:IsCastable() and x and u.RecklessAbandon:IsAvailable() then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow single_target 34"
        end end
    ;
    if u.Bloodthirst:IsCastable() and not u.WrathandFury:IsAvailable() then if l(u.Bloodthirst, nil, nil, not D) then
            z = u.Bloodthirst:ID()
            return "bloodthirst single_target 36"
        end end
    ;
    if u.RagingBlow:IsCastable() and u.RagingBlow:Charges() > 1 then if l(u.RagingBlow, nil, nil, not D) then
            z = u.RagingBlow:ID()
            return "raging_blow single_target 38"
        end end
    ;
    if u.Rampage:IsReady() then if l(u.Rampage, nil, nil, not D) then
            z = u.Rampage:ID()
            return "rampage single_target 40"
        end end
    ;
    if u.Slam:IsReady() and u.Annihilator:IsAvailable() then if l(u.Slam, nil, nil, not D) then
            z = u.Slam:ID()
            return "slam single_target 42"
        end end
    ;
    if u.Bloodbath:IsCastable() then if l(u.Bloodbath, nil, nil, not D) then z = u.Bloodbath:ID() "bloodbath single_target 44" end end
    ;
    if u.RagingBlow:IsCastable() then if l(u.RagingBlow, nil, nil, not D) then
            z = u.RagingBlow:ID()
            return "raging_blow single_target 46"
        end end
    ;
    if u.CrushingBlow:IsCastable() then if l(u.CrushingBlow, nil, nil, not D) then
            z = u.CrushingBlow:ID()
            return "crushing_blow single_target 48"
        end end
    ;
    if u.Bloodthirst:IsCastable() then if l(u.Bloodthirst, nil, nil, not D) then
            z = u.Bloodthirst:ID()
            return "bloodthirst single_target 50"
        end end
    ;
    if n() and u.Whirlwind:IsCastable() then if l(u.Whirlwind, nil, nil, not h:IsInMeleeRange(8)) then
            z = u.Whirlwind:ID()
            return "whirlwind single_target 52"
        end end
    ;
    if u.WreckingThrow:IsCastable() then if l(u.WreckingThrow, nil, nil, not h:IsInRange(30)) then
            z = u.WreckingThrow:ID()
            return "wrecking_throw single_target 54"
        end end
    ;
    if u.StormBolt:IsCastable() then if l(u.StormBolt, nil, nil, not D) then
            z = u.StormBolt:ID()
            return "storm_bolt single_target 56"
        end end
end
;
local function N()
end
;
local function O()
    p = HeroRotationCharDB.Toggles[5]
    o = HeroRotationCharDB.Toggles[4]
    r = HeroRotationCharDB.Toggles[12]
    q = HeroRotationCharDB.Toggles[15]
    if F.Commons.Enabled.TopTrinket then s = GetInventoryItemID("player", 13) else s = 1 end
    ;
    if F.Commons.Enabled.BottomTrinket then t = GetInventoryItemID("player", 14) else t = 1 end
end
;
local function P()
    if not BotOn then
        y = 0;
        z = 0
    end
    ;
    if n() then
        A = g:GetEnemiesInMeleeRange(8)
        C = #A
    else C = 1 end
    ;
    x = g:BuffUp(u.EnrageBuff)
    D = h:IsInMeleeRange(5)
    local Q = g:AffectingCombat() and 180 or 900;
    local R;
    if i(6673):IsAvailable() then
        R = g:BuffRemains(i(6673))
        if R < Q then if l(u.BattleShout, nil) then
                z = u.BattleShout:ID()
                return "battle_shout refresh"
            end end
        ;
        if F.Fury.UseDefensives and g:AffectingCombat() then
            if u.EnragedRegeneration:IsReady() and g:HealthPercentage() < F.Fury.EnragedRegneration then if k.Cast(u.EnragedRegeneration, nil, nil, nil) then
                    z = 184364;
                    return "Enraged Regeneration 100"
                end end
            ;
            if u.RallyingCry:IsReady() and g:HealthPercentage() < F.Fury.RallyingCry then if k.Cast(u.RallyingCry, nil, nil, nil) then
                    z = 97462;
                    return "RallyingCry 100"
                end end
        end
    end
    ;
    if E.TargetIsValid() then
        if u.BattleShout:IsCastable() and (g:BuffDown(u.BattleShoutBuff, true) or E.GroupBuffMissing(u.BattleShoutBuff)) then if l(u.BattleShout, nil) then
                z = u.BattleShout:ID()
                return "battle_shout precombat"
            end end
        ;
        if not g:AffectingCombat() then
            local S = K()
            if S then return S end
        end
        ;
        if u.Charge:IsCastable() and p and F.Fury.UseCharge then if l(u.Charge, nil, nil, not h:IsSpellInRange(u.Charge)) then
                z = u.Charge:ID()
                return "charge main 2"
            end end
        ;
        if m() and F.Commons.Enabled.Potions then
            local T = E.PotionSelected()
            if T and T:IsReady() then if l(T, nil, F.Commons.DisplayStyle.Potions) then return "potion main 6" end end
        end
        ;
        local S = E.Interrupt(5, u.Pummel, F.Commons.OffGCDasOffGCD.Pummel, G)
        if S then return S end
        ;
        if g:HealthPercentage() < F.Commons.VictoryRushHP then
            if u.VictoryRush:IsReady() then if l(u.VictoryRush, nil, nil, not D) then
                    z = u.VictoryRush:ID()
                    return "victory_rush heal"
                end end
            ;
            if u.ImpendingVictory:IsReady() then if l(u.ImpendingVictory, nil, nil, not D) then
                    z = u.ImpendingVictory:ID()
                    return "impending_victory heal"
                end end
        end
        ;
        if m() then
            local U = g:GetUseableTrinkets(w)
            if U then if l(U, nil, nil) then if U:ID() == GetInventoryItemID("player", 13) and F.Commons.Enabled.TopTrinket then
                        z = 30;
                        return "top trinket 1"
                    elseif U:ID() == GetInventoryItemID("player", 14) and F.Commons.Enabled.BottomTrinket then
                        z = 40;
                        return "Bot trinket 1"
                    end end end
            ;
            if u.BloodFury:IsCastable() then if l(u.BloodFury, nil) then
                    z = u.BloodFury:ID()
                    return "blood_fury main 12"
                end end
            ;
            if u.Berserking:IsCastable() and g:BuffUp(u.RecklessnessBuff) then if l(u.Berserking, nil) then
                    z = u.Berserking:ID()
                    return "berserking main 14"
                end end
            ;
            if u.LightsJudgment:IsCastable() and g:BuffDown(u.RecklessnessBuff) then if l(u.LightsJudgment, nil, nil, not h:IsSpellInRange(u.LightsJudgment)) then return
                    "lights_judgment main 16" end end
            ;
            if u.Fireblood:IsCastable() then if l(u.Fireblood, nil) then
                    z = u.Fireblood:ID()
                    return "fireblood main 18"
                end end
            ;
            if u.AncestralCall:IsCastable() then if l(u.AncestralCall, nil) then
                    z = u.AncestralCall:ID()
                    return "ancestral_call main 20"
                end end
            ;
            if u.Avatar:IsCastable() and (u.TitansTorment:IsAvailable() and x or not u.TitansTorment:IsAvailable() and (g:BuffUp(u.RecklessnessBuff) or d.FightRemains() < 20)) then if l(u.Avatar, nil) then
                    z = u.Avatar:ID()
                    return "avatar main 24"
                end end
            ;
            if u.Recklessness:IsCastable() and (u.Annihilator:IsAvailable() and u.Avatar:CooldownRemains() < 1 or u.Avatar:CooldownRemains() > 40 or not u.Avatar:IsAvailable() or d.FightRemains() < 12) then if l(u.Recklessness, nil) then
                    z = u.Recklessness:ID()
                    return "recklessness main 26"
                end end
            ;
            if u.Recklessness:IsCastable() and (not u.Annihilator:IsAvailable() or d.FightRemains() < 12) then if l(u.Recklessness, nil) then
                    z = u.Recklessness:ID()
                    return "recklessness main 28"
                end end
            ;
            if u.SpearofBastion:IsCastable() and (x and (g:BuffUp(u.RecklessnessBuff) or g:BuffUp(u.AvatarBuff) or d.FightRemains() < 20 or C > 1)) then if l(u.SpearofBastion, nil, nil, not h:IsInRange(25)) then
                    z = u.SpearofBastion:ID()
                    return "spear_of_bastion main 30"
                end end
            ;
            if u.Ravager:IsCastable() and (u.Avatar:CooldownRemains() < 3 or g:BuffUp(u.RecklessnessBuff) or d.FightRemains() < 10) then if l(u.Ravager, nil, nil, not D) then
                    z = u.Ravager:ID()
                    return "ravager main 10"
                end end
        end
        ;
        if n() and C > 2 then
            local S = L()
            if S then return S end
        end
        ;
        local S = M()
        if S then return S end
        ;
        if k.CastAnnotated(u.Pool, false, "WAIT") then return "Wait/Pool Resources" end
    end
end
;
function ReturnSpell() if z == 0 then return 0 else return z end end

;
function ReturnSpellMO() if y == 0 then return 0 else return y end end

;
local function V()
end
;
k.SetAPL(72, P, V)
