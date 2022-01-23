local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=d.Action;local m=HeroRotation;local n=m.AoEON;local o=m.CDsON;local p=m.Cast;local q=m.CastSuggested;local r=HeroRotationCharDB.Toggles[4]local s=HeroRotationCharDB.Toggles[5]local t=HeroRotationCharDB.Toggles[6]local u=HeroRotationCharDB.Toggles[12]local v=not HeroRotationCharDB.Toggles[15]local w=HeroRotationCharDB.Toggles[120]local x={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}local y=math.max;local _G,pairs,type,table,string,error=_G,pairs,type,table,string,error;local z=m.Commons.Everyone;local A=m.Commons.Hunter;local B={General=m.GUISettings.General,Commons=m.GUISettings.APL.Hunter.Commons,BeastMastery=m.GUISettings.APL.Hunter.BeastMastery}local C=j.Hunter.BeastMastery;local D={C.SummonPet,C.SummonPet2,C.SummonPet3,C.SummonPet4,C.SummonPet5}local E=k.Hunter.BeastMastery;local F={}local G;local H=g:HasLegendaryEquipped(68)local I=g:HasLegendaryEquipped(72)d:RegisterForEvent(function()H=g:HasLegendaryEquipped(68)I=g:HasLegendaryEquipped(72)end,"PLAYER_EQUIPMENT_CHANGED")local J,K,L;local M,N;local O;local G;local P;local Q=0;local R=0;local S={{C.Intimidation,"Cast Intimidation (Interrupt)",function()return true end}}local function T()P=g:GCD()+0.150;if g:BuffUp(C.AspectoftheWildBuff)then P=y(0.75,P-0.2/(1+g:HastePct()/100))end end;local function U(V)return V~=0 end;local function W(X)return X:DebuffRemains(C.BarbedShot)end;local function Y(X)if i:BuffUp(C.FrenzyPetBuff)and i:BuffRemains(C.FrenzyPetBuff)<=P+0.5 and X:TimeToDie()>6 and X:GUID()==f("mouseover"):GUID()then R=1217200;return true elseif i:BuffUp(C.FrenzyPetBuff)and i:BuffRemains(C.FrenzyPetBuff)<=P+0.5 and X:TimeToDie()>6 and B.BeastMastery.TargetSwap=="AutoSwap"and X:GUID()~=h:GUID()and not u then R=999;return true elseif i:BuffUp(C.FrenzyPetBuff)and i:BuffRemains(C.FrenzyPetBuff)<=P+0.5 and X:TimeToDie()>6 and X:GUID()==h:GUID()then Q=217200;return true elseif i:BuffUp(C.FrenzyPetBuff)and i:BuffRemains(C.FrenzyPetBuff)<=P+0.5 and X:TimeToDie()>6 then return true end end;local function Z(X)if(C.BarbedShot:FullRechargeTime()<P+0.5 and U(C.BestialWrath:CooldownRemains())and X:TimeToDie()>6 or C.BestialWrath:CooldownRemains()<12+P and C.ScentOfBlood:IsAvailable()and X:TimeToDie()>6)and X:GUID()==f("mouseover"):GUID()then R=1217200;return true elseif(C.BarbedShot:FullRechargeTime()<P+0.5 and U(C.BestialWrath:CooldownRemains())and X:TimeToDie()>6 or C.BestialWrath:CooldownRemains()<12+P and C.ScentOfBlood:IsAvailable()and X:TimeToDie()>6)and B.BeastMastery.TargetSwap=="AutoSwap"and X:GUID()~=h:GUID()and not u then R=999;return true elseif(C.BarbedShot:FullRechargeTime()<P+0.5 and U(C.BestialWrath:CooldownRemains())and X:TimeToDie()>6 or C.BestialWrath:CooldownRemains()<12+P and C.ScentOfBlood:IsAvailable()and X:TimeToDie()>6)and X:GUID()==h:GUID()then Q=217200;return true elseif C.BarbedShot:FullRechargeTime()<P+0.5 and U(C.BestialWrath:CooldownRemains())and X:TimeToDie()>6 or C.BestialWrath:CooldownRemains()<12+P and C.ScentOfBlood:IsAvailable()and X:TimeToDie()>6 then return true end end;local function _(X)if X:TimeToDie()<9 and C.Bloodletting:ConduitEnabled()and X:GUID()==f("mouseover"):GUID()then R=1217200;return true elseif X:TimeToDie()<9 and C.Bloodletting:ConduitEnabled()and B.BeastMastery.TargetSwap=="AutoSwap"and X:GUID()~=h:GUID()and not u then R=999;return true elseif X:TimeToDie()<9 and C.Bloodletting:ConduitEnabled()and X:GUID()==h:GUID()then Q=217200;return true elseif X:TimeToDie()<9 and C.Bloodletting:ConduitEnabled()then return true end end;local function a0()if z.TargetIsValid()and M then if C.BestialWrath:IsCastable()and s then if p(C.BestialWrath,nil)then Q=19574;return"Bestial Wrath (PreCombat)"end end;if C.BarbedShot:IsCastable()and C.BarbedShot:Charges()>=2 then if p(C.BarbedShot)then Q=217200;return"Barbed Shot (PreCombat)"end end;if C.KillShot:IsCastable()then if p(C.KillShot)then Q=53351;return"Kill Shot (PreCombat)"end end;if C.KillCommand:IsCastable()and O then if p(C.KillCommand)then Q=34026;return"Kill Command (PreCombat)"end end;if L>1 then if C.MultiShot:IsCastable()then if p(C.MultiShot)then Q=2643;return"Multi-Shot (PreCombat)"end end else if C.CobraShot:IsCastable()then if p(C.CobraShot)then Q=193455;return"Cobra Shot (PreCombat)"end end end end end;local function a1()if C.AncestralCall:IsCastable()and C.BestialWrath:CooldownRemains()>30 then if p(C.AncestralCall,nil)then Q=274738;return"Ancestral Call"end end;if C.Fireblood:IsCastable()and C.BestialWrath:CooldownRemains()>30 then if p(C.Fireblood,nil)then Q=265221;return"Fireblood"end end;if C.Berserking:IsCastable()and(g:BuffUp(C.AspectoftheWildBuff)and(h:TimeToDie()>180+C.BerserkingBuff:BaseDuration()or(h:HealthPercentage()<35 or not C.KillerInstinct:IsAvailable()))or h:TimeToDie()<13)then if p(C.Berserking,nil)then Q=26297;return"Berserking"end end;if C.BloodFury:IsCastable()and(g:BuffUp(C.AspectoftheWildBuff)and(h:TimeToDie()>120+C.BloodFuryBuff:BaseDuration()or(h:HealthPercentage()<35 or not C.KillerInstinct:IsAvailable()))or h:TimeToDie()<16)then if p(C.BloodFury,nil)then Q=20572;return"Blood Fury"end end;if C.LightsJudgment:IsCastable()and(i:BuffRemains(C.FrenzyPetBuff)>P or i:BuffDown(C.FrenzyPetBuff))then if p(C.LightsJudgment,nil,nil,40)then Q=255647;return"Light's Judgment"end end;if B.Commons.Enabled.Potions and E.PotionOfSpectralAgility:IsReady()then if p(E.PotionOfSpectralAgility,nil)then Q=50;return"Potion of Spectral Agility"end end end;local function a2()if o()and C.AspectoftheWild:IsCastable()then if p(C.AspectoftheWild,nil)then Q=193530;return"Aspect of the Wild (Cleave)"end end;if C.BarbedShot:IsCastable()then if z.CastTargetIf(C.BarbedShot,J,"min",W,Y)then return"Barbed Shot (Cleave - 1)"end;if i:BuffUp(C.FrenzyPetBuff)and i:BuffRemains(C.FrenzyPetBuff)<=P+0.5 then if p(C.BarbedShot,nil,nil,not M)then Q=217200;return"Barbed Shot (Cleave - 1@Target)"end end end;if C.MultiShot:IsReady()and(P-i:BuffRemains(C.BeastCleavePetBuff)>0.25 or P-g:BuffRemains(C.BeastCleaveBuff)>0.25)then if p(C.MultiShot,nil,nil,not M)then Q=2643;return"Multi-Shot (Cleave - 1)"end end;if C.TarTrap:IsCastable()and(H and h:BuffDown(C.SoulforgeEmbersDebuff)and C.Flare:CooldownRemains()<g:GCD())then if p(C.TarTrap,nil,nil,not h:IsInRange(40))then Q=187698;return"tar_trap st 4"end end;if C.Flare:IsCastable()and not C.TarTrap:CooldownUp()and H then if p(C.Flare,nil)then Q=1543;return"flare st 5"end end;if o()and r and C.DeathChakram:IsCastable()and g:Focus()+g:FocusCastRegen(C.DeathChakram:ExecuteTime())<g:FocusMax()then if p(C.DeathChakram,nil,nil)then Q=325028;return"death_chakram st"end end;if o()and r and r and C.WildSpirits:IsCastable()then if p(C.WildSpirits,nil,nil)then Q=328231;return"wild_spirits st"end end;if C.BarbedShot:IsCastable()then if z.CastTargetIf(C.BarbedShot,J,"min",W,Z)then return"Barbed Shot (Cleave - 2)"end;if C.BarbedShot:FullRechargeTime()<P+0.5 and U(C.BestialWrath:CooldownRemains())or C.BestialWrath:CooldownRemains()<12+P and C.ScentOfBlood:IsAvailable()then if p(C.BarbedShot,nil,nil,not M)then Q=217200;return"Barbed Shot (Cleave - 2@Target)"end end end;if o()or s then if C.BestialWrath:IsCastable()and s then if p(C.BestialWrath,nil)then Q=19574;return"Bestial Wrath (Cleave)"end end;if C.ResonatingArrow:IsCastable()and r then if p(C.ResonatingArrow,nil,nil)then Q=308491;return"resonating_arrow cleave"end end;if C.Stampede:IsCastable()and o()and(g:BuffUp(C.AspectoftheWildBuff)or h:TimeToDie()<15)then if p(C.Stampede,nil,nil,not N)then Q=201430;return"Stampede (Cleave)"end end;if C.WailingArrow:IsReady()and s then if p(C.WailingArrow,nil,nil,not M)then Q=355589;return"Wailing Arrow (Cleave)"end end;if C.FlayedShot:IsCastable()and r then if p(C.FlayedShot,nil,nil)then Q=324149;return"flayed_shot cleave"end end end;if C.KillShot:IsCastable()then if p(C.KillShot,nil,nil,not M)then Q=53351;return"Kill Shot (Cleave)"end end;if C.ChimaeraShot:IsCastable()then if p(C.ChimaeraShot,nil,nil,not M)then Q=53209;return"Chimaera Shot (Cleave)"end end;if s and C.Bloodshed:IsCastable()then if p(C.Bloodshed,nil)then Q=321530;return"Bloodshed (ST)"end end;if o()and C.AMurderofCrows:IsReady()then if p(C.AMurderofCrows,nil,nil,not M)then Q=131894;return"A Murder of Crows (Cleave)"end end;if C.Barrage:IsReady()and i:BuffRemains(C.BeastCleavePetBuff)>C.Barrage:ExecuteTime()and g:BuffRemains(C.BeastCleaveBuff)>C.Barrage:ExecuteTime()then if p(C.Barrage,nil,nil,not M)then Q=120360;return"Barrage (Cleave)"end end;if C.KillCommand:IsReady()and O and g:Focus()>C.KillCommand:Cost()+C.MultiShot:Cost()then if p(C.KillCommand)then Q=34026;return"Kill Command (Cleave)"end end;if C.BagofTricks:IsCastable()and(g:BuffDown(C.BestialWrathBuff)or h:TimeToDie()<5)then if p(C.BagofTricks,nil,nil,not M)then Q=312411;return"Bag of Tricks (ST)"end end;if C.DireBeast:IsReady()then if p(C.DireBeast,nil,nil,not M)then Q=120679;return"Dire Beast (Cleave)"end end;if C.BarbedShot:IsCastable()then if z.CastTargetIf(C.BarbedShot,J,"min",W,_)then return"Barbed Shot (Cleave - 3)"end;if h:TimeToDie()<9 and C.Bloodletting:ConduitEnabled()then if p(C.BarbedShot,nil,nil,not M)then Q=217200;return"Barbed Shot (Cleave - 3@Target)"end end end;if C.CobraShot:IsCastable()and g:FocusTimeToMaxPredicted()<P*2 then if p(C.CobraShot)then Q=193455;return"Cobra-Shot (Cleave)"end end end;local function a3()if o()and C.AspectoftheWild:IsCastable()then if p(C.AspectoftheWild,nil)then Q=193530;return"Aspect of the Wild (ST)"end end;if C.BarbedShot:IsCastable()and(i:BuffUp(C.FrenzyPetBuff)and i:BuffRemains(C.FrenzyPetBuff)<=P+0.5)then if p(C.BarbedShot,nil,nil,not M)then Q=217200;return"Barbed Shot (ST - 1)"end end;if C.TarTrap:IsCastable()and(H and h:BuffDown(C.SoulforgeEmbersDebuff)and C.Flare:CooldownRemains()<g:GCD())then if p(C.TarTrap,nil,nil,not h:IsInRange(40))then Q=187698;return"tar_trap st 4"end end;if C.Flare:IsCastable()and not C.TarTrap:CooldownUp()and H then if p(C.Flare,nil)then Q=1543;return"flare st 5"end end;if s and C.Bloodshed:IsCastable()then if p(C.Bloodshed,nil)then Q=321530;return"Bloodshed (ST)"end end;if o()and r and C.WildSpirits:IsCastable()then if p(C.WildSpirits,nil,nil)then Q=328231;return"wild_spirits st"end end;if o()and r and C.FlayedShot:IsCastable()then if p(C.FlayedShot,nil,nil)then Q=324149;return"flayed_shot st"end end;if C.KillShot:IsCastable()then if p(C.KillShot,nil,nil,not M)then Q=53351;return"Kill Shot (ST)"end end;if s and C.WailingArrow:IsReady()and(C.ResonatingArrow:CooldownRemains()<g:GCD()or g:Covenant()~="Kyrian"or not C.ResonatingArrow:CooldownUp()or h:TimeToDie()<5)then if p(C.WailingArrow,nil,nil,not M)then Q=355589;return"Wailing Arrow (ST)"end end;if C.BarbedShot:IsCastable()and(C.BestialWrath:CooldownRemains()<12*C.BarbedShot:ChargesFractional()+P and C.ScentOfBlood:IsAvailable()or C.BarbedShot:FullRechargeTime()<P and U(C.BestialWrath:CooldownRemains())or h:TimeToDie()<9)then if p(C.BarbedShot,nil,nil,not M)then Q=217200;return"Barbed Shot (ST - 1)"end end;if o()and r and C.DeathChakram:IsCastable()and g:Focus()+g:FocusCastRegen(C.DeathChakram:ExecuteTime())<g:FocusMax()then if p(C.DeathChakram,nil,nil)then Q=325028;return"death_chakram st"end end;if C.Stampede:IsCastable()and(g:BuffUp(C.AspectoftheWildBuff)and g:BuffUp(C.BestialWrathBuff)or h:TimeToDie()<15)then if p(C.Stampede,nil,nil,not N)then Q=201430;return"Stampede (ST)"end end;if C.AMurderofCrows:IsReady()then if p(C.AMurderofCrows,nil,nil,not M)then Q=131894;return"A Murder of Crows (ST)"end end;if o()and r and C.ResonatingArrow:IsCastable()and(g:BuffUp(C.BestialWrathBuff)or h:TimeToDie()<10)then if p(C.ResonatingArrow,nil,nil)then Q=308491;return"resonating_arrow st"end end;if s and C.BestialWrath:IsCastable()and(not C.WildSpirits:IsAvailable()or(C.WildSpirits:CooldownRemains()>15 or not r)or g:Covenant()=="Kyrian"and(C.ResonatingArrow:CooldownRemains()<5 or C.ResonatingArrow:CooldownRemains()>20 or not r)or h:TimeToDie()<15 or g:Covenant()~="Night Fae"and g:Covenant()~="Kyrian")then if p(C.BestialWrath,nil)then Q=19574;return"Bestial Wrath (ST)"end end;if C.ChimaeraShot:IsCastable()then if p(C.ChimaeraShot,nil,nil,not M)then Q=53209;return"Chimaera Shot (ST)"end end;if C.KillCommand:IsReady()and O then if p(C.KillCommand)then Q=34026;return"Kill Command (ST)"end end;if C.BagofTricks:IsCastable()and(g:BuffDown(C.BestialWrathBuff)or h:TimeToDie()<5)then if p(C.BagofTricks,nil,nil,not M)then Q=312411;return"Bag of Tricks (ST)"end end;if C.DireBeast:IsReady()then if p(C.DireBeast,nil,nil,not M)then Q=120679;return"Dire Beast (ST)"end end;if C.CobraShot:IsReady()and(g:Focus()-C.CobraShot:Cost()+g:FocusRegen()*(C.KillCommand:CooldownRemains()-1)>C.KillCommand:Cost()or C.KillCommand:CooldownRemains()>1+P or(g:BuffUp(C.BestialWrathBuff)or g:BuffUp(C.NesingwarysTrappingApparatusBuff))and not I or h:TimeToDie()<3)then if p(C.CobraShot,nil,nil,not M)then Q=193455;return"Cobra Shot (ST)"end end;if C.BarbedShot:IsCastable()and(g:BuffUp(C.WildSpiritsBuff)or C.BarbedShot:ChargesFractional()>1.2 and C.Bloodletting:ConduitEnabled())then if p(C.BarbedShot,nil,nil,not M)then Q=217200;return"Barbed Shot (ST - 3)"end end end;local function a4()if C.Stomp:IsAvailable()then d.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")else d.SplashEnemies.ChangeFriendTargetsTracking("All")end;t=HeroRotationCharDB.Toggles[6]r=HeroRotationCharDB.Toggles[4]s=HeroRotationCharDB.Toggles[5]u=HeroRotationCharDB.Toggles[12]v=not HeroRotationCharDB.Toggles[15]w=HeroRotationCharDB.Toggles[120]local a5,a6=GetInventoryItemID("player",13)local a7,a6=GetInventoryItemID("player",14)T()if R>0 then R=0 end;if Q>0 then Q=0 end;local a8=C.BloodBolt:IsPetKnown()and l.FindBySpellID(C.BloodBolt:ID())and C.BloodBolt or C.Bite:IsPetKnown()and l.FindBySpellID(C.Bite:ID())and C.Bite or C.Claw:IsPetKnown()and l.FindBySpellID(C.Claw:ID())and C.Claw or C.Smack:IsPetKnown()and l.FindBySpellID(C.Smack:ID())and C.Smack or nil;local a9=C.Growl:IsPetKnown()and l.FindBySpellID(C.Growl:ID())and C.Growl or nil;if n()then J=g:GetEnemiesInRange(40)L=a8 and#g:GetEnemiesInSpellActionRange(a8)or h:GetEnemiesInSplashRangeCount(8)else J={}L=0 end;M=h:IsInRange(40)N=h:IsInRange(30)O=a9 and h:IsSpellInActionRange(a9)or h:IsInRange(30)if C.Exhilaration:IsCastable()and g:HealthPercentage()<=B.Commons.ExhilarationHP then if p(C.Exhilaration,nil)then Q=109304;return"Exhilaration"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if C.CobraShot:IsCastable()and f("mouseover"):IsInMeleeRange(8)then if p(C.CobraShot,nil)then R=1193455;return"explosive MO SWD"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if C.CobraShot:IsCastable()and h:IsInMeleeRange(8)then if p(C.CobraShot,nil)then Q=193455;return"explosive  SWD"end end end;x={228318,178658,333227,334800,334967,324737,326450,334470,326450,320703,320012,324085,333241,331510}if UnitExists("target")then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for aa=0,40 do local a6,a6,ab,type,a6,a6,a6,a6,a6,ac=UnitBuff("target",aa)for a6,ad in pairs(x)do if ad==ac then if m.Cast(C.TranqualizingShot,nil)then Q=19801;return"Tranq Enrage"end end end end end end;if m.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+m.GUISettings.General.OpenerReset elseif m.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)m.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if w and C.Bindingshot:IsAvailable()and C.Bindingshot:CooldownRemains(BypassRecovery)<=0 then if m.Cast(C.Bindingshot,nil,nil,nil)then Q=109248;return"queue Binding Shot"end elseif(not C.Bindingshot:IsUsableP()or C.Bindingshot:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[120]=not HeroRotationCharDB.Toggles[120]m.Print("Binding Shot Queue is now "..(HeroRotationCharDB.Toggles[120]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if i:IsDeadOrGhost()and C.RevivePet:IsCastable()then if p(C.RevivePet,nil)then Q=982;return"Revive Pet"end end;if C.SummonPet:IsCastable()then if B.Commons.SummonPetSlot==1 then if p(D[B.Commons.SummonPetSlot],nil)then Q=883;return"Summon Pet"end elseif B.Commons.SummonPetSlot==2 then if p(D[B.Commons.SummonPetSlot],nil)then Q=83242;return"Summon Pet"end elseif B.Commons.SummonPetSlot==3 then if p(D[B.Commons.SummonPetSlot],nil)then Q=83243;return"Summon Pet"end elseif B.Commons.SummonPetSlot==4 then if p(D[B.Commons.SummonPetSlot],nil)then Q=83244;return"Summon Pet"end elseif B.Commons.SummonPetSlot==5 then if p(D[B.Commons.SummonPetSlot],nil)then Q=83245;return"Summon Pet"end end end;local ae,af,a6=GetSpellCooldown(34477)if g:AffectingCombat()then if ae+af-GetTime()<=0 and C.Misdirection:IsAvailable()and C.Misdirection:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and(UnitInParty("focus")or UnitInRaid("focus")or UnitIsUnit("focus","pet"))and IsItemInRange(32698,"focus")then if m.Cast(C.Misdirection)then R=134477;return"MD Focus"end end end;if C.AnimalCompanion:IsAvailable()and A.PetTable.LastPetSpellCount==1 and g:AffectingCombat()then q(C.AnimalCompanion)end;if not i:IsDeadOrGhost()and C.MendPet:IsCastable()and i:HealthPercentage()<=B.Commons.MendPetHighHP then if p(C.MendPet)then Q=1982;return"Mend Pet High Priority"end end;if not g:AffectingCombat()and t then G=a0()if G then return G end end;if z.TargetIsValid()and(g:AffectingCombat()or t)then G=z.Interrupt(40,C.CounterShot,nil,S)if G then Q=147362;return G end;if o()and B.Commons.Enabled.Trinkets and(g:BuffRemains(C.AspectoftheWildBuff)>10 or C.AspectoftheWild:CooldownRemains()>60 or h:TimeToDie()<20)then local ag=g:GetUseableTrinkets(F)if ag then if p(ag,nil,nil)then if ag:ID()==a5 then Q=24;return"Generic use_items for "..ag:Name()elseif ag:ID()==a7 then Q=30;return"Generic use_items for "..ag:Name()end end end end;if o()then G=a1()if G then return G end end;if L>1 then G=a2()else G=a3()end;if G then return G end;if not i:IsDeadOrGhost()and C.MendPet:IsCastable()and i:HealthPercentage()<=B.Commons.MendPetLowHP then if p(C.MendPet)then Q=1982;return"Mend Pet Low Priority (w/ Target)"end end;if p(C.PoolFocus)then Q=999999;return"Pooling Focus"end end;if not i:IsDeadOrGhost()and C.MendPet:IsCastable()and i:HealthPercentage()<=B.Commons.MendPetLowHP then if p(C.MendPet)then Q=1982;return"Mend Pet Low Priority (w/o Target)"end end end;local function ah()d.Print("BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")end;function ReturnSpell1()if Q==0 then return 0 else return Q end end;function ReturnSpellMO1()if R==0 then return 0 else return R end end;m.SetAPL(253,a4,ah)