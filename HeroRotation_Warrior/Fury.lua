local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.Item;local k=HeroRotation;local l=k.Cast;local m=k.CDsON;local n=k.AoEON;local o=HeroRotationCharDB.Toggles[4]local p=HeroRotationCharDB.Toggles[5]local q=HeroRotationCharDB.Toggles[15]local r=HeroRotationCharDB.Toggles[12]local s=GetInventoryItemID("player",13)local t=GetInventoryItemID("player",14)local u=i.Warrior.Fury;local v=j.Warrior.Fury;local w={}local x;local y,z;local A=0;local B=0;local C=11111;local D=11111;d:RegisterForEvent(function()C=11111;D=11111 end,"PLAYER_REGEN_ENABLED")local E,F;local G;local H=k.Commons.Everyone;local I={General=k.GUISettings.General,Commons=k.GUISettings.APL.Warrior.Commons,Fury=k.GUISettings.APL.Warrior.Fury}local J={{u.StormBolt,"Cast Storm Bolt (Interrupt)",function()return true end}}local function K(L)if L then return 1 else return 0 end end;local function M(L)return L~=0 end;local function N()if u.BerserkerStance:IsCastable()and g:BuffDown(u.BerserkerStance,true)then if l(u.BerserkerStance)then B=u.BerserkerStance:ID()return"berserker_stance precombat 2"end end;if u.Charge:IsReady()and p and not G and I.Fury.UseCharge then if l(u.Charge,nil)then B=u.Charge:ID()return"charge precombat 12"end end;if u.Avatar:IsCastable()and not u.TitansTorment:IsAvailable()then if l(u.Avatar,nil)then B=u.Avatar:ID()return"avatar precombat 6"end end;if u.Recklessness:IsCastable()and not u.RecklessAbandon:IsAvailable()then if l(u.Recklessness,nil)then B=u.Recklessness:ID()return"recklessness precombat 8"end end;if u.Bloodthirst:IsCastable()and G then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst precombat 10"end end end;local function O()if m()and u.Recklessness:IsCastable()and(F>1 or D<12)then if l(u.Recklessness)then B=u.Recklessness:ID()return"recklessness multi_target 2"end end;if m()and u.OdynsFury:IsCastable()and(F>1 and u.TitanicRage:IsAvailable()and(g:BuffDown(u.MeatCleaverBuff)or g:BuffUp(u.AvatarBuff)or g:BuffUp(u.RecklessnessBuff)))then if l(u.OdynsFury,nil,nil,not h:IsInMeleeRange(12))then B=u.OdynsFury:ID()return"odyns_fury multi_target 4"end end;if u.Whirlwind:IsCastable()and(F>1 and u.ImprovedWhilwind:IsAvailable()and g:BuffDown(u.MeatCleaverBuff))then if l(u.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then B=u.Whirlwind:ID()return"whirlwind multi_target 6"end end;if u.Execute:IsReady()and(g:BuffUp(u.AshenJuggernautBuff)and g:BuffRemains(u.AshenJuggernautBuff)<g:GCD())then if l(u.Execute,nil,nil,not G)then B=280735;return"execute multi_target 8"end end;if m()and u.ThunderousRoar:IsCastable()and x then if l(u.ThunderousRoar,nil,nil,not h:IsInMeleeRange(12))then B=u.ThunderousRoar:ID()return"thunderous_roar multi_target 10"end end;if m()and u.OdynsFury:IsCastable()and(F>1 and x)then if l(u.OdynsFury,nil,nil,not h:IsInMeleeRange(12))then B=u.OdynsFury:ID()return"odyns_fury multi_target 12"end end;local P=g:CritChancePct()+K(g:BuffUp(u.RecklessnessBuff))*20+g:BuffStack(u.MercilessAssaultBuff)*10+g:BuffStack(u.BloodcrazeBuff)*15;if g:HasTier(30,4)and P>=95 then if u.Bloodbath:IsCastable()then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()return"bloodbath multi_target 14"end end;if u.Bloodthirst:IsCastable()then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst multi_target 16"end end end;if u.CrushingBlow:IsCastable()and(u.WrathandFury:IsAvailable()and x)then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow multi_target 14"end end;if u.Execute:IsReady()and x then if l(u.Execute,nil,nil,not G)then B=280735;return"execute multi_target 16"end end;if m()and u.OdynsFury:IsCastable()and x then if l(u.OdynsFury,nil,nil,not h:IsInMeleeRange(12))then B=u.OdynsFury:ID()return"odyns_fury multi_target 18"end end;if u.Rampage:IsReady()and(g:BuffUp(u.RecklessnessBuff)or g:BuffRemains(u.EnrageBuff)<g:GCD()or g:Rage()>110 and u.OverwhelmingRage:IsAvailable()or g:Rage()>80 and not u.OverwhelmingRage:IsAvailable())then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage multi_target 20"end end;if u.Execute:IsReady()then if l(u.Execute,nil,nil,not G)then B=280735;return"execute multi_target 22"end end;if u.Bloodbath:IsCastable()and(x and u.RecklessAbandon:IsAvailable()and not u.WrathandFury:IsAvailable())then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()"bloodbath multi_target 24"end end;if u.Bloodthirst:IsCastable()and(not x or u.Annihilator:IsAvailable()and g:BuffDown(u.RecklessnessBuff))then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst multi_target 26"end end;if u.Onslaught:IsReady()and(not u.Annihilator:IsAvailable()and x or u.Tenderize:IsAvailable())then if l(u.Onslaught,nil,nil,not G)then B=u.Onslaught:ID()return"onslaught multi_target 28"end end;if u.RagingBlow:IsCastable()and(u.RagingBlow:Charges()>1 and u.WrathandFury:IsAvailable())then if l(u.RagingBlow,nil,nil,not G)then B=u.RagingBlow:ID()return"raging_blow multi_target 30"end end;if u.CrushingBlow:IsCastable()and(u.CrushingBlow:Charges()>1 and u.WrathandFury:IsAvailable())then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow multi_target 32"end end;if u.Bloodbath:IsCastable()and(not x or not u.WrathandFury:IsAvailable())then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()"bloodbath multi_target 34"end end;if u.CrushingBlow:IsCastable()and(x and u.RecklessAbandon:IsAvailable())then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow multi_target 36"end end;if u.Bloodthirst:IsCastable()and not u.WrathandFury:IsAvailable()then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst multi_target 38"end end;if u.RagingBlow:IsCastable()and u.RagingBlow:Charges()>1 then if l(u.RagingBlow,nil,nil,not G)then B=u.RagingBlow:ID()return"raging_blow multi_target 40"end end;if u.Rampage:IsReady()then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage multi_target 42"end end;if u.Slam:IsReady()and u.Annihilator:IsAvailable()then if l(u.Slam,nil,nil,not G)then B=u.Slam:ID()return"slam multi_target 44"end end;if u.Bloodbath:IsCastable()then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()"bloodbath multi_target 46"end end;if u.RagingBlow:IsCastable()then if l(u.RagingBlow,nil,nil,not G)then B=u.RagingBlow:ID()return"raging_blow multi_target 48"end end;if u.CrushingBlow:IsCastable()then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow multi_target 50"end end;if u.Whirlwind:IsCastable()then if l(u.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then B=u.Whirlwind:ID()return"whirlwind multi_target 52"end end end;local function Q()if u.Whirlwind:IsCastable()and F>1 and u.ImprovedWhilwind:IsAvailable()and g:BuffDown(u.MeatCleaverBuff)then if l(u.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then B=u.Whirlwind:ID()return"whirlwind single_target 2"end end;if u.Execute:IsReady()and(g:BuffUp(u.AshenJuggernautBuff)and g:BuffRemains(u.AshenJuggernautBuff)<g:GCD())then if l(u.Execute,nil,nil,not G)then B=280735;return"execute single_target 4"end end;if m()and u.OdynsFury:IsCastable()and(x and(u.DancingBlades:IsAvailable()and g:BuffRemains(u.DancingBladesBuff)<5 or not u.DancingBlades:IsAvailable()))then if l(u.OdynsFury,nil,nil,not h:IsInMeleeRange(12))then B=u.OdynsFury:ID()return"odyns_fury single_target 8"end end;if u.Rampage:IsReady()and(u.AngerManagement:IsAvailable()and(g:BuffUp(u.RecklessnessBuff)or g:BuffRemains(u.EnrageBuff)<g:GCD()or g:RagePercentage()>85))then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage single_target 10"end end;local P=g:CritChancePct()+K(g:BuffUp(u.RecklessnessBuff))*20+g:BuffStack(u.MercilessAssaultBuff)*10+g:BuffStack(u.BloodcrazeBuff)*15;if g:HasTier(30,4)and P>=95 then if u.Bloodbath:IsCastable()then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()return"bloodbath single_target 12"end end;if u.Bloodthirst:IsCastable()then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst single_target 14"end end end;if u.Bloodbath:IsCastable()and g:HasTier(31,2)then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()return"bloodbath single_target 14"end end;if m()and u.ThunderousRoar:IsCastable()and x then if l(u.ThunderousRoar,nil,nil,not h:IsInMeleeRange(12))then B=u.ThunderousRoar:ID()return"thunderous_roar single_target 16"end end;if u.Onslaught:IsReady()and(x or u.Tenderize:IsAvailable())then if l(u.Onslaught,nil,nil,not G)then B=u.Onslaught:ID()return"onslaught single_target 14"end end;if u.CrushingBlow:IsCastable()and(u.WrathandFury:IsAvailable()and x and g:BuffDown(u.FuriousBloodthirstBuff))then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow single_target 20"end end;if u.Execute:IsReady()and(x and g:BuffDown(u.FuriousBloodthirstBuff)and g:BuffUp(u.AshenJuggernautBuff)or g:BuffRemains(u.SuddenDeathBuff)<=g:GCD()and(h:HealthPercentage()>35 and u.Massacre:IsAvailable()or h:HealthPercentage()>20))then if l(u.Execute,nil,nil,not G)then B=u.Execute:ID()return"execute single_target 22"end end;if u.Rampage:IsReady()and(u.RecklessAbandon:IsAvailable()and(g:BuffUp(u.RecklessnessBuff)or g:BuffRemains(u.EnrageBuff)<g:GCD()or g:RagePercentage()>85))then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage single_target 18"end end;if u.Execute:IsReady()and x then if l(u.Execute,nil,nil,not G)then B=u.Execute:ID()return"execute single_target 28"end end;if u.Rampage:IsReady()and u.AngerManagement:IsAvailable()then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage single_target 20"end end;if u.Execute:IsReady()then if l(u.Execute,nil,nil,not G)then B=280735;return"execute single_target 22"end end;if u.Bloodbath:IsCastable()and(x and u.RecklessAbandon:IsAvailable()and not u.WrathandFury:IsAvailable())then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()return"bloodbath single_target 28"end end;if u.Rampage:IsReady()and(h:HealthPercentage()<35 and u.Massacre:IsAvailable())then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage single_target 30"end end;if u.Bloodthirst:IsCastable()and((not x or u.Annihilator:IsAvailable()and g:BuffDown(u.RecklessnessBuff))and g:BuffDown(u.FuriousBloodthirstBuff))then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst single_target 32"end end;if u.RagingBlow:IsCastable()and(u.RagingBlow:Charges()>1 and u.WrathandFury:IsAvailable())then if l(u.RagingBlow,nil,nil,not G)then B=u.RagingBlow:ID()return"raging_blow single_target 34"end end;if u.CrushingBlow:IsCastable()and(u.CrushingBlow:Charges()>1 and u.WrathandFury:IsAvailable()and g:BuffDown(u.FuriousBloodthirstBuff))then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow single_target 36"end end;if u.Bloodbath:IsCastable()and(not x or not u.WrathandFury:IsAvailable())then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()return"bloodbath single_target 38"end end;if u.CrushingBlow:IsCastable()and(x and u.RecklessAbandon:IsAvailable()and g:BuffDown(u.FuriousBloodthirstBuff))then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow single_target 40"end end;if u.Bloodthirst:IsCastable()and(not u.WrathandFury:IsAvailable()and g:BuffDown(u.FuriousBloodthirstBuff))then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst single_target 42"end end;if u.RagingBlow:IsCastable()and u.RagingBlow:Charges()>1 then if l(u.RagingBlow,nil,nil,not G)then B=u.RagingBlow:ID()return"raging_blow single_target 44"end end;if u.Rampage:IsReady()then if l(u.Rampage,nil,nil,not G)then B=u.Rampage:ID()return"rampage single_target 46"end end;if u.Slam:IsReady()and u.Annihilator:IsAvailable()then if l(u.Slam,nil,nil,not G)then B=u.Slam:ID()return"slam single_target 48"end end;if u.Bloodbath:IsCastable()then if l(u.Bloodbath,nil,nil,not G)then B=u.Bloodbath:ID()return"bloodbath single_target 50"end end;if u.RagingBlow:IsCastable()then if l(u.RagingBlow,nil,nil,not G)then B=u.RagingBlow:ID()return"raging_blow single_target 52"end end;if u.CrushingBlow:IsCastable()and g:BuffDown(u.FuriousBloodthirstBuff)then if l(u.CrushingBlow,nil,nil,not G)then B=u.CrushingBlow:ID()return"crushing_blow single_target 54"end end;if u.Bloodthirst:IsCastable()then if l(u.Bloodthirst,nil,nil,not G)then B=u.Bloodthirst:ID()return"bloodthirst single_target 56"end end;if u.Whirlwind:IsCastable()then if l(u.Whirlwind,nil,nil,not h:IsInMeleeRange(8))then B=u.Whirlwind:ID()return"whirlwind single_target 58"end end;if u.WreckingThrow:IsCastable()then if l(u.WreckingThrow,nil,nil,not h:IsInRange(30))then B=u.WreckingThrow:ID()return"wrecking_throw single_target 60"end end;if u.StormBolt:IsCastable()then if l(u.StormBolt,nil,nil,not G)then B=u.StormBolt:ID()return"storm_bolt single_target 62"end end end;local function R()end;local function S()p=HeroRotationCharDB.Toggles[5]o=HeroRotationCharDB.Toggles[4]r=HeroRotationCharDB.Toggles[12]q=HeroRotationCharDB.Toggles[15]if I.Commons.Enabled.TopTrinket then s=GetInventoryItemID("player",13)else s=1 end;if I.Commons.Enabled.BottomTrinket then t=GetInventoryItemID("player",14)else t=1 end end;local function T()if not BotOn then A=0;B=0 end;if n()then E=g:GetEnemiesInMeleeRange(5)F=#E else F=1 end;x=g:BuffUp(u.EnrageBuff)G=h:IsInRange(5)local U=g:AffectingCombat()and 180 or 900;local V;if i(386196):IsAvailable()then if not g:BuffUp(u.BerserkerStance)then if l(u.BerserkerStance,nil)then B=u.BerserkerStance:ID()return"Cast Berserker Stance"end end end;if i(6673):IsAvailable()and I.Fury.UseAutoBattleShout then V=g:BuffRemains(i(6673))if V<U then if l(u.BattleShout,nil)then B=u.BattleShout:ID()return"battle_shout refresh"end end end;if I.Fury.UseDefensives and g:AffectingCombat()then if u.EnragedRegeneration:IsReady()and g:HealthPercentage()<I.Fury.EnragedRegneration then if k.Cast(u.EnragedRegeneration,nil,nil,nil)then B=184364;return"Enraged Regeneration 100"end end;if u.RallyingCry:IsReady()and g:HealthPercentage()<I.Fury.RallyingCry then if k.Cast(u.RallyingCry,nil,nil,nil)then B=97462;return"RallyingCry 100"end end;if v.Healthstone:IsReady()and v.Healthstone:CooldownRemains()<=0 and g:HealthPercentage()<I.Commons.HealthstoneHP then if k.Cast(v.Healthstone,nil)then B=51;return"Healthstone HP"end end;if g:HealthPercentage()<I.Commons.HealPotHP and v.CosmicHealPot:IsReady()and v.CosmicHealPot:CooldownRemains()<=0 then if k.Cast(v.CosmicHealPot,nil)then B=54;return"HealPot HP"end end end;if H.TargetIsValid()and g:AffectingCombat()and g:GetEnemiesInMeleeRange(8)then C=d.BossFightRemains()D=C;if D==11111 then D=d.FightRemains(Enemies10yd,false)end;if not g:AffectingCombat()then local W=N()if W then return W end end;if u.Charge:IsCastable()and p and I.Fury.UseCharge then if l(u.Charge,nil,nil,not h:IsSpellInRange(u.Charge))then B=u.Charge:ID()return"charge main 2"end end;if m()and I.Commons.Enabled.Potions and q then local X=H.PotionSelected()if not k.GUISettings.General.HoldPotforBL or k.GUISettings.General.HoldPotforBL and g:BloodlustUp()then if X and X:IsReady()then if l(X,nil,nil)then B=54;return"potion main 6"end end end end;local W=H.Interrupt(5,u.Pummel,I.Commons.OffGCDasOffGCD.Pummel,J)if W then return W end;if g:HealthPercentage()<I.Commons.VictoryRushHP then if u.VictoryRush:IsReady()then if l(u.VictoryRush,nil,nil,not G)then B=u.VictoryRush:ID()return"victory_rush heal"end end;if u.ImpendingVictory:IsReady()then if l(u.ImpendingVictory,nil,nil,not G)then B=u.ImpendingVictory:ID()return"impending_victory heal"end end end;if m()then local Y=g:GetUseableTrinkets(w)if Y then if l(Y,nil,nil)then if Y:ID()==GetInventoryItemID("player",13)and I.Commons.Enabled.TopTrinket then B=30;return"top trinket 1"elseif Y:ID()==GetInventoryItemID("player",14)and I.Commons.Enabled.BottomTrinket then B=40;return"Bot trinket 1"end end end;if u.Ravager:IsCastable()and(u.Avatar:CooldownRemains()<3 or g:BuffUp(u.RecklessnessBuff)or D<10)then if l(u.Ravager,nil,nil,not h:IsInRange(40))then B=u.Ravager:ID()return"ravager main 8"end end;if u.BloodFury:IsCastable()then if l(u.BloodFury,nil)then B=u.BloodFury:ID()return"blood_fury main 12"end end;if u.Berserking:IsCastable()and g:BuffUp(u.RecklessnessBuff)then if l(u.Berserking,nil)then B=u.Berserking:ID()return"berserking main 14"end end;if u.LightsJudgment:IsCastable()and g:BuffDown(u.RecklessnessBuff)then if l(u.LightsJudgment,nil,nil,not h:IsSpellInRange(u.LightsJudgment))then return"lights_judgment main 16"end end;if u.Fireblood:IsCastable()then if l(u.Fireblood,nil)then B=u.Fireblood:ID()return"fireblood main 18"end end;if u.AncestralCall:IsCastable()then if l(u.AncestralCall,nil)then B=u.AncestralCall:ID()return"ancestral_call main 20"end end;if u.Avatar:IsCastable()and(u.TitansTorment:IsAvailable()and x or u.BerserkersTorment:IsAvailable()and x and g:BuffDown(u.AvatarBuff)or not u.TitansTorment:IsAvailable()and not u.BerserkersTorment:IsAvailable()and(g:BuffUp(u.RecklessnessBuff)or D<20))then if l(u.Avatar,nil)then B=u.Avatar:ID()return"avatar main 24"end end;if u.Recklessness:IsCastable()and(u.Annihilator:IsAvailable()and u.SpearofBastion:CooldownRemains()<1 or u.Avatar:CooldownRemains()>40 or not u.Avatar:IsAvailable()or D<12)then if l(u.Recklessness,nil)then B=u.Recklessness:ID()return"recklessness main 26"end end;if u.Recklessness:IsCastable()and(not u.Annihilator:IsAvailable()or D<12)then if l(u.Recklessness,nil)then B=u.Recklessness:ID()return"recklessness main 28"end end;if u.SpearofBastion:IsCastable()and(x and(g:BuffUp(u.FuriousBloodthirstBuff)and u.TitansTorment:IsAvailable()or not u.TitansTorment:IsAvailable()or D<20 or F>1 or not g:HasTier(31,2)))then if l(u.SpearofBastion,nil,nil,not h:IsInRange(25))then B=u.SpearofBastion:ID()return"spear_of_bastion main 30"end end;if u.Ravager:IsCastable()and(u.Avatar:CooldownRemains()<3 or g:BuffUp(u.RecklessnessBuff)or d.FightRemains()<10)then if l(u.Ravager,nil,nil,G)then B=u.Ravager:ID()return"ravager main 10"end end end;if n()and F>=2 then local W=O()if W then return W end end;if F==1 then local W=Q()if W then return W end end;if W then return W end;if k.CastAnnotated(u.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;function ReturnSpell()if B==0 then return 0 else return B end end;function ReturnSpellMO()if A==0 then return 0 else return A end end;local function Z()end;k.SetAPL(72,T,Z)