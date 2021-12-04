local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.MultiSpell;local k=d.Item;local l=d.Utils.BoolToInt;local m=HeroRotation;local n=m.AoEON;local o=m.CDsON;local p=HeroRotationCharDB.Toggles[4]local q=HeroRotationCharDB.Toggles[5]local r=HeroRotationCharDB.Toggles[6]local s=HeroRotationCharDB.Toggles[12]local t=HeroRotationCharDB.Toggles[15]local u=HeroRotationCharDB.Toggles[20]local v=HeroRotationCharDB.Toggles[21]local w=HeroRotationCharDB.Toggles[22]local x=HeroRotationCharDB.Toggles[23]local y=HeroRotationCharDB.Toggles[24]local z=HeroRotationCharDB.Toggles[25]local A=HeroRotationCharDB.Toggles[26]local B=HeroRotationCharDB.Toggles[27]local C=HeroRotationCharDB.Toggles[28]local D=HeroRotationCharDB.Toggles[29]local E={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}local F=nil;local G=nil;local H=false;local I=false;local J=false;local K=false;local L=false;local M=true;local N=GetInventoryItemID("player",13)local O=GetInventoryItemID("player",14)local pairs=pairs;local P=table.insert;local Q=math.min;local R=math.max;local S=math.abs;local T=m.Commons.Everyone;local U=m.Commons.Rogue;local V=i.Rogue.Subtlety;local W=k.Rogue.Subtlety;local X={W.MistcallerOcarina:ID()}local Y,Z,_,a0;local a1;local a2=U.ReturnSpell()local a3=U.ReturnSpellMO()local a4,a5,a6;local a7,a8;local a9,aa;local ab,ac,ad;local ae;local af=g:HasLegendaryEquipped(129)local ag=g:HasLegendaryEquipped(116)local ah=g:HasLegendaryEquipped(127)local ai=g:HasLegendaryEquipped(117)local aj=g:HasLegendaryEquipped(126)local ak=g:HasLegendaryEquipped(229)local al=g:HasLegendaryEquipped(231)d:RegisterForEvent(function()af=g:HasLegendaryEquipped(129)ag=g:HasLegendaryEquipped(116)ah=g:HasLegendaryEquipped(127)ai=g:HasLegendaryEquipped(117)aj=g:HasLegendaryEquipped(126)ak=g:HasLegendaryEquipped(229)al=g:HasLegendaryEquipped(231)end,"PLAYER_EQUIPMENT_CHANGED")V.Eviscerate:RegisterDamageFormula(function()return g:AttackPowerDamageMod()*ab*0.176*1.21*(V.Nightstalker:IsAvailable()and g:StealthUp(true,false)and 1.12 or 1)*(V.DeeperStratagem:IsAvailable()and 1.05 or 1)*(V.DarkShadow:IsAvailable()and g:BuffUp(V.ShadowDanceBuff)and 1.3 or 1)*(not V.DarkShadow:IsAvailable()and g:BuffUp(V.ShadowDanceBuff)and 1.15 or 1)*(g:BuffUp(V.SymbolsofDeath)and 1.15 or 1)*(g:BuffUp(V.FinalityEviscerate)and 1.25 or 1)*(1+g:MasteryPct()/100)*(1+g:VersatilityDmgPct()/100)*(h:DebuffUp(V.FindWeaknessDebuff)and 1.5 or 1)*(h:DebuffUp(V.SinfulRevelationDebuff)and 1.06 or 1)end)V.Rupture:RegisterPMultiplier(function()return V.Nightstalker:IsAvailable()and g:StealthUp(true,false)and 1.12 or 1 end)local am={General=m.GUISettings.General,Commons=m.GUISettings.APL.Rogue.Commons,Subtlety=m.GUISettings.APL.Rogue.Subtlety}local function an(ao,EnergyThreshold)if not a4 then a4=ao;a5=EnergyThreshold or 0 end end;local function ap(ao)if not a6 then a6=ao end end;local function aq()if am.Subtlety.BurnShadowDance=="On Bosses not in Dungeons"and g:IsInDungeonArea()then return false elseif am.Subtlety.BurnShadowDance~="Always"and not h:IsInBossList()then return false else return true end end;local function ar()if _<2 then return false elseif am.Commons.UsePriorityRotation=="Always"then return true elseif am.Commons.UsePriorityRotation=="On Bosses"and h:IsInBossList()then return true elseif am.Commons.UsePriorityRotation=="Auto"then if g:InstanceDifficulty()==16 and h:NPCID()==138967 then return true elseif h:NPCID()==166969 or h:NPCID()==166971 or h:NPCID()==166970 then return true end end;return false end;local function as(at,au,av,aw)local ax,ay=nil,av;local az=h:GUID()for aA,aB in pairs(aw)do if aB:GUID()~=az and T.UnitIsCycleValid(aB,ay,-aB:DebuffRemains(at))and au(aB)then ax,ay=aB,aB:TimeToDie()end end;if ax then m.CastLeftNameplate(ax,at)if ax:GUID()==f("mouseover"):GUID()and am.Subtlety.TargetSwap=="Mouseover"then if at==V.Rupture then a3=11943 elseif at==V.SerratedBoneSpike then a3=1328547 end elseif am.Subtlety.TargetSwap=="AutoSwap"and ax:GUID()~=h:GUID()and not s then a3=9999 end elseif am.Commons.RangedMultiDoT then ax,ay=nil,av;for aA,aB in pairs(Z)do if aB:GUID()~=az and T.UnitIsCycleValid(aB,ay,-aB:DebuffRemains(at))and au(aB)then ax,ay=aB,aB:TimeToDie()end end;if ax then m.CastLeftNameplate(ax,at)if ax:GUID()==f("mouseover"):GUID()and am.Subtlety.TargetSwap=="Mouseover"then if at==V.Rupture then a3=11943 elseif at==V.SerratedBoneSpike then a3=1328547 end elseif am.Subtlety.TargetSwap=="AutoSwap"and ax:GUID()~=h:GUID()and not s then a3=9999 end end end end;local function aC(aD)if aD then return 1 else return 0 end end;local function aE()return 25+aC(V.Vigor:IsAvailable())*20+aC(V.MasterofShadows:IsAvailable())*20+aC(V.ShadowFocus:IsAvailable())*25+aC(V.Alacrity:IsAvailable())*20+aC(_>=4)*25 end;local function aF()return V.ShadowDance:ChargesFractional()>=1.75 end;local function aG()if ae and _>=4 then return ad<=1 elseif g:Covenant()=="Kyrian"then return ad>=3 else return ad>=2+aC(g:BuffUp(V.ShadowBlades))end end;local function aH()return g:BuffUp(V.SliceandDice)or _>=6 end;local function aI(aJ)return U.MasterAssassinsMarkRemains()>0 or not V.Nightstalker:IsAvailable()and V.DarkShadow:IsAvailable()and aJ or _>=5-l(aj)end;local function aK(aL,StealthSpell)local aJ=g:BuffUp(V.ShadowDanceBuff)or StealthSpell and StealthSpell:ID()==V.ShadowDance:ID()if V.SliceandDice:IsCastable()and d.FilteredFightRemains(Z,">",g:BuffRemains(V.SliceandDice))then if V.Premeditation:IsAvailable()and _<5-aC(g:Covenant()=="Necrolord")and g:Covenant()~="Kyrian"then if V.ShadowDance:ChargesFractional()<1.75 and(g:BuffRemains(V.SliceandDice)<V.SymbolsofDeath:CooldownRemains()or not K)and(V.ShadowDance:Charges()>=1 and g:BuffRemains(V.SymbolsofDeath)-g:BuffRemains(V.ShadowDanceBuff)<1.2)then if aL then return V.SliceandDice else if V.SliceandDice:IsReady()and m.Cast(V.SliceandDice)then a2=5171;return"Cast Slice and Dice (Premed)"end end end else if _<6 and not aJ and g:BuffRemains(V.SliceandDice)<1+ab*1.8 then if aL then return V.SliceandDice else if V.SliceandDice:IsReady()and m.Cast(V.SliceandDice)then a2=5171;return"Cast Slice and Dice"end end end end end;local aM=aI(aJ)if(not aM or ae)and V.Rupture:IsCastable()then if h:IsInMeleeRange(5)and(h:FilteredTimeToDie(">",6,-h:DebuffRemains(V.Rupture))or h:TimeToDieIsNotValid())and U.CanDoTUnit(h,aa)and h:DebuffRefreshable(V.Rupture,a9)then if aL then return V.Rupture else if V.Rupture:IsReady()and m.Cast(V.Rupture)then a2=1943;return"Cast Rupture 1"end end end end;if V.SecretTechnique:IsReady()then if aL then return V.SecretTechnique else if m.Cast(V.SecretTechnique)then a2=280719;return"Cast Secret Technique"end end end;if not aM and V.Rupture:IsCastable()then if not aL and m.AoEON()and not ae and _>=2 then local function aN(aO)return T.CanDoTUnit(aO,aa)and aO:DebuffRefreshable(V.Rupture,a9)end;as(V.Rupture,aN,5+2*ab,a0)end;if h:IsInMeleeRange(5)and h:DebuffRemains(V.Rupture)<V.SymbolsofDeath:CooldownRemains()+10 and(V.SymbolsofDeath:CooldownRemains()<=5 or not K)and U.CanDoTUnit(h,aa)and h:FilteredTimeToDie(">",5+V.SymbolsofDeath:CooldownRemains(),-h:DebuffRemains(V.Rupture))then if aL then return V.Rupture else if V.Rupture:IsReady()and m.Cast(V.Rupture)then a2=1943;return"Cast Rupture 2"end end end end;if V.BlackPowder:IsCastable()and not ae and _>=3 and not u then if aL then return V.BlackPowder else if V.BlackPowder:IsReady()and m.Cast(V.BlackPowder)then a2=319175;return"Cast Black Powder"end end end;if V.Eviscerate:IsCastable()and h:IsInMeleeRange(5)then if aL then return V.Eviscerate else if V.Eviscerate:IsReady()and m.Cast(V.Eviscerate)then a2=196819;return"Cast Eviscerate"end end end;return false end;local function aP(aL,StealthSpell)local aQ=g:BuffUp(a7)or StealthSpell and StealthSpell:ID()==a7:ID()local aR=g:BuffUp(a8)or StealthSpell and StealthSpell:ID()==V.Vanish:ID()local aJ=g:BuffUp(V.ShadowDanceBuff)or StealthSpell and StealthSpell:ID()==V.ShadowDance:ID()local aS=V.Shadowstrike:IsCastable()or aQ or aR or aJ;if aQ or aR then aS=aS and h:IsInRange(25)else aS=aS and h:IsInMeleeRange(5)end;if aS and h:IsInMeleeRange(am.Subtlety.ShadowStrikeRange)and(aQ or aR)and U.MasterAssassinsMarkRemains()==0 then if aL then return V.Shadowstrike else if m.Cast(V.Shadowstrike)then a2=185438;return"Cast Shadowstrike (Stealth)"end end end;if ab>=U.CPMaxSpend()then return aK()end;if g:BuffUp(V.ShurikenTornado)and ad<=2 then return aK()end;if _>=4 and ab>=4 then return aK()end;if ad<=1-aC(V.DeeperStratagem:IsAvailable()and aR)then return aK()end;if aS and h:IsInMeleeRange(am.Subtlety.ShadowStrikeRange)and not g:StealthUp(true,false)and g:BuffUp(V.SepsisBuff)and _<4 then if aL then return V.Shadowstrike else if m.Cast(V.Shadowstrike)then a2=185438;return"Cast Shadowstrike (Sepsis)"end end end;if V.Shiv:IsReady()and ag and V.Nightstalker:IsAvailable()and _<5 then if aL then return V.Shiv else if m.Cast(V.Shiv)then a2=5938;return"Cast Shiv (TTB NS)"end end end;if aS and h:IsInMeleeRange(am.Subtlety.ShadowStrikeRange)and ae and(h:DebuffRemains(V.FindWeaknessDebuff)<1 or V.Weaponmaster:IsAvailable()and _<=4)then if aL then return V.Shadowstrike else if m.Cast(V.Shadowstrike)then a2=185438;return"Cast Shadowstrike (Prio Rotation)"end end end;if m.AoEON()and V.ShurikenStorm:IsCastable()and _>=3+aC(g:BuffUp(V.TheRottenBuff)or ah)and(g:BuffUp(V.SymbolsofDeathCrit)or not g:BuffUp(V.PremeditationBuff)or _>=5)then if aL then return V.ShurikenStorm else if m.Cast(V.ShurikenStorm)then a2=197835;return"Cast Shuriken Storm"end end end;if aS and h:IsInMeleeRange(am.Subtlety.ShadowStrikeRange)and(h:DebuffRemains(V.FindWeaknessDebuff)<1 or V.SymbolsofDeath:CooldownRemains()<18 and K and h:DebuffRemains(V.FindWeaknessDebuff)<V.SymbolsofDeath:CooldownRemains())then if aL then return V.Shadowstrike else if m.Cast(V.Shadowstrike)then a2=185438;return"Cast Shadowstrike (FW Refresh)"end end end;if aS and h:IsInMeleeRange(am.Subtlety.ShadowStrikeRange)then if aL then return V.Shadowstrike else if m.Cast(V.Shadowstrike)then a2=185438;return"Cast Shadowstrike 2"end end end;return false end;local function aT(StealthSpell,EnergyThreshold)local aU=aP(true,StealthSpell)print(StealthSpell==V.Vanish,not am.Subtlety.StealthMacro.Vanish or not aU,am.Commons.VanishOffensive,J)if StealthSpell==V.Vanish and(not am.Subtlety.StealthMacro.Vanish or not aU)and am.Commons.VanishOffensive and J then print("here2")if m.Cast(V.Vanish,nil)then a2=1213;return"Cast Vanish"end;print("Here3")return false elseif StealthSpell==V.Shadowmeld and(not am.Subtlety.StealthMacro.Shadowmeld or not aU)then if m.Cast(V.Shadowmeld,nil)then a2=1214;return"Cast Shadowmeld"end;return false elseif StealthSpell==V.ShadowDance and(not am.Subtlety.StealthMacro.ShadowDance or not aU)and I then if m.Cast(V.ShadowDance,nil)then a2=1212;return"Cast Shadow Dance"end;return false end;local aV={StealthSpell,aU}if EnergyThreshold and g:EnergyPredicted()<EnergyThreshold then return false end;if aV[1]==V.ShadowDance and aV[2]==V.DeathfromAbove then a1=m.CastQueue(aV[2],aV[1])if a1 then return"| "..aV[1]:Name()end end;return false end;local function aW()if g:BuffUp(V.ShurikenTornado)then if V.SymbolsofDeath:IsCastable()and V.ShadowDance:IsCastable()and not g:BuffUp(V.SymbolsofDeath)and not g:BuffUp(V.ShadowDance)then if m.CastQueue(V.SymbolsofDeath,V.ShadowDance)then a2=800;return"Dance + Symbols (during Tornado)"end elseif V.SymbolsofDeath:IsCastable()and not g:BuffUp(V.SymbolsofDeath)and K then if m.Cast(V.SymbolsofDeath)then a2=212283;return"Cast Symbols of Death (during Tornado)"end elseif V.ShadowDance:IsCastable()and not g:BuffUp(V.ShadowDanceBuff)and I then if m.Cast(V.ShadowDance)then a2=185313;return"Cast Shadow Dance (during Tornado)"end end end;local aX=aH()if h:IsInMeleeRange(5)then if p and V.Flagellation:IsReady()and aX and not g:StealthUp(false,false)and(not ak or g:BuffUp(V.SymbolsofDeath)and ab>=5)then if m.Cast(V.Flagellation,nil,nil)then a2=323654;return"Cast Flrgrrlation"end end end;if J and V.Vanish:IsCastable()and not v and am.Commons.VanishOffensive and(ai and ad<=1-aC(V.DeeperStratagem:IsAvailable())or af)and g:BuffUp(V.SymbolsofDeath)and g:BuffUp(V.ShadowDanceBuff)and U.MasterAssassinsMarkRemains()==0 and not g:BuffUp(V.DeathlyShadowsBuff)then print("finally")if aT(V.Vanish,EnergyThreshold)then return"Vanish Macro"end end;if V.ShurikenTornado:IsCastable()and aX and V.SymbolsofDeath:CooldownUp()and V.ShadowDance:Charges()>=1 and L and(not ak or h:DebuffUp(V.Flagellation))and ab<=2 and(not g:BuffUp(V.PremeditationBuff)or _>4)then if g:Energy()>=60 and not D then if m.Cast(V.ShurikenTornado)then a2=277925;return"Cast Shuriken Tornado"end elseif not V.ShadowFocus:IsAvailable()and not D then if m.CastPooling(V.ShurikenTornado)then a2=1000;return"Pool for Shuriken Tornado"end end end;if V.SerratedBoneSpike:IsReady()and(aX or d.BossFilteredFightRemains("<=",5)and _<3)and not g:BuffUp(V.PremeditationBuff)and not g:BuffUp(V.ShurikenTornado)then local function aY(aO)return not aO:DebuffUp(V.SerratedBoneSpikeDebuff)end;if h:IsInRange(30)and aY(h)and h:FilteredTimeToDie(">",21)then if m.Cast(V.SerratedBoneSpike,nil,nil)then a2=328547;return"Cast Serrated Bone Spike (ST)"end end;if m.AoEON()then as(V.SerratedBoneSpike,aY,21,Y)end end;if h:IsInMeleeRange(5)then if p and V.Sepsis:IsReady()and aX and ad>=1 then if m.Cast(V.Sepsis,nil,nil)then a2=328305;return"Cast Sepsis"end end;if V.SymbolsofDeath:IsCastable()and aX and K and(V.EnvelopingShadows:IsAvailable()or V.ShadowDance:Charges()>=1)and(not V.ShurikenTornado:IsAvailable()or V.ShadowFocus:IsAvailable()or(V.ShurikenTornado:CooldownRemains()>2 or V.ShurikenTornado:CooldownUp()or not L))and(not ak or(V.Flagellation:CooldownRemains()>10 or not p)or V.Flagellation:CooldownUp()and p and ab>=5)then if m.Cast(V.SymbolsofDeath,nil)then a2=212283;return"Cast Symbols of Death"end end end;if V.MarkedforDeath:IsCastable()then if h:FilteredTimeToDie("<",ad)then if m.Cast(V.MarkedforDeath,nil)then a2=137619;return"Cast Marked for Death"end end;if not g:StealthUp(true,true)and ad>=U.CPMaxSpend()then if M then if m.Cast(V.MarkedforDeath,nil)then a2=137619;return"Cast Marked for Death"end end end end;if m.CDsON()or not m.CDsON()then if V.ShadowBlades:IsCastable()and aX and ad>=2 and H and(V.SymbolsofDeath:CooldownRemains()<1 and K or g:BuffUp(V.SymbolsofDeath)or d.BossFilteredFightRemains("<=",20))then if m.Cast(V.ShadowBlades,nil)then a2=121471;return"Cast Shadow Blades"end end;if V.EchoingReprimand:IsReady()and p and h:IsInMeleeRange(5)and aX and ad>=2 and(ae or _<=4 or al)then if m.Cast(V.EchoingReprimand,nil,nil)then a2=323547;return"Cast Echoing Reprimand"end end;if V.ShurikenTornado:IsReady()and not D and V.ShadowFocus:IsAvailable()and aX and g:BuffUp(V.SymbolsofDeath)and L and ab<=2 and(not g:BuffUp(V.PremeditationBuff)or _>4)then if m.Cast(V.ShurikenTornado)then a2=277925;return"Cast Shuriken Tornado (SF)"end end;if V.ShadowDance:IsCastable()and(aq()or I)and not g:BuffUp(V.ShadowDanceBuff)and d.BossFilteredFightRemains("<=",8+aC(V.Subterfuge:IsAvailable()))then a1=aT(V.ShadowDance)if a1 then return"Shadow Dance Macro (Low TTD) "..a1 end end;if W.PotionofSpectralAgility:IsReady()and o()and am.Commons.Enabled.Potions and t and(g:BloodlustUp()or d.BossFilteredFightRemains("<",30)or(g:BuffUp(V.ShadowBlades)or V.ShadowBlades:CooldownRemains()<=10 and H))then if m.Cast(W.PotionofSpectralAgility,nil)then a2=500;return"potion cooldowns 2"end end;if g:BuffUp(V.SymbolsofDeath)then if V.BloodFury:IsCastable()then if m.Cast(V.BloodFury,nil)then a2=20572;return"Cast Blood Fury"end end;if V.Berserking:IsCastable()then if m.Cast(V.Berserking,nil)then a2=26297;return"Cast Berserking"end end;if V.Fireblood:IsCastable()then if m.Cast(V.Fireblood,nil)then a2=265221;return"Cast Fireblood"end end;if V.AncestralCall:IsCastable()then if m.Cast(V.AncestralCall,nil)then a2=274738;return"Cast Ancestral Call"end end end;if am.Commons.Enabled.TopTrinket or am.Commons.Enabled.BottomTrinket then local aZ=g:BuffUp(V.SymbolsofDeath)or d.BossFilteredFightRemains("<",20)if aZ then local a_=g:GetUseableTrinkets(X)if a_ then if m.Cast(a_,nil,nil)then if a_:ID()==GetInventoryItemID("player",13)then a2=24;return"Generic use_items for "..a_:Name()elseif a_:ID()==GetInventoryItemID("player",14)then a2=25;return"Generic use_items for "..a_:Name()end end end end end end end;local function b0(EnergyThreshold)if(m.CDsON()or not m.CDsON())and V.ShadowDance:TimeSinceLastDisplay()>0.3 and V.Shadowmeld:TimeSinceLastDisplay()>0.3 and not g:IsTanking(h)then if V.Vanish:IsCastable()and J and not v and am.Commons.VanishOffensive and(not aF()or not V.Nightstalker:IsAvailable()and V.DarkShadow:IsAvailable())and ad>1 and not ai then a1=aT(V.Vanish,EnergyThreshold)if a1 then a2=1213;return"Vanish Macro "..a1 end end;if V.Shadowmeld:IsCastable()and h:IsInMeleeRange(5)and not g:IsMoving()and g:EnergyDeficitPredicted()>10 and not aF()and ad>1 and h:DebuffRemains(V.FindWeaknessDebuff)<1 then if g:Energy()<40 then if m.CastPooling(V.Shadowmeld,g:EnergyTimeToX(40))then a2=1000;return"Pool for Shadowmeld"end end;a1=aT(V.Shadowmeld,EnergyThreshold)if a1 then a2=1214;return"Shadowmeld Macro "..a1 end end end;if aG()and h:IsInMeleeRange(5)and V.ShadowDance:IsCastable()and V.ShadowDance:Charges()>=1 and V.Vanish:TimeSinceLastDisplay()>0.3 and V.Shadowmeld:TimeSinceLastDisplay()>0.3 and(I or V.ShadowDance:ChargesFractional()>=am.Subtlety.ShDEcoCharge-(not V.EnvelopingShadows:IsAvailable()and 0.75 or 0))then if aF()or g:BuffRemains(V.SymbolsofDeath)>=1.2 or _>=4 and(V.SymbolsofDeath:CooldownRemains()>10 or not K)then a1=aT(V.ShadowDance,EnergyThreshold)if a1 then a2=1212;return"ShadowDance Macro 1 "..a1 end end;if aq()and(d.BossFilteredFightRemains("<",V.SymbolsofDeath:CooldownRemains())or not K)and I then a1=aT(V.ShadowDance,EnergyThreshold)if a1 then a2=1212;return"ShadowDance Macro 2 "..a1 end end end;return false end;local function b1(EnergyThreshold)local b2=not EnergyThreshold or g:EnergyPredicted()>=EnergyThreshold;if V.Shiv:IsCastable()and ag and not V.Nightstalker:IsAvailable()and _<5 then if b2 and m.Cast(V.ShurikenStorm)then a2=5938;return"Cast Shiv (TTB)"end end;if m.AoEON()and V.ShurikenStorm:IsCastable()and _>=2 and(not g:Covenant()=="Necrolord"or V.SerratedBoneSpike:MaxCharges()-V.SerratedBoneSpike:ChargesFractional()>=0.25 or _>=4)then if b2 and m.Cast(V.ShurikenStorm)then a2=197835;return"Cast Shuriken Storm"end end;if V.SerratedBoneSpike:IsCastable()and(V.SerratedBoneSpike:MaxCharges()-V.SerratedBoneSpike:ChargesFractional()<=0.25 or V.LeadbyExample:SoulbindEnabled()and not g:BuffUp(V.LeadbyExampleBuff)and not d.BossFightRemainsIsNotValid())then if b2 and m.Cast(V.SerratedBoneSpike,nil,nil)then a2=328547;return"Cast Serrated Bone Spike (Capping Filler)"end end;if h:IsInMeleeRange(5)then if V.Gloomblade:IsCastable()then if b2 and m.Cast(V.Gloomblade)then a2=200758;return"Cast Gloomblade"end elseif V.Backstab:IsCastable()then if b2 and m.Cast(V.Backstab)then a2=53;return"Cast Backstab"end end end;return false end;local b3={{V.Blind,"Cast Blind (Interrupt)",function()return true end},{V.KidneyShot,"Cast Kidney Shot (Interrupt)",function()return ab>0 end},{V.CheapShot,"Cast Cheap Shot (Interrupt)",function()return g:StealthUp(true,true)end}}local function b4()r=HeroRotationCharDB.Toggles[6]p=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[5]s=HeroRotationCharDB.Toggles[12]t=HeroRotationCharDB.Toggles[15]u=HeroRotationCharDB.Toggles[20]v=HeroRotationCharDB.Toggles[21]w=HeroRotationCharDB.Toggles[22]x=HeroRotationCharDB.Toggles[23]y=HeroRotationCharDB.Toggles[24]z=HeroRotationCharDB.Toggles[25]A=HeroRotationCharDB.Toggles[26]B=HeroRotationCharDB.Toggles[27]C=HeroRotationCharDB.Toggles[28]D=HeroRotationCharDB.Toggles[29]H=false;I=false;J=false;K=false;M=true;L=false;if am.Subtlety.IncludedCooldowns.ShadowBlades and o()or am.Subtlety.IncludedSmallCooldowns.ShadowBlades and(o()or q)or not am.Subtlety.IncludedSmallCooldowns.ShadowBlades and not am.Subtlety.IncludedCooldowns.ShadowBlades then H=true end;if am.Subtlety.IncludedCooldowns.ShadowDance and o()or am.Subtlety.IncludedSmallCooldowns.ShadowDance and(o()or q)or not am.Subtlety.IncludedSmallCooldowns.ShadowDance and not am.Subtlety.IncludedCooldowns.ShadowDance then I=true end;if am.Subtlety.IncludedCooldowns.Vanish and o()or am.Subtlety.IncludedSmallCooldowns.Vanish and(o()or q)or not am.Subtlety.IncludedSmallCooldowns.Vanish and not am.Subtlety.IncludedCooldowns.Vanish then J=true end;if am.Subtlety.IncludedCooldowns.SymbolsofDeath and o()or am.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and(o()or q)or not am.Subtlety.IncludedSmallCooldowns.SymbolsofDeath and not am.Subtlety.IncludedCooldowns.SymbolsofDeath then K=true end;if am.Subtlety.IncludedCooldowns.ShurikenTornado and o()or am.Subtlety.IncludedSmallCooldowns.ShurikenTornado and(o()or q)or not am.Subtlety.IncludedSmallCooldowns.ShurikenTornado and not am.Subtlety.IncludedCooldowns.ShurikenTornado then L=true end;if not am.Commons.Enabled.TopTrinket then N=GetInventoryItemID("player",13)else N=1 end;if not am.Commons.Enabled.BottomTrinket then O=GetInventoryItemID("player",14)else O=1 end;X={N,O}end;local function b5()if V.Subterfuge:IsAvailable()then a7=V.Stealth2;a8=V.VanishBuff2 else a7=V.Stealth;a8=V.VanishBuff end;a4=nil;a6=nil;a5=0;if n()then Y=g:GetEnemiesInRange(30)Z=g:GetEnemiesInMeleeRange(10)_=#Z;a0=g:GetEnemiesInMeleeRange(5)else Y={}Z={}_=0;a0={}end;ac=g:ComboPoints()ab=U.EffectiveComboPoints(ac)ad=g:ComboPointsDeficit()a9=(4+ac*4)*0.3;aa=V.Eviscerate:Damage()*am.Subtlety.EviscerateDMGOffset;ae=ar()a1=b4()if a1 then return a1 end;if a3>0 then a3=0 end;if a2>0 then a2=0 end;a2=U.ReturnSpell()a3=U.ReturnSpellMO()if m.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then F=GetTime()G=F+m.GUISettings.General.OpenerReset elseif m.GUISettings.General.OpenerReset>0 and G~=nil and GetTime()>G and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)m.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if w and V.CheapShot:IsUsableP()and V.CheapShot:CooldownRemains(BypassRecovery)<=0 and g:StealthUp(true,true)then if m.Cast(V.CheapShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(V.CheapShot)then a3=11833;return"queue Cheap Shot MO"else a2=1833;return"queue Cheap Shot"end end elseif(not V.CheapShot:IsUsableP()or V.CheapShot:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]m.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and V.KidneyShot:IsUsableP()and V.KidneyShot:CooldownRemains(BypassRecovery)<=0 then if m.Cast(V.KidneyShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(V.KidneyShot)then a3=1408;return"queue Kidney Shot MO"else a2=408;return"queue Kidney Shot"end end elseif(not V.KidneyShot:IsUsableP()or V.KidneyShot:CooldownRemains()>0)and x then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]m.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and V.Blind:IsUsableP()and V.Blind:CooldownRemains(BypassRecovery)<=0 then if m.Cast(V.Blind,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(V.Blind)then a3=12094;return"queue Blind MO"end end elseif(not V.Blind:IsUsableP()or V.Blind:CooldownRemains()>0)and y then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]m.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and V.Sap:IsUsableP()and V.Sap:CooldownRemains(BypassRecovery)<=0 then if m.Cast(V.Sap,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(V.Sap)then a3=16770;return"queue Sap MO"else a2=6770;return"queue Sap"end end elseif(not V.Sap:IsUsableP()or V.Sap:CooldownRemains()>0)and z then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]m.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A and V.ShurikenTornado:IsUsableP()and V.ShurikenTornado:CooldownRemains(BypassRecovery)<=0 then if m.Cast(V.ShurikenTornado,nil,nil,nil)then a2=277925;return"queue Shuriken Tornado"end elseif(not V.ShurikenTornado:IsUsableP()or V.ShurikenTornado:CooldownRemains()>0)and A then HeroRotationCharDB.Toggles[26]=not HeroRotationCharDB.Toggles[26]m.Print("Shuriken Tornado Queue is now "..(HeroRotationCharDB.Toggles[26]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if B and V.Feint:IsUsableP()and V.Feint:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(V.Feint,nil,nil,nil)then a2=202;return"queue Shuriken Tornado"end elseif(not V.Feint:IsUsableP()or V.Feint:CooldownRemains()>0 or not g:AffectingCombat())and B then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]m.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if C and V.Flagellation:IsUsableP()and V.Flagellation:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if m.Cast(V.Flagellation,nil,nil,nil)then a2=323654;return"queue Flagellation Queue"end elseif(not V.Flagellation:IsUsableP()or V.Flagellation:CooldownRemains()>0 or not g:AffectingCombat())and C then HeroRotationCharDB.Toggles[28]=not HeroRotationCharDB.Toggles[28]m.Print("Flagellation Queue is now "..(HeroRotationCharDB.Toggles[28]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if g:BuffUp(V.ShurikenTornado,nil,true)and ac<U.CPMaxSpend()then local b6=U.TimeToNextTornado()if b6<=g:GCDRemains()or S(g:GCDRemains()-b6)<0.25 then local b7=_+aC(g:BuffUp(V.ShadowBlades))ac=Q(ac+b7,U.CPMaxSpend())ad=R(ad-b7,0)if ab<U.CPMaxSpend()then ab=ac end end end;a1=U.CrimsonVial()if a1 then return a1 end;a1=U.Feint()if a1 then return a1 end;if g:HealthPercentage()<am.Commons.PhialHP and W.PhialofSerenity:IsReady()and W.PhialofSerenity:CooldownRemains()<=0 then if m.Cast(W.PhialofSerenity,nil)then a2=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<am.Commons.HealthstoneHP and W.Healthstone:IsReady()and W.Healthstone:CooldownRemains()<=0 then if m.Cast(W.Healthstone,nil)then a2=40;return"Healthstone HP"end end;if g:HealthPercentage()<am.Commons.HealPotHP and W.HealPot:IsReady()and W.HealPot:CooldownRemains()<=0 then if m.Cast(W.HealPot,nil)then a2=41;return"HealPot HP"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if V.Backstab:IsCastable()and f("mouseover"):IsInMeleeRange(8)then if m.Cast(V.Backstab,nil)then a3=153;return"explosive MO SWD"end end;if V.ShurikenToss:IsCastable()and f("mouseover"):IsInMeleeRange(40)and not f("mouseover"):IsInMeleeRange(8)then if m.Cast(V.ShurikenToss,nil)then a3=1114014;return"explosive MO SWD"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if V.Backstab:IsCastable()and h:IsInMeleeRange(8)then if m.Backstab(V.Shiv,nil)then a2=53;return"explosive  SWD"end end;if V.ShurikenToss:IsCastable()and h:IsInMeleeRange(40)and not h:IsInMeleeRange(8)then if m.Cast(V.ShurikenToss,nil)then a2=114014;return"explosive MO SWD"end end end;E={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}if UnitExists("target")and V.Shiv:IsReady()then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for b8=0,40 do local aA,aA,b9,type,aA,aA,aA,aA,aA,ba=UnitBuff("target",b8)for aA,bb in pairs(E)do if bb==ba then if m.Cast(V.Shiv,nil)then a2=5938;return"Shiv Enrage"end end end end end end;local bc=g:AffectingCombat()and 180 or 900;local bd;if i(8679):IsAvailable()and am.Commons.LethalPoison=="Wound Poison"then bd=g:BuffRemains(i(8679))if bd<bc and not g:IsCasting(i(8679))then if m.Cast(i(8679))then a2=203;return"Wound Poison Refresh"end end elseif i(2823):IsAvailable()and am.Commons.LethalPoison=="Deadly Poison"then bd=g:BuffRemains(i(2823))if bd<bc and not g:IsCasting(i(2823))then if m.Cast(i(2823))then a2=204;return"Deadly Poison Refresh"end end elseif i(315584):IsAvailable()and am.Commons.LethalPoison=="Instant Poison"then bd=g:BuffRemains(i(315584))if bd<bc and not g:IsCasting(i(315584))then if m.Cast(i(315584))then a2=205;return"Instant Poison Refresh"end end end;bd=g:BuffRemains(i(3408))if i(3408):IsAvailable()and am.Commons.NonLethalPoison=="Crippling Poison"then if bd<bc and not g:IsCasting(i(3408))then if m.Cast(i(3408))then a2=206;return"Crippling Poison Refresh"end end elseif i(5761):IsAvailable()and am.Commons.NonLethalPoison=="Numbing Poison"then bd=g:BuffRemains(i(5761))if bd<bc and not g:IsCasting(NumbingPoison)then if m.Cast(i(5761))then a2=204;return"Numbing Poison Refresh"end end end;if not g:AffectingCombat()then if not g:BuffUp(V.ShadowDanceBuff)and not g:BuffUp(a8)then a1=U.Stealth(a7)if a1 then return a1 end end end;U.MfDSniping(V.MarkedforDeath)if T.TargetIsValid()and(g:AffectingCombat()or r or(g:BuffUp(a8)or StealthSpell and StealthSpell:ID()==V.Vanish:ID()))then a1=T.Interrupt(5,V.Kick,nil,b3)if a1 then return a1 end;local be,bf,aA=GetSpellCooldown(57934)if am.Commons.AutoToT and g:AffectingCombat()then if be+bf-GetTime()<=0 and V.TricksoftheTrade:IsAvailable()and V.TricksoftheTrade:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and(UnitInParty("focus")or UnitInRaid("focus"))and IsItemInRange(32698,"focus")then if m.Cast(V.TricksoftheTrade)then a2=157934;return"ToT Focus"end end end;a1=aW()if a1 then return"CDs: "..a1 end;if V.SliceandDice:IsCastable()and(h:FilteredTimeToDie(">",6)or h:TimeToDieIsNotValid())and g:BuffRemains(V.SliceandDice)<g:GCD()and ab>=4-(d.CombatTime()<10 and 2 or 0)then if V.SliceandDice:IsReady()and m.Cast(V.SliceandDice)then a2=5171;return"Cast Slice and Dice (Low Duration)"end end;if g:StealthUp(true,true)then a4=aP(true)if a4 then if type(a4)=="table"and#a4>1 then if m.CastQueuePooling(nil,unpack(a4))then return"Stealthed Macro "..a4[1]:Name().."|"..a4[2]:Name()end else if g:BuffUp(V.ShurikenTornado)and ac~=g:ComboPoints()and(a4==V.BlackPowder or a4==V.Eviscerate or a4==V.Rupture or a4==V.SliceandDice)then if m.CastQueuePooling(nil,V.ShurikenTornado,a4)then return"Stealthed Tornado Cast  "..a4:Name()end else if a4==V.Shadowstrike then if m.CastPooling(a4)then a2=185438;return"Stealthed Cast "..a4:Name()end elseif a4==V.ShurikenToss then if m.CastPooling(a4)then a2=114014;return"Stealthed Cast "..a4:Name()end elseif a4==V.ShurikenTornado then if m.CastPooling(a4)then a2=277925;return"Stealthed Cast "..a4:Name()end elseif a4==V.Shadowmeld then if m.CastPooling(a4)then a2=58984;return"Stealthed Cast "..a4:Name()end elseif a4==V.ShurikenStorm then if m.CastPooling(a4)then a2=197835;return"Stealthed Cast "..a4:Name()end elseif a4==V.BlackPowder then if m.CastPooling(a4)then a2=319175;return"Stealthed Cast "..a4:Name()end elseif a4==V.Rupture then if m.CastPooling(a4)then a2=1943;return"Stealthed Cast "..a4:Name()end elseif a4==V.Eviscerate then if m.CastPooling(a4)then a2=196819;return"Stealthed Cast "..a4:Name()end elseif a4==V.Vanish then if m.CastPooling(a4)then a2=1856;return"Stealthed Cast "..a4:Name()end end end end end end;if V.SliceandDice:IsCastable()and(h:FilteredTimeToDie(">",6)or h:TimeToDieIsNotValid())and g:BuffRemains(V.SliceandDice)<g:GCD()and ab>=4-(d.CombatTime()<10 and 2 or 0)then if V.SliceandDice:IsReady()and m.Cast(V.SliceandDice)then a2=5171;return"Cast Slice and Dice (Low Duration)"end end;if ae then a1=b0()if a1 then return"Stealth CDs: (Priority Rotation)"..a1 end end;a1=b0(g:EnergyMax()-aE())if a1 then return"Stealth CDs: "..a1 end;if ab>=U.CPMaxSpend()or(ad<=1 or d.BossFilteredFightRemains("<",2)and ab>=3)or _>=4 and ab>=4 or g:BuffUp(V.SymbolsofDeathCrit)and ab>=4 then a1=aK()if a1 then return"Finish: "..a1 end else a1=b1(g:EnergyMax()-aE())if a1 then return"Build: "..a1 end end;if m.CDsON()then if V.ArcaneTorrent:IsReady()and h:IsInMeleeRange(5)and g:EnergyDeficitPredicted()>15+g:EnergyRegen()then if m.Cast(V.ArcaneTorrent,nil)then a2=155145;return"Cast Arcane Torrent"end end;if V.ArcanePulse:IsReady()and h:IsInMeleeRange(5)then if m.Cast(V.ArcanePulse,nil)then a2=260364;return"Cast Arcane Pulse"end end;if V.LightsJudgment:IsReady()then if m.Cast(V.LightsJudgment,nil)then a2=255647;return"Cast Lights Judgment"end end;if V.BagofTricks:IsReady()then if m.Cast(V.BagofTricks,nil)then a2=312411;return"Cast Bag of Tricks"end end end;if false and h:IsInMeleeRange(5)then if type(a4)=="table"and#a4>1 then if m.CastQueuePooling(g:EnergyTimeToX(a5),unpack(a4))then a2=1000;return"Macro pool towards "..a4[1]:Name().." at "..a5 end elseif a4:IsCastable()then a5=R(a5,a4:Cost())if m.CastPooling(a4,g:EnergyTimeToX(a5))then a2=1000;return"Pool towards: "..a4:Name().." at "..a5 end end end;if m.Cast(V.PoolEnergy)then a2=1000;return"Stealthed Pooling"end end end;local function bg()end;function ReturnSpell()if a2==0 then return 0 else return a2 end end;function ReturnSpellMO()if a3==0 then return 0 else return a3 end end;m.SetAPL(261,b5,bg)