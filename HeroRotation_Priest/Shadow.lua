local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=l.Cast;local p=l.CastSuggested;local q=HeroRotationCharDB.Toggles[4]local r=HeroRotationCharDB.Toggles[5]local s=HeroRotationCharDB.Toggles[6]local t=not HeroRotationCharDB.Toggles[15]local u=HeroRotationCharDB.Toggles[12]local v=HeroRotationCharDB.Toggles[60]local w=false;local x=false;local y=false;local z=false;local A=false;local B=math.min;local C=j.Priest.Shadow;local D=k.Priest.Shadow;local E={D.DarkmoonDeckPutrescence:ID(),D.DreadfireVessel:ID(),D.EmpyrealOrdinance:ID(),D.GlyphofAssimilation:ID(),D.InscrutableQuantumDevice:ID(),D.MacabreSheetMusic:ID(),D.ShadowedOrbofTorment:ID(),D.SinfulGladiatorsBadgeofFerocity:ID(),D.SoullettingRuby:ID(),D.SunbloodAmethyst:ID()}local F=g:GetEquipment()local G=k(0)local H=k(0)local I,J=GetInventoryItemID("player",13)local K,J=GetInventoryItemID("player",14)if F[13]then G=k(F[13])end;if F[14]then H=k(F[14])end;local L;local M,N,O,P;local Q,R;local S;local T;local U=0;local V=0;local W=0;local X=l.Commons.Everyone;local Y={General=l.GUISettings.General,Commons=l.GUISettings.APL.Priest.Commons,Shadow=l.GUISettings.APL.Priest.Shadow}local Z=false;local _=false;local a0=1;local a1=false;local a2=false;local a3=g:HasLegendaryEquipped(202)local a4=g:HasLegendaryEquipped(161)local a5=g:HasLegendaryEquipped(158)local a6=g:HasLegendaryEquipped(159)local a7=j(200174)d:RegisterForEvent(function()Z=false;_=false;a0=1;a1=false;a2=false end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()a3=g:HasLegendaryEquipped(202)a4=g:HasLegendaryEquipped(161)a5=g:HasLegendaryEquipped(158)a6=g:HasLegendaryEquipped(159)end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()C.ShadowCrash:RegisterInFlight()end,"LEARNED_SPELL_IN_TAB")C.ShadowCrash:RegisterInFlight()local function a8(a9)if a9 then return 1 else return 0 end end;local function aa(a9)return a9~=0 end;local function ab(ac,ad)if ad then return ac:DebuffUp(C.ShadowWordPainDebuff)and ac:DebuffUp(C.VampiricTouchDebuff)and ac:DebuffUp(C.DevouringPlagueDebuff)else return ac:DebuffUp(C.ShadowWordPainDebuff)and ac:DebuffUp(C.VampiricTouchDebuff)end end;local function ae(af)local ag=0;for ah in pairs(af)do local ai=af[ah]if ai:DebuffDown(C.ShadowWordPainDebuff)then ag=ag+1 end end;return ag end;local function aj(af)local ak=0;for ah in pairs(af)do local ai=af[ah]if ai:DebuffRefreshable(C.ShadowWordPainDebuff)then ak=ak+1 end end;return ak end;local function al(am)return not ab(am,true)end;local function an(am)if(am:HealthPercentage()<20 and R<4 or a7:TimeSinceLastCast()<=15 and a6)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=1136149;return true elseif(am:HealthPercentage()<20 and R<4 or a7:TimeSinceLastCast()<=15 and a6)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif(am:HealthPercentage()<20 and R<4 or a7:TimeSinceLastCast()<=15 and a6)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=136149;return true elseif(am:HealthPercentage()<20 and R<4 or a7:TimeSinceLastCast()<=15 and a6)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function ao(am)if am:TimeToDie()<20 and g:BuffDown(C.VoidformBuff)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=1319952;return true elseif am:TimeToDie()<20 and g:BuffDown(C.VoidformBuff)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif am:TimeToDie()<20 and g:BuffDown(C.VoidformBuff)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=319952;return true elseif am:TimeToDie()<20 and g:BuffDown(C.VoidformBuff)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function ap(am)if ab(am,false)and am:TimeToDie()>3 and(g:BuffDown(C.VoidformBuff)or g:BuffRemains(C.VoidformBuff)<C.VoidBolt:CooldownRemains()-0.5)and C.VampiricTouchDebuff:AuraActiveCount()>=R and R<5+6*a8(C.TwistofFate:IsAvailable())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=1263165;return true elseif ab(am,false)and am:TimeToDie()>3 and(g:BuffDown(C.VoidformBuff)or g:BuffRemains(C.VoidformBuff)<C.VoidBolt:CooldownRemains()-0.5)and C.VampiricTouchDebuff:AuraActiveCount()>=R and R<5+6*a8(C.TwistofFate:IsAvailable())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif ab(am,false)and am:TimeToDie()>3 and(g:BuffDown(C.VoidformBuff)or g:BuffRemains(C.VoidformBuff)<C.VoidBolt:CooldownRemains()-0.5)and C.VampiricTouchDebuff:AuraActiveCount()>=R and R<5+6*a8(C.TwistofFate:IsAvailable())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=263165;return true elseif ab(am,false)and am:TimeToDie()>3 and(g:BuffDown(C.VoidformBuff)or g:BuffRemains(C.VoidformBuff)<C.VoidBolt:CooldownRemains()-0.5)and C.VampiricTouchDebuff:AuraActiveCount()>=R and R<5+6*a8(C.TwistofFate:IsAvailable())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function aq(am)if(am:DebuffRefreshable(C.VampiricTouchDebuff)and(am:TimeToDie()>8 or am:IsDummy())or C.Misery:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)or g:BuffUp(C.UnfurlingDarknessBuff))and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=134914;return true elseif(am:DebuffRefreshable(C.VampiricTouchDebuff)and(am:TimeToDie()>8 or am:IsDummy())or C.Misery:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)or g:BuffUp(C.UnfurlingDarknessBuff))and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif(am:DebuffRefreshable(C.VampiricTouchDebuff)and(am:TimeToDie()>8 or am:IsDummy())or C.Misery:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)or g:BuffUp(C.UnfurlingDarknessBuff))and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=34914;return true elseif(am:DebuffRefreshable(C.VampiricTouchDebuff)and(am:TimeToDie()>8 or am:IsDummy())or C.Misery:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)or g:BuffUp(C.UnfurlingDarknessBuff))and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function ar(am)if am:DebuffRefreshable(C.ShadowWordPainDebuff)and am:TimeToDie()>4 and not C.Misery:IsAvailable()and not(C.SearingNightmare:IsAvailable()and R>a0)and(not C.PsychicLink:IsAvailable()or C.PsychicLink:IsAvailable()and R<=2)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=1589;return true elseif am:DebuffRefreshable(C.ShadowWordPainDebuff)and am:TimeToDie()>4 and not C.Misery:IsAvailable()and not(C.SearingNightmare:IsAvailable()and R>a0)and(not C.PsychicLink:IsAvailable()or C.PsychicLink:IsAvailable()and R<=2)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif am:DebuffRefreshable(C.ShadowWordPainDebuff)and am:TimeToDie()>4 and not C.Misery:IsAvailable()and not(C.SearingNightmare:IsAvailable()and R>a0)and(not C.PsychicLink:IsAvailable()or C.PsychicLink:IsAvailable()and R<=2)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=589;return true elseif am:DebuffRefreshable(C.ShadowWordPainDebuff)and am:TimeToDie()>4 and not C.Misery:IsAvailable()and not(C.SearingNightmare:IsAvailable()and R>a0)and(not C.PsychicLink:IsAvailable()or C.PsychicLink:IsAvailable()and R<=2)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function as(am)if C.SearingNightmare:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)and R>2 and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=148045;return true elseif C.SearingNightmare:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)and R>2 and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif C.SearingNightmare:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)and R>2 and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=48045;return true elseif C.SearingNightmare:IsAvailable()and am:DebuffRefreshable(C.ShadowWordPainDebuff)and R>2 and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function at(am)if g:Insanity()<90 and(ab(am,true)and(not C.VoidEruption:CooldownUp()or not x or not C.HungeringVoid:IsAvailable())or g:BuffUp(C.VoidformBuff))and(not C.HungeringVoid:IsAvailable()or am:DebuffUp(C.HungeringVoidDebuff)or g:BuffDown(C.VoidformBuff))and(not C.SearingNightmare:IsAvailable()or R<5)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then U=1323673;return true elseif g:Insanity()<90 and(ab(am,true)and(not C.VoidEruption:CooldownUp()or not x or not C.HungeringVoid:IsAvailable())or g:BuffUp(C.VoidformBuff))and(not C.HungeringVoid:IsAvailable()or am:DebuffUp(C.HungeringVoidDebuff)or g:BuffDown(C.VoidformBuff))and(not C.SearingNightmare:IsAvailable()or R<5)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;if U==999 then starttime=GetTime()endtime=starttime+0.25 elseif U>0 and endtime~=nil and GetTime()>endtime then U=0 end;return true elseif g:Insanity()<90 and(ab(am,true)and(not C.VoidEruption:CooldownUp()or not x or not C.HungeringVoid:IsAvailable())or g:BuffUp(C.VoidformBuff))and(not C.HungeringVoid:IsAvailable()or am:DebuffUp(C.HungeringVoidDebuff)or g:BuffDown(C.VoidformBuff))and(not C.SearingNightmare:IsAvailable()or R<5)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then V=323673;return true elseif g:Insanity()<90 and(ab(am,true)and(not C.VoidEruption:CooldownUp()or not x or not C.HungeringVoid:IsAvailable())or g:BuffUp(C.VoidformBuff))and(not C.HungeringVoid:IsAvailable()or am:DebuffUp(C.HungeringVoidDebuff)or g:BuffDown(C.VoidformBuff))and(not C.SearingNightmare:IsAvailable()or R<5)and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function au(am)return am:HealthPercentage()end;local function av(am)if(g:BuffUp(C.PowerInfusionBuff)or not Y.Shadow.SelfPI or D.ShadowedOrbofTorment:IsEquipped())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==f("mouseover"):GUID()and Y.Shadow.TargetSwap=="Mouseover"then if D.SoullettingRuby:ID()==GetInventoryItemID("player",13)then U=241;return true elseif D.SoullettingRuby:ID()==GetInventoryItemID("player",14)then U=251;return true end elseif(g:BuffUp(C.PowerInfusionBuff)or not Y.Shadow.SelfPI or D.ShadowedOrbofTorment:IsEquipped())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and Y.Shadow.TargetSwap=="AutoSwap"and am:GUID()~=h:GUID()and not u then U=999;return true elseif(g:BuffUp(C.PowerInfusionBuff)or not Y.Shadow.SelfPI or D.ShadowedOrbofTorment:IsEquipped())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)and am:GUID()==h:GUID()then if D.SoullettingRuby:ID()==GetInventoryItemID("player",13)then U=241;return true elseif D.SoullettingRuby:ID()==GetInventoryItemID("player",14)then U=251;return true end elseif(g:BuffUp(C.PowerInfusionBuff)or not Y.Shadow.SelfPI or D.ShadowedOrbofTorment:IsEquipped())and(am:AffectingCombat()or am:IsDummy()or am:NPCID()==153285)then return true end end;local function aw()if X.TargetIsValid()and not g:IsDeadOrGhost()and not g:AffectingCombat()and s and not g:IsMoving()then if C.ArcaneTorrent:IsCastable()and n()then if o(C.ArcaneTorrent,nil,nil,not h:IsSpellInRange(C.ArcaneTorrent))then V=28730;return"arcane_torrent 6"end end;if Y.Commons.Enabled.Trinkets and D.ShadowedOrbofTorment:IsEquippedAndReady()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>2)then if o(D.ShadowedOrbofTorment,nil,nil)then if D.ShadowedOrbofTorment:ID()==I then V=24;return"top trinket 1"elseif D.ShadowedOrbofTorment:ID()==K then V=30;return"top trinket 2"end end end;a0=2;if C.VampiricTouch:IsCastable()then if o(C.VampiricTouch,nil,nil,not h:IsSpellInRange(C.VampiricTouch))then V=34914;return"vampiric_touch 10"end end;if C.MindBlast:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.MindBlast:CastTime()+0.5)and(C.Misery:IsAvailable()and(not a4 or not C.VoidTorrent:IsAvailable()))then if o(C.MindBlast,nil,nil,not h:IsSpellInRange(C.MindBlast))then V=8092;return"mind_blast 12"end end;if C.VoidTorrent:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>3+0.5)and y and(C.Misery:IsAvailable()and a4)then if o(C.VoidTorrent,nil,nil,not h:IsSpellInRange(C.VoidTorrent))then V=263165;return"void_torrent 14"end end;if C.MindFlay:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>1)and not g:IsChanneling(C.MindFlay)and(C.Misery:IsAvailable()and a4 and not C.VoidTorrent:IsAvailable())then if o(C.MindFlay,nil,nil,not h:IsSpellInRange(C.MindFlay))then V=15407;return"mind_flay 15"end end;if C.ShadowWordPain:IsCastable()and not C.Misery:IsAvailable()then if o(C.ShadowWordPain,nil,nil,not h:IsSpellInRange(C.ShadowWordPain))then V=589;return"shadow_word_pain 16"end end end end;local function ax()if D.DarkmoonDeckPutrescence:IsEquippedAndReady()then if o(D.DarkmoonDeckPutrescence,nil,nil,not h:IsInRange(40))then if D.DarkmoonDeckPutrescence:ID()==I then V=24;return"top trinket 1"elseif D.DarkmoonDeckPutrescence:ID()==K then V=30;return"top trinket 2"end end end;if D.SunbloodAmethyst:IsEquippedAndReady()then if o(D.SunbloodAmethyst,nil,nil,not h:IsInRange(40))then if D.SunbloodAmethyst:ID()==I then V=24;return"top trinket 1"elseif D.SunbloodAmethyst:ID()==K then V=30;return"top trinket 2"end end end;if D.GlyphofAssimilation:IsEquippedAndReady()then if o(D.GlyphofAssimilation,nil,nil,not h:IsInRange(50))then if D.GlyphofAssimilation:ID()==I then V=24;return"top trinket 1"elseif D.GlyphofAssimilation:ID()==K then V=30;return"top trinket 2"end end end;if D.DreadfireVessel:IsEquippedAndReady()then if o(D.DreadfireVessel,nil,nil,not h:IsInRange(50))then if D.DreadfireVessel:ID()==I then V=24;return"top trinket 1"elseif D.DreadfireVessel:ID()==K then V=30;return"top trinket 2"end end end end;local function ay()if D.EmpyrealOrdinance:IsEquippedAndReady()and(C.VoidEruption:CooldownRemains()<=12 and x or(C.VoidEruption:CooldownRemains()>27 or not x))then if o(D.EmpyrealOrdinance,nil,nil,not h:IsInRange(40))then if D.EmpyrealOrdinance:ID()==I then V=24;return"top trinket 1"elseif D.EmpyrealOrdinance:ID()==K then V=30;return"top trinket 2"end end end;if D.InscrutableQuantumDevice:IsEquippedAndReady()and(g:BuffUp(C.VoidformBuff)and g:BuffUp(C.PowerInfusionBuff)or d.BossFilteredFightRemains("<=",20)or g:BuffUp(C.PowerInfusionBuff)and(d.BossFilteredFightRemains("<",C.VoidEruption:CooldownRemains()+15)or not x)or g:BuffUp(C.VoidformBuff)and(d.BossFilteredFightRemains("<",C.PowerInfusion:CooldownRemains()+15)or not w)or(C.PowerInfusion:CooldownRemains()>=10 or not w)and(C.VoidEruption:CooldownRemains()>=10 or not x)and d.BossFilteredFightRemains(">=",190))then if o(D.InscrutableQuantumDevice,nil,nil)then if D.InscrutableQuantumDevice:ID()==I then V=24;return"top trinket 1"elseif D.InscrutableQuantumDevice:ID()==K then V=30;return"top trinket 2"end end end;if D.MacabreSheetMusic:IsEquippedAndReady()and(C.VoidEruption:CooldownRemains()>10 or not x)then if o(D.MacabreSheetMusic,nil,nil)then if D.MacabreSheetMusic:ID()==I then V=24;return"top trinket 1"elseif D.MacabreSheetMusic:ID()==K then V=30;return"top trinket 2"end end end;if D.SoullettingRuby:IsEquippedAndReady()and(g:BuffUp(C.PowerInfusionBuff)or not Y.Shadow.SelfPI or D.ShadowedOrbofTorment:IsEquipped())then if o(D.SoullettingRuby,nil,nil)then if D.SoullettingRuby:ID()==I then V=24;return"top trinket 1"elseif D.SoullettingRuby:ID()==K then V=30;return"top trinket 2"end end end;if D.SinfulGladiatorsBadgeofFerocity:IsEquippedAndReady()and(C.VoidEruption:CooldownRemains()>=10 or not x)then if o(D.SinfulGladiatorsBadgeofFerocity,nil,nil)then if D.SinfulGladiatorsBadgeofFerocity:ID()==I then V=24;return"top trinket 1"elseif D.SinfulGladiatorsBadgeofFerocity:ID()==K then V=30;return"top trinket 2"end end end;if D.ShadowedOrbofTorment:IsEquippedAndReady()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>2.5)and(g:BuffDown(C.VoidformBuff)or g:PrevGCD(1,C.VoidBolt))then if o(D.ShadowedOrbofTorment,nil,nil)then if D.ShadowedOrbofTorment:ID()==I then V=24;return"top trinket 1"elseif D.ShadowedOrbofTorment:ID()==K then V=30;return"top trinket 2"end end end;if(not C.HungeringVoid:IsAvailable()or h:DebuffUp(C.HungeringVoidDebuff))and(g:BuffUp(C.VoidformBuff)or(C.VoidEruption:CooldownRemains()>10 or not x))then local L=ax()if L then return L end end;if g:BuffUp(C.VoidformBuff)or g:BuffUp(C.PowerInfusionBuff)or(C.VoidEruption:CooldownRemains()>10 or not x)then local az=g:GetUseableTrinkets(E)if az then if o(az,nil,nil)then if az:ID()==I then V=24;return"top trinket 1"elseif az:ID()==K then V=30;return"top trinket 2"end end end end end;local function aA()if C.PowerInfusion:IsCastable()and w and not g:IsMoving()and(Y.Shadow.SelfPI and(g:BuffUp(C.VoidformBuff)or g:Covenant()~="Kyrian"and(C.VoidEruption:CooldownRemains()>=10 or not x)or(d.BossFilteredFightRemains("<",C.VoidEruption:CooldownRemains())or not x))and(d.BossFilteredFightRemains(">=",C.VoidEruption:CooldownRemains()+15)and x and(C.VoidEruption:CooldownRemains()<=g:GCD()*4 and x)or d.BossFilteredFightRemains(">",C.PowerInfusion:Cooldown())and w or(d.BossFilteredFightRemains("<",C.VoidEruption:CooldownRemains()+15)or not x)or g:Covenant()=="Kyrian"or g:BloodlustUp()))then if o(C.PowerInfusion,nil)then V=10060;return"power_infusion 50"end end;if C.FaeGuardians:IsReady()and q and(g:BuffDown(C.VoidformBuff)and(not C.VoidTorrent:CooldownUp()or not y or not C.VoidTorrent:IsAvailable())and(Z and R==1 or C.VampiricTouchDebuff:AuraActiveCount()==R and R>1)or g:BuffUp(C.VoidformBuff)and(C.GroveInvigoration:IsAvailable()or C.FieldofBlossoms:IsAvailable()))then if o(C.FaeGuardians,nil)then V=327661;return"fae_guardians 52"end end;if C.Mindgames:IsReady()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.Mindgames:CastTime()+0.5)and not g:IsMoving()and q then if g:Insanity()<90 and(ab(h,true)and(not C.VoidEruption:CooldownUp()or not x or not C.HungeringVoid:IsAvailable())or g:BuffUp(C.VoidformBuff))and(not C.HungeringVoid:IsAvailable()or h:DebuffUp(C.HungeringVoidDebuff)or g:BuffDown(C.VoidformBuff))and(not C.SearingNightmare:IsAvailable()or R<5)then if o(C.Mindgames,nil,nil,not h:IsSpellInRange(C.Mindgames))then V=323673;return"mindgames 54"end end end;if C.UnholyNova:IsReady()and q and((g:BuffUp(C.PowerInfusionBuff)or(C.PowerInfusion:CooldownRemains()>=10 or not w)or not Y.Shadow.SelfPI)and(not C.HungeringVoid:IsAvailable()or h:DebuffUp(C.HungeringVoidDebuff)or g:BuffDown(C.VoidformBuff)))then if o(C.UnholyNova,nil,nil,not h:IsSpellInRange(C.UnholyNova))then V=324724;return"Shadow_nova 56"end end;if C.BoonoftheAscended:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.BoonoftheAscended:CastTime()+0.5)and q and(g:BuffDown(C.VoidformBuff)and(not C.VoidEruption:CooldownUp()or not x)and R>1 and not C.SearingNightmare:IsAvailable()or g:BuffUp(C.VoidformBuff)and R<2 and not C.SearingNightmare:IsAvailable()and(g:PrevGCD(1,C.VoidBolt)and(not D.EmpyrealOrdinance:IsEquipped()or not C.HungeringVoid:IsAvailable())or D.EmpyrealOrdinance:IsEquipped()and D.EmpyrealOrdinance:CooldownRemains()<=162 and h:DebuffUp(C.HungeringVoidDebuff))or g:BuffUp(C.VoidformBuff)and C.SearingNightmare:IsAvailable())then if o(C.BoonoftheAscended,nil)then V=325013;return"boon_of_the_ascended 58"end end;if Y.Commons.Enabled.Trinkets then local L=ay()if L then return L end end end;local function aB()if C.AscendedBlast:IsReady()and R<=3 then if o(C.AscendedBlast,nil,nil,not h:IsSpellInRange(C.AscendedBlast))then V=235283;return"ascended_blast 70"end end;if C.AscendedNova:IsReady()and(#M>1 and R>1+a8(C.SearingNightmare:IsAvailable()))then if o(C.AscendedNova,nil,nil,not h:IsInRange(8))then V=325020;return"ascended_nova 72"end end end;local function aC()if C.SearingNightmare:IsReady()and g:IsChanneling(C.MindSear)and(a1 and not a2 or T>0 and R>1)then if o(C.SearingNightmare,nil,nil,not h:IsInRange(40))then V=341385;return"searing_nightmare 80"end end;if C.SearingNightmare:IsReady()and g:IsChanneling(C.MindSear)and(T>0 and R>2)then if o(C.SearingNightmare,nil,nil,not h:IsInRange(40))then V=341385;return"searing_nightmare 82"end end;if C.MindBlast:IsCastable()and(g:BuffUp(C.DarkThoughtBuff)and(g:IsChanneling(C.MindFlay)or g:IsChanneling(C.MindSear)))then if o(C.MindBlast,nil,nil,not h:IsSpellInRange(C.MindBlast))then V=8092;return"mind_blast 84"end end end;local function aD()if g:BuffUp(C.BoonoftheAscendedBuff)then local L=aB()if L then return L end end;if C.VoidBolt:CooldownUp()and g:BuffUp(C.DissonantEchoesBuff)then if o(C.VoidBolt,nil,nil,not h:IsInRange(40))then V=214771;return"void_bolt 90"end end;if C.VoidEruption:IsReady()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.VoidErruption:CastTime()+0.5)and x and not g:IsMoving()and(a2 and(g:Insanity()>=40 or a7:TimeSinceLastCast()<=15 and a6 and(not C.MindBlast:CooldownUp()and not C.ShadowWordDeath:CooldownUp()or R>=4)and(g:Insanity()<=85 or C.SearingNightmare:IsAvailable()and a1)and(not a7:CooldownUp()or not A)and(not C.MindBlast:CooldownUp()or R>2)))then if o(C.VoidEruption,nil,nil,not h:IsSpellInRange(C.VoidEruption))then V=228260;return"void_eruption 92"end end;if C.ShadowWordPain:IsCastable()and(g:BuffUp(C.FaeGuardiansBuff)and h:DebuffDown(C.WrathfulFaerieDebuff)and R<4)then if C.Misery:IsAvailable()and h:TimeToDie()>=6 then if o(C.VampiricTouch,nil,nil,not h:IsSpellInRange(C.VampiricTouch))then V=34914;return"vampiric_touch 94"end else if o(C.ShadowWordPain,nil,nil,not h:IsSpellInRange(C.ShadowWordPain))then V=589;return"shadow_word_pain 94"end end end;if true then local L=aA()if L then return L end end;if C.MindSear:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>1)and not g:IsMoving()and not g:IsChanneling(C.MindSear)and(C.SearingNightmare:IsAvailable()and R>a0 and S>0 and(not a7:CooldownUp()or not A))then if o(C.MindSear,nil,nil,not h:IsSpellInRange(C.MindSear))then V=48045;return"mind_sear 97"end end;if C.Damnation:IsCastable()then if X.CastCycle(C.Damnation,O,al,not h:IsSpellInRange(C.Damnation))then V=341374;return"damnation 98"end end;if C.ShadowWordDeath:IsReady()and(a7:TimeSinceLastCast()<=15 and a6 and 15-a7:TimeSinceLastCast()<=g:GCD()+0.5)then if o(C.ShadowWordDeath,nil,nil,not h:IsSpellInRange(C.ShadowWordDeath))then V=136149;return"shadow_word_death 99"end end;if C.MindBlast:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.MindBlast:CastTime()+0.5)and not g:IsMoving()and R<4 and((C.MindBlast:Charges()>=1 and(h:DebuffUp(C.HungeringVoidDebuff)or not C.HungeringVoid:IsAvailable())or 15-a7:TimeSinceLastCast()<=C.MindBlast:CastTime()+g:GCD()+0.5)and a7:TimeSinceLastCast()<=15 and a6 and 15-a7:TimeSinceLastCast()>C.MindBlast:CastTime())then if o(C.MindBlast,nil,nil,not h:IsSpellInRange(C.MindBlast))then V=8092;return"mind_blast 100"end end;if C.VoidBolt:IsCastable()and(R<4 or C.HungeringVoid:IsAvailable()and R<=6)and(g:Insanity()<=85 and C.HungeringVoid:IsAvailable()and C.SearingNightmare:IsAvailable()and R<=6 or(C.HungeringVoid:IsAvailable()and not C.SearingNightmare:IsAvailable()or R==1))then if o(C.VoidBolt,nil,nil,not h:IsInRange(40))then V=214771;return"void_bolt 101"end end;if C.DevouringPlague:IsReady()and(R<3 or g:BuffUp(C.VoidformBuff))and((h:DebuffRefreshable(C.DevouringPlagueDebuff)or g:Insanity()>75)and(not a2 or g:Insanity()>=85)and(not C.SearingNightmare:IsAvailable()or C.SearingNightmare:IsAvailable()and not a1))then if o(C.DevouringPlague,nil,nil,not h:IsSpellInRange(C.DevouringPlague))then V=335467;return"devouring_plague 102"end end;if C.VoidBolt:IsCastable()and(R<4 or C.HungeringVoid:IsAvailable()and R<=6)and(R<4+a8(C.DissonantEchoes:ConduitEnabled())and g:Insanity()<=85 and C.SearingNightmare:IsAvailable()or not C.SearingNightmare:IsAvailable())then if o(C.VoidBolt,nil,nil,not h:IsInRange(40))then V=214771;return"void_bolt 103"end end;if C.ShadowWordDeath:IsReady()and h:IsSpellInRange(C.ShadowWordDeath)and(h:HealthPercentage()<20 and R<4 or a7:TimeSinceLastCast()<=15 and a6)then if o(C.ShadowWordDeath,nil)then V=136149;return"shadow_word_death 104"end end;if C.ShadowWordDeath:IsReady()and R<4 then if X.CastCycle(C.ShadowWordDeath,O,an,not h:IsSpellInRange(C.ShadowWordDeath),nil)then return"shadow_word_death 104"end end;if C.SurrenderToMadness:IsCastable()then if X.CastCycle(C.SurrenderToMadness,O,ao,not h:IsSpellInRange(C.SurrenderToMadness),Y.Shadow.OffGCDasOffGCD.SurrenderToMadness)then return"surrender_to_madness 106"end end;if C.VoidTorrent:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>3+0.5)and y and not g:IsMoving()and R<4 then if ab(h,false)and h:TimeToDie()>3 and(g:BuffDown(C.VoidformBuff)or g:BuffRemains(C.VoidformBuff)<C.VoidBolt:CooldownRemains()-0.5)and C.VampiricTouchDebuff:AuraActiveCount()>=R and R<5+6*a8(C.TwistofFate:IsAvailable())then if o(C.VoidTorrent,nil)then V=263165;return"void_torrent 107"end end end;if a7:IsCastable()and A and(h:DebuffUp(C.VampiricTouchDebuff)and(C.SearingNightmare:IsAvailable()and R>a0 or h:DebuffUp(C.ShadowWordPainDebuff))and(not a6 or C.VampiricTouchDebuff:AuraActiveCount()>=R))then if o(C.Mindbender,nil,nil,not h:IsSpellInRange(C.Mindbender))then V=200174;return"shadowfiend/mindbender 108"end end;if C.ShadowWordDeath:IsReady()and(a5 and Z and h:TimeToX(20)>C.ShadowWordDeath:Cooldown()+g:GCD())then if o(C.ShadowWordDeath,nil,nil,not h:IsSpellInRange(C.ShadowWordDeath))then V=136149;return"shadow_word_death 112"end end;if C.ShadowCrash:IsCastable()and z then if o(C.ShadowCrash,nil,nil,not h:IsInRange(40))then V=205385;return"shadow_crash 114"end end;if C.MindSear:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>1)and not g:IsMoving()and not g:IsChanneling(C.MindSear)and(R>a0 and g:BuffUp(C.DarkThoughtBuff))then if o(C.MindSear,nil,nil,not h:IsSpellInRange(C.MindSear))then V=48045;return"mind_sear 118"end end;if C.MindFlay:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>1)and not g:IsMoving()and not g:IsCasting(C.MindFlay)and(g:BuffUp(C.DarkThoughtBuff)and not(g:BuffUp(C.VoidformBuff)and C.VoidBolt:CooldownRemains()<=g:GCD())and Z)then if o(C.MindFlay,nil,nil,not h:IsSpellInRange(C.MindFlay))then V=15407;return"mind_flay 120"end end;if C.DevouringPlague:IsReady()and(R<3 or g:BuffUp(C.VoidformBuff))and R<4 and(a4 and Z and not _)then if o(C.DevouringPlague,nil,nil,not h:IsSpellInRange(C.DevouringPlague))then V=335467;return"devouring_plague 121"end end;if C.MindBlast:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.MindBlast:CastTime()+0.5)and not g:IsMoving()and(Z and R<4+2*a8(C.Misery:IsAvailable())+C.VampiricTouchDebuff:AuraActiveCount()*a8(C.PsychicLink:IsAvailable())+B(5,R)*a8(a7:TimeSinceLastCast()<=15 and a6)and(not a6 or(not a7:CooldownUp()or not A)and a6 or C.VampiricTouchDebuff:AuraActiveCount()==R))then if o(C.MindBlast,nil,nil,not h:IsSpellInRange(C.MindBlast))then V=8092;return"mind_blast 122"end end;if C.VampiricTouch:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.VampiricTouch:CastTime()+0.5)and not g:IsMoving()and(h:DebuffRefreshable(C.VampiricTouchDebuff)and not g:IsCasting(C.VampiricTouch)and h:IsSpellInRange(C.VampiricTouch)and(h:TimeToDie()>8 or h:IsDummy()or h:NPCID()==153285)or C.Misery:IsAvailable()and h:DebuffRefreshable(C.ShadowWordPainDebuff)or g:BuffUp(C.UnfurlingDarknessBuff))then if o(C.VampiricTouch,nil)then V=34914;return"vampiric_touch 124"end end;if C.VampiricTouch:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>C.VampiricTouch:CastTime()+0.5)and not g:IsMoving()and(R<4 or R<7 and g:Insanity()<30 and g:BuffDown(C.DarkThoughtBuff))then if X.CastCycle(C.VampiricTouch,O,aq,not h:IsSpellInRange(C.VampiricTouch))then return"vampiric_touch 124"end end;if C.ShadowWordPain:IsCastable()and R<4 and(h:DebuffRefreshable(C.ShadowWordPainDebuff)and h:TimeToDie()>4 and not C.Misery:IsAvailable()and C.PsychicLink:IsAvailable()and R>2)then if o(C.ShadowWordPain,nil,nil,not h:IsSpellInRange(C.ShadowWordPain))then V=589;return"shadow_word_pain 126"end end;if C.ShadowWordPain:IsCastable()and(h:DebuffRefreshable(C.ShadowWordPainDebuff)and h:IsSpellInRange(C.ShadowWordPain)and(h:TimeToDie()>4 or h:IsDummy()or h:NPCID()==153285)and not C.Misery:IsAvailable()and not(C.SearingNightmare:IsAvailable()and R>a0)and(not C.PsychicLink:IsAvailable()or C.PsychicLink:IsAvailable()and R<=2))then if o(C.ShadowWordPain,nil)then V=589;return"shadow_word_pain 128"end end;if C.ShadowWordPain:IsCastable()and R<4 and not C.Misery:IsAvailable()then if X.CastCycle(C.ShadowWordPain,O,ar,not h:IsSpellInRange(C.ShadowWordPain))then return"shadow_word_pain 128"end end;if C.MindSear:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>1)and not g:IsMoving()and not g:IsChanneling(C.MindSear)and R>a0 and(C.VoidBolt:CooldownRemains()>=g:GCD()or not g:BuffUp(C.VoidformBuff)or R>6)then if o(C.MindSear,nil,nil,not h:IsSpellInRange(C.MindSear))then V=48045;return"mind_sear 130"end end;if C.MindFlay:IsCastable()and(g:DebuffDown(j(240447))or g:DebuffRemains(j(240447))>1)and not g:IsMoving()and not g:IsChanneling(C.MindFlay)and R<=a0 and(C.VoidBolt:CooldownRemains()>=g:GCD()or not g:BuffUp(C.VoidformBuff))then if o(C.MindFlay,nil,nil,not h:IsSpellInRange(C.MindFlay))then V=15407;return"mind_flay 132"end end;if C.ShadowWordDeath:IsReady()and g:IsMoving()then if o(C.ShadowWordDeath,nil,nil,not h:IsSpellInRange(C.ShadowWordDeath))then V=136149;return"shadow_word_death 133"end end;if C.ShadowWordPain:IsCastable()and g:IsMoving()then if o(C.ShadowWordPain,nil,nil,not h:IsSpellInRange(C.ShadowWordPain))then V=589;return"shadow_word_pain 134"end end end;local function aE()s=HeroRotationCharDB.Toggles[6]q=HeroRotationCharDB.Toggles[4]r=HeroRotationCharDB.Toggles[5]u=HeroRotationCharDB.Toggles[12]t=not HeroRotationCharDB.Toggles[15]v=HeroRotationCharDB.Toggles[60]w=false;x=false;y=false;z=false;A=false;if Y.Shadow.IncludedCooldowns.PowerInfusion and n()or Y.Shadow.IncludedSmallCooldowns.PowerInfusion and(n()or r)or not Y.Shadow.IncludedSmallCooldowns.PowerInfusion and not Y.Shadow.IncludedCooldowns.PowerInfusion then w=true end;if Y.Shadow.IncludedCooldowns.VoidErruption and n()or Y.Shadow.IncludedSmallCooldowns.VoidErruption and(n()or r)or not Y.Shadow.IncludedSmallCooldowns.VoidErruption and not Y.Shadow.IncludedCooldowns.VoidErruption then x=true end;if Y.Shadow.IncludedCooldowns.VoidTorrent and n()or Y.Shadow.IncludedSmallCooldowns.VoidTorrent and(n()or r)or not Y.Shadow.IncludedSmallCooldowns.VoidTorrent and not Y.Shadow.IncludedCooldowns.VoidTorrent then y=true end;if Y.Shadow.IncludedCooldowns.ShadowCrash and n()or Y.Shadow.IncludedSmallCooldowns.ShadowCrash and(n()or r)or not Y.Shadow.IncludedSmallCooldowns.ShadowCrash and not Y.Shadow.IncludedCooldowns.ShadowCrash then z=true end;if Y.Shadow.IncludedCooldowns.MindBender and n()or Y.Shadow.IncludedSmallCooldowns.MindBender and(n()or r)or not Y.Shadow.IncludedSmallCooldowns.MindBender and not Y.Shadow.IncludedCooldowns.MindBender then A=true end end;local function aF()M=g:GetEnemiesInMeleeRange(8)N=g:GetEnemiesInRange(30)O=g:GetEnemiesInRange(40)P=h:GetEnemiesInSplashRange(15)I,J=GetInventoryItemID("player",13)K,J=GetInventoryItemID("player",14)if m()and Y.Commons.AoeMode=="Conservative"then Q=h:GetEnemiesInSplashRangeCount(8)R=h:GetEnemiesInSplashRangeCount(15)elseif m()and Y.Commons.AoeMode=="Aggresive"then local aG=0;for aH=1,20 do local aI="nameplate"..aH;if UnitExists(aI)then if UnitCanAttack("player",aI)then if UnitCanAttack("player",aI)and UnitAffectingCombat("target")and IsItemInRange(32698,aI)and UnitDetailedThreatSituation("player",aI)~=nil or f(aI):IsDummy()or string.find(UnitGUID(aI),153285)or string.find(UnitGUID(aI),31146)or string.find(UnitGUID(aI),176581)or string.find(UnitGUID(aI),179124)or string.find(UnitGUID(aI),179010)or string.find(UnitGUID(aI),180323)or string.find(UnitGUID(aI),179010)or string.find(UnitGUID(aI),179942)or string.find(UnitGUID(aI),176521)or string.find(UnitGUID(aI),177594)or string.find(UnitGUID(aI),177117)or string.find(UnitGUID(aI),176581)or string.find(UnitGUID(aI),180840)or string.find(UnitGUID(aI),176605)or UnitName(aI)=="Glacial Spike"or string.find(UnitGUID(aI),180473)or string.find(UnitGUID(aI),180474)or string.find(UnitGUID(aI),176929)or string.find(UnitGUID(aI),176920)or string.find(UnitGUID(aI),177154)or string.find(UnitGUID(aI),177787)or string.find(UnitGUID(aI),177889)or string.find(UnitGUID(aI),177891)or string.find(UnitGUID(aI),177892)or string.find(UnitGUID(aI),168326)then aG=aG+1 end end end end;Q=aG;R=aG end;if not m()then Q=1;R=1 end;if v then R=10;Q=10 end;S=ae(P)T=aj(P)if not BotOn then U=0;V=0 end;if U>0 then U=0 end;if V>0 then V=0 end;L=aE()if j(200174):IsAvailable()then a7=j(200174)else a7=j(132603)end;if l.GUISettings.General.OpenerReset>0 and not HeroRotationCharDB.Toggles[6]then starttime=GetTime()endtime=starttime+l.GUISettings.General.OpenerReset elseif l.GUISettings.General.OpenerReset>0 and endtime~=nil and GetTime()>endtime and HeroRotationCharDB.Toggles[6]then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]l.ToggleIconFrame:UpdateButtonText(6)l.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))end;local aJ=select(1,UnitCastingInfo("player"))if g:DebuffRemains(j(240447))<0.5 and g:DebuffUp(j(240447))and(g:IsChanneling(C.MindSear)or g:IsChanneling(C.MindFlay))then if o(C.Pool,nil)then V=1999;return"Quaking Stope"end end;if g:IsChanneling(j(355321))then if o(C.Pool,nil)then V=999;return"Trinket Channel"end end;if C.Shadowform:IsCastable()and g:BuffDown(C.ShadowformBuff)then if o(C.Shadowform,nil)then V=232698;return"shadowform 4"end end;if C.PowerWordShield:IsCastable()and g:DebuffDown(C.WeakenedSoul)and not g:IsChanneling()and not g:IsCasting()and(Y.Shadow.PWS=="Moving"and g:IsMoving()or Y.Shadow.PWS=="Always"or Y.Shadow.PWS=="OOC Moving"and g:IsMoving()and not g:AffectingCombat())then if o(C.PowerWordShield,nil)then V=17;return"PW:S Settings"end end;if g:IsChanneling(C.VoidTorrent)then if o(C.Pool,nil)then V=99999;return"channeling 4"end end;if not g:AffectingCombat()and X.TargetIsValid()and s then local L=aw()if L then return L end end;if UnitExists("mouseover")and string.find(UnitGUID("mouseover"),120651)then if C.ShadowWordDeath:IsCastable()then if o(C.ShadowWordDeath,nil)then U=1136149;return"explosive MO SWD"end end;if C.ShadowWordPain:IsCastable()then if o(C.ShadowWordPain,nil)then U=1589;return"explosive MO SWP"end end end;if UnitExists("target")and string.find(UnitGUID("target"),120651)then if C.ShadowWordDeath:IsCastable()then if o(C.ShadowWordDeath,nil)then V=136149;return"explosive  SWD"end end;if C.ShadowWordPain:IsCastable()then if o(C.ShadowWordPain,nil)then V=589;return"explosive  SWP"end end end;if X.TargetIsValid()and g:AffectingCombat()and(h:AffectingCombat()or h:IsDummy()or h:NPCID()==153285 or h:NPCID()==168326 or h:NPCID()==176581 or h:NPCID()==176920)and not g:IsDeadOrGhost()then if C.Dispersion:IsCastable()and g:HealthPercentage()<Y.Shadow.DispersionHP then if o(C.Dispersion,nil)then V=47585;return"dispersion low_hp"end end;if D.PotionofPhantomFire:IsReady()and Y.Commons.Enabled.Potions and t and(g:BuffUp(C.VoidformBuff)or g:BuffUp(C.PowerInfusionBuff))then if o(D.PotionofPhantomFire,nil,nil)then V=50;return"potion_of_spectral_intellect 2"end end;Z=ab(h,false)_=ab(h,true)a1=R>2+a8(g:BuffUp(C.VoidformBuff))a2=C.VoidEruption:CooldownUp()and x and(R==1 or R>=4 or C.HungeringVoid:IsAvailable()or g:Covenant()=="Kyrian")if n()then if C.Fireblood:IsCastable()and g:BuffUp(C.VoidformBuff)then if o(C.Fireblood,nil)then V=265221;return"fireblood 22"end end;if C.Berserking:IsCastable()and g:BuffUp(C.VoidformBuff)then if o(C.Berserking,nil)then V=26297;return"berserking 24"end end;if C.LightsJudgment:IsCastable()and R>=2 then if o(C.LightsJudgment,nil,nil,not h:IsSpellInRange(C.LightsJudgment))then V=255647;return"lights_judgment 26"end end;if C.AncestralCall:IsCastable()and g:BuffUp(C.VoidformBuff)then if o(C.AncestralCall,nil)then V=274738;return"ancestral_call 28"end end;if C.BagofTricks:IsCastable()then if o(C.BagofTricks,nil,nil,not h:IsSpellInRange(C.BagofTricks))then V=312411;return"bag_of_tricks 30"end end end;if true then local L=aC()if L then return L end end;if true then local L=aD()if L then return L end end end;if X.TargetIsValid()and not UnitIsFriend("target","player")and g:AffectingCombat()and(not h:AffectingCombat()and not h:IsDummy()and h:NPCID()~=153285)and not u then U=999 end end;local function aK()C.VampiricTouchDebuff:RegisterAuraTracking()end;function ReturnSpell()if V==0 then return 0 else return V end end;function ReturnSpellMO()if U==0 then return 0 else return U end end;l.SetAPL(258,aF,aK)