local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.MultiSpell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=HeroRotationCharDB.Toggles[4]local p=HeroRotationCharDB.Toggles[5]local q=HeroRotationCharDB.Toggles[12]local r=not HeroRotationCharDB.Toggles[15]local s=HeroRotationCharDB.Toggles[21]local t=HeroRotationCharDB.Toggles[52]local u=HeroRotationCharDB.Toggles[22]local v=HeroRotationCharDB.Toggles[23]local w=HeroRotationCharDB.Toggles[24]local x=HeroRotationCharDB.Toggles[25]local y=HeroRotationCharDB.Toggles[27]local z=HeroRotationCharDB.Toggles[50]local A=HeroRotationCharDB.Toggles[51]local B=HeroRotationCharDB.Toggles[53]local C=HeroRotationCharDB.Toggles[30]local D=HeroRotationCharDB.Toggles[54]local E=HeroRotationCharDB.Toggles[190]local F=0;local G=g:GetEquipment()local H=k(0)local I=k(0)local J=GetInventoryItemID("player",13)local K=GetInventoryItemID("player",14)if G[13]then H=k(G[13])end;if G[14]then I=k(G[14])end;local L={324736,228318,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,331510,344739,368477,368396,355057,356133,342139,353706,355782,327155,158337}local M=math.min;local N=math.max;local O=math.abs;local P=nil;local Q=nil;local J=GetInventoryItemID("player",13)local K=GetInventoryItemID("player",14)local R;local S;local T;local U;local V=l.Commons.Everyone;local W=l.Commons.Rogue;local X={General=l.GUISettings.General,Commons=l.GUISettings.APL.Rogue.Commons,Commons2=l.GUISettings.APL.Rogue.Commons2,Outlaw=l.GUISettings.APL.Rogue.Outlaw}local Y=i.Rogue.Outlaw;local Z=k.Rogue.Outlaw;local _={Z.ManicGrieftorch:ID(),Z.DragonfireBombDispenser:ID(),Z.BeaconToTheBeyond:ID()}local a0,a1,a2;local a3;local a4=6;local a5;local a6,a7,a8;local a9,aa,ab,ac,ad;local ae={{Y.Blind,"Cast Blind (Interrupt)",function()return true end}}local af=W.ReturnSpell()local ag=W.ReturnSpellMO()local ah=0;local function ai(aj)if aj then return 1 else return 0 end end;local function ak()return g:BuffUp(Y.SliceandDice)or g:BuffUp(Y.AdrenalineRush)end;local al,am=0,0;local function an(ao)local ap=g:EnergyTimeToMaxPredicted(nil,ao)if ap<al or ap-al>0.5 then al=ap end;return al end;local function aq()local ar=g:EnergyPredicted()if ar>am or ar-am>9 then am=ar end;return am end;local as={Y.Broadside,Y.BuriedTreasure,Y.GrandMelee,Y.RuthlessPrecision,Y.SkullandCrossbones,Y.TrueBearing}local function at()if not e.APLVar.RtB_Buffs then e.APLVar.RtB_Buffs={}e.APLVar.RtB_Buffs.Total=0;e.APLVar.RtB_Buffs.Normal=0;e.APLVar.RtB_Buffs.Shorter=0;e.APLVar.RtB_Buffs.Longer=0;local au=W.RtBRemains()for av=1,#as do local aw=g:BuffRemains(as[av])if aw>0 then e.APLVar.RtB_Buffs.Total=e.APLVar.RtB_Buffs.Total+1;if aw==au then e.APLVar.RtB_Buffs.Normal=e.APLVar.RtB_Buffs.Normal+1 elseif aw>au then e.APLVar.RtB_Buffs.Longer=e.APLVar.RtB_Buffs.Longer+1 else e.APLVar.RtB_Buffs.Shorter=e.APLVar.RtB_Buffs.Shorter+1 end end end end;return e.APLVar.RtB_Buffs.Total end;local function ax()if not e.APLVar.RtB_Reroll then if X.Outlaw.RolltheBonesLogic=="1+ Buff"then e.APLVar.RtB_Reroll=at()<=0 and true or false elseif X.Outlaw.RolltheBonesLogic=="Broadside"then e.APLVar.RtB_Reroll=not g:BuffUp(Y.Broadside)and true or false elseif X.Outlaw.RolltheBonesLogic=="Buried Treasure"then e.APLVar.RtB_Reroll=not g:BuffUp(Y.BuriedTreasure)and true or false elseif X.Outlaw.RolltheBonesLogic=="Grand Melee"then e.APLVar.RtB_Reroll=not g:BuffUp(Y.GrandMelee)and true or false elseif X.Outlaw.RolltheBonesLogic=="Skull and Crossbones"then e.APLVar.RtB_Reroll=not g:BuffUp(Y.SkullandCrossbones)and true or false elseif X.Outlaw.RolltheBonesLogic=="Ruthless Precision"then e.APLVar.RtB_Reroll=not g:BuffUp(Y.RuthlessPrecision)and true or false elseif X.Outlaw.RolltheBonesLogic=="True Bearing"then e.APLVar.RtB_Reroll=not g:BuffUp(Y.TrueBearing)and true or false else e.APLVar.RtB_Reroll=false;at()if at()<=2 and g:BuffUp(Y.BuriedTreasure)and g:BuffDown(Y.GrandMelee)and a2<2 then e.APLVar.RtB_Reroll=true end;if Y.Crackshot:IsAvailable()and Y.HiddenOpportunity:IsAvailable()and not g:HasTier(31,4)and(not g:BuffUp(Y.TrueBearing)and Y.HiddenOpportunity:IsAvailable()or not g:BuffUp(Y.Broadside)and not Y.HiddenOpportunity:IsAvailable())and at()<=1 then e.APLVar.RtB_Reroll=true end;if Y.Crackshot:IsAvailable()and g:HasTier(31,4)and at()<=1+ai(g:BuffUp(Y.LoadedDiceBuff))then e.APLVar.RtB_Reroll=true end;if not Y.Crackshot:IsAvailable()and Y.HiddenOpportunity:IsAvailable()and not g:BuffUp(Y.SkullandCrossbones)and(at()<2+ai(g:BuffUp(Y.GrandMelee))and a2<2)then e.APLVar.RtB_Reroll=true end;if e.APLVar.RtB_Reroll and(e.APLVar.RtB_Buffs.Longer==0 or e.APLVar.RtB_Buffs.Normal==0)and e.APLVar.RtB_Buffs.Longer>=1 and at()<5 and W.RtBRemains()<=39 and not g:StealthUp(true,true)then e.APLVar.RtB_Reroll=true end;if h:FilteredTimeToDie("<",12)or d.BossFilteredFightRemains("<",12)then e.APLVar.RtB_Reroll=false end end end;return e.APLVar.RtB_Reroll end;local function ay()return a6>=W.CPMaxSpend()-1-ai(g:StealthUp(true,true)and Y.Crackshot:IsAvailable())end;local function az()return(Y.HiddenOpportunity:IsAvailable()or a8>=2+ai(Y.ImprovedAmbush:IsAvailable())+ai(g:BuffUp(Y.Broadside)))and a9>=50 end;local function aA()return X.Commons.VanishOffensive and n()and not(V.IsSoloMode()and g:IsTanking(h))end;local function aB()return not Y.ShadowDanceTalent:IsAvailable()and Y.FanTheHammer:TalentRank()+ai(Y.QuickDraw:IsAvailable())+ai(Y.Audacity:IsAvailable())<ai(Y.CountTheOdds:IsAvailable())+ai(Y.KeepItRolling:IsAvailable())end;local function aC()return g:BuffUp(Y.BetweentheEyes)and(not Y.HiddenOpportunity:IsAvailable()or g:BuffDown(Y.AudacityBuff)and(Y.FanTheHammer:TalentRank()<2 or g:BuffDown(Y.Opportunity)))and not Y.Crackshot:IsAvailable()end;local function aD()if not s and X.Commons.VanishOffensive and S and Y.Vanish:IsCastable()and aA()and Y.HiddenOpportunity:IsAvailable()and not Y.Crackshot:IsAvailable()and not g:BuffUp(Y.Audacity)and(aB()or g:BuffStack(Y.Opportunity)<6)and az()then if l.Cast(Y.Vanish,nil)then af=1856;return"Cast Vanish (HO)"end end;if Y.Vanish:IsCastable()and S and aA()and(not Y.HiddenOpportunity:IsAvailable()or Y.Crackshot:IsAvailable())and ay()then if l.Cast(Y.Vanish,nil)then af=1856;return"Cast Vanish (Finish)"end end;if Y.ShadowDance:IsAvailable()and Y.ShadowDance:IsCastable()and Y.Crackshot:IsAvailable()and ay()and Y.Vanish:CooldownRemains()>=6 and U then if l.Cast(Y.ShadowDance,nil)then af=185313;return"Cast Shadow Dance"end end;if Y.ShadowDance:IsAvailable()and Y.ShadowDance:IsCastable()and not Y.KeepItRolling:IsAvailable()and aC()and g:BuffUp(Y.SliceandDice)and(ay()or Y.HiddenOpportunity:IsAvailable())and(not Y.HiddenOpportunity:IsAvailable()or not Y.Vanish:IsReady())and U then if l.Cast(Y.ShadowDance,nil)then af=185313;return"Cast Shadow Dance"end end;if Y.ShadowDance:IsAvailable()and Y.ShadowDance:IsCastable()and Y.KeepItRolling:IsAvailable()and aC()and(Y.KeepItRolling:CooldownRemains()<=30 or Y.KeepItRolling:CooldownRemains()>=120 and(ay()or Y.HiddenOpportunity:IsAvailable()))and U then if l.Cast(Y.ShadowDance,nil)then af=185313;return"Cast Shadow Dance"end end;if Y.Shadowmeld:IsAvailable()and Y.Shadowmeld:IsReady()and X.Commons.Racials then if Y.Crackshot:IsAvailable()and ay()or not Y.Crackshot:IsAvailable()and(Y.CountTheOdds:IsAvailable()and ay()or Y.HiddenOpportunity:IsAvailable())then if l.Cast(Y.Shadowmeld,nil)then af=58984;return"Cast Shadowmeld"end end end end;local function aE()if R and Y.AdrenalineRush:IsCastable()and(not g:BuffUp(Y.AdrenalineRush)or g:StealthUp(true,true)and Y.Crackshot:IsAvailable()and Y.ImprovedAdrenalineRush:IsAvailable())and(a7<=2 or not Y.ImprovedAdrenalineRush:IsAvailable())then if l.Cast(Y.AdrenalineRush,nil)then af=13750;return"Cast Adrenaline Rush"end end;if Y.BladeFlurry:IsReady()then local aF=a2+ai(g:BuffUp(Y.Broadside))if a2>=2-ai(Y.UnderhandedUpperhand:IsAvailable())and not g:StealthUp(true,false)and g:BuffRemains(Y.BladeFlurry)<g:GCD()or Y.DeftManeuvers:IsAvailable()and a2>=3 and aF>=a8 and not ay()then if l.Cast(Y.BladeFlurry)then af=13877;return"Cast Blade Flurry"end end end;if Y.RolltheBones:IsReady()then local aG=not g:StealthUp(true,true)or not Y.Crackshot:IsAvailable()if aG and(ax()or W.RtBRemains()<=ai(g:HasTier(31,4))+ai(Y.ShadowDance:CooldownRemains()<=1 or Y.Vanish:CooldownRemains()<=1)*6)then if l.Cast(Y.RolltheBones)then af=315508;return"Cast Roll the Bones"end end end;if Y.KeepItRolling:IsReady()and not ax()and at()>=3+ai(g:HasTier(31,4))and(g:BuffDown(Y.ShadowDance)or at()>=6)then if l.Cast(Y.KeepItRolling,nil)then af=381989;return"Cast Keep it Rolling"end end;if Y.GhostlyStrike:IsAvailable()and Y.GhostlyStrike:IsReady()and T then if l.Cast(Y.GhostlyStrike,nil)then af=196937;return"Cast Ghostly Strike"end end;if n()and Y.Sepsis:IsAvailable()and Y.Sepsis:IsReady()then if Y.Crackshot:IsAvailable()and Y.BetweentheEyes:IsReady()and ay()and not g:StealthUp(true,true)or not Y.Crackshot:IsAvailable()and h:FilteredTimeToDie(">",11)and g:BuffUp(Y.BetweentheEyes)or d.BossFilteredFightRemains("<",11)then if l.Cast(Y.Sepsis,nil)then af=328305;return"Cast Sepsis"end end end;if Y.BladeRush:IsReady()and ac>4 and not g:StealthUp(true,true)then if l.Cast(Y.BladeRush,nil)then af=271877;return"Cast Blade Rush"end end;if not g:StealthUp(true,true,true)then a3=aD()if a3 then return a3 end end;if n()and Y.ThistleTea:IsCastable()and not g:BuffUp(Y.ThistleTea)and(ab>=100 or d.BossFilteredFightRemains("<",Y.ThistleTea:Charges()*6))then if l.Cast(Y.ThistleTea,nil)then af=381623;return"Cast Thistle Tea"end end;if X.Commons.Enabled.Potions then local aH=V.PotionSelected()if aH then if aH:IsReady()and n()and r and(g:BloodlustUp()and l.GUISettings.General.HoldPotforBL or(g:BloodlustUp()or d.BossFightRemains()<=60 or g:BuffUp(Y.AdrenalineRush))and not l.GUISettings.General.HoldPotforBL)then if l.Cast(aH,nil)then af=50;return"potion cooldowns 2"end end end end;if Y.BloodFury:IsCastable()then if l.Cast(Y.BloodFury,nil)then af=20572;return"Cast Blood Fury"end end;if Y.Berserking:IsCastable()then if l.Cast(Y.Berserking,nil)then af=26297;return"Cast Berserking"end end;if Y.Fireblood:IsCastable()then if l.Cast(Y.Fireblood,nil)then af=265221;return"Cast Fireblood"end end;if Y.AncestralCall:IsCastable()then if l.Cast(Y.AncestralCall,nil)then af=274738;return"Cast Ancestral Call"end end;if X.Commons.Enabled.BottomTrinket or X.Commons.Enabled.TopTrinket then if Z.ManicGrieftorch:IsEquippedAndReady()then if g:GCDRemains()>g:GCD()-0.1 and not g:StealthUp(true,true)and g:BuffUp(Y.BetweentheEyes)or d.BossFilteredFightRemains("<=",5)then if l.Cast(Z.ManicGrieftorch,nil,nil)then if Z.BalefireBranch:ID()==J then af=24;return"Manic Grieftorch top"elseif Z.ManicGrieftorch:ID()==K then af=30;return"Manic Grieftorch bop"end end end end;if Z.DragonfireBombDispenser:IsEquippedAndReady()then if not H:ID()==Z.DragonfireBombDispenser:ID()and H:CooldownRemains()>10 or I:CooldownRemains()>10 or d.BossFilteredFightRemains("<",20)or not I:HasCooldown()or not H:HasCooldown()then if l.Cast(Z.DragonfireBombDispenser,nil,nil)then if Z.DragonfireBombDispenser:ID()==J then af=24;return"Dragonfire Bomb Dispenser top"elseif Z.DragonfireBombDispenser:ID()==K then af=30;return"Dragonfire Bomb Dispenser bop"end end end end;if Z.BeaconToTheBeyond:IsEquippedAndReady()then if not g:StealthUp(true,true)and g:BuffUp(Y.BetweentheEyes)or d.BossFilteredFightRemains("<",5)then if l.Cast(Z.DragonfireBombDispenser,nil,nil)then if Z.DragonfireBombDispenser:ID()==J then af=24;return"Beacon top"elseif Z.DragonfireBombDispenser:ID()==K then af=30;return"Beacon bop"end end end end;local aI=g:GetUseableTrinkets(_)aI=g:GetUseableTrinkets(_)if aI and(n()and not g:StealthUp(true,true)or d.BossFilteredFightRemains("<",10))then if aI then if l.Cast(aI,nil,nil)then if aI:ID()==GetInventoryItemID("player",13)and X.Commons.Enabled.TopTrinket then af=24;return"Generic use_items for "..aI:Name()elseif aI:ID()==GetInventoryItemID("player",14)and X.Commons.Enabled.BottomTrinket then af=25;return"Generic use_items for "..aI:Name()end end end end end end;local function aJ()if Y.BladeFlurry:IsReady()and Y.BladeFlurry:IsCastable()and m()and Y.Subterfuge:IsAvailable()and Y.HiddenOpportunity:IsAvailable()and a2>=2 and g:BuffRemains(Y.BladeFlurry)<=g:GCDRemains()then if l.Cast(Y.BladeFlurry)then af=13877;return"Cast Blade Flurry"end end;if Y.ColdBlood:IsCastable()and g:BuffDown(Y.ColdBlood)and h:IsSpellInRange(Y.Dispatch)and ay()then if l.Cast(Y.ColdBlood,nil)then af=382245;return"Cast Cold Blood"end end;if Y.BetweentheEyes:IsCastable()and h:IsSpellInRange(Y.BetweentheEyes)and ay()and Y.Crackshot:IsAvailable()then if l.CastPooling(Y.BetweentheEyes)then af=315341;return"Cast Between the Eyes"end end;if Y.Dispatch:IsCastable()and h:IsSpellInRange(Y.Dispatch)and ay()then if l.CastPooling(Y.Dispatch)then af=2098;return"Cast Dispatch"end end;if Y.PistolShot:IsCastable()and h:IsSpellInRange(Y.PistolShot)and Y.Crackshot:IsAvailable()and Y.FanTheHammer:TalentRank()>=2 and g:BuffStack(Y.Opportunity)>=6 and(g:BuffUp(Y.Broadside)and a7<=1 or g:BuffUp(Y.GreenskinsWickersBuff))then if l.CastPooling(Y.PistolShot)then af=185763;return"Cast Pistol Shot"end end;if Y.Ambush:IsCastable()and h:IsSpellInRange(Y.Ambush)and Y.HiddenOpportunity:IsAvailable()then if l.CastPooling(Y.Ambush)then af=8676;return"Cast Ambush"end end end;local function aK()if Y.BetweentheEyes:IsCastable()and h:IsSpellInRange(Y.BetweentheEyes)and not Y.Crackshot:IsAvailable()and(g:BuffRemains(Y.BetweentheEyes)<4 or Y.ImprovedBetweenTheEyes:IsAvailable()or Y.GreenskinsWickers:IsAvailable()or g:HasTier(30,4))and g:BuffDown(Y.GreenskinsWickers)then if l.CastPooling(Y.BetweentheEyes)then af=315341;return"Cast Between the Eyes"end end;if Y.BetweentheEyes:IsCastable()and h:IsSpellInRange(Y.BetweentheEyes)and Y.Crackshot:IsAvailable()and(Y.Vanish:CooldownRemains()>45 and Y.ShadowDance:CooldownRemains()>12)then if l.CastPooling(Y.BetweentheEyes)then af=315341;return"Cast Between the Eyes"end end;if Y.SliceandDice:IsCastable()and(d.FilteredFightRemains(a1,">",g:BuffRemains(Y.SliceandDice),true)or g:BuffRemains(Y.SliceandDice)==0)and g:BuffRemains(Y.SliceandDice)<(1+a7)*1.8 then if l.CastPooling(Y.SliceandDice)then af=315496;return"Cast Slice and Dice"end end;if Y.KillingSpree:IsCastable()and h:IsSpellInRange(Y.KillingSpree)and(h:DebuffUp(Y.GhostlyStrike)or not Y.GhostlyStrike:IsAvailable())then if l.Cast(Y.KillingSpree)then af=51690;return"Cast Killing Spree"end end;if Y.ColdBlood:IsCastable()and g:BuffDown(Y.ColdBlood)and h:IsSpellInRange(Y.Dispatch)then if l.Cast(Y.ColdBlood,nil)then af=382245;return"Cast Cold Blood"end end;if Y.Dispatch:IsCastable()and h:IsSpellInRange(Y.Dispatch)then if l.CastPooling(Y.Dispatch)then af=2098;return"Cast Dispatch"end end end;local function aL()if n()and Y.EchoingReprimand:IsReady()then if l.Cast(Y.EchoingReprimand,nil,nil)then af=323547;return"Cast Echoing Reprimand"end end;if Y.Ambush:IsCastable()and Y.HiddenOpportunity:IsAvailable()and g:BuffUp(Y.AudacityBuff)then if l.CastPooling(Y.Ambush)then af=8676;return"Cast Ambush (High-Prio Buffed)"end end;if Y.FanTheHammer:IsAvailable()and Y.Audacity:IsAvailable()and Y.HiddenOpportunity:IsAvailable()and g:BuffUp(Y.Opportunity)and g:BuffDown(Y.AudacityBuff)then if l.CastPooling(Y.PistolShot)then af=185763;return"Cast Pistol Shot (Audacity)"end end;if g:BuffUp(Y.GreenskinsWickersBuff)and(not Y.FanTheHammer:IsAvailable()and g:BuffUp(Y.Opportunity)or g:BuffRemains(Y.GreenskinsWickersBuff)<1.5)then if l.CastPooling(Y.PistolShot)then af=185763;return"Cast Pistol Shot (GSW Dump)"end end;if Y.FanTheHammer:IsAvailable()and g:BuffUp(Y.Opportunity)and(g:BuffStack(Y.Opportunity)>=6 or g:BuffRemains(Y.Opportunity)<2)then if l.CastPooling(Y.PistolShot)then af=185763;return"Cast Pistol Shot (FtH Dump)"end end;if Y.FanTheHammer:IsAvailable()and g:BuffUp(Y.Opportunity)and a8>1+ai(Y.QuickDraw:IsAvailable())*Y.FanTheHammer:TalentRank()and(not Y.Vanish:IsReady()and not Y.ShadowDance:IsReady()or g:StealthUp(true,true)or not Y.Crackshot:IsAvailable()or Y.FanTheHammer:TalentRank()<=1)then if l.CastPooling(Y.PistolShot)then af=185763;return"Cast Pistol Shot"end end;if not Y.FanTheHammer:IsAvailable()and g:BuffUp(Y.Opportunity)and(ac>1.5 or a8<=1+ai(g:BuffUp(Y.Broadside))or Y.QuickDraw:IsAvailable()or Y.Audacity:IsAvailable()and g:BuffDown(Y.AudacityBuff))then if l.CastPooling(Y.PistolShot)then af=185763;return"Cast Pistol Shot"end end;if Y.SinisterStrike:IsCastable()and h:IsSpellInRange(Y.SinisterStrike)then if l.CastPooling(Y.SinisterStrike)then af=193315;return"Cast Sinister Strike"end end end;local function aM()p=HeroRotationCharDB.Toggles[5]o=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[12]r=not HeroRotationCharDB.Toggles[15]s=HeroRotationCharDB.Toggles[21]u=HeroRotationCharDB.Toggles[22]v=HeroRotationCharDB.Toggles[23]w=HeroRotationCharDB.Toggles[24]x=HeroRotationCharDB.Toggles[25]y=HeroRotationCharDB.Toggles[27]z=HeroRotationCharDB.Toggles[50]A=HeroRotationCharDB.Toggles[51]t=HeroRotationCharDB.Toggles[52]B=HeroRotationCharDB.Toggles[53]C=HeroRotationCharDB.Toggles[30]D=HeroRotationCharDB.Toggles[54]E=HeroRotationCharDB.Toggles[190]J=GetInventoryItemID("player",13)K=GetInventoryItemID("player",14)if not X.Commons.Enabled.TopTrinket and not X.Commons.Enabled.BottomTrinket then _={J,K}elseif not X.Commons.Enabled.TopTrinket and X.Commons.Enabled.BottomTrinket then _={J}elseif not X.Commons.Enabled.BottomTrinket and X.Commons.Enabled.TopTrinket then _={K}end;R=false;S=false;T=false;U=false;if X.Outlaw.AdrenalineRushCD=="CDs"and n()or X.Outlaw.AdrenalineRushCD=="Small CDs"and o or X.Outlaw.AdrenalineRushCD=="Always"then R=true end;if X.Outlaw.VanishCD=="CDs"and n()or X.Outlaw.VanishCD=="Small CDs"and o or X.Outlaw.VanishCD=="Always"then S=true end;if X.Outlaw.GhostlyStrikeCD=="CDs"and n()or X.Outlaw.GhostlyStrikeCD=="Small CDs"and o or X.Outlaw.GhostlyStrikeCD=="Always"then T=true end;if X.Outlaw.ShadowDanceCD=="CDs"and n()or X.Outlaw.ShadowDanceCD=="Small CDs"and o or X.Outlaw.ShadowDanceCD=="Always"then U=true end;F=0;for av=1,20 do if select(10,UnitDebuff("player",av))==240447 then if select(6,UnitDebuff("player",av))~=nil then F=select(6,UnitDebuff("player",av))-GetTime()end end end end;a1=g:GetEnemiesInRange(a4,Y.SinisterStrike)local function aN()local aO=l.Common.Everyone;local aP=aO.WhiteList()a4=Y.AcrobaticStrikes:IsAvailable()and 9 or 6;a7=g:ComboPoints()a6=W.EffectiveComboPoints(a7)a8=g:ComboPointsDeficit()ad=g:BuffUp(Y.AdrenalineRush,nil,true)and-50 or 0;a9=aq()aa=g:EnergyRegen()ac=an(ad)ab=g:EnergyDeficitPredicted(nil,ad)if m()then a0=g:GetEnemiesInRange(30)a1=g:GetEnemiesInRange(a4)a2=#a1 else a2=1 end;a3=aM()if l.QueuedCast()then af=l.QueuedCast()return"Custom Queue "..i(af):ID()end;if a3 then return a3 end;if ag>0 then ag=0 end;if af>0 then af=0 end;af=W.ReturnSpell()ag=W.ReturnSpellMO()if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[5]then P=GetTime()Q=P+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and Q~=nil and GetTime()>Q and HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]l.ToggleIconFrame:UpdateButtonText(5)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[5]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if B and Y.GrapplingHook:IsUsableP()and Y.GrapplingHook:CooldownRemains(BypassRecovery)<=0 then if l.Cast(Y.GrapplingHook,nil,nil,nil)then af=195457;return"queue Grappling Hook"end elseif(not Y.GrapplingHook:IsUsableP()or Y.GrapplingHook:CooldownRemains()>0)and B then HeroRotationCharDB.Toggles[53]=not HeroRotationCharDB.Toggles[53]l.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[53]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if u and Y.CheapShot:IsUsableP()and Y.CheapShot:CooldownRemains(BypassRecovery)<=0 and(g:StealthUp(true,true)or g:BuffUp(Y.VanishBuff))and(h:IsInRange(8)or f("mouseover"):IsInRange(8))then if l.Cast(Y.CheapShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.CheapShot)then ag=18335;return"queue Cheap Shot MO"else af=1833;return"queue Cheap Shot"end end elseif(not Y.CheapShot:IsUsableP()or Y.CheapShot:CooldownRemains()>0)and u then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]l.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if v and Y.KidneyShot:IsUsableP()and Y.KidneyShot:CooldownRemains(BypassRecovery)<=0 and(h:IsInRange(8)or f("mouseover"):IsInRange(8))then if l.Cast(Y.KidneyShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.KidneyShot)then ag=4085;return"queue Kidney Shot MO"else af=408;return"queue Kidney Shot"end end elseif(not Y.KidneyShot:IsUsableP()or Y.KidneyShot:CooldownRemains()>0)and v then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]l.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if w and Y.Blind:IsUsableP()and Y.Blind:CooldownRemains(BypassRecovery)<=0 and(h:IsInRange(15)or f("mouseover"):IsInRange(15))then if l.Cast(Y.Blind,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.Blind)then ag=20945;return"queue Blind MO"end end elseif(not Y.Blind:IsUsableP()or Y.Blind:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]l.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and Y.Sap:IsUsableP()and Y.Sap:CooldownRemains(BypassRecovery)<=0 and g:StealthUp(true,true)and(h:IsInRange(10)or f("mouseover"):IsInRange(10))then if l.Cast(Y.Sap,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.Sap)then ag=67705;return"queue Sap MO"else af=6770;return"queue Sap"end end elseif(not Y.Sap:IsUsableP()or Y.Sap:CooldownRemains()>0 or not g:StealthUp(true,true))and x then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]l.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and Y.Feint:IsUsableP()and Y.Feint:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()and not g:PrevGCD(1,Y.Feint)then if l.Cast(Y.Feint,nil,nil,nil)then af=202;return"queue Feint"end elseif(not Y.Feint:IsUsableP()or Y.Feint:CooldownRemains()>0 or not g:AffectingCombat())and y then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]l.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A and Y.BladeRush:IsUsableP()and Y.BladeRush:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.BladeRush,nil,nil,nil)then af=271877;return"queue BladeRush"end elseif(not Y.BladeRush:IsUsableP()or Y.BladeRush:CooldownRemains()>0 or not g:AffectingCombat())and A then HeroRotationCharDB.Toggles[51]=not HeroRotationCharDB.Toggles[51]l.Print("BladeRush que is now "..(HeroRotationCharDB.Toggles[51]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and Y.Gouge:IsUsableP()and Y.Gouge:CooldownRemains(BypassRecovery)<=0 then if l.Cast(Y.Gouge,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Y.Gouge)then ag=17765;return"queue Gouge MO"elseif f("target"):IsSpellInRange(Y.Gouge)then af=1776;return"queue Gouge"end end elseif(not Y.Gouge:IsUsableP()or Y.Gouge:CooldownRemains()>0 or not g:AffectingCombat())and z then HeroRotationCharDB.Toggles[50]=not HeroRotationCharDB.Toggles[50]l.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[50]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if E and Y.BladeFlurry:IsUsableP()and Y.BladeFlurry:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.BladeFlurry,nil,nil,nil)then af=13877;return"queue BladeFlurry"end elseif(not Y.BladeFlurry:IsUsableP()or Y.BladeFlurry:CooldownRemains()>0 or not g:AffectingCombat())and E then HeroRotationCharDB.Toggles[190]=not HeroRotationCharDB.Toggles[190]l.Print("BladeFlurry que is now "..(HeroRotationCharDB.Toggles[190]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if C then if Y.ArcaneTorrent:IsAvailable()and Y.ArcaneTorrent:IsUsableP()and Y.ArcaneTorrent:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.ArcaneTorrent,nil,nil,nil)then af=155145;return"queue ArcaneTorrent Queue"end elseif Y.LightsJudgment:IsAvailable()and Y.LightsJudgment:IsUsableP()and Y.LightsJudgment:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.LightsJudgment,nil,nil,nil)then af=255647;return"queue LightsJudgment Queue"end elseif Y.BagofTricks:IsAvailable()and Y.BagofTricks:IsUsableP()and Y.BagofTricks:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.BagofTricks,nil,nil,nil)then af=312411;return"queue BagofTricks Queue"end elseif Y.BloodFury:IsAvailable()and Y.BloodFury:IsUsableP()and Y.BloodFury:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.BloodFury,nil,nil,nil)then af=20572;return"queue BloodFury Queue"end elseif Y.Berserking:IsAvailable()and Y.Berserking:IsUsableP()and Y.Berserking:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.Berserking,nil,nil,nil)then af=26297;return"queue Berserking Queue"end elseif Y.Fireblood:IsAvailable()and Y.Fireblood:IsUsableP()and Y.Fireblood:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.Fireblood,nil,nil,nil)then af=265221;return"queue Fireblood Queue"end elseif Y.AncestralCall:IsAvailable()and Y.AncestralCall:IsUsableP()and Y.AncestralCall:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Y.AncestralCall,nil,nil,nil)then af=274738;return"queue AncestralCall Queue"end elseif(Y.ArcaneTorrent:IsAvailable()and(not Y.ArcaneTorrent:IsUsableP()or Y.ArcaneTorrent:CooldownRemains()>0 or not g:AffectingCombat())or Y.LightsJudgment:IsAvailable()and(not Y.LightsJudgment:IsUsableP()or Y.LightsJudgment:CooldownRemains()>0 or not g:AffectingCombat())or Y.BagofTricks:IsAvailable()and(not Y.BagofTricks:IsUsableP()or Y.BagofTricks:CooldownRemains()>0 or not g:AffectingCombat())or Y.BloodFury:IsAvailable()and(not Y.BloodFury:IsUsableP()or Y.BloodFury:CooldownRemains()>0 or not g:AffectingCombat())or Y.Berserking:IsAvailable()and(not Y.Berserking:IsUsableP()or Y.Berserking:CooldownRemains()>0 or not g:AffectingCombat())or Y.Fireblood:IsAvailable()and(not Y.Fireblood:IsUsableP()or Y.Fireblood:CooldownRemains()>0 or not g:AffectingCombat())or Y.AncestralCall:IsAvailable()and(not Y.AncestralCall:IsUsableP()or Y.AncestralCall:CooldownRemains()>0 or not g:AffectingCombat()))and C then HeroRotationCharDB.Toggles[30]=not HeroRotationCharDB.Toggles[30]l.Print("Arcane Torrent Queue is now "..(HeroRotationCharDB.Toggles[30]and"|cff00ff00on|r."or"|cffff0000off|r."))end end;if g:IsChanneling(i(324631))then if l.Cast(Y.PoolEnergy,nil,nil,nil)then af=99999;return"channeling Fleashcraft"end end;a3=W.CrimsonVial()if a3 then return a3 end;a3=W.Feint()if a3 then return a3 end;a3=W.Evasion()if a3 then return a3 end;if g:HealthPercentage()<X.Commons.PhialHP and Z.PhialofSerenity:IsReady()and Z.PhialofSerenity:CooldownRemains()<=0 then if l.Cast(Z.PhialofSerenity,nil)then af=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<X.Commons.HealthstoneHP and Z.Healthstone:IsReady()and Z.Healthstone:CooldownRemains()<=0 then if l.Cast(Z.Healthstone,nil)then af=40;return"Healthstone HP"end end;if g:HealthPercentage()<X.Commons.HealPotHP and Z.CosmicHealPot:IsReady()and Z.CosmicHealPot:CooldownRemains()<=0 then if l.Cast(Z.CosmicHealPot,nil)then af=45;return"CosmicHealPot HP"end end;if g:HealthPercentage()<X.Commons.HealPotHP and Z.HealPotL:IsReady()and Z.HealPotL:CooldownRemains()<=0 then if l.Cast(Z.HealPotL,nil)then af=41;return"HealPot LOW HP"end end;if g:HealthPercentage()<X.Commons.HealPotHP and Z.HealPotM:IsReady()and Z.HealPotM:CooldownRemains()<=0 then if l.Cast(Z.HealPotM,nil)then af=41;return"HealPot MEDIUM HP"end end;if g:HealthPercentage()<X.Commons.HealPotHP and Z.HealPotH:IsReady()and Z.HealPotH:CooldownRemains()<=0 then if l.Cast(Z.HealPotH,nil)then af=41;return"HealPot HIGH HP"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if Y.PistolShot:IsCastable()and f("mouseover"):IsInMeleeRange(20)then if l.Cast(Y.PistolShot,nil)then ag=1185763;return"explosive MO Pistol"end end end;if Y.PistolShot:IsCastable()and f("target"):IsInMeleeRange(40)and string.find(UnitGUID("target"),120651)then if l.Cast(Y.PistolShot,nil)then af=185763;return"explosive Tar Pistol"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),408801)then if Y.Blind:IsCastable()and f("mouseover"):IsInMeleeRange(20)then if l.Cast(Y.Blind,nil)then ag=20945;return"blind MO incorporeal affix"end end end;if UnitExists("target")and Y.Shiv:IsReady()and not D then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for av=0,10 do local aQ,aQ,aR,aS,aT,aU,aQ,aQ,aQ,aV=UnitBuff("target",av)for aQ,aW in pairs(aP)do if aW==aV and aU-aT+500/1000<=GetTime()then if l.Cast(Y.Shiv,nil)then af=5938;return"Shiv Enrage"end end end end end end;local aX=g:AffectingCombat()and 180 or 900;local aY;if not g:AffectingCombat()then if i(8679):IsAvailable()and X.Commons.LethalPoison=="Wound Poison"then aY=g:BuffRemains(i(8679))if aY<aX and not g:IsCasting(i(8679))then if l.Cast(i(8679))then af=203;return"Wound Poison Refresh"end end elseif i(2823):IsAvailable()and X.Commons.LethalPoison=="Deadly Poison"then aY=g:BuffRemains(i(2823))if aY<aX and not g:IsCasting(i(2823))then if l.Cast(i(2823))then af=208;return"Deadly Poison Refresh"end end elseif i(315584):IsAvailable()and X.Commons.LethalPoison=="Instant Poison"then aY=g:BuffRemains(i(315584))if aY<aX and not g:IsCasting(i(315584))then if l.Cast(i(315584))then af=205;return"Instant Poison Refresh"end end end end;aY=g:BuffRemains(i(381637))if i(381637):IsAvailable()and X.Commons.NonLethalPoison=="Atrophic Poison"then if aY<aX and not g:IsCasting(i(381637))then if l.Cast(i(381637))then af=381637;return"Antropic Poison Refresh"end end elseif i(5761):IsAvailable()and X.Commons.NonLethalPoison=="Numbing Poison"then aY=g:BuffRemains(i(5761))if aY<aX and not g:IsCasting(NumbingPoison)then if l.Cast(i(5761))then af=204;return"Numbing Poison Refresh"end end elseif i(3408):IsAvailable()and X.Commons.NonLethalPoison=="Crippling Poison"then aY=g:BuffRemains(i(3408))if aY<aX and not g:IsCasting(NumbingPoison)then if l.Cast(i(3408))then af=206;return"Crippling Poison Refresh"end end end;if not g:BuffUp(Y.VanishBuff)and not g:AffectingCombat()and not g:StealthUp(true,true)then a3=W.Stealth(Y.Stealth)if a3 then return a3 end end;if not g:AffectingCombat()and Y.Vanish:TimeSinceLastCast()>1 then if Y.BladeFlurry:IsReady()and g:BuffDown(Y.BladeFlurry)and Y.UnderhandedUpperhand:IsAvailable()and not g:StealthUp(true,true)and ak()then if l.Cast(Y.BladeFlurry)then af=13877;return"Blade Flurry (Opener)"end end;if not g:StealthUp(true,false)then a3=W.Stealth(W.StealthSpell())if a3 then return a3 end end;if V.TargetIsValid()and(not g:AffectingCombat()and p)then if n()and Y.MarkedforDeath:IsCastable()and a8>=W.CPMaxSpend()-1 and h:NPCID()~=170234 then if X.Commons.STMfDAsDPSCD then if l.Cast(Y.MarkedforDeath,nil)then af=137619;return"Cast Marked for Death (OOC)"end else if l.Cast(Y.MarkedforDeath,nil)then af=137619;return"Cast Marked for Death (OOC)"end end end;if Y.AdrenalineRush:IsReady()and R and Y.ImprovedAdrenalineRush:IsAvailable()and a7<=2 and not Y.LoadedDiceBuff:IsAvailable()and a7<=2 then if l.Cast(Y.AdrenalineRush)then af=13750;return"Cast Adrenaline Rush (Opener)"end end;if Y.RolltheBones:IsReady()and not g:DebuffUp(Y.Dreadblades)and(at()==0 or ax())then if l.Cast(Y.RolltheBones)then af=315508;return"Cast Roll the Bones (Opener)"end end;if Y.AdrenalineRush:IsReady()and R and Y.ImprovedAdrenalineRush:IsAvailable()and a7<=2 and Y.LoadedDiceBuff:IsAvailable()and a7<=2 then if l.Cast(Y.AdrenalineRush)then af=13750;return"Cast Adrenaline Rush (Opener)"end end;if Y.SliceandDice:IsReady()and g:BuffRemains(Y.SliceandDice)<(1+a7)*1.8 then if l.CastPooling(Y.SliceandDice)then af=315496;return"Cast Slice and Dice (Opener)"end end;if g:StealthUp(true,false)or g:BuffUp(Y.VanishBuff)then a3=aJ()if a3 then return"Stealth (Opener): "..a3 end;if Y.KeepItRolling:IsAvailable()and Y.GhostlyStrike:IsReady()and Y.EchoingReprimand:IsAvailable()and T then if l.Cast(Y.GhostlyStrike)then af=196937;return"Cast Ghostly Strike KiR (Opener)"end end;if Y.Ambush:IsCastable()and Y.HiddenOpportunity:IsAvailable()then if l.Cast(Y.Ambush)then af=8676;return"Cast Ambush (Opener)"end else if Y.SinisterStrike:IsCastable()then if l.Cast(Y.SinisterStrike,nil,nil,not h:IsSpellInRange(Y.SinisterStrike))then af=193315;return"Cast Sinister Strike (Opener)"end end end elseif ay()then a3=aK()if a3 then return"Finish (Opener): "..a3 end end;if Y.SinisterStrike:IsCastable()then if l.Cast(Y.SinisterStrike)then af=193315;return"Cast Sinister Strike (Opener)"end end end;return end;if Y.FanTheHammer:IsAvailable()and Y.PistolShot:TimeSinceLastCast()<g:GCDRemains()then a7=N(a7,W.FanTheHammerCP())a6=W.EffectiveComboPoints(a7)a8=g:ComboPointsDeficit()end;if V.TargetIsValid()and(g:AffectingCombat()or p or g:BuffUp(Y.VanishBuff)or g:BuffUp(Y.VanishBuff)or g:BuffUp(Y.VanishBuff2))and not h:DebuffUp(i(6770))then if g:BuffUp(Y.Stealth)or g:BuffUp(Y.VanishBuff)or g:BuffUp(Y.Shadowmeld)then a3=aJ()if a3 then return"Stealth: "..a3 end end;local aZ,a_,aQ=GetSpellCooldown(57934)if X.Commons.AutoToT then if aZ+a_-GetTime()<=0 and Y.TricksoftheTrade:IsAvailable()and Y.TricksoftheTrade:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and not f("focus"):IsDeadOrGhost()and(UnitInParty("focus")or UnitInRaid("focus"))then if l.Cast(Y.TricksoftheTrade)then af=207;return"ToT Focus"end end end;a3=aE()if a3 then return"CDs: "..a3 end;if g:StealthUp(true,true)then a3=aJ()if a3 then return"Stealth: "..a3 end end;if ay()then a3=aK()if a3 then return"Finish: "..a3 end;l.Cast(Y.PoolEnergy)return"Finish Pooling"end;a3=aL()if a3 then return"Build: "..a3 end;if Y.ArcaneTorrent:IsCastable()and X.Commons.Enabled.Racials and n()and h:IsSpellInRange(Y.SinisterStrike)and ab>15+aa then if l.Cast(Y.ArcaneTorrent,nil)then af=155145;return"Cast Arcane Torrent"end end;if Y.ArcanePulse:IsCastable()and X.Commons.Enabled.Racials and n()and h:IsSpellInRange(Y.SinisterStrike)then if l.Cast(Y.ArcanePulse)then af=260364;return"Cast Arcane Pulse"end end;if Y.LightsJudgment:IsCastable()and X.Commons.Enabled.Racials and n()and h:IsInMeleeRange(5)then if l.Cast(Y.LightsJudgment,nil)then af=255647;return"Cast Lights Judgment"end end;if Y.BagofTricks:IsCastable()and X.Commons.Enabled.Racials and n()and h:IsInMeleeRange(5)then if l.Cast(Y.BagofTricks,nil)then af=312411;return"Cast Bag of Tricks"end end;if Y.PistolShot:IsCastable()and h:IsSpellInRange(Y.PistolShot)and not h:IsInRange(a4)and not g:StealthUp(true,true)and ab<25 and(a8>=1 or ac<=1.2)then if l.Cast(Y.PistolShot)then af=185763;return"Cast Pistol Shot (OOR)"end end end end;local function b0()if HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]l.ToggleIconFrame:UpdateButtonText(5)end end;function ReturnSpellOut()if af==0 then return 0 else return af end end;function ReturnSpellMOOut()if ag==0 then return 0 else return ag end end;l.SetAPL(260,aN,b0)