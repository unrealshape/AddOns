local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Pet;local i=f.Target;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;local n=m.AoEON;local o=m.CDsON;local p=m.Cast;local q=HeroRotationCharDB.Toggles[4]and select(8,GetInstanceInfo())~=1698;local r=HeroRotationCharDB.Toggles[5]local s=HeroRotationCharDB.Toggles[6]local t=not HeroRotationCharDB.Toggles[15]local u=HeroRotationCharDB.Toggles[12]local v=HeroRotationCharDB.Toggles[70]local w=HeroRotationCharDB.Toggles[71]local x=HeroRotationCharDB.Toggles[72]local y=false;local z={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}local A=m.Commons.Everyone;local B={General=m.GUISettings.General,Commons=m.GUISettings.APL.Druid.Commons,Guardian=m.GUISettings.APL.Druid.Guardian,Guardian2=m.GUISettings.APL.Druid.Guardian2}local C=j.Druid.Guardian;local D=l.Druid.Guardian;local E={}local F=g:GetEquipment()local G=l(0)local H=l(0)if F[13]then G=l(F[13])end;if F[14]then H=l(F[14])end;local I;local J;local K;local L=0;local M=0;local N=0;local O;local P,Q;local R=g:HasLegendaryEquipped(58)local S=g:HasLegendaryEquipped(49)local T=g:HasLegendaryEquipped(48)local U=g:HasLegendaryEquipped(60)local V=g:CovenantID()d:RegisterForEvent(function()V=g:CovenantID()end,"COVENANT_CHOSEN")d:RegisterForEvent(function()F=g:GetEquipment()G=l(0)H=l(0)if F[13]then G=l(F[13])end;if F[14]then H=l(F[14])end;R=g:HasLegendaryEquipped(58)S=g:HasLegendaryEquipped(49)T=g:HasLegendaryEquipped(48)U=g:HasLegendaryEquipped(60)end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()C.AdaptiveSwarm:RegisterInFlight()end,"LEARNED_SPELL_IN_TAB")C.AdaptiveSwarm:RegisterInFlight()local function W(X)if X then return 1 else return 0 end end;local function Y(X)return X~=0 end;local function Z(a0)local a1=0;for a2 in pairs(a0)do local a3=a0[a2]if a3:IsChanneling(j(240784))then a1=a1+1 end end;return a1 end;local function a4(a0)local a5=0;for a2 in pairs(a0)do local a3=a0[a2]if a3:CastRemains()<=g:GCD()and a3:IsCasting(j(240784))then a5=a5+1 end end;return a5 end;local function a6(a0)local a7=0;for a2 in pairs(a0)do local a3=a0[a2]if a3:NPCID()==118044 then a7=a7+1 end end;return a7 end;local function a8(a0)local a9=0;for a2 in pairs(a0)do local a3=a0[a2]if a3:NPCID()==118065 or a3:NPCID()==118032 then a9=a9+1 end end;return a9 end;local function aa(ab)if ab:DebuffRefreshable(C.MoonfireDebuff)and ab:TimeToDie()>12 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and ab:GUID()==f("mouseover"):GUID()and B.Guardian.TargetSwap=="Mouseover"and ab:NPCID()~=118044 then L=18921;return true elseif ab:DebuffRefreshable(C.MoonfireDebuff)and ab:TimeToDie()>12 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and B.Guardian.TargetSwap=="AutoSwap"and ab:GUID()~=i:GUID()and not u and ab:NPCID()~=118044 then L=9999;if L==999 then starttime=GetTime()endtime=starttime+0.25 elseif L>0 and endtime~=nil and GetTime()>endtime then L=0 end;return true elseif ab:DebuffRefreshable(C.MoonfireDebuff)and ab:TimeToDie()>12 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and ab:GUID()==i:GUID()and ab:NPCID()~=118044 then M=8921;return true elseif ab:DebuffRefreshable(C.MoonfireDebuff)and ab:TimeToDie()>12 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and ab:NPCID()~=118044 then return true end end;local function ac(ab)if ab:DebuffRefreshable(C.MoonfireDebuff)and(ab:NPCID()==118032 or ab:NPCID()==118065)and ab:GUID()==f("mouseover"):GUID()and ab:NPCID()~=118044 then L=18921;return true elseif ab:DebuffRefreshable(C.MoonfireDebuff)and(ab:NPCID()==118032 or ab:NPCID()==118065)and ab:GUID()==f("target"):GUID()and ab:NPCID()~=118044 then M=8921;return true elseif ab:DebuffRefreshable(C.MoonfireDebuff)and(ab:NPCID()==118032 or ab:NPCID()==118065)then return true end end;local function ad(ab)if ab:DebuffRefreshable(C.SunfireDebuff)and ab:NPCID()==118065 and ab:GUID()==f("mouseover"):GUID()and ab:NPCID()~=118044 then L=2197630;return true elseif ab:DebuffRefreshable(C.SunfireDebuff)and ab:NPCID()==118065 and ab:GUID()==f("target"):GUID()and ab:NPCID()~=118044 then M=197630;return true elseif ab:DebuffRefreshable(C.SunfireDebuff)and ab:NPCID()==118065 then return true end end;local function ae(ab)return ab:DebuffRefreshable(C.ThrashDebuff)or ab:DebuffStack(C.ThrashDebuff)<3 or ab:DebuffStack(C.ThrashDebuff)<4 and R or Q>=4 or g:BuffUp(C.BerserkBuff)and g:BuffRemains(C.BerserkBuff)<=g:GCD()+0.5 end;local function af(ab)if ab:DebuffStack(C.ThrashDebuff)>2 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and ab:GUID()==f("mouseover"):GUID()and B.Guardian.TargetSwap=="Mouseover"then L=180313;return true elseif ab:DebuffStack(C.ThrashDebuff)>2 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and B.Guardian.TargetSwap=="AutoSwap"and ab:GUID()~=i:GUID()and not u then L=9999;if L==999 then starttime=GetTime()endtime=starttime+0.25 elseif L>0 and endtime~=nil and GetTime()>endtime then L=0 end;return true elseif ab:DebuffStack(C.ThrashDebuff)>2 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)and ab:GUID()==i:GUID()then M=80313;return true elseif ab:DebuffStack(C.ThrashDebuff)>2 and(ab:AffectingCombat()or ab:IsDummy()or ab:NPCID()==153285)then return true end;return ab:DebuffStack(C.ThrashDebuff)>2 end;local function ag()if g:HealthPercentage()<B.Guardian2.FrenziedRegenHP and C.FrenziedRegeneration:IsReady()and g:BuffDown(C.FrenziedRegenerationBuff)and not g:HealingAbsorbed()and g:BuffUp(C.BearForm)then if p(C.FrenziedRegeneration,nil,nil)then M=22842;return"frenzied_regeneration defensive 2"end end;if C.Ironfur:IsCastable()and not y and g:BuffUp(C.BearForm)and(g:Rage()>=C.Ironfur:Cost()+1 and(J or i:IsDummy()or i:NPCID()==153285)and(g:BuffDown(C.IronfurBuff)or g:BuffStack(C.IronfurBuff)<2 and g:BuffRefreshable(C.Ironfur)or g:Rage()>=90))then if p(C.Ironfur,nil,nil)then M=192081;return"ironfur defensive 4"end end;if C.Barkskin:IsCastable()and select(8,GetInstanceInfo())~=1698 and(g:HealthPercentage()<B.Guardian2.BarkskinHP and g:BuffDown(C.IronfurBuff)or g:HealthPercentage()<B.Guardian2.BarkskinHP*0.75)then if p(C.Barkskin,nil,nil)then M=22812;return"barkskin defensive 6"end end;if C.SurvivalInstincts:IsCastable()and g:HealthPercentage()<B.Guardian2.SurvivalInstinctsHP then if p(C.SurvivalInstincts,nil,nil)then M=61336;return"survival_instincts defensive 8"end end;if C.BristlingFur:IsCastable()and g:Rage()<B.Guardian2.BristlingFurRage then if p(C.BristlingFur,nil,nil)then M=155835;return"bristling_fur defensive 10"end end;if g:HealthPercentage()<B.Guardian2.PhialHP and D.PhialofSerenity:IsReady()and D.PhialofSerenity:CooldownRemains()<=0 then if m.Cast(D.PhialofSerenity,nil)then M=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<B.Guardian2.HealthstoneHP and D.Healthstone:IsReady()and D.Healthstone:CooldownRemains()<=0 then if m.Cast(D.Healthstone,nil)then M=40;return"Healthstone HP"end end;if g:HealthPercentage()<B.Guardian2.HealPotHP and D.HealPot:IsReady()and D.HealPot:CooldownRemains()<=0 then if m.Cast(D.HealPot,nil)then M=41;return"HealPot HP"end end end;local function ah()if C.CatForm:IsCastable()and v and C.FeralAffinity:IsAvailable()and not g:BuffUp(C.CatForm)and not select(8,GetInstanceInfo())==1698 then if p(C.CatForm)then M=768;return"cat_form precombat 2"end end;if C.MoonkinForm:IsCastable()and(v or select(8,GetInstanceInfo())==1698)and C.BalanceAffinity:IsAvailable()and not g:BuffUp(C.MoonkinForm)then if p(C.MoonkinForm)then M=197625;return"moonkin_form precombat 2"end end;if C.HeartoftheWild:IsCastable()and o()and i:IsInMeleeRange(8)and v and(C.BalanceAffinity:IsAvailable()or C.FeralAffinity:IsAvailable())and not select(8,GetInstanceInfo())==1698 then if p(C.HeartoftheWild,nil)then M=319454;return"heart_of_the_wild bear Precombat "end end;if C.Prowl:IsCastable()and v and C.FeralAffinity:IsAvailable()and g:BuffDown(C.Prowl)and not select(8,GetInstanceInfo())==1698 then if p(C.Prowl,nil)then M=5215;return"Prowl Precombat"end end;if C.BearForm:IsCastable()and g:BuffDown(C.BearForm)and(not v or not C.FeralAffinity:IsAvailable()and not C.BalanceAffinity:IsAvailable())and not select(8,GetInstanceInfo())==1698 then if p(C.BearForm)then M=5487;return"bear_form precombat 2"end end;if C.Wrath:IsCastable()and(v or select(8,GetInstanceInfo())==1698)and g:BuffUp(C.MoonkinForm)and(V~=3 or select(8,GetInstanceInfo())==1698)then if p(C.Wrath)then M=5176;return"cat_form precombat 2"end end;if C.Starfire:IsCastable()and(v or select(8,GetInstanceInfo())==1698)and g:BuffUp(C.MoonkinForm)and V==3 then if p(C.Starfire)then M=197628;return"cat_form precombat 2"end end;if C.Fleshcraft:IsCastable()and q and not g:IsMoving()and(C.PustuleEruption:SoulbindEnabled()or C.VolatileSolvent:SoulbindEnabled())then if p(C.Fleshcraft,nil,nil)then M=324631;return"fleshcraft precombat 3"end end;if C.WildCharge:IsCastable()and(i:IsInRange(25)and not i:IsInRange(8))and not select(8,GetInstanceInfo())==1698 then if p(C.WildCharge)then M=102401;return"wild_charge precombat 4"end end;if C.Rake:IsCastable()and g:BuffUp(C.Prowl)and not select(8,GetInstanceInfo())==1698 then if p(C.Rake)then M=1822;return"Rake cat 2"end end;if C.Mangle:IsCastable()and i:IsInMeleeRange(5)and g:BuffUp(C.BearForm)and not select(8,GetInstanceInfo())==1698 then if p(C.Mangle)then M=33917;return"mangle precombat 6"end end;if C.Thrash:IsCastable()and i:IsInMeleeRange(8)and g:BuffUp(C.BearForm)and not select(8,GetInstanceInfo())==1698 then if p(C.Thrash)then M=77758;return"thrash precombat 8"end end;if C.Moonfire:IsCastable()and i:NPCID()~=118044 and not select(8,GetInstanceInfo())==1698 then if p(C.Moonfire,nil,nil,not i:IsSpellInRange(C.Moonfire))then M=8921;return"moonfire precombat 10"end end end;local function ai()if C.MoonkinForm:IsCastable()and g:BuffDown(C.MoonkinForm)then if p(C.MoonkinForm)then M=197625;return"MoonkinForm lycara 2"end end end;local function aj()if C.CatForm:IsCastable()and g:BuffDown(C.CatForm)then if p(C.CatForm)then M=768;return"catform lycara 2"end end end;local function ak()if C.MoonkinForm:IsCastable()and g:BuffDown(C.MoonkinForm)then if p(C.MoonkinForm)then M=197625;return"owl_form owl 2"end end;if C.HeartoftheWild:IsCastable()and o()and C.HeartoftheWild:IsAvailable()and g:BuffDown(C.HeartoftheWild)then if p(C.HeartoftheWild)then M=319454;return"HOTW owl 2"end end;if C.ConvoketheSpirits:IsCastable()and g:BuffUp(C.MoonkinForm)and q and(C.FirstStrike:SoulbindEnabled()and g:BuffUp(C.FirstStrike))then if p(C.ConvoketheSpirits)then M=323764;return"Convoke owl 2"end end;if C.ConvoketheSpirits:IsCastable()and g:BuffUp(C.MoonkinForm)and(C.HeartoftheWild:IsAvailable()and(g:BuffUp(C.HeartoftheWild)or C.HeartoftheWild:CooldownRemains()>15)or not C.HeartoftheWild:IsAvailable()or not o())then if p(C.ConvoketheSpirits)then M=323764;return"Convoke owlvoke 2"end end end;local function al()if C.CatForm:IsCastable()and g:BuffDown(C.CatForm)then if p(C.CatForm)then M=768;return"catform catvoke 2"end end;if C.HeartoftheWild:IsCastable()and o()and C.HeartoftheWild:IsAvailable()and g:BuffDown(C.HeartoftheWild)then if p(C.HeartoftheWild)then M=319454;return"HOTW catvoke 2"end end;if C.ConvoketheSpirits:IsCastable()and g:BuffUp(C.CatForm)and(C.FirstStrike:SoulbindEnabled()and g:BuffUp(C.FirstStrikeBuff)or C.HeartoftheWild:IsAvailable()and(g:BuffUp(C.HeartoftheWild)or C.HeartoftheWild:CooldownRemains()>15)or not C.HeartoftheWild:IsAvailable()or not o())then if p(C.ConvoketheSpirits)then M=323764;return"Convoke catvoke 2"end end end;local function am()if C.BearForm:IsCastable()and g:BuffDown(C.BearForm)then if p(C.BearForm)then M=5487;return"bear_form bear 2"end end;if C.HeartoftheWild:IsCastable()and o()and i:IsInMeleeRange(8)and(C.BalanceAffinity:IsAvailable()and V==2)then if p(C.HeartoftheWild,nil)then M=319454;return"heart_of_the_wild bear 3"end end;if C.Ironfur:IsCastable()and g:Rage()>=C.Ironfur:Cost()+1 and not K and(g:BuffUp(C.IncarnationBuff)or g:BuffUp(C.BerserkBuff))then if p(C.Ironfur,nil,nil)then M=192081;return"ironfur Zerk 1"end end;if C.Thrash:IsCastable()and i:IsInMeleeRange(8)and U and not select(8,GetInstanceInfo())==1698 then if p(C.Thrash)then M=77758;return"thrash bear 30"end end;if C.Moonfire:IsReady()then if A.CastCycle(C.Moonfire,P,aa,not i:IsSpellInRange(C.Moonfire))then return"moonfire bear 4"end end;if C.RavenousFrenzy:IsCastable()and q and i:IsInMeleeRange(8)then if p(C.RavenousFrenzy,nil,nil)then M=323546;return"ravenous_frenzy bear 7"end end;if D.Jotungeirr:IsEquippedAndReady()and V==2 and i:IsInMeleeRange(8)then if p(D.Jotungeirr,nil,nil)then M=16;return"jotungeirr_destinys_call bear 8"end end;if V==2 and o()and i:IsInMeleeRange(8)then local an=g:GetUseableTrinkets(E)if an then if p(an,nil,nil)then if an:ID()==TopTrinketID then M=24;return"top trinket 1"elseif an:ID()==BotTrinketID then M=30;return"top trinket 2"end end end end;if B.Commons.Enabled.Potions and t and i:IsInMeleeRange(8)and D.PotionofPhantomFire:IsReady()and(V==2 and g:BuffRemains(C.IncarnationBuff)>=23 and g:BuffRemains(C.IncarnationBuff)<=26)then if p(D.PotionofPhantomFire,nil,nil)then M=50;return"potion bear 11"end end;if C.ConvoketheSpirits:IsCastable()and q and i:IsInMeleeRange(8)then if p(C.ConvoketheSpirits,nil,nil,not i:IsInMeleeRange(5))then M=323764;return"convoke_the_spirits bear 12"end end;if C.Berserk:IsCastable()and not w and i:IsInMeleeRange(8)and o()and(J or i:IsDummy()or i:NPCID()==153285)and(g:BuffUp(C.RavenousFrenzyBuff)or V~=2)then if p(C.Berserk,nil)then M=50334;return"berserk bear 13"end end;if C.Incarnation:IsCastable()and not w and i:IsInMeleeRange(8)and o()and(J or i:IsDummy()or i:NPCID()==153285)and(g:BuffUp(C.RavenousFrenzyBuff)or V~=2)then if p(C.Incarnation,nil)then M=102558;return"incarnation bear 14"end end;if C.Berserking:IsCastable()and i:IsInMeleeRange(8)and(g:BuffUp(C.BerserkBuff)or g:BuffUp(C.IncarnationBuff))then if p(C.Berserking,nil)then M=26297;return"berserking bear 15"end end;if C.Barkskin:IsCastable()and(J or i:IsDummy()or i:NPCID()==153285)and not B.Guardian.UseBarkskinDefensively and C.Brambles:IsAvailable()and select(8,GetInstanceInfo())~=1698 then if p(C.Barkskin,nil,nil)then M=22812;return"barkskin bear 17"end end;if C.AdaptiveSwarm:IsCastable()and i:IsInMeleeRange(8)and q and(i:DebuffDown(C.AdaptiveSwarmDebuff)and not C.AdaptiveSwarm:InFlight()and(i:DebuffDown(C.AdaptiveSwarmDebuff)or g:BuffRemains(C.AdaptiveSwarmHeal)>3)or i:DebuffStack(C.AdaptiveSwarmDebuff)<3 and i:DebuffRemains(C.AdaptiveSwarmDebuff)<5 and i:DebuffUp(C.AdaptiveSwarmDebuff))then if p(C.AdaptiveSwarm,nil,nil,not i:IsSpellInRange(C.AdaptiveSwarm))then M=325727;return"adaptive_swarm bear 18"end end;if C.Moonfire:IsReady()and(g:BuffUp(C.GalacticGuardianBuff)and Q<3)then if p(C.Moonfire,nil,nil,not i:IsSpellInRange(C.Moonfire))then M=8921;return"moonfire bear 19"end end;if C.Thrash:IsCastable()and i:IsInMeleeRange(8)and(i:DebuffRefreshable(C.ThrashDebuff)or i:DebuffStack(C.ThrashDebuff)<3 or i:DebuffStack(C.ThrashDebuff)<4 and R or Q<=4)then if p(C.Thrash)then M=77758;return"thrash bear 20"end end;if C.Fleshcraft:IsCastable()and q and(C.PustuleEruption:SoulbindEnabled()and(C.Thrash:CooldownRemains()>0 and C.Mangle:CooldownRemains()>0 and i:DebuffRemains(C.MoonfireDebuff)>=3 and(g:BuffDown(C.IncarnationBuff)and g:BuffDown(C.BerserkBuff)and g:BuffDown(C.GalacticGuardianBuff)))or C.VolatileSolvent:SoulbindEnabled())then if p(C.Fleshcraft,nil,nil)then M=324631;return"fleshcraft bear 27"end end;if C.Swipe:IsCastable()and i:IsInMeleeRange(8)and(g:BuffDown(C.IncarnationBuff)and g:BuffDown(C.BerserkBuff)and Q>=4)then if p(C.Swipe,nil,nil,not i:IsInMeleeRange(8))then M=213771;return"swipe bear 28"end end;if C.Maul:IsReady()and i:IsInMeleeRange(8)and K and not y and(g:BuffUp(C.IncarnationBuff)and Q<3 and g:BuffStack(C.ToothandClawBuff)>=2 or g:BuffUp(C.ToothandClawBuff)and g:BuffRemains(C.ToothandClawBuff)<1.5 or g:BuffStack(C.SavageCombatantBuff)>=3 or g:BuffUp(C.BerserkBuff)and Q<3)then if p(C.Maul,nil,nil,not i:IsInMeleeRange(5))then M=6807;return"maul bear 30"end end;if C.Maul:IsReady()and i:IsInMeleeRange(8)and K and not y and(g:BuffStack(C.SavageCombatantBuff)>=1 and g:BuffUp(C.ToothandClawBuff)and g:BuffUp(C.IncarnationBuff)and Q==2)then if p(C.Maul,nil,nil,not i:IsInMeleeRange(5))then M=6807;return"maul bear 32"end end;if C.Mangle:IsCastable()and i:IsInMeleeRange(8)and(g:BuffUp(C.IncarnationBuff)and Q<=3)then if p(C.Mangle,nil,nil,not i:IsInMeleeRange(5))then M=33917;return"mangle bear 34"end end;if C.Maul:IsReady()and i:IsInMeleeRange(8)and K and not y and((g:BuffStack(C.ToothandClawBuff)>=2 or g:BuffUp(C.ToothandClawBuff)and g:BuffRemains(C.ToothandClawBuff)<1.5 or g:BuffStack(C.SavageCombatantBuff)>=3)and Q<3)then if p(C.Maul,nil,nil,not i:IsInMeleeRange(5))then M=6807;return"maul bear 36"end end;if C.Thrash:IsCastable()and i:IsInMeleeRange(8)and Q>1 then if p(C.Thrash,nil,nil,not i:IsInMeleeRange(8))then M=77758;return"thrash bear 38"end end;if C.Mangle:IsCastable()and i:IsInMeleeRange(8)and(g:Rage()<90 and Q<3 or g:Rage()<85 and Q<3 and C.SouloftheForest:IsAvailable())then if p(C.Mangle,nil,nil,not i:IsInMeleeRange(5))then M=33917;return"mangle bear 40"end end;if C.Pulverize:IsReady()and i:IsInMeleeRange(8)then if A.CastCycle(C.Pulverize,P,af,not i:IsInMeleeRange(5))then return"pulverize bear 42"end end;if C.Thrash:IsCastable()and i:IsInMeleeRange(8)then if p(C.Thrash,nil,nil,not i:IsInMeleeRange(8))then M=77758;return"thrash bear 44"end end;if C.Maul:IsReady()and i:IsInMeleeRange(8)and K and not y and Q<3 then if p(C.Maul,nil,nil,not i:IsInMeleeRange(5))then M=6807;return"maul bear 46"end end;if C.Swipe:IsCastable()and i:IsInMeleeRange(8)then if p(C.Swipe,nil,nil,not i:IsInMeleeRange(8))then M=213771;return"swipe bear 48"end end end;local function ao()if C.CatForm:IsCastable()and g:BuffDown(C.CatForm)then if p(C.CatForm)then M=768;return"cat_form cat 2"end end;if C.Rake:IsCastable()and g:BuffUp(C.Prowl)then if p(C.Rake)then M=1822;return"Rake cat 2"end end;if C.HeartoftheWild:IsCastable()and C.HeartoftheWild:IsAvailable()and g:BuffDown(C.HeartoftheWild)and o()then if p(C.HeartoftheWild)then M=319454;return"HOTW cat 2"end end;if C.Rake:IsCastable()and(i:DebuffRefreshable(C.RakeDebuff)or g:Energy()<45)then if p(C.Rake)then M=1822;return"Rake cat 3"end end;if C.Rip:IsCastable()and i:DebuffRefreshable(C.Rip)and g:ComboPoints()>=1 then if p(C.Rip)then M=1079;return"Rip cat 2"end end;if C.ConvoketheSpirits:IsCastable()then if p(C.ConvoketheSpirits)then M=323764;return"Convoke cat 2"end end;if C.FerociousBite:IsCastable()and g:ComboPoints()>=4 and g:Energy()>50 then if p(C.FerociousBite)then M=22568;return"FB cat 2"end end;if C.AdaptiveSwarm:IsCastable()and q and(i:DebuffDown(C.AdaptiveSwarmDebuff)and not C.AdaptiveSwarm:InFlight()or i:DebuffStack(C.AdaptiveSwarmDebuff)<3 and i:DebuffRemains(C.AdaptiveSwarmDebuff)<5 and i:DebuffUp(C.AdaptiveSwarmDebuff))then if p(C.AdaptiveSwarm)then M=325727;return"Adaptive Swarm cat 2"end end;if C.Fleshcraft:IsCastable()and q and not g:IsMoving()and(C.PustuleEruption:SoulbindEnabled()and g:Energy()<35 or C.VolatileSolvent:SoulbindEnabled())then if p(C.Fleshcraft,nil,nil)then M=324631;return"fleshcraft precombat 3"end end;if true then if p(C.Swipe)then M=213771;return"Swipe cat 2"end end end;local function ap()if C.MoonkinForm:IsCastable()and g:BuffDown(C.MoonkinForm)then if p(C.MoonkinForm)then M=197625;return"owl_form owl 2"end end;if C.HeartoftheWild:IsCastable()and o()and C.HeartoftheWild:IsAvailable()and g:BuffDown(C.HeartoftheWild)then if p(C.HeartoftheWild)then M=319454;return"HOTW owl 2"end end;if C.Starsurge:IsCastable()and not g:IsMoving()then if p(C.Starsurge)then M=197626;return"Starsurge owl 2"end end;if C.ConvoketheSpirits:IsCastable()and q and C.FirstStrike:SoulbindEnabled()then if p(C.ConvoketheSpirits)then M=323764;return"Convoke owl 2"end end;if C.AdaptiveSwarm:IsCastable()and q and(i:DebuffDown(C.AdaptiveSwarmDebuff)and not C.AdaptiveSwarm:InFlight()or i:DebuffStack(C.AdaptiveSwarmDebuff)<3 and i:DebuffRemains(C.AdaptiveSwarmDebuff)<5 and i:DebuffUp(C.AdaptiveSwarmDebuff))then if p(C.AdaptiveSwarm)then M=325727;return"Adaptive Swarm cat 2"end end;if C.Sunfire:IsCastable()and i:DebuffRefreshable(C.SunfireDebuff)then if p(C.Sunfire)then M=197630;return"Sunfire owl 2"end end;if C.Sunfire:IsCastable()then if A.CastCycle(C.Sunfire,Enemies40y,ad,not i:IsSpellInRange(C.Sunfire))then return"Sunfire Owl 3"end end;if C.Moonfire:IsCastable()and(i:DebuffRefreshable(C.MoonfireDebuff)or g:BuffUp(C.GalacticGuardianBuff))then if p(C.Moonfire)then M=8921;return"Moonfire owl 2"end end;if C.Starfire:IsCastable()and EclipseAnyNext and V==3 and not g:IsMoving()then if p(C.Starfire)then M=197628;return"Starfire owl 2"end end;if C.Wrath:IsCastable()and EclipseAnyNext and V~=3 and not g:IsMoving()then if p(C.Wrath)then M=5176;return"Wrath owl 2"end end;if C.ConvoketheSpirits:IsCastable()and q and(g:BuffUp(C.EclipseLunar)or g:BuffUp(C.EclipseSolar))then if p(C.ConvoketheSpirits)then M=323764;return"Convoke owl 2"end end;if C.Starfire:IsCastable()and not g:IsMoving()and(EclipseInLunar or EclipseSolarNext or EclipseInLunar and g:BuffUp(C.EclipseLunar)and C.Starsurge:TimeSinceLastCast()<14)then if p(C.Starfire)then M=197628;return"Starfire owl 2"end end;if C.Wrath:IsCastable()and not g:IsMoving()then if p(C.Wrath)then M=5176;return"Wrath owl 2"end end;if C.Moonfire:IsCastable()and g:IsMoving()then if p(C.Moonfire)then M=8921;return"Moonfire owl 2"end end end;local function aq()s=HeroRotationCharDB.Toggles[6]q=HeroRotationCharDB.Toggles[4]and select(8,GetInstanceInfo())~=1698;r=HeroRotationCharDB.Toggles[5]u=HeroRotationCharDB.Toggles[12]t=not HeroRotationCharDB.Toggles[15]v=HeroRotationCharDB.Toggles[70]w=HeroRotationCharDB.Toggles[71]x=HeroRotationCharDB.Toggles[72]y=false end;local function ar()EclipseInAny=g:BuffUp(C.EclipseSolar)or g:BuffUp(C.EclipseLunar)EclipseInBoth=g:BuffUp(C.EclipseSolar)and g:BuffUp(C.EclipseLunar)EclipseInLunar=g:BuffUp(C.EclipseLunar)and g:BuffDown(C.EclipseSolar)EclipseInSolar=g:BuffUp(C.EclipseSolar)and g:BuffDown(C.EclipseLunar)EclipseLunarNext=not EclipseInAny and(C.Starfire:Count()==0 and C.Wrath:Count()>0 or g:IsCasting(C.Wrath))or EclipseInSolar;EclipseSolarNext=not EclipseInAny and(C.Wrath:Count()==0 and C.Starfire:Count()>0 or g:IsCasting(C.Starfire))or EclipseInLunar;EclipseAnyNext=not EclipseInAny and C.Wrath:Count()>0 and C.Starfire:Count()>0 end;local function as()if n()then P=g:GetEnemiesInMeleeRange(8)Q=#P;O=g:GetEnemiesInMeleeRange(5)Enemies40y=g:GetEnemiesInRange(40)else P=g:GetEnemiesInMeleeRange(8)if#P>=1 then Q=1 else Q=0 end;O=g:GetEnemiesInMeleeRange(5)end;TopTrinketID,_=GetInventoryItemID("player",13)BotTrinketID,_=GetInventoryItemID("player",14)I=g:ActiveMitigationNeeded()J=g:IsTankingAoE(8)or g:IsTanking(i)UnitsCastinNetherStormCount=Z(P)UnitsCastinNetherStormCount2=a4(P)UnitsCastinNetherStormCount3=a6(P)MTNegligableMeleeCount=a8(P)if n()then if MTNegligableMeleeCount>0 then Q=Q-MTNegligableMeleeCount end end;K=false;if not B.Guardian.UseRageDefensively or B.Guardian.UseRageDefensively and(not J or i:IsDummy()or i:NPCID()==153285 or g:RageDeficit()<=10)then K=true end;if not BotOn then L=0;M=0 end;if L>0 then L=0 end;if M>0 then M=0 end;ShouldReturn=aq()ar()if m.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+m.GUISettings.General.OpenerReset elseif m.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)m.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if g:IsChanneling(C.ConvoketheSpirits)then if p(C.Pool,nil)then M=99999;return"channeling 4"end end;if A.TargetIsValid()then if select(8,GetInstanceInfo())==1698 then if UnitsCastinNetherStormCount>0 and j(99):IsReady()and g:BuffUp(C.BearForm)then if p(j(99),nil)then M=99;return"Shout Interrupt MT 1"end end;if UnitsCastinNetherStormCount2>0 and j(99):IsReady()and g:BuffUp(C.BearForm)then if p(C.Pool,nil)then M=99999;return"Pool for Shout Interrupt MT 1"end end;if UnitsCastinNetherStormCount3>0 and C.Barkskin:IsReady()and f("boss1"):NPCID()==117933 and f("boss1"):TimeToDie()>60 then if p(C.Barkskin,nil,nil)then M=22812;return"barkskin defensive MT 6"end end;if i:IsInRange(28)and not i:IsInRange(8)and C.WildCharge:IsReady()and g:BuffUp(C.BearForm)and f("target"):NPCID()~=117933 and f("target"):NPCID()~=118032 then if p(j(102401),nil)then M=102401;return"Wild Charge Back"end end;if true then local ShouldReturn=ag()if ShouldReturn then return ShouldReturn end end;if(select(8,UnitChannelInfo("target"))==234676 or select(9,UnitCastingInfo("target"))==234676)and f("target"):IsInRange(20)then if g:BuffUp(C.BearForm)or g:BuffUp(C.CatForm)then if p(j(106839),nil)then M=11106839;return"interrupt boss MT"end else if p(C.BearForm,nil)then M=5487;return"Bear for interrupt"end end end;if f("boss1"):NPCID()==117933 then if(select(8,UnitChannelInfo("boss1"))==234423 or select(9,UnitCastingInfo("boss1"))==234423)and f("boss1"):IsInRange(20)then if g:BuffUp(C.MoonkinForm)and j(132469):CooldownRemains()<=0 and UnitsCastinNetherStormCount2==0 and UnitsCastinNetherStormCount==0 then if p(j(132469),nil)then M=132469;return"typhoon interrupt boss MT"end elseif g:BuffUp(C.BearForm)or g:BuffUp(C.CatForm)then if p(j(106839),nil)then M=11106839;return"interrupt boss MT"end elseif(not g:BuffUp(C.BearForm)or g:BuffUp(C.CatForm))and j(132469):CooldownRemains()>=0 then if p(C.BearForm,nil)then M=5487;return"Bear for interrupt"end end end;if C.Moonfire:IsReady()then if A.CastCycle(C.Moonfire,g:GetEnemiesInMeleeRange(40),ac,not i:IsSpellInRange(C.Moonfire))then return"moonfire MT 4"end end;if Q==0 then if g:BuffUp(C.MoonkinForm)then if(g:HealthPercentage()<B.Guardian2.MTRegrowth-20 and not g:IsCasting(j(8936))or g:HealthPercentage()<B.Guardian2.MTRegrowth-20)and j(8936):IsReady()and not g:IsMoving()then if p(j(8936),nil)then M=8936;return"Regrowth phase 1"end elseif true then local ShouldReturn=ap()if ShouldReturn then return ShouldReturn end end else if p(C.MoonkinForm,nil)then M=197625;return"Moonkin phase 1"end end else if UnitsCastinNetherStormCount>0 and j(99):IsCastable()and g:BuffUp(C.BearForm)then if p(j(99),nil)then M=99;return"Shout Interrupt MT 1"end elseif g:BuffUp(C.BearForm)then local ShouldReturn=am()if ShouldReturn then return ShouldReturn end elseif g:BuffDown(C.BearForm)then if p(C.BearForm,nil)then M=5487;return"Bear for melee"end end end end;if f("boss1"):NPCID()==117198 then if(select(8,UnitChannelInfo("boss1"))==234676 or select(9,UnitCastingInfo("boss1"))==234676)and f("boss1"):IsInRange(20)then if(g:BuffUp(C.BearForm)or g:BuffUp(C.CatForm))and j(106839):CooldownRemains()<=0 then if p(j(106839),nil)then M=11106839;return"interrupt boss MT"end elseif g:BuffUp(C.BearForm)and j(132469):CooldownRemains()<=0 then if p(j(132469),nil)then M=132469;return"interrupt boss MT"end elseif not g:BuffUp(C.BearForm)then if p(C.BearForm,nil)then M=5487;return"Bear for interrupt"end end end;if(select(8,UnitChannelInfo("boss1"))==236572 or select(9,UnitCastingInfo("boss1"))==236572)and f("boss1"):IsInRange(8)and j(5211):IsAvailable()and j(5211):IsReady()then if p(j(5211),nil)then M=5211;return"interrupt boss bash MT"end end;if select(8,UnitChannelInfo("boss1"))==236572 and g:BuffUp(C.BearForm)then if g:DebuffStack(j(236572))>=0 and C.Ironfur:IsCastable()and(g:Rage()>=C.Ironfur:Cost()+1 and(g:BuffDown(C.IronfurBuff)or g:BuffStack(C.IronfurBuff)<2 and g:BuffRefreshable(C.Ironfur)or g:Rage()>=90))then if p(C.Ironfur,nil,nil)then M=192081;return"ironfur defensive 4"end elseif g:DebuffStack(j(236572))>=1 and C.Barkskin:IsCastable()then if p(C.Barkskin,nil,nil)then M=22812;return"barkskin defensive 6"end elseif g:DebuffStack(j(236572))>=2 and C.SurvivalInstincts:IsCastable()then if p(C.SurvivalInstincts,nil,nil)then M=61336;return"survival_instincts defensive 8"end end end;if C.Moonfire:IsReady()then if A.CastCycle(C.Moonfire,g:GetEnemiesInMeleeRange(40),ac,not i:IsSpellInRange(C.Moonfire))then return"moonfire MT 4"end end;if Q>=0 then if UnitsCastinNetherStormCount>0 and j(99):IsCastable()and g:BuffUp(C.BearForm)then if p(j(99),nil)then M=99;return"Shout Interrupt MT 1"end elseif g:BuffUp(C.BearForm)then local ShouldReturn=am()if ShouldReturn then return ShouldReturn end elseif g:BuffDown(C.BearForm)then if p(C.BearForm,nil)then M=5487;return"Bear for melee"end end end end end;if not g:AffectingCombat()and s then local ShouldReturn=ah()if ShouldReturn then return ShouldReturn end end;if not UnitIsEnemy("player","mouseover")and UnitIsDead("mouseover")then if C.Rebirth:IsCastable()and(g:Rage()>=30 and g:BuffUp(C.BearForm)or g:BuffDown(C.BearForm)and not g:IsMoving())then if p(C.Rebirth,nil)then M=20484;return"Rebirth MO"end elseif C.Rebirth:CooldownRemains(BypassRecovery)<=0 and(g:Rage()<30 and g:BuffUp(C.BearForm))then y=true end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if C.Moonfire:IsCastable()then if p(C.Moonfire,nil)then L=18921;return"explosive MO SWD"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if C.Moonfire:IsCastable()then if p(C.Moonfire,nil)then M=8921;return"explosive  SWD"end end end;z={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}if UnitExists("target")and C.Soothe:IsCastable()then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for at=0,40 do local _,_,au,av,_,_,_,_,_,aw=UnitBuff("target",at)for _,ax in pairs(z)do if ax==aw then if p(C.Soothe,nil)then M=2908;return"Southe Enrage"end end end end end end;if UnitExists("mouseover")and C.Soothe:IsCastable()then if UnitCanAttack("player","mouseover")and UnitAffectingCombat("mouseover")and UnitIsDead("mouseover")~=true then for at=0,40 do local _,_,au,av,_,_,_,_,_,aw=UnitBuff("mouseover",at)for _,ax in pairs(z)do if ax==aw then if p(C.Soothe,nil)then L=12908;return"Southe Enrage mouseover"end end end end end end;for at=0,40 do local _,_,au,av,_,_,_,_,_,aw=UnitDebuff("mouseover",at)if C.RemoveCorruption:IsCastable()and UnitIsDead("mouseover")~=true and UnitCanAttack("player","mouseover")~=true and IsItemInRange(34471,"mouseover")and(av=="Poison"or av=="Curse")then if p(C.RemoveCorruption,nil)then M=2782;return"Remove Corruption MO"end end end;if(J or i:IsDummy()or i:NPCID()==153285)and g:BuffUp(C.BearForm)then local ShouldReturn=ag()if ShouldReturn then return ShouldReturn end end;if D.Jotungeirr:IsEquippedAndReady()and V~=2 and o()then if p(D.Jotungeirr,nil,nil)then M=16;return"jotungeirr_destinys_call main"end end;if V~=2 and o()then local an=g:GetUseableTrinkets(E)if an then if p(an,nil,nil)then if an:ID()==TopTrinketID then M=24;return"top trinket 1"elseif an:ID()==BotTrinketID then M=30;return"top trinket 2"end end end end;if B.Commons.Enabled.Potions and t and D.PotionofPhantomFire:IsReady()and(V~=2 and(g:BuffUp(C.BerserkBuff)or g:BuffUp(C.Incarnation)))then if p(D.PotionofPhantomFire,nil,nil)then M=50;return"potion main"end end;if v and C.FeralAffinity:IsAvailable()and V~=2 and g:BuffDown(C.IncarnationBuff)and(C.Thrash:CooldownRemains()>0 and C.Mangle:CooldownRemains()>0 and i:DebuffRemains(C.MoonfireDebuff)>=g:GCD()+0.5 and g:Rage()<40 and g:BuffDown(C.IncarnationBuff)and g:BuffDown(C.BerserkBuff)and g:BuffDown(C.GalacticGuardianBuff)or g:BuffUp(C.CatForm)and g:Energy()>25 or i:DebuffRefreshable(C.RakeDebuff)and i:DebuffRefreshable(C.Rip)or S and g:BuffDown(C.OathofElderDruidBuff)and(g:BuffUp(C.CatForm)and g:Energy()>20)and g:BuffRemins(C.HeartoftheWild)<=10 or V==1 and C.EmpowerBond:CooldownRemains()<=1 and Q<2 or g:BuffUp(C.HeartoftheWild)and g:Energy()>90)then local ShouldReturn=ao()if ShouldReturn then return ShouldReturn end end;if v and C.FeralAffinity:IsAvailable()and V==2 and(C.Thrash:CooldownRemains()>0 and C.Mangle:CooldownRemains()>0 and i:DebuffRemains(C.MoonfireDebuff)>=g:GCD()+0.5 and g:Rage()<40 and g:BuffDown(C.IncarnationBuff)and g:BuffDown(C.BerserkBuff)and g:BuffDown(C.GalacticGuardianBuff)or g:BuffUp(C.CatForm)and g:Energy()>25 or i:DebuffRefreshable(C.RakeDebuff)and i:DebuffRefreshable(C.Rip)and g:Rage()<40 and g:BuffDown(C.IncarnationBuff)and g:BuffDown(C.BerserkBuff)and g:BuffDown(C.GalacticGuardianBuff))then local ShouldReturn=ao()if ShouldReturn then return ShouldReturn end end;if v and C.BalanceAffinity:IsAvailable()and(C.Thrash:CooldownRemains()>0 and C.Mangle:CooldownRemains()>0 and g:Rage()<15 and g:BuffDown(C.IncarnationBuff)and g:BuffDown(C.BerserkBuff)and g:BuffDown(C.GalacticGuardianBuff)or g:BuffUp(C.MoonkinForm)and i:DebuffRefreshable(C.SunfireDebuff)or g:BuffUp(C.MoonkinForm)and g:BuffUp(C.HeartoftheWild)or S and g:BuffDown(C.OathofElderDruidBuff)or V==3 and C.ConvoketheSpirits:CooldownRemains()<=1 or V==1 and C.EmpowerBond:CooldownRemains()<=1 and Q<2)then local ShouldReturn=ap()if ShouldReturn then return ShouldReturn end end;if v and(T and C.BalanceAffinity:IsAvailable()and g:BuffUp(C.LycarasFleetingGlimpse)and g:BuffRemains(C.LycarasFleetingGlimpse)<=2)then local ShouldReturn=ai()if ShouldReturn then return ShouldReturn end end;if v and(T and C.FeralAffinity:IsAvailable()and g:BuffUp(C.LycarasFleetingGlimpse)and g:BuffRemains(C.LycarasFleetingGlimpse)<=2)then local ShouldReturn=aj()if ShouldReturn then return ShouldReturn end end;if B.Guardian.SwapForConvoke and q and(C.BalanceAffinity:IsAvailable()and not v and(V==3 and C.ConvoketheSpirits:CooldownRemains()<=1))then local ShouldReturn=ak()if ShouldReturn then return ShouldReturn end end;if B.Guardian.SwapForConvoke and q and(C.FeralAffinity:IsAvailable()and not v and(V==3 and C.ConvoketheSpirits:CooldownRemains()<=1))then local ShouldReturn=al()if ShouldReturn then return ShouldReturn end end;if true then local ShouldReturn=am()if ShouldReturn then return ShouldReturn end end;if true then if m.CastAnnotated(C.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end end;local function ay()end;function ReturnSpell()if M==0 then return 0 else return M end end;function ReturnSpellMO()if L==0 then return 0 else return L end end;m.SetAPL(104,as,ay)