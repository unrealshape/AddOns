local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=d.Action;local m=HeroRotation;local n=m.AoEON;local o=m.CDsON;local p=m.Cast;local q=m.CastSuggested;local r=math.max;local s=HeroRotationCharDB.Toggles[4]local t=HeroRotationCharDB.Toggles[5]local u=HeroRotationCharDB.Toggles[12]local v=not HeroRotationCharDB.Toggles[15]local w=HeroRotationCharDB.Toggles[120]local x=HeroRotationCharDB.Toggles[121]local y=HeroRotationCharDB.Toggles[122]local z=HeroRotationCharDB.Toggles[123]local A=HeroRotationCharDB.Toggles[124]local B=HeroRotationCharDB.Toggles[125]local C=HeroRotationCharDB.Toggles[142]local D=HeroRotationCharDB.Toggles[17]local E=HeroRotationCharDB.Toggles[170]local F;local G;local H;local I;local J={355782,333875,344739,228318,332158,321764,324914,326046,324776,340544,324736,328015,322433,334324,317936,327332,328288,343470,333293,320272,342139,355888,349933,356549,355934,353706,347775,357284,335141,327155,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,344739,368477,368396,355057,356133,158337,164426,382555,257260}local K=m.Commons.Everyone;local L=m.Commons.Hunter;local M={General=m.GUISettings.General,Commons=m.GUISettings.APL.Hunter.Commons,BeastMastery=m.GUISettings.APL.Hunter.BeastMastery}local N=j.Hunter.BeastMastery;local O={N.SummonPet,N.SummonPet2,N.SummonPet3,N.SummonPet4,N.SummonPet5}local P=k.Hunter.BeastMastery;local Q={}local R=g:GetEquipment()local S=R[11]and k(R[11])or k(0)local T=R[12]and k(R[12])or k(0)local U=k(0)local V=k(0)local W=GetInventoryItemID("player",13)local X=GetInventoryItemID("player",14)local Y;local Z=11111;local _=11111;d:RegisterForEvent(function()R=g:GetEquipment()S=R[11]and k(R[11])or k(0)T=R[12]and k(R[12])or k(0)end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()Z=11111;_=11111 end,"PLAYER_REGEN_ENABLED")local a0,a1,a2;local a3;local a4,a5;local a6;local a7;local Y;local a8=0;local a9=0;local aa={{N.Intimidation,"Cast Intimidation (Interrupt)",function()return true end}}local function ab(ac)if ac then return 1 else return 0 end end;local function ad(ac)return ac~=0 end;local function ae(af)local ae=0;if af~=nil then for ag in pairs(af)do local ah=af[ag]if ah:IsInRange(40)and(ah:AffectingCombat()or ah:IsDummy()or ah:NPCID()==153285)and ah:DebuffUp(j(257284))then ae=ae+1 end end end;return ae end;local function ai(aj)return aj:DebuffRemains(N.BarbedShotDebuff)end;local function ak(aj)return aj:DebuffStack(N.LatentPoisonDebuff)end;local function al(aj)return aj:DebuffRemains(N.SerpentStingDebuff)end;local function am(aj)if aj:DebuffStack(N.LatentPoisonDebuff)>9 and(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1217200;return true elseif aj:DebuffStack(N.LatentPoisonDebuff)>9 and(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif aj:DebuffStack(N.LatentPoisonDebuff)>9 and(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=217200;return true elseif aj:DebuffStack(N.LatentPoisonDebuff)>9 and(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function an(aj)if(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1217200;return true elseif(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=217200;return true elseif(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function ao(aj)if aj:DebuffStack(N.LatentPoisonDebuff)>9 and(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1217200;return true elseif aj:DebuffStack(N.LatentPoisonDebuff)>9 and(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif aj:DebuffStack(N.LatentPoisonDebuff)>9 and(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=217200;return true elseif aj:DebuffStack(N.LatentPoisonDebuff)>9 and(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function ap(aj)if(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1217200;return true elseif(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=217200;return true elseif(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or _<9 or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function aq(aj)if aj:DebuffRefreshable(N.SerpentStingDebuff)and aj:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1271788;return true elseif aj:DebuffRefreshable(N.SerpentStingDebuff)and aj:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif aj:DebuffRefreshable(N.SerpentStingDebuff)and aj:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=271788;return true elseif aj:DebuffRefreshable(N.SerpentStingDebuff)and aj:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function ar(aj)if(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and i:BuffStack(N.FrenzyPetBuff)<3 and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1217200;return true elseif(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and i:BuffStack(N.FrenzyPetBuff)<3 and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and i:BuffStack(N.FrenzyPetBuff)<3 and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=217200;return true elseif(i:BuffUp(N.FrenzyPetBuff)and i:BuffRemains(N.FrenzyPetBuff)<=Y+0.25 or N.ScentofBlood:IsAvailable()and i:BuffStack(N.FrenzyPetBuff)<3 and(N.BestialWrath:CooldownRemains()>0 or not o()))and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function as(aj)if(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8 or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o())or N.ScentofBlood:IsAvailable()and(N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()+Y<8 and N.BestialWrath:CooldownRemains()<24+8-Y+N.BarbedShot:FullRechargeTime()and o())or _<9)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1217200;return true elseif(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8 or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o())or N.ScentofBlood:IsAvailable()and(N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()+Y<8 and N.BestialWrath:CooldownRemains()<24+8-Y+N.BarbedShot:FullRechargeTime()and o())or _<9)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8 or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o())or N.ScentofBlood:IsAvailable()and(N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()+Y<8 and N.BestialWrath:CooldownRemains()<24+8-Y+N.BarbedShot:FullRechargeTime()and o())or _<9)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=217200;return true elseif(N.WildInstincts:IsAvailable()and g:BuffUp(N.CalloftheWildBuff)or N.WildCall:IsAvailable()and N.BarbedShot:ChargesFractional()>1.8 or N.BarbedShot:FullRechargeTime()<Y and(N.BestialWrath:CooldownRemains()>0 or not o())or N.ScentofBlood:IsAvailable()and(N.BestialWrath:CooldownRemains()<12+Y and o()or N.BarbedShot:FullRechargeTime()+Y<8 and N.BestialWrath:CooldownRemains()<24+8-Y+N.BarbedShot:FullRechargeTime()and o())or _<9)and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function at(aj)if aj:DebuffRefreshable(N.SerpentStingDebuff)and h:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==f("mouseover"):GUID()then a9=1271788;return true elseif aj:DebuffRefreshable(N.SerpentStingDebuff)and h:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and M.BeastMastery.TargetSwap=="AutoSwap"and aj:GUID()~=h:GUID()and not u then a9=999;return true elseif aj:DebuffRefreshable(N.SerpentStingDebuff)and h:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)and aj:GUID()==h:GUID()then a8=271788;return true elseif aj:DebuffRefreshable(N.SerpentStingDebuff)and h:TimeToDie()>N.SerpentStingDebuff:BaseDuration()and(aj:AffectingCombat()or aj:IsDummy()or aj:NPCID()==153285)then return true end end;local function au()if K.TargetIsValid()and a4 then if N.BarbedShot:IsCastable()and N.BarbedShot:Charges()>=2 then if p(N.BarbedShot)then a8=217200;return"Barbed Shot (PreCombat)"end end;if N.KillShot:IsReady()then if p(N.KillShot)then a8=53351;return"Kill Shot (PreCombat)"end end;if N.KillCommand:IsReady()and UnitExists("pet")and a6 then if p(N.KillCommand)then a8=34026;return"Kill Command (PreCombat)"end end;if PetEnemiesMixedCount>1 then if N.MultiShot:IsReady()then if p(N.MultiShot)then a8=2643;return"Multi-Shot (PreCombat)"end end else if N.CobraShot:IsReady()then if p(N.CobraShot)then a8=193455;return"Cobra Shot (PreCombat)"end end end end end;local function av()if o()and N.Berserking:IsCastable()and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and g:BuffUp(N.BestialWrathBuff)or _<13)then if p(N.Berserking,nil)then a8=26297;return"Berserking"end end;if o()and N.BloodFury:IsCastable()and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and g:BuffUp(N.BestialWrathBuff)or _<16)then if p(N.BloodFury,nil)then a8=20572;return"Blood Fury"end end;if o()and N.AncestralCall:IsCastable()and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and g:BuffUp(N.BestialWrathBuff)or _<16)then if p(N.AncestralCall,nil)then a8=274738;return"Ancestral Call"end end;if o()and N.Fireblood:IsCastable()and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and g:BuffUp(N.BestialWrathBuff)or _<9)then if p(N.Fireblood,nil)then a8=265221;return"Fireblood"end end;if M.Commons.Enabled.Potions and o()and v and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and g:BuffUp(N.BestialWrathBuff)or _<31)then local aw=K.PotionSelected()if aw and aw:IsReady()then if p(aw,nil,nil)then a8=50;return"potion cooldowns 2"end end end;if N.LightsJudgment:IsCastable()and o()and(i:BuffRemains(N.FrenzyPetBuff)>Y or i:BuffDown(N.FrenzyPetBuff))then if p(N.LightsJudgment,nil,nil,40)then a8=255647;return"Light's Judgment"end end end;local function ax()local ay=g:GetUseableTrinkets(Q,13)if ay and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and(g:BuffUp(N.BestialWrathBuff)and(g:BloodlustUp()or h:HealthPercentage()<20))or _<31)then if ay:ID()==W and M.Commons.Enabled.TopTrinket then if p(ay,nil,nil)then a8=24;return"Generic use_items for "..ay:Name()end end end;local az=g:GetUseableTrinkets(Q,14)if az and(g:BuffUp(N.CalloftheWildBuff)or not N.CalloftheWild:IsAvailable()and(g:BuffUp(N.BestialWrathBuff)and(g:BloodlustUp()or h:HealthPercentage()<20))or _<31)then if az:ID()==W and M.Commons.Enabled.BottomTrinket then if p(az,nil,nil)then a8=30;return"Generic use_items for "..az:Name()end end end end;local function aA()if N.BarbedShot:IsCastable()then if K.CastTargetIf(N.BarbedShot,a0,"max",ak,am,not h:IsSpellInRange(N.BarbedShot))then return"barbed_shot cleave 2"end;if ak(h)and am(h)then if p(N.BarbedShot,nil,nil,not a4)then a8=217200;return"barbed_shot cleave 2"end end end;if N.BarbedShot:IsCastable()then if K.CastTargetIf(N.BarbedShot,a0,"min",ai,an,not h:IsSpellInRange(N.BarbedShot))then return"barbed_shot cleave 4"end;if ai(h)and an(h)then if p(N.BarbedShot,nil,nil,not a4)then a8=217200;return"barbed_shot cleave 4"end end end;if N.MultiShot:IsReady()and(i:BuffRemains(N.BeastCleavePetBuff)<0.25+Y and(not N.BloodyFrenzy:IsAvailable()or N.CalloftheWild:CooldownDown()))then if p(N.MultiShot,nil,nil,not a4)then a8=2643;return"Multi-Shot (Cleave - 1)"end end;if N.BestialWrath:IsCastable()and o()then if p(N.BestialWrath,nil)then a8=19574;return"bestial_wrath cleave 8"end end;if N.KillCommand:IsReady()and(N.KillCommand:FullRechargeTime()<Y and N.AlphaPredator:IsAvailable()and N.KillCleave:IsAvailable())then if p(N.KillCommand)then a8=34026;return"Kill Command (Cleave)"end end;if N.CalloftheWild:IsCastable()and o()and h:IsInMeleeRange(40)then if p(N.CalloftheWild,nil)then a8=359844;return"CalloftheWild (Cleave)"end end;if N.KillCommand:IsReady()and N.KillCleave:IsAvailable()then if p(N.KillCommand,nil,nil,not h:IsInRange(50))then a8=34026;return"kill_command cleave 12"end end;if N.ExplosiveShot:IsReady()and h:IsInMeleeRange(40)and s then if p(N.ExplosiveShot,nil,nil,not h:IsInRange(40))then a8=212431;return"ExplosiveShot cleave 4"end end;if N.Stampede:IsCastable()and G then if p(N.Stampede,nil,nil,not a5)then a8=201430;return"Stampede (Cleave)"end end;if N.Bloodshed:IsCastable()and I then if p(N.Bloodshed,nil)then a8=321530;return"Bloodshed (ST)"end end;if N.DeathChakram:IsCastable()and s then if p(N.DeathChakram,nil,nil)then a8=325028;return"death_chakram st"end end;if N.AMurderofCrows:IsReady()then if p(N.AMurderofCrows,nil,nil,not h:IsSpellInRange(N.AMurderofCrows))then a8=131894;return"a_murder_of_crows cleave 24"end end;if N.BarbedShot:IsCastable()then if K.CastTargetIf(N.BarbedShot,a0,"max",ak,ao,not h:IsSpellInRange(N.BarbedShot))then a8=217200;return"barbed_shot cleave 26"end end;if N.BarbedShot:IsCastable()then if K.CastTargetIf(N.BarbedShot,a0,"min",ai,ap,not h:IsSpellInRange(N.BarbedShot))then a8=217200;return"barbed_shot cleave 28"end end;if N.KillCommand:IsReady()then if p(N.KillCommand,nil,nil,not h:IsSpellInRange(N.KillCommand))then a8=34026;return"kill_command cleave 30"end end;if N.DireBeast:IsCastable()then if p(N.DireBeast,nil,nil,not h:IsSpellInRange(N.DireBeast))then a8=120679;return"dire_beast cleave 32"end end;if N.SerpentSting:IsReady()then if K.CastTargetIf(N.SerpentSting,a0,"min",al,aq,not h:IsSpellInRange(N.SerpentSting))then return"serpent_sting cleave 34"end end;if N.Barrage:IsReady()and i:BuffRemains(N.FrenzyPetBuff)>N.Barrage:ExecuteTime()then if p(N.Barrage,nil,nil,not h:IsSpellInRange(N.Barrage))then a8=120360;return"barrage cleave 36"end end;if N.MultiShot:IsReady()and i:BuffRemains(N.BeastCleavePetBuff)<g:GCD()*2 then if p(N.MultiShot,nil,nil,not h:IsSpellInRange(N.MultiShot))then a8=2643;return"multishot cleave 38"end end;if o()and N.LightsJudgment:IsCastable()and(g:BuffDown(N.BestialWrathBuff)or h:TimeToDie()<5)then if p(N.LightsJudgment,nil,nil,not h:IsInRange(5))then a8=255647;return"lights_judgment cleave 40"end end;if N.KillShot:IsReady()then if p(N.KillShot,nil,nil,not h:IsSpellInRange(N.KillShot))then return"kill_shot cleave 42"end end;if N.CobraShot:IsReady()and g:FocusTimeToMax()<Y*2 then if p(N.CobraShot,nil,nil,not h:IsSpellInRange(N.CobraShot))then a8=193455;return"cobra_shot cleave 42"end end;if N.WailingArrow:IsReady()and(i:BuffRemains(N.FrenzyPetBuff)>N.WailingArrow:ExecuteTime()or _<5)then if p(N.WailingArrow,nil,nil,not h:IsSpellInRange(N.WailingArrow))then a8=392060;return"wailing_arrow cleave 44"end end;if N.BagofTricks:IsCastable()and o()and(g:BuffDown(N.BestialWrathBuff)or _<5)then if p(N.BagofTricks,nil)then a8=312411;return"bag_of_tricks cleave 46"end end;if N.ArcaneTorrent:IsCastable()and o()and g:Focus()+g:FocusRegen()+30<g:FocusMax()then if p(N.ArcaneTorrent,nil)then a8=155145;return"arcane_torrent cleave 48"end end;if N.KillShot:IsReady()then if p(N.KillShot,nil,nil,not h:IsSpellInRange(N.KillShot))then a8=53351;return"kill_shot cleave 50"end end end;local function aB()if N.BarbedShot:IsCastable()then if K.CastTargetIf(N.BarbedShot,a0,"min",ai,ar,not h:IsSpellInRange(N.BarbedShot))then return"barbed_shot st 2"end;if ai(h)and ar(h)then if p(N.BarbedShot,nil,nil,not a4)then a8=217200;return"barbed_shot st 2"end end end;if N.BarbedShot:IsCastable()and ar(h)then if p(N.BarbedShot,nil,nil,not h:IsSpellInRange(N.BarbedShot))then a8=217200;return"barbed_shot st mt_backup 3"end end;if N.CalloftheWild:IsCastable()and o()then if p(N.CalloftheWild,nil)then a8=359844;return"call_of_the_wild st 4"end end;if N.KillCommand:IsReady()and(N.KillCommand:FullRechargeTime()<Y and N.AlphaPredator:IsAvailable())then if p(N.KillCommand)then a8=34026;return"Kill Command (ST)"end end;if N.DeathChakram:IsCastable()and s then if p(N.DeathChakram,nil,nil)then a8=325028;return"death_chakram st"end end;if N.Bloodshed:IsCastable()and I then if p(N.Bloodshed,nil)then a8=321530;return"Bloodshed (ST)"end end;if s and N.DeathChakram:IsCastable()then if p(N.DeathChakram,nil,nil,not h:IsSpellInRange(N.DeathChakram))then a8=12345;return"death_chakram st 12"end end;if N.KillCommand:IsReady()then if p(N.KillCommand,nil,nil,not h:IsSpellInRange(N.KillCommand))then a8=34026;return"kill_command st 14"end end;if N.AMurderofCrows:IsCastable()then if p(N.AMurderofCrows,nil,nil,not a4)then a8=131894;return"A Murder of Crows (ST)"end end;if N.ExplosiveShot:IsReady()and h:IsInMeleeRange(40)and s then if p(N.ExplosiveShot,nil,nil,not h:IsInRange(40))then a8=212431;return"ExplosiveShot cleave 4"end end;if N.BestialWrath:IsCastable()and H and UnitExists("pet")and a2>0 then if p(N.BestialWrath,nil)then a8=19574;return"Bestial Wrath (ST)"end end;if N.KillCommand:IsReady()and UnitExists("pet")and a6 then if p(N.KillCommand)then a8=34026;return"Kill Command (ST)"end end;if N.BarbedShot:IsCastable()then if K.CastTargetIf(N.BarbedShot,a0,"min",ai,as,not h:IsSpellInRange(N.BarbedShot))then return"barbed_shot st 24"end;if ai(h)and as(h)then if p(N.BarbedShot,nil,nil,not a4)then a8=217200;return"barbed_shot st 24"end end end;if N.DireBeast:IsCastable()then if p(N.DireBeast,nil,nil,not a4)then a8=120679;return"Dire Beast (ST)"end end;if N.SerpentSting:IsReady()then if K.CastTargetIf(N.SerpentSting,a0,"min",al,at,not h:IsSpellInRange(N.SerpentSting))then return"serpent_sting st 28"end end;if N.KillShot:IsReady()then if p(N.KillShot,nil,nil,not a4)then a8=53351;return"Kill Shot (ST)"end end;if N.AspectoftheWild:IsCastable()and F and UnitExists("pet")and h:IsInMeleeRange(40)then if p(N.AspectoftheWild,nil)then a8=193530;return"Aspect of the Wild (Cleave)"end end;if N.CobraShot:IsReady()then if p(N.CobraShot,nil,nil,not a4)then a8=193455;return"Cobra Shot (ST)"end end;if N.WailingArrow:IsReady()and s and not D and not g:IsMoving()and h:IsInMeleeRange(40)and(i:BuffRemains(N.FrenzyPetBuff)>N.WailingArrow:ExecuteTime()or _<5)then if p(N.WailingArrow,nil,nil,not a4)then a8=355589;return"Wailing Arrow (ST)"end end;if o()then if N.BagofTricks:IsCastable()and o()and(g:BuffDown(N.BestialWrathBuff)or _<5)then if p(N.BagofTricks,nil,nil,not a4)then a8=312411;return"Bag of Tricks (ST)"end end;if N.ArcaneTorrent:IsCastable()and o()and g:Focus()+g:FocusRegen()+15<g:FocusMax()then if p(N.ArcaneTorrent,nil,nil,not h:IsInRange(8))then a8=155145;return"arcane_torrent st 50"end end end end;local function aC()t=HeroRotationCharDB.Toggles[5]s=HeroRotationCharDB.Toggles[4]u=HeroRotationCharDB.Toggles[12]v=not HeroRotationCharDB.Toggles[15]w=HeroRotationCharDB.Toggles[120]x=HeroRotationCharDB.Toggles[121]y=HeroRotationCharDB.Toggles[122]z=HeroRotationCharDB.Toggles[123]A=HeroRotationCharDB.Toggles[124]B=HeroRotationCharDB.Toggles[125]C=HeroRotationCharDB.Toggles[142]D=HeroRotationCharDB.Toggles[17]E=HeroRotationCharDB.Toggles[170]F=false;G=false;H=false;I=false;if M.BeastMastery.AspectoftheWild=="CDs"and o()or M.BeastMastery.AspectoftheWild=="Small CDs"and(o()or s)or M.BeastMastery.AspectoftheWild=="Always"then F=true end;if M.BeastMastery.Stampede=="CDs"and o()or M.BeastMastery.Stampede=="Small CDs"and(o()or s)or M.BeastMastery.Stampede=="Always"then G=true end;if M.BeastMastery.BestialWrathCD=="CDs"and o()or M.BeastMastery.BestialWrathCD=="Small CDs"and(o()or s)or M.BeastMastery.BestialWrathCD=="Always"then H=true end;if M.BeastMastery.Bloodshed=="CDs"and o()or M.BeastMastery.Bloodshed=="Small CDs"and(o()or s)or M.BeastMastery.Bloodshed=="Always"then I=true end;W=GetInventoryItemID("player",13)X=GetInventoryItemID("player",14)end;local function aD()if N.Stomp:IsAvailable()then d.SplashEnemies.ChangeFriendTargetsTracking("Mine Only")else d.SplashEnemies.ChangeFriendTargetsTracking("All")end;local W,aE=GetInventoryItemID("player",13)local X,aE=GetInventoryItemID("player",14)local aF=N.BloodBolt:IsPetKnown()and l.FindBySpellID(N.BloodBolt:ID())and N.BloodBolt or N.Bite:IsPetKnown()and l.FindBySpellID(N.Bite:ID())and N.Bite or N.Claw:IsPetKnown()and l.FindBySpellID(N.Claw:ID())and N.Claw or N.Smack:IsPetKnown()and l.FindBySpellID(N.Smack:ID())and N.Smack or nil;local aG=N.Growl:IsPetKnown()and l.FindBySpellID(N.Growl:ID())and N.Growl or nil;if n()then a3=g:GetEnemiesInRange(8)a0=g:GetEnemiesInRange(40)PetEnemiesMixed=aF and g:GetEnemiesInSpellActionRange(aF)or h:GetEnemiesInSplashRange(8)PetEnemiesMixedCount=aF and#PetEnemiesMixed or h:GetEnemiesInSplashRangeCount(8)else a3={}a0={}PetEnemiesMixed=h or{}PetEnemiesMixedCount=0 end;a4=h:IsInRange(40)a5=h:IsInRange(30)a6=aG and h:IsSpellInActionRange(aG)or h:IsInRange(30)Y=g:GCD()+0.150;if K.TargetIsValid()or g:AffectingCombat()then Z=d.BossFightRemains(nil,true)_=Z;if _==11111 then _=d.FightRemains(a0,false)end end;if a9>0 then a9=0 end;if a8>0 then a8=0 end;local aF=N.BloodBolt:IsPetKnown()and l.FindBySpellID(N.BloodBolt:ID())and N.BloodBolt or N.Bite:IsPetKnown()and l.FindBySpellID(N.Bite:ID())and N.Bite or N.Claw:IsPetKnown()and l.FindBySpellID(N.Claw:ID())and N.Claw or N.Smack:IsPetKnown()and l.FindBySpellID(N.Smack:ID())and N.Smack or nil;local aG=N.Growl:IsPetKnown()and l.FindBySpellID(N.Growl:ID())and N.Growl or nil;if n()then a0=g:GetEnemiesInRange(40)a2=aF and#g:GetEnemiesInSpellActionRange(aF)or h:GetEnemiesInSplashRangeCount(8)else a0={}a2=0 end;a4=h:IsInRange(40)a5=h:IsInRange(30)a6=aG and h:IsSpellInActionRange(aG)or h:IsInRange(30)aC()if N.Exhilaration:IsCastable()and g:HealthPercentage()<=M.Commons.ExhilarationHP then if p(N.Exhilaration,nil)then a8=109304;return"Exhilaration"end end;if g:HealthPercentage()<M.Commons.HealthstoneHP and P.Healthstone:IsReady()and P.Healthstone:CooldownRemains()<=0 then if m.Cast(P.Healthstone,nil)then a8=40;return"Healthstone HP"end end;if g:HealthPercentage()<M.Commons.HealPotHP and P.CosmicHealPot:IsReady()and P.CosmicHealPot:CooldownRemains()<=0 then if m.Cast(P.CosmicHealPot,nil)then a8=45;return"CosmicHealPot HP"end end;if g:HealthPercentage()<M.Commons.HealPotHP and P.HealPot:IsReady()and P.HealPot:CooldownRemains()<=0 then if m.Cast(P.HealPot,nil)then a8=41;return"HealPot HP"end end;if N.AspectoftheTurtle:IsCastable()and g:HealthPercentage()<=M.Commons.TurtleHP then if p(N.AspectoftheTurtle,nil)then a8=186265;return"AspectoftheTurtle"end end;if g:BuffUp(j(5384))then return false end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if N.CobraShot:IsCastable()and a4 then if p(N.CobraShot,nil)then a9=1193455;return"explosive MO SWD"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if N.CobraShot:IsCastable()and a4 then if p(N.CobraShot,nil)then a8=193455;return"explosive  SWD"end end end;J={333875,344739,228318,332158,321764,324914,326046,324776,340544,324736,328015,322433,334324,317936,327332,328288,195181,333293,320272,342139,355888,349933,356549,355934,353706,347775,357284,335141,327155,178658,333227,334800,334967,324737,326450,334470,320703,320012,324085,333241,344739,368477,368396,355057,356133,158337,164426,382555,412695,265368,8599,428291}if UnitExists("target")and N.TranqualizingShot:IsCastable()and not C then if UnitCanAttack("player","target")and UnitAffectingCombat("target")and UnitIsDead("target")~=true and N.TranqualizingShot:IsCastable()and N.TranqualizingShot:CooldownRemains(BypassRecovery)<=0 then for aH=0,40 do local aE,aE,aI,aJ,aE,aE,aE,aE,aE,aK=UnitBuff("target",aH)for aE,aL in pairs(J)do if aL==aK then if m.Cast(N.TranqualizingShot,nil)then a8=19801;return"Tranq Enrage"end end end end end end;if m.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+m.GUISettings.General.OpenerReset elseif m.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)m.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;if m.QueuedCast()then a8=m.QueuedCast()return"Custom Queue "..j(a8):ID()end;if w and N.Bindingshot:IsAvailable()and N.Bindingshot:CooldownRemains(BypassRecovery)<=0 then if m.Cast(N.Bindingshot,nil,nil,nil)then a8=109248;return"queue Binding Shot"end elseif(not N.Bindingshot:IsUsableP()or N.Bindingshot:CooldownRemains()>0)and w then HeroRotationCharDB.Toggles[120]=not HeroRotationCharDB.Toggles[120]m.Print("Binding Shot Queue is now "..(HeroRotationCharDB.Toggles[120]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if x and N.FreezingTrap:IsAvailable()and N.FreezingTrap:CooldownRemains(BypassRecovery)<=0 then if m.Cast(N.FreezingTrap,nil,nil,nil)then a8=187650;return"queue Freezing Trap"end elseif(not N.FreezingTrap:IsUsableP()or N.FreezingTrap:CooldownRemains()>0)and x then HeroRotationCharDB.Toggles[121]=not HeroRotationCharDB.Toggles[121]m.Print("Freezing Trap Queue is now "..(HeroRotationCharDB.Toggles[121]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if y and N.Intimidation:IsAvailable()and N.Intimidation:CooldownRemains(BypassRecovery)<=0 then if m.Cast(N.Intimidation,nil,nil,nil)then a8=19577;return"queue Intimidation"end elseif(not N.Intimidation:IsUsableP()or N.Intimidation:CooldownRemains()>0)and y then HeroRotationCharDB.Toggles[122]=not HeroRotationCharDB.Toggles[122]m.Print("Intimidation Queue is now "..(HeroRotationCharDB.Toggles[122]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if z and N.Flare:IsAvailable()and N.Flare:CooldownRemains(BypassRecovery)<=0 then if m.Cast(N.Flare,nil,nil,nil)then a8=1543;return"queue Flare"end elseif(not N.Flare:IsUsableP()or N.Flare:CooldownRemains()>0)and z then HeroRotationCharDB.Toggles[123]=not HeroRotationCharDB.Toggles[123]m.Print("Flare Queue is now "..(HeroRotationCharDB.Toggles[123]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A and N.TarTrap:IsAvailable()and N.TarTrap:CooldownRemains(BypassRecovery)<=0 then if m.Cast(N.TarTrap,nil,nil,nil)then a8=187698;return"queue TarTrap"end elseif(not N.TarTrap:IsUsableP()or N.TarTrap:CooldownRemains()>0)and A then HeroRotationCharDB.Toggles[124]=not HeroRotationCharDB.Toggles[124]m.Print("Tar Trap Queue is now "..(HeroRotationCharDB.Toggles[124]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if E and N.WailingArrow:IsAvailable()and N.WailingArrow:CooldownRemains(BypassRecovery)<=0 then if m.Cast(N.WailingArrow,nil,nil,nil)then a8=392060;return"queue WailingArrow"end elseif(not N.WailingArrow:IsUsableP()or N.WailingArrow:CooldownRemains()>0)and E then HeroRotationCharDB.Toggles[170]=not HeroRotationCharDB.Toggles[170]m.Print("WailingArrow Queue is now "..(HeroRotationCharDB.Toggles[170]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if g:BuffUp(j(5384))then return false end;if g:IsCasting(N.RevivePet)then if p(N.PoolFocus)then a8=999999;return"Pooling Focus"end end;if i:IsActive()and select(2,GetStablePetInfo(M.Commons.SummonPetSlot))~=select(1,UnitName("pet"))and M.Commons.SummonPetSlot~=0 and not g:IsMoving()and not g:PrevGCD(1,N.DismissPet)and not g:IsCasting(N.DismissPet)then if p(N.DismissPet,nil)then a8=2641;return"Dismiss Pet"end end;if N.SummonPet:IsCastable()and not i:IsActive()and M.Commons.SummonPetSlot~=0 then if M.Commons.SummonPetSlot==1 and not g:PrevGCD(1,O[M.Commons.SummonPetSlot])then if p(O[M.Commons.SummonPetSlot],nil)then a8=883;return"Summon Pet"end elseif M.Commons.SummonPetSlot==2 and not g:PrevGCD(1,O[M.Commons.SummonPetSlot])then if p(O[M.Commons.SummonPetSlot],nil)then a8=83242;return"Summon Pet"end elseif M.Commons.SummonPetSlot==3 and not g:PrevGCD(1,O[M.Commons.SummonPetSlot])then if p(O[M.Commons.SummonPetSlot],nil)then a8=83243;return"Summon Pet"end elseif M.Commons.SummonPetSlot==4 and not g:PrevGCD(1,O[M.Commons.SummonPetSlot])then if p(O[M.Commons.SummonPetSlot],nil)then a8=83244;return"Summon Pet"end elseif M.Commons.SummonPetSlot==5 and not g:PrevGCD(1,O[M.Commons.SummonPetSlot])then if p(O[M.Commons.SummonPetSlot],nil)then a8=83245;return"Summon Pet"end end end;if(i:IsDeadOrGhost()or not UnitExists("pet"))and N.RevivePet:IsCastable()and not g:IsMoving()and M.Commons.SummonPetSlot~=0 then if p(N.RevivePet,nil)then a8=982;return"Revive Pet"end end;local aM,aN,aE=GetSpellCooldown(34477)if g:AffectingCombat()and M.Commons.AutoMisdirect and not B then if aM+aN-GetTime()<=0 and N.Misdirection:IsAvailable()and N.Misdirection:CooldownRemains(BypassRecovery)<=0 and UnitExists("focus")and(UnitInParty("focus")or UnitInRaid("focus")or UnitIsUnit("focus","pet"))and IsItemInRange(32698,"focus")then if m.Cast(N.Misdirection)then a9=134477;return"MD Focus"end end end;if not i:IsDeadOrGhost()and UnitExists("pet")and N.MendPet:IsCastable()and i:HealthPercentage()<=M.Commons.MendPetHighHP and not g:PrevGCD(1,N.MendPet)then if p(N.MendPet)then a8=1982;return"Mend Pet High Priority"end end;if not g:AffectingCombat()and(t or M.BeastMastery.DBMSupport and(N.BestialWrath:IsCastable()and H and m.BossMods:GetPullTimer()<Y and m.BossMods:GetPullTimer()>0 or m.BossMods:GetPullTimer()<0.5 and m.BossMods:GetPullTimer()>0))and K.TargetIsValid()then a7=au()if a7 then return a7 end end;if K.TargetIsValid()and(g:AffectingCombat()or t)then if not h:AffectingCombat()and not h:IsDummy()and not h:NPCID()==153285 and a2>=1 then a8=999 end;if not h:AffectingCombat()and not h:IsDummy()and not h:NPCID()==153285 then if p(N.PoolFocus)then a8=999999;return"Pooling Focus"end end;if true then a7=av()if a7 then return a7 end end;if(M.Commons.Enabled.TopTrinket or M.Commons.Enabled.BottomTrinket)and o()then local a7=ax()if a7 then return a7 end end;if a2<2 or not N.BeastCleave:IsAvailable()and a2<3 then local a7=aB()if a7 then return a7 end end;if a2>2 or N.BeastCleave:IsAvailable()and a2>1 then local a7=aA()if a7 then return a7 end end;if not i:IsDeadOrGhost()and UnitExists("pet")and N.MendPet:IsCastable()and i:HealthPercentage()<=M.Commons.MendPetLowHP then if p(N.MendPet)then a8=1982;return"Mend Pet Low Priority (w/ Target)"end end;if p(N.PoolFocus)then a8=999999;return"Pooling Focus"end end;if not i:IsDeadOrGhost()and UnitExists("pet")and N.MendPet:IsCastable()and i:HealthPercentage()<=M.Commons.MendPetLowHP then if p(N.MendPet)then a8=1982;return"Mend Pet Low Priority (w/o Target)"end end end;local function aO()d.Print("BeastMastery can use pet abilities to better determine AoE, makes sure you have Growl and Blood Bolt / Bite / Claw / Smack in your player action bars.")if HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]m.ToggleIconFrame:UpdateButtonText(6)end end;function ReturnSpell1()if a8==0 then return 0 else return a8 end end;function ReturnSpellMO1()if a9==0 then return 0 else return a9 end end;m.SetAPL(253,aD,aO)