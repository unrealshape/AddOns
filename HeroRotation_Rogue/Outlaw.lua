local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=d.Spell;local j=d.MultiSpell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=HeroRotationCharDB.Toggles[4]local p=HeroRotationCharDB.Toggles[5]local q=HeroRotationCharDB.Toggles[12]local r=not HeroRotationCharDB.Toggles[15]local s=HeroRotationCharDB.Toggles[21]local t=HeroRotationCharDB.Toggles[52]local u=HeroRotationCharDB.Toggles[22]local v=HeroRotationCharDB.Toggles[23]local w=HeroRotationCharDB.Toggles[24]local x=HeroRotationCharDB.Toggles[25]local y=HeroRotationCharDB.Toggles[27]local z=HeroRotationCharDB.Toggles[50]local A=HeroRotationCharDB.Toggles[51]local B=HeroRotationCharDB.Toggles[53]local C=HeroRotationCharDB.Toggles[30]local D=HeroRotationCharDB.Toggles[54]local E=HeroRotationCharDB.Toggles[190]local F=f.MouseOver;local G=0;local H=g:GetEquipment()local I=k(0)local J=k(0)local K=GetInventoryItemID("player",13)local L=GetInventoryItemID("player",14)if H[13]then I=k(H[13])end;if H[14]then J=k(H[14])end;local M={324736,228318,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,331510,344739,368477,368396,355057,356133,342139,353706,355782,327155,158337}local N=math.min;local O=math.max;local P=math.abs;local Q=nil;local R=nil;local S;local T;local U;local V;local W=l.Commons.Everyone;local X=l.Commons.Rogue;local Y={General=l.GUISettings.General,Commons=l.GUISettings.APL.Rogue.Commons,Commons2=l.GUISettings.APL.Rogue.Commons2,Outlaw=l.GUISettings.APL.Rogue.Outlaw}local Z=i.Rogue.Outlaw;local _=k.Rogue.Outlaw;local a0={_.ManicGrieftorch:ID(),_.DragonfireBombDispenser:ID(),_.BeaconToTheBeyond:ID()}local a1,a2,a3;local a4;local a5=6;local a6;local a7,a8,a9;local aa,ab,ac,ad,ae;local af={{Z.Blind,"Cast Blind (Interrupt)",function()return true end}}local ag=X.ReturnSpell()local ah=X.ReturnSpellMO()local function ai(aj)if aj then return 1 else return 0 end end;local function ak()return g:BuffUp(Z.SliceandDice)or g:BuffUp(Z.AdrenalineRush)end;local al,am=0,0;local function an(ao)local ap=g:EnergyTimeToMaxPredicted(nil,ao)if ap<al or ap-al>0.5 then al=ap end;return al end;local function aq()local ar=g:EnergyPredicted()if ar>am or ar-am>9 then am=ar end;return am end;local as={Z.Broadside,Z.BuriedTreasure,Z.GrandMelee,Z.RuthlessPrecision,Z.SkullandCrossbones,Z.TrueBearing}local function at()if not e.APLVar.RtB_Buffs then e.APLVar.RtB_Buffs={}e.APLVar.RtB_Buffs.Total=0;e.APLVar.RtB_Buffs.Normal=0;e.APLVar.RtB_Buffs.Shorter=0;e.APLVar.RtB_Buffs.Longer=0;local au=X.RtBRemains()for av=1,#as do local aw=g:BuffRemains(as[av])if aw>0 then e.APLVar.RtB_Buffs.Total=e.APLVar.RtB_Buffs.Total+1;if aw==au then e.APLVar.RtB_Buffs.Normal=e.APLVar.RtB_Buffs.Normal+1 elseif aw>au then e.APLVar.RtB_Buffs.Longer=e.APLVar.RtB_Buffs.Longer+1 else e.APLVar.RtB_Buffs.Shorter=e.APLVar.RtB_Buffs.Shorter+1 end end end end;return e.APLVar.RtB_Buffs.Total end;local function ax()if not e.APLVar.RtB_Reroll then if Y.Outlaw.RolltheBonesLogic=="1+ Buff"then e.APLVar.RtB_Reroll=at()<=0 and true or false elseif Y.Outlaw.RolltheBonesLogic=="Broadside"then e.APLVar.RtB_Reroll=not g:BuffUp(Z.Broadside)and true or false elseif Y.Outlaw.RolltheBonesLogic=="Buried Treasure"then e.APLVar.RtB_Reroll=not g:BuffUp(Z.BuriedTreasure)and true or false elseif Y.Outlaw.RolltheBonesLogic=="Grand Melee"then e.APLVar.RtB_Reroll=not g:BuffUp(Z.GrandMelee)and true or false elseif Y.Outlaw.RolltheBonesLogic=="Skull and Crossbones"then e.APLVar.RtB_Reroll=not g:BuffUp(Z.SkullandCrossbones)and true or false elseif Y.Outlaw.RolltheBonesLogic=="Ruthless Precision"then e.APLVar.RtB_Reroll=not g:BuffUp(Z.RuthlessPrecision)and true or false elseif Y.Outlaw.RolltheBonesLogic=="True Bearing"then e.APLVar.RtB_Reroll=not g:BuffUp(Z.TrueBearing)and true or false else e.APLVar.RtB_Reroll=false;at()if at()<=2 and g:BuffUp(Z.BuriedTreasure)and g:BuffDown(Z.GrandMelee)and a3<2 then e.APLVar.RtB_Reroll=true end;if Z.Crackshot:IsAvailable()and Z.HiddenOpportunity:IsAvailable()and not g:HasTier(31,4)and(not g:BuffUp(Z.TrueBearing)and Z.HiddenOpportunity:IsAvailable()or not g:BuffUp(Z.Broadside)and not Z.HiddenOpportunity:IsAvailable())and at()<=1 then e.APLVar.RtB_Reroll=true end;if Z.Crackshot:IsAvailable()and g:HasTier(31,4)and at()<=1+ai(g:BuffUp(Z.LoadedDiceBuff))then e.APLVar.RtB_Reroll=true end;if not Z.Crackshot:IsAvailable()and Z.HiddenOpportunity:IsAvailable()and not g:BuffUp(Z.SkullandCrossbones)and(at()<2+ai(g:BuffUp(Z.GrandMelee))and a3<2)then e.APLVar.RtB_Reroll=true end;if e.APLVar.RtB_Reroll and(e.APLVar.RtB_Buffs.Longer==0 or e.APLVar.RtB_Buffs.Normal==0)and e.APLVar.RtB_Buffs.Longer>=1 and at()<5 and X.RtBRemains()<=39 and not g:StealthUp(true,true)then e.APLVar.RtB_Reroll=true end;if h:FilteredTimeToDie("<",12)or d.BossFilteredFightRemains("<",12)then e.APLVar.RtB_Reroll=false end end end;return e.APLVar.RtB_Reroll end;local function ay()return a7>=X.CPMaxSpend()-1-ai(g:StealthUp(true,true)and Z.Crackshot:IsAvailable())end;local function az()return(Z.HiddenOpportunity:IsAvailable()or a9>=2+ai(Z.ImprovedAmbush:IsAvailable())+ai(g:BuffUp(Z.Broadside)))and aa>=50 end;local function aA()return Y.Commons.VanishOffensive and n()and not(W.IsSoloMode()and g:IsTanking(h))end;local function aB()return not Z.ShadowDanceTalent:IsAvailable()and Z.FanTheHammer:TalentRank()+ai(Z.QuickDraw:IsAvailable())+ai(Z.Audacity:IsAvailable())<ai(Z.CountTheOdds:IsAvailable())+ai(Z.KeepItRolling:IsAvailable())end;local function aC()return g:BuffUp(Z.BetweentheEyes)and(not Z.HiddenOpportunity:IsAvailable()or g:BuffDown(Z.AudacityBuff)and(Z.FanTheHammer:TalentRank()<2 or g:BuffDown(Z.Opportunity)))and not Z.Crackshot:IsAvailable()end;local function aD()if not s and Y.Commons.VanishOffensive and T and Z.Vanish:IsReady()and aA()and Z.HiddenOpportunity:IsAvailable()and not Z.Crackshot:IsAvailable()and not g:BuffUp(Z.Audacity)and(aB()or g:BuffStack(Z.Opportunity)<6)and az()then if l.Cast(Z.Vanish,nil)then ag=1856;return"Cast Vanish (HO)"end end;if Z.Vanish:IsReady()and T and aA()and(not Z.HiddenOpportunity:IsAvailable()or Z.Crackshot:IsAvailable())and ay()and not s and T and Y.Commons.VanishOffensive then if l.Cast(Z.Vanish,nil)then ag=1856;return"Cast Vanish (Finish)"end end;if Z.ShadowDance:IsReady()and Z.Crackshot:IsAvailable()and ay()and(Z.Vanish:CooldownRemains()>=6 or not Y.Commons.VanishOffensive)and not g:StealthUp(true,false)and V then if l.Cast(Z.ShadowDance,nil)then ag=185313;return"Cast Shadow Dance"end end;if Z.ShadowDance:IsReady()and not Z.KeepItRolling:IsAvailable()and aC()and g:BuffUp(Z.SliceandDice)and(ay()or Z.HiddenOpportunity:IsAvailable())and(not Z.HiddenOpportunity:IsAvailable()or not Z.Vanish:IsReady())and V then if l.Cast(Z.ShadowDance,nil)then ag=185313;return"Cast Shadow Dance"end end;if Z.ShadowDance:IsReady()and Z.KeepItRolling:IsAvailable()and aC()and(Z.KeepItRolling:CooldownRemains()<=30 or Z.KeepItRolling:CooldownRemains()>=120 and(ay()or Z.HiddenOpportunity:IsAvailable()))and V then if l.Cast(Z.ShadowDance,nil)then ag=185313;return"st Shadow Dance KiR without Crackshot"end end;if Z.Shadowmeld:IsAvailable()and Z.Shadowmeld:IsReady()and Y.Commons.Racials then if Z.Crackshot:IsAvailable()and ay()or not Z.Crackshot:IsAvailable()and(Z.CountTheOdds:IsAvailable()and ay()or Z.HiddenOpportunity:IsAvailable())then if l.Cast(Z.Shadowmeld,nil)then ag=58984;return"Cast Shadowmeld"end end end end;local function aE()if S and Z.AdrenalineRush:IsCastable()and(not g:BuffUp(Z.AdrenalineRush)and(not ay()or not Z.ImprovedAdrenalineRush:IsAvailable())or g:StealthUp(true,true)and Z.Crackshot:IsAvailable()and Z.ImprovedAdrenalineRush:IsAvailable()and a8<=2)then if l.Cast(Z.AdrenalineRush,nil)then ag=13750;return"Cast Adrenaline Rush"end end;if Z.BladeFlurry:IsReady()then if a3>=2-ai(Z.UnderhandedUpperhand:IsAvailable()and not g:StealthUp(true,true)and g:BuffUp(Z.AdrenalineRush))and g:BuffRemains(Z.BladeFlurry)<g:GCD()then if l.Cast(Z.BladeFlurry)then ag=13877;return"Cast Blade Flurry"end end end;if Z.BladeFlurry:IsReady()then if Z.DeftManeuvers:IsAvailable()and not ay()and(a3>=3 and a9==a3+ai(g:BuffUp(Z.Broadside))or a3>=5)then if l.Cast(Z.BladeFlurry)then ag=13877;return"Cast Blade Flurry"end end end;if Z.RolltheBones:IsReady()then if ax()or at()==0 or X.RtBRemains()<=3 and g:HasTier(31,4)or X.RtBRemains()<=7 and(Z.ShadowDance:CooldownRemains()<=3 or Z.Vanish:CooldownRemains()<=3)and not g:StealthUp(true,true)then if l.Cast(Z.RolltheBones)then ag=315508;return"Cast Roll the Bones"end end end;if Z.KeepItRolling:IsReady()and not ax()and at()>=3+ai(g:HasTier(31,4))and(g:BuffDown(Z.ShadowDance)or at()>=6)then if l.Cast(Z.KeepItRolling,nil)then ag=381989;return"Cast Keep it Rolling"end end;if Z.GhostlyStrike:IsAvailable()and Z.GhostlyStrike:IsReady()and a7<7 and U then if l.Cast(Z.GhostlyStrike,nil,nil,not h:IsSpellInRange(Z.GhostlyStrike))then ag=196937;return"Cast Ghostly Strike"end end;if n()and Z.Sepsis:IsAvailable()and Z.Sepsis:IsReady()then if Z.Crackshot:IsAvailable()and Z.BetweentheEyes:IsReady()and ay()and not g:StealthUp(true,true)or not Z.Crackshot:IsAvailable()and h:FilteredTimeToDie(">",11)and g:BuffUp(Z.BetweentheEyes)or d.BossFilteredFightRemains("<",11)then if l.Cast(Z.Sepsis,nil,nil,not h:IsSpellInRange(Z.Sepsis))then ag=328305;return"Cast Sepsis"end end end;if not g:StealthUp(true,true)and(not Z.Crackshot:IsAvailable()or Z.BetweentheEyes:IsReady())then a4=aD()if a4 then return a4 end end;if n()and Z.ThistleTea:IsCastable()and not g:BuffUp(Z.ThistleTea)and(ac>=100 or d.BossFilteredFightRemains("<",Z.ThistleTea:Charges()*6))then if l.Cast(Z.ThistleTea,nil)then ag=381623;return"Cast Thistle Tea"end end;if Z.BladeRush:IsCastable()and ad>4 and not g:StealthUp(true,true)then if l.Cast(Z.BladeRush,nil,nil,not h:IsSpellInRange(Z.BladeRush))then ag=271877;return"Cast Blade Rush"end end;if Y.Commons.Enabled.Potions then local aF=W.PotionSelected()if aF then if aF:IsReady()and n()and r and(g:BloodlustUp()and l.GUISettings.General.HoldPotforBL or(g:BloodlustUp()or d.BossFightRemains()<=30 or g:BuffUp(Z.AdrenalineRush))and not l.GUISettings.General.HoldPotforBL)then if l.Cast(aF,nil)then ag=50;return"potion cooldowns 2"end end end end;if Z.BloodFury:IsCastable()then if l.Cast(Z.BloodFury,nil)then ag=20572;return"Cast Blood Fury"end end;if Z.Berserking:IsCastable()then if l.Cast(Z.Berserking,nil)then ag=26297;return"Cast Berserking"end end;if Z.Fireblood:IsCastable()then if l.Cast(Z.Fireblood,nil)then ag=265221;return"Cast Fireblood"end end;if Z.AncestralCall:IsCastable()then if l.Cast(Z.AncestralCall,nil)then ag=274738;return"Cast Ancestral Call"end end;if Y.Commons.Enabled.BottomTrinket or Y.Commons.Enabled.TopTrinket then if _.ManicGrieftorch:IsEquippedAndReady()then if g:GCDRemains()>g:GCD()-0.1 and not g:StealthUp(true,true)and g:BuffUp(Z.BetweentheEyes)or d.BossFilteredFightRemains("<=",5)then if l.Cast(_.ManicGrieftorch,nil,nil)then if _.BalefireBranch:ID()==K then ag=24;return"Manic Grieftorch top"elseif _.ManicGrieftorch:ID()==L then ag=30;return"Manic Grieftorch bop"end end end end;if _.DragonfireBombDispenser:IsEquippedAndReady()then if not I:ID()==_.DragonfireBombDispenser:ID()and I:CooldownRemains()>10 or J:CooldownRemains()>10 or d.BossFilteredFightRemains("<",20)or not J:HasCooldown()or not I:HasCooldown()then if l.Cast(_.DragonfireBombDispenser,nil,nil)then if _.DragonfireBombDispenser:ID()==K then ag=24;return"Dragonfire Bomb Dispenser top"elseif _.DragonfireBombDispenser:ID()==L then ag=30;return"Dragonfire Bomb Dispenser bop"end end end end;if _.BeaconToTheBeyond:IsEquippedAndReady()then if not g:StealthUp(true,true)and g:BuffUp(Z.BetweentheEyes)or d.BossFilteredFightRemains("<",5)then if l.Cast(_.DragonfireBombDispenser,nil,nil)then if _.DragonfireBombDispenser:ID()==K then ag=24;return"Beacon top"elseif _.DragonfireBombDispenser:ID()==L then ag=30;return"Beacon bop"end end end end;local aG=g:GetUseableTrinkets(a0)aG=g:GetUseableTrinkets(a0)if aG and(n()and not g:StealthUp(true,true)or d.BossFilteredFightRemains("<",10))then if aG and(g:BuffUp(Z.BetweentheEyes)or d.BossFilteredFightRemains("<",20)or aG:HasStatAnyDps())then if l.Cast(aG,nil,nil)then if aG:ID()==GetInventoryItemID("player",13)and Y.Commons.Enabled.TopTrinket then ag=24;return"Generic use_items for "..aG:Name()elseif aG:ID()==GetInventoryItemID("player",14)and Y.Commons.Enabled.BottomTrinket then ag=25;return"Generic use_items for "..aG:Name()end end end end end end;local function aH()if Z.BladeFlurry:IsReady()and Z.BladeFlurry:IsCastable()and m()and Z.Subterfuge:IsAvailable()and Z.HiddenOpportunity:IsAvailable()and a3>=2 and g:BuffRemains(Z.BladeFlurry)<=g:GCD()and(Z.AdrenalineRush:IsReady()or g:BuffUp(Z.AdrenalineRush))then if Y.Outlaw.GCDasOffGCD.BladeFlurry then if l.Cast(Z.BladeFlurry)then ag=13877;return"Cast Blade Flurry"end else if l.Cast(Z.BladeFlurry)then ag=13877;return"Cast Blade Flurry"end end end;if Z.ColdBlood:IsCastable()and g:BuffDown(Z.ColdBlood)and h:IsSpellInRange(Z.Dispatch)and ay()then if l.Cast(Z.ColdBlood,nil)then ag=382245;return"Cast Cold Blood"end end;if Z.BetweentheEyes:IsCastable()and h:IsSpellInRange(Z.BetweentheEyes)and ay()and Z.Crackshot:IsAvailable()and(not g:BuffUp(Z.Shadowmeld)or g:StealthUp(true,false))then if l.CastPooling(Z.BetweentheEyes)then ag=315341;return"Cast Between the Eyes"end end;if Z.Dispatch:IsCastable()and h:IsSpellInRange(Z.Dispatch)and ay()then if l.CastPooling(Z.Dispatch)then ag=2098;return"Cast Dispatch"end end;if Z.PistolShot:IsCastable()and h:IsSpellInRange(Z.PistolShot)and Z.Crackshot:IsAvailable()and Z.FanTheHammer:TalentRank()>=2 and g:BuffStack(Z.Opportunity)>=6 and(g:BuffUp(Z.Broadside)and a8<=1 or g:BuffUp(Z.GreenskinsWickersBuff))then if l.CastPooling(Z.PistolShot)then ag=185763;return"Cast Pistol Shot"end end;if Z.Ambush:IsCastable()and h:IsSpellInRange(Z.Ambush)and Z.HiddenOpportunity:IsAvailable()then if l.CastPooling(Z.Ambush)then ag=8676;return"Cast Ambush"end end end;local function aI()if Z.BetweentheEyes:IsCastable()and h:IsSpellInRange(Z.BetweentheEyes)and not Z.Crackshot:IsAvailable()and(g:BuffRemains(Z.BetweentheEyes)<4 or Z.ImprovedBetweenTheEyes:IsAvailable()or Z.GreenskinsWickers:IsAvailable()or g:HasTier(30,4))and g:BuffDown(Z.GreenskinsWickers)then if l.CastPooling(Z.BetweentheEyes)then ag=315341;return"Cast Between the Eyes"end end;if Z.BetweentheEyes:IsCastable()and h:IsSpellInRange(Z.BetweentheEyes)and Z.Crackshot:IsAvailable()and(Z.Vanish:CooldownRemains()>45 and Z.ShadowDance:CooldownRemains()>15)then if l.CastPooling(Z.BetweentheEyes)then ag=315341;return"Cast Between the Eyes"end end;if Z.SliceandDice:IsCastable()and(d.FilteredFightRemains(a2,">",g:BuffRemains(Z.SliceandDice),true)or g:BuffRemains(Z.SliceandDice)==0)and g:BuffRemains(Z.SliceandDice)<(1+a8)*1.8 then if l.CastPooling(Z.SliceandDice)then ag=315496;return"Cast Slice and Dice"end end;if Z.KillingSpree:IsCastable()and h:IsSpellInRange(Z.KillingSpree)and(h:DebuffUp(Z.GhostlyStrike)or not Z.GhostlyStrike:IsAvailable())then if l.Cast(Z.KillingSpree)then ag=51690;return"Cast Killing Spree"end end;if Z.ColdBlood:IsCastable()and g:BuffDown(Z.ColdBlood)and h:IsSpellInRange(Z.Dispatch)then if l.Cast(Z.ColdBlood,nil)then ag=382245;return"Cast Cold Blood"end end;if Z.Dispatch:IsCastable()and h:IsSpellInRange(Z.Dispatch)then if l.CastPooling(Z.Dispatch)then ag=2098;return"Cast Dispatch"end end end;local function aJ()if n()and Z.EchoingReprimand:IsReady()then if l.Cast(Z.EchoingReprimand,nil,nil)then ag=323547;return"Cast Echoing Reprimand"end end;if Z.Ambush:IsCastable()and Z.HiddenOpportunity:IsAvailable()and g:BuffUp(Z.AudacityBuff)then if l.CastPooling(Z.SSAudacity,nil,not h:IsSpellInRange(Z.Ambush))then ag=8676;return"Cast Ambush (High-Prio Buffed)"end end;if Z.FanTheHammer:IsAvailable()and Z.Audacity:IsAvailable()and Z.HiddenOpportunity:IsAvailable()and g:BuffUp(Z.Opportunity)and g:BuffDown(Z.AudacityBuff)then if l.CastPooling(Z.PistolShot,nil,not h:IsSpellInRange(Z.PistolShot))then ag=185763;return"Cast Pistol Shot (Audacity)"end end;if Z.FanTheHammer:IsAvailable()and g:BuffUp(Z.Opportunity)and(g:BuffStack(Z.Opportunity)>=6 or g:BuffRemains(Z.Opportunity)<2)then if l.CastPooling(Z.PistolShot,nil,not h:IsSpellInRange(Z.PistolShot))then ag=185763;return"Cast Pistol Shot (FtH Dump)"end end;if Z.FanTheHammer:IsAvailable()and g:BuffUp(Z.Opportunity)and(a9>=1+(ai(Z.QuickDraw:IsAvailable())+ai(g:BuffUp(Z.Broadside)))*(Z.FanTheHammer:TalentRank()+1)or a8<=ai(Z.Ruthlessness:IsAvailable()))then if l.CastPooling(Z.PistolShot,nil,not h:IsSpellInRange(Z.PistolShot))then ag=185763;return"Cast Pistol Shot"end end;if not Z.FanTheHammer:IsAvailable()and g:BuffUp(Z.Opportunity)and(ad>1.5 or a9<=1+ai(g:BuffUp(Z.Broadside))or Z.QuickDraw:IsAvailable()or Z.Audacity:IsAvailable()and g:BuffDown(Z.AudacityBuff))then if l.CastPooling(Z.PistolShot,nil,not h:IsSpellInRange(Z.PistolShot))then ag=185763;return"Cast Pistol Shot"end end;if Z.SinisterStrike:IsCastable()and h:IsSpellInRange(Z.SinisterStrike)then if l.CastPooling(Z.SinisterStrike,nil,not h:IsSpellInRange(Z.SinisterStrike))then ag=193315;return"Cast Sinister Strike"end end end;local function aK()p=HeroRotationCharDB.Toggles[5]o=HeroRotationCharDB.Toggles[4]q=HeroRotationCharDB.Toggles[12]r=not HeroRotationCharDB.Toggles[15]s=HeroRotationCharDB.Toggles[21]u=HeroRotationCharDB.Toggles[22]v=HeroRotationCharDB.Toggles[23]w=HeroRotationCharDB.Toggles[24]x=HeroRotationCharDB.Toggles[25]y=HeroRotationCharDB.Toggles[27]z=HeroRotationCharDB.Toggles[50]A=HeroRotationCharDB.Toggles[51]t=HeroRotationCharDB.Toggles[52]B=HeroRotationCharDB.Toggles[53]C=HeroRotationCharDB.Toggles[30]D=HeroRotationCharDB.Toggles[54]E=HeroRotationCharDB.Toggles[190]K=GetInventoryItemID("player",13)L=GetInventoryItemID("player",14)if not Y.Commons.Enabled.TopTrinket and not Y.Commons.Enabled.BottomTrinket then a0={K,L}elseif not Y.Commons.Enabled.TopTrinket and Y.Commons.Enabled.BottomTrinket then a0={K}elseif not Y.Commons.Enabled.BottomTrinket and Y.Commons.Enabled.TopTrinket then a0={L}end;S=false;T=false;U=false;V=false;if Y.Outlaw.AdrenalineRushCD=="CDs"and n()or Y.Outlaw.AdrenalineRushCD=="Small CDs"and o or Y.Outlaw.AdrenalineRushCD=="Always"then S=true end;if Y.Outlaw.VanishCD=="CDs"and n()or Y.Outlaw.VanishCD=="Small CDs"and o or Y.Outlaw.VanishCD=="Always"then T=true end;if Y.Outlaw.GhostlyStrikeCD=="CDs"and n()or Y.Outlaw.GhostlyStrikeCD=="Small CDs"and o or Y.Outlaw.GhostlyStrikeCD=="Always"then U=true end;if Y.Outlaw.ShadowDanceCD=="CDs"and n()or Y.Outlaw.ShadowDanceCD=="Small CDs"and o or Y.Outlaw.ShadowDanceCD=="Always"then V=true end;G=0;for av=1,20 do if select(10,UnitDebuff("player",av))==240447 then if select(6,UnitDebuff("player",av))~=nil then G=select(6,UnitDebuff("player",av))-GetTime()end end end end;a2=g:GetEnemiesInRange(a5,Z.SinisterStrike)local function aL()local aM={{Z.Blind,function()return true end,2094},{Z.KidneyShot,function()return a8>0 end,408}}local aN=l.Common.Everyone;local aO=aN.WhiteList()a5=Z.AcrobaticStrikes:IsAvailable()and 9 or 6;a8=g:ComboPoints()a7=X.EffectiveComboPoints(a8)a9=g:ComboPointsDeficit()ae=g:BuffUp(Z.AdrenalineRush,nil,true)and-50 or 0;aa=aq()ab=g:EnergyRegen()ad=an(ae)ac=g:EnergyDeficitPredicted(nil,ae)if m()then a1=g:GetEnemiesInRange(30)a2=g:GetEnemiesInRange(a5)a3=#a2 else a3=1 end;a4=aK()if l.QueuedCast()then ag=l.QueuedCast()return"Custom Queue "..i(ag):ID()end;if a4 then return a4 end;if ah>0 then ah=0 end;if ag>0 then ag=0 end;ag=X.ReturnSpell()ah=X.ReturnSpellMO()if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[5]then Q=GetTime()R=Q+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and R~=nil and GetTime()>R and HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]l.ToggleIconFrame:UpdateButtonText(5)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[5]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if B and Z.GrapplingHook:IsUsableP()and Z.GrapplingHook:CooldownRemains(BypassRecovery)<=0 then if l.Cast(Z.GrapplingHook,nil,nil,nil)then ag=195457;return"queue Grappling Hook"end elseif(not Z.GrapplingHook:IsUsableP()or Z.GrapplingHook:CooldownRemains()>0)and B then HeroRotationCharDB.Toggles[53]=not HeroRotationCharDB.Toggles[53]l.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[53]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if u and Z.CheapShot:IsUsableP()and Z.CheapShot:CooldownRemains(BypassRecovery)<=0 and(g:StealthUp(true,true)or g:BuffUp(Z.VanishBuff))and(h:IsInRange(8)or f("mouseover"):IsInRange(8))then if l.Cast(Z.CheapShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Z.CheapShot)then ah=18335;return"queue Cheap Shot MO"else ag=1833;return"queue Cheap Shot"end end elseif(not Z.CheapShot:IsUsableP()or Z.CheapShot:CooldownRemains()>0)and u then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]l.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if v and Z.KidneyShot:IsUsableP()and Z.KidneyShot:CooldownRemains(BypassRecovery)<=0 and(h:IsInRange(8)or f("mouseover"):IsInRange(8))then if l.Cast(Z.KidneyShot,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Z.KidneyShot)then ah=4085;return"queue Kidney Shot MO"else ag=408;return"queue Kidney Shot"end end elseif(not Z.KidneyShot:IsUsableP()or Z.KidneyShot:CooldownRemains()>0)and v then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]l.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if w and Z.Blind:IsUsableP()and Z.Blind:CooldownRemains(BypassRecovery)<=0 and(h:IsInRange(15)or f("mouseover"):IsInRange(15))then if l.Cast(Z.Blind,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Z.Blind)then ah=20945;return"queue Blind MO"end end elseif(not Z.Blind:IsUsableP()or Z.Blind:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]l.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and Z.Sap:IsUsableP()and Z.Sap:CooldownRemains(BypassRecovery)<=0 and g:StealthUp(true,true)and(h:IsInRange(10)or f("mouseover"):IsInRange(10))then if l.Cast(Z.Sap,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Z.Sap)then ah=67705;return"queue Sap MO"else ag=6770;return"queue Sap"end end elseif(not Z.Sap:IsUsableP()or Z.Sap:CooldownRemains()>0 or not g:StealthUp(true,true))and x then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]l.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and Z.Feint:IsUsableP()and Z.Feint:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()and not g:PrevGCD(1,Z.Feint)then if l.Cast(Z.Feint,nil,nil,nil)then ag=202;return"queue Feint"end elseif(not Z.Feint:IsUsableP()or Z.Feint:CooldownRemains()>0 or not g:AffectingCombat())and y then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]l.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A and Z.BladeRush:IsUsableP()and Z.BladeRush:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.BladeRush,nil,nil,not h:IsSpellInRange(Z.BladeRush))then ag=271877;return"queue BladeRush"end elseif(not Z.BladeRush:IsUsableP()or Z.BladeRush:CooldownRemains()>0 or not g:AffectingCombat())and A then HeroRotationCharDB.Toggles[51]=not HeroRotationCharDB.Toggles[51]l.Print("BladeRush que is now "..(HeroRotationCharDB.Toggles[51]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and Z.Gouge:IsUsableP()and Z.Gouge:CooldownRemains(BypassRecovery)<=0 then if l.Cast(Z.Gouge,nil,nil,nil)then if f("mouseover"):GUID()~=nil and f("mouseover"):IsSpellInRange(Z.Gouge)then ah=17765;return"queue Gouge MO"elseif f("target"):IsSpellInRange(Z.Gouge)then ag=1776;return"queue Gouge"end end elseif(not Z.Gouge:IsUsableP()or Z.Gouge:CooldownRemains()>0 or not g:AffectingCombat())and z then HeroRotationCharDB.Toggles[50]=not HeroRotationCharDB.Toggles[50]l.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[50]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if E and Z.BladeFlurry:IsUsableP()and Z.BladeFlurry:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.BladeFlurry,nil,nil,nil)then ag=13877;return"queue BladeFlurry"end elseif(not Z.BladeFlurry:IsUsableP()or Z.BladeFlurry:CooldownRemains()>0 or not g:AffectingCombat())and E then HeroRotationCharDB.Toggles[190]=not HeroRotationCharDB.Toggles[190]l.Print("BladeFlurry que is now "..(HeroRotationCharDB.Toggles[190]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if C then if Z.ArcaneTorrent:IsAvailable()and Z.ArcaneTorrent:IsUsableP()and Z.ArcaneTorrent:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.ArcaneTorrent,nil,nil,nil)then ag=155145;return"queue ArcaneTorrent Queue"end elseif Z.LightsJudgment:IsAvailable()and Z.LightsJudgment:IsUsableP()and Z.LightsJudgment:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.LightsJudgment,nil,nil,nil)then ag=255647;return"queue LightsJudgment Queue"end elseif Z.BagofTricks:IsAvailable()and Z.BagofTricks:IsUsableP()and Z.BagofTricks:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.BagofTricks,nil,nil,nil)then ag=312411;return"queue BagofTricks Queue"end elseif Z.BloodFury:IsAvailable()and Z.BloodFury:IsUsableP()and Z.BloodFury:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.BloodFury,nil,nil,nil)then ag=20572;return"queue BloodFury Queue"end elseif Z.Berserking:IsAvailable()and Z.Berserking:IsUsableP()and Z.Berserking:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.Berserking,nil,nil,nil)then ag=26297;return"queue Berserking Queue"end elseif Z.Fireblood:IsAvailable()and Z.Fireblood:IsUsableP()and Z.Fireblood:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.Fireblood,nil,nil,nil)then ag=265221;return"queue Fireblood Queue"end elseif Z.AncestralCall:IsAvailable()and Z.AncestralCall:IsUsableP()and Z.AncestralCall:CooldownRemains(BypassRecovery)<=0 and g:AffectingCombat()then if l.Cast(Z.AncestralCall,nil,nil,nil)then ag=274738;return"queue AncestralCall Queue"end elseif(Z.ArcaneTorrent:IsAvailable()and(not Z.ArcaneTorrent:IsUsableP()or Z.ArcaneTorrent:CooldownRemains()>0 or not g:AffectingCombat())or Z.LightsJudgment:IsAvailable()and(not Z.LightsJudgment:IsUsableP()or Z.LightsJudgment:CooldownRemains()>0 or not g:AffectingCombat())or Z.BagofTricks:IsAvailable()and(not Z.BagofTricks:IsUsableP()or Z.BagofTricks:CooldownRemains()>0 or not g:AffectingCombat())or Z.BloodFury:IsAvailable()and(not Z.BloodFury:IsUsableP()or Z.BloodFury:CooldownRemains()>0 or not g:AffectingCombat())or Z.Berserking:IsAvailable()and(not Z.Berserking:IsUsableP()or Z.Berserking:CooldownRemains()>0 or not g:AffectingCombat())or Z.Fireblood:IsAvailable()and(not Z.Fireblood:IsUsableP()or Z.Fireblood:CooldownRemains()>0 or not g:AffectingCombat())or Z.AncestralCall:IsAvailable()and(not Z.AncestralCall:IsUsableP()or Z.AncestralCall:CooldownRemains()>0 or not g:AffectingCombat()))and C then HeroRotationCharDB.Toggles[30]=not HeroRotationCharDB.Toggles[30]l.Print("Arcane Torrent Queue is now "..(HeroRotationCharDB.Toggles[30]and"|cff00ff00on|r."or"|cffff0000off|r."))end end;if W.HandleIncorporeal(Z.Blind,F,15,false)then if l.Cast(Z.Blind)then ah=20945;return"blind MO"end end;local aM={{Z.Blind,function()return true end,2094},{Z.KidneyShot,function()return a8>0 end,408}}if g:IsChanneling(i(324631))then if l.Cast(Z.PoolEnergy,nil,nil,nil)then ag=99999;return"channeling Fleashcraft"end end;a4=X.CrimsonVial()if a4 then return a4 end;a4=X.Feint()if a4 then return a4 end;a4=X.Evasion()if a4 then return a4 end;if g:HealthPercentage()<Y.Commons.PhialHP and _.PhialofSerenity:IsReady()and _.PhialofSerenity:CooldownRemains()<=0 then if l.Cast(_.PhialofSerenity,nil)then ag=55;return"PhialofSerenity HP"end end;if g:HealthPercentage()<Y.Commons.HealthstoneHP and _.Healthstone:IsReady()and _.Healthstone:CooldownRemains()<=0 then if l.Cast(_.Healthstone,nil)then ag=40;return"Healthstone HP"end end;if g:HealthPercentage()<Y.Commons.HealPotHP and _.CosmicHealPot:IsReady()and _.CosmicHealPot:CooldownRemains()<=0 then if l.Cast(_.CosmicHealPot,nil)then ag=45;return"CosmicHealPot HP"end end;if g:HealthPercentage()<Y.Commons.HealPotHP and _.HealPotL:IsReady()and _.HealPotL:CooldownRemains()<=0 then if l.Cast(_.HealPotL,nil)then ag=41;return"HealPot LOW HP"end end;if g:HealthPercentage()<Y.Commons.HealPotHP and _.HealPotM:IsReady()and _.HealPotM:CooldownRemains()<=0 then if l.Cast(_.HealPotM,nil)then ag=41;return"HealPot MEDIUM HP"end end;if g:HealthPercentage()<Y.Commons.HealPotHP and _.HealPotH:IsReady()and _.HealPotH:CooldownRemains()<=0 then if l.Cast(_.HealPotH,nil)then ag=41;return"HealPot HIGH HP"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if Z.PistolShot:IsCastable()and f("mouseover"):IsInMeleeRange(20)then if l.Cast(Z.PistolShot,nil)then ah=1185763;return"explosive MO Pistol"end end end;if Z.PistolShot:IsCastable()and f("target"):IsInMeleeRange(40)and string.find(UnitGUID("target"),120651)then if l.Cast(Z.PistolShot,nil)then ag=185763;return"explosive Tar Pistol"end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),204560)then if Z.Blind:IsCastable()and f("mouseover"):IsInMeleeRange(20)then if l.Cast(Z.Blind,nil)then ah=20945;return"blind MO incorporeal affix"end end end;if UnitExists("target")and Z.Shiv:IsReady()and not D then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true then for av=0,10 do local aP,aP,aQ,aR,aS,aT,aP,aP,aP,aU=UnitBuff("target",av)for aP,aV in pairs(aO)do if aV==aU and aT-aS+500/1000<=GetTime()then if l.Cast(Z.Shiv,nil)then ag=5938;return"Shiv Enrage"end end end end end end;local aW=g:AffectingCombat()and 180 or 900;local aX;if not g:AffectingCombat()then if i(8679):IsAvailable()and Y.Commons.LethalPoison=="Wound Poison"then aX=g:BuffRemains(i(8679))if aX<aW and not g:IsCasting(i(8679))then if l.Cast(i(8679))then ag=203;return"Wound Poison Refresh"end end elseif i(2823):IsAvailable()and Y.Commons.LethalPoison=="Deadly Poison"then aX=g:BuffRemains(i(2823))if aX<aW and not g:IsCasting(i(2823))then if l.Cast(i(2823))then ag=208;return"Deadly Poison Refresh"end end elseif i(315584):IsAvailable()and Y.Commons.LethalPoison=="Instant Poison"then aX=g:BuffRemains(i(315584))if aX<aW and not g:IsCasting(i(315584))then if l.Cast(i(315584))then ag=205;return"Instant Poison Refresh"end end end end;aX=g:BuffRemains(i(381637))if i(381637):IsAvailable()and Y.Commons.NonLethalPoison=="Atrophic Poison"then if aX<aW and not g:IsCasting(i(381637))then if l.Cast(i(381637))then ag=381637;return"Antropic Poison Refresh"end end elseif i(5761):IsAvailable()and Y.Commons.NonLethalPoison=="Numbing Poison"then aX=g:BuffRemains(i(5761))if aX<aW and not g:IsCasting(NumbingPoison)then if l.Cast(i(5761))then ag=204;return"Numbing Poison Refresh"end end elseif i(3408):IsAvailable()and Y.Commons.NonLethalPoison=="Crippling Poison"then aX=g:BuffRemains(i(3408))if aX<aW and not g:IsCasting(NumbingPoison)then if l.Cast(i(3408))then ag=206;return"Crippling Poison Refresh"end end end;if not g:BuffUp(Z.VanishBuff)and not g:AffectingCombat()and not g:StealthUp(true,true)then a4=X.Stealth(Z.Stealth)if a4 then return a4 end end;if not g:AffectingCombat()and Z.Vanish:TimeSinceLastCast()>1 then if Z.BladeFlurry:IsReady()and g:BuffDown(Z.BladeFlurry)and Z.UnderhandedUpperhand:IsAvailable()and not g:StealthUp(true,true)and(Z.AdrenalineRush:IsReady()or g:BuffUp(Z.AdrenalineRush))then if l.Cast(Z.BladeFlurry)then ag=13877;return"Blade Flurry (Opener)"end end;if not g:StealthUp(true,false)then a4=X.Stealth(X.StealthSpell())if a4 then return a4 end end;if W.TargetIsValid()and(not g:AffectingCombat()and p)then if n()and Z.MarkedforDeath:IsCastable()and a9>=X.CPMaxSpend()-1 and h:NPCID()~=170234 then if Y.Commons.STMfDAsDPSCD then if l.Cast(Z.MarkedforDeath,nil)then ag=137619;return"Cast Marked for Death (OOC)"end else if l.Cast(Z.MarkedforDeath,nil)then ag=137619;return"Cast Marked for Death (OOC)"end end end;if Z.AdrenalineRush:IsReady()and S and Z.ImprovedAdrenalineRush:IsAvailable()and a8<=2 and not Z.LoadedDiceBuff:IsAvailable()and a8<=2 then if l.Cast(Z.AdrenalineRush)then ag=13750;return"Cast Adrenaline Rush (Opener)"end end;if Z.RolltheBones:IsReady()and not g:DebuffUp(Z.Dreadblades)and(at()==0 or ax())then if l.Cast(Z.RolltheBones)then ag=315508;return"Cast Roll the Bones (Opener)"end end;if Z.AdrenalineRush:IsReady()and S and Z.ImprovedAdrenalineRush:IsAvailable()and a8<=2 then if l.Cast(Z.AdrenalineRush)then ag=13750;return"Cast Adrenaline Rush (Opener)"end end;if Z.SliceandDice:IsReady()and g:BuffRemains(Z.SliceandDice)<(1+a8)*1.8 then if l.CastPooling(Z.SliceandDice)then ag=315496;return"Cast Slice and Dice (Opener)"end end;if g:StealthUp(true,false)or g:BuffUp(Z.VanishBuff)then a4=aH()if a4 then return"Stealth (Opener): "..a4 end;if Z.KeepItRolling:IsAvailable()and Z.GhostlyStrike:IsReady()and Z.EchoingReprimand:IsAvailable()and U then if l.Cast(Z.GhostlyStrike,nil,nil,not h:IsSpellInRange(Z.GhostlyStrike))then ag=196937;return"Cast Ghostly Strike KiR (Opener)"end end;if Z.Ambush:IsCastable()and Z.HiddenOpportunity:IsAvailable()then if l.Cast(Z.Ambush,nil,nil,not h:IsSpellInRange(Z.Ambush))then ag=8676;return"Cast Ambush (Opener)"end else if Z.SinisterStrike:IsCastable()then if l.Cast(Z.SinisterStrike,nil,nil,not h:IsSpellInRange(Z.SinisterStrike))then ag=193315;return"Cast Sinister Strike (Opener)"end end end elseif ay()then a4=aI()if a4 then return"Finish (Opener): "..a4 end end;if Z.SinisterStrike:IsCastable()then if l.Cast(Z.SinisterStrike)then ag=193315;return"Cast Sinister Strike (Opener)"end end end;return end;if Z.FanTheHammer:IsAvailable()and Z.PistolShot:TimeSinceLastCast()<g:GCDRemains()then a8=O(a8,X.FanTheHammerCP())a7=X.EffectiveComboPoints(a8)a9=g:ComboPointsDeficit()end;if W.TargetIsValid()and(g:AffectingCombat()or p or g:BuffUp(Z.VanishBuff)or g:BuffUp(Z.VanishBuff)or g:BuffUp(Z.VanishBuff2))and not h:DebuffUp(i(6770))then local aY,aZ,aP=GetSpellCooldown(57934)if Y.Commons.AutoToT then if aY+aZ-GetTime()<=0 and Z.TricksoftheTrade:IsAvailable()and Z.TricksoftheTrade:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and not f("focus"):IsDeadOrGhost()and(UnitInParty("focus")or UnitInRaid("focus"))then if l.Cast(Z.TricksoftheTrade)then ag=207;return"ToT Focus"end end end;a4=aE()if a4 then return"CDs: "..a4 end;if g:StealthUp(true,true)or g:BuffUp(Z.VanishBuff)or g:BuffUp(Z.Shadowmeld)then a4=aH()if a4 then return"Stealth: "..a4 end end;if ay()then a4=aI()if a4 then return"Finish: "..a4 end;l.Cast(Z.PoolEnergy)return"Finish Pooling"end;a4=aJ()if a4 then return"Build: "..a4 end;if Z.ArcaneTorrent:IsCastable()and Y.Commons.Enabled.Racials and n()and h:IsSpellInRange(Z.SinisterStrike)and ac>15+ab then if l.Cast(Z.ArcaneTorrent,nil)then ag=155145;return"Cast Arcane Torrent"end end;if Z.ArcanePulse:IsCastable()and Y.Commons.Enabled.Racials and n()and h:IsSpellInRange(Z.SinisterStrike)then if l.Cast(Z.ArcanePulse)then ag=260364;return"Cast Arcane Pulse"end end;if Z.LightsJudgment:IsCastable()and Y.Commons.Enabled.Racials and n()and h:IsInMeleeRange(5)then if l.Cast(Z.LightsJudgment,nil)then ag=255647;return"Cast Lights Judgment"end end;if Z.BagofTricks:IsCastable()and Y.Commons.Enabled.Racials and n()and h:IsInMeleeRange(5)then if l.Cast(Z.BagofTricks,nil)then ag=312411;return"Cast Bag of Tricks"end end;if Z.PistolShot:IsCastable()and h:IsSpellInRange(Z.PistolShot)and not h:IsInRange(a5)and not g:StealthUp(true,true)and ac<25 and(a9>=1 or ad<=1.2)then if l.Cast(Z.PistolShot)then ag=185763;return"Cast Pistol Shot (OOR)"end end;if not h:IsSpellInRange(Z.Dispatch)then if l.CastAnnotated(Z.PoolEnergy,false,"OOR")then ag=999999;return"Pool Energy (OOR)"end else if l.Cast(Z.PoolEnergy)then ag=999999;return"Pool Energy"end end end end;local function a_()if HeroRotationCharDB.Toggles[5]then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]l.ToggleIconFrame:UpdateButtonText(5)end end;function ReturnSpellOut()if ag==0 then return 0 else return ag end end;function ReturnSpellMOOut()if ah==0 then return 0 else return ah end end;l.SetAPL(260,aL,a_)