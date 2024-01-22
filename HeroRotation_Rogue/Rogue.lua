local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.MouseOver;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=d.Utils.MergeTableByKey;local n=HeroRotation;local o=n.Commons.Everyone;local p=math.min;local pairs=pairs;local q={}local r=HeroRotationCharDB.Toggles[12]n.Commons.Rogue=q;local s={General=n.GUISettings.General,Commons=n.GUISettings.APL.Rogue.Commons,Assassination=n.GUISettings.APL.Rogue.Assassination,Outlaw=n.GUISettings.APL.Rogue.Outlaw,Subtlety=n.GUISettings.APL.Rogue.Subtlety}local t=0;local u=0;if not j.Rogue then j.Rogue={}end;j.Rogue.Commons={Shiv=j(5938),SliceandDice=j(315496),SealFate=j(14190),Stealth2=j(115191),VanishBuff2=j(115193),AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(25046),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),Shadowmeld=j(58984),CloakofShadows=j(31224),CrimsonVial=j(185311),Evasion=j(5277),Feint=j(1966),Blind=j(2094),CheapShot=j(1833),Kick=j(1766),KidneyShot=j(408),Sap=j(6770),Sprint=j(2983),TricksoftheTrade=j(57934),MasterAssassinsMark=j(340094),Flagellation=j(384631),FlagellationBuff=j(345569),Fleshcraft=j(324631),SerratedBoneSpike=j(385424),SerratedBoneSpikeDebuff=j(394036),EffusiveAnimaAccelerator=j(352188),KevinsOozeling=j(352110),KevinsWrathDebuff=j(352528),LeadbyExample=j(342156),LeadbyExampleBuff=j(342181),MarrowedGemstoneBuff=j(327069),PustuleEruption=j(351094),VolatileSolvent=j(323074),ChaosBaneBuff=j(355829),AcrobaticStrikes=j(196924),Alacrity=j(193539),ColdBlood=j(382245),DeeperStratagem=j(193531),Crackshot=j(423703),EchoingReprimand=j(385616),EchoingReprimand2=j(323558),EchoingReprimand3=j(323559),EchoingReprimand4=j(323560),EchoingReprimand5=j(354838),Elusiveness=j(79008),FindWeakness=j(91023),FindWeaknessDebuff=j(316220),ImprovedAmbush=j(381620),ResoundingClarity=j(381622),MarkedforDeath=j(137619),Nightstalker=j(14062),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),Sepsis=j(385408),SepsisBuff=j(375939),ShadowDance=j(185313),ShadowDanceBuff=j(185422),ShadowDanceTalent=j(394930),Shadowstep=j(36554),Subterfuge=j(108208),SubterfugeBuff=j(115192),ThistleTea=j(381623),ThistleTeaBuff=j(381623),Vigor=j(112651),Stealth=j(108208):IsAvailable()and j(115191)or j(1784),AcquiredSword=j(368657),AcquiredAxe=j(368656),AcquiredWand=j(368654),TheFirstRune=j(368635),TheFourthRune=j(368638),TheFinalRune=j(368641),PoolEnergy=j(999910),SinfulRevelationDebuff=j(324260),GracefulGuilde=j(423647),PickPocket=j(921),Vanish=j(1856),VanishBuff=j(11327),VanishBuff2=j(115193)}j.Rogue.Assassination=m(j.Rogue.Commons,{SliceandDice=j(315496),Exsanguinate=j(200806),Shiv=j(5938),ShroudedSuffocation=j(385478),Vendetta=j(79140),Ambush=j(8676),AmbushOverride=j(430023),AmplifyingPoison=j(381664),PickPocket=j(921),AmplifyingPoisonDebuff=j(383414),AmplifyingPoisonDebuffDeathmark=j(394328),CripplingPoisonDebuff=j(3409),DeadlyPoison=j(2823),DeadlyPoisonDebuff=j(2818),DeadlyPoisonDebuffDeathmark=j(394324),Envenom=j(32645),FanofKnives=j(51723),Garrote=j(703),GarroteDeathmark=j(360830),Mutilate=j(1329),PoisonedKnife=j(185565),Rupture=j(1943),RuptureDeathmark=j(360826),WoundPoison=j(8679),WoundPoisonDebuff=j(8680),ArterialPrecision=j(400783),AtrophicPoisonDebuff=j(392388),BlindsideBuff=j(121153),CausticSpatter=j(421975),CausticSpatterDebuff=j(421976),CrimsonTempest=j(121411),CutToTheChase=j(51667),DashingScoundrel=j(381797),Deathmark=j(360194),Doomblade=j(381673),DragonTemperedBlades=j(381801),Elusiveness=j(79008),ImprovedGarrote=j(381632),ImprovedGarroteBuff=j(392401),ImprovedGarroteAura=j(392403),IndiscriminateCarnage=j(381802),IndiscriminateCarnageAura=j(385754),IndiscriminateCarnageBuff=j(385747),InternalBleeding=j(154953),Kingsbane=j(385627),LightweightShiv=j(394983),MasterAssassin=j(255989),MasterAssassinBuff=j(256735),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),ScentOfBlood=j(381799),ScentOfBloodBuff=j(394080),SerratedBoneSpike=j(385424),SerratedBoneSpikeDebuff=j(394036),ShivDebuff=j(319504),VenomRush=j(152152)})j.Rogue.Outlaw=m(j.Rogue.Commons,{GrapplingHook=j(195457),Shiv=j(5938),SliceandDice=j(315496),DeeperStratagem=j(193531),ImprovedBetweentheEyes=j(235484),LoadedDice=j(256170),MarkedforDeath=j(137619),AdrenalineRush=j(13750),SSAudacity=j(197834),Ruthlessness=j(14161),Ambush=j(8676),AmbushOverride=j(430023),BetweentheEyes=j(315341),BladeFlurry=j(13877),Dispatch=j(2098),Elusiveness=j(79008),Opportunity=j(195627),PistolShot=j(185763),RolltheBones=j(315508),SinisterStrike=j(193315),Audacity=j(381845),AudacityBuff=j(386270),BladeRush=j(271877),CountTheOdds=j(381982),Crackshot=j(423703),DeftManeuvers=j(385835),Dreadblades=j(343142),FanTheHammer=j(381846),GhostlyStrike=j(196937),GreenskinsWickers=j(386823),GreenskinsWickersBuff=j(394131),HiddenOpportunity=j(383281),ImprovedAdrenalineRush=j(395422),ImprovedBetweenTheEyes=j(235484),KeepItRolling=j(381989),KillingSpree=j(51690),LoadedDiceBuff=j(256171),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),QuickDraw=j(196938),SummarilyDispatched=j(381990),SwiftSlasher=j(381988),TakeEmBySurpriseBuff=j(385907),UnderhandedUpperhand=j(424044),Weaponmaster=j(200733),PickPocket=j(921),Gouge=j(1776),Broadside=j(193356),BuriedTreasure=j(199600),GrandMelee=j(193358),RuthlessPrecision=j(193357),SkullandCrossbones=j(199603),TrueBearing=j(193359),ViciousFollowup=j(394879)})j.Rogue.Subtlety=m(j.Rogue.Commons,{Eviscerate=j(196819),Shiv=j(5938),SliceandDice=j(315496),Stealth=j(1784),Stealth2=j(115191),SymbolsofDeathCrit=j(227151),Vanish=j(1856),VanishBuff=j(11327),GoremawsBite=j(426591),SealFate=j(14190),CloakofShadows=j(31224),CrimsonVial=j(185311),Evasion=j(5277),Feint=j(1966),Blind=j(2094),CheapShot=j(1833),Kick=j(1766),KidneyShot=j(408),Shadowstep=j(36554),Sprint=j(2983),TricksoftheTrade=j(57934),DeathfromAbove=j(269513),Maneuverability=j(197000),ShadowyDuel=j(207736),SmokeBomb=j(212182),Shadowcraft=j(426594),VeilofMidnight=j(198952),DeathlyShadowsBuff=j(341202),FinalityBlackPowder=j(340603),FinalityEviscerate=j(340600),FinalityRupture=j(340601),Backstab=j(53),BlackPowder=j(319175),Elusiveness=j(79008),Rupture=j(1943),ShadowBlades=j(121471),Shadowstrike=j(185438),ShurikenStorm=j(197835),ShurikenToss=j(114014),SymbolsofDeath=j(212283),DanseMacabre=j(382528),DanseMacabreBuff=j(393969),DeeperDaggers=j(382517),DeeperDaggersBuff=j(383405),DarkBrew=j(382504),DarkShadow=j(245687),EnvelopingShadows=j(238104),Finality=j(382525),FinalityBlackPowderBuff=j(385948),FinalityEviscerateBuff=j(385949),FinalityRuptureBuff=j(385951),Flagellation=j(384631),FlagellationPersistBuff=j(394758),Gloomblade=j(200758),ImprovedShadowDance=j(393972),ImprovedShurikenStorm=j(319951),InvigoratingShadowdust=j(382523),LingeringShadow=j(382524),LingeringShadowBuff=j(385960),MasterofShadows=j(196976),PerforatedVeins=j(382518),PerforatedVeinsBuff=j(394254),PreyontheWeak=j(131511),PreyontheWeakDebuff=j(255909),Premeditation=j(343160),PremeditationBuff=j(343173),SecretStratagem=j(394320),SecretTechnique=j(280719),ShadowFocus=j(108209),ShurikenTornado=j(277925),SilentStorm=j(385722),SilentStormBuff=j(385727),TheFirstDance=j(382505),TheRotten=j(382015),TheRottenBuff=j(394203),Weaponmaster=j(193537)})if not l.Rogue then l.Rogue={}end;l.Rogue.Assassination={GalecallersBoon=l(159614,{13,14}),LustrousGoldenPlumage=l(159617,{13,14}),ComputationDevice=l(167555,{13,14}),VigorTrinket=l(165572,{13,14}),FontOfPower=l(169314,{13,14}),RazorCoral=l(169311,{13,14}),InscrutableQuantumDevice=l(179350,{13,14}),ShadowgraspTotem=l(179356,{13,14}),OverchargedAnimaBattery=l(180116,{13,14}),CacheOfAcquiredTreasures=l(188265,{13,14}),TheFirstSigil=l(188271,{13,14}),ScarsofFraternalStrife=l(188253,{13,14})}l.Rogue.Outlaw={PotionofSpectralAgility=l(171270),Healthstone=l(5512),HealPotL=l(191378),HealPotM=l(191379),HealPotH=l(191380),CosmicHealPot=l(187802),PhialofSerenity=l(177278),ManicGrieftorch=l(194308,{13,14}),WindscarWhetstone=l(137486,{13,14}),BeaconToTheBeyond=l(203963,{13,14}),DragonfireBombDispenser=l(202610,{13,14}),AlgetharPuzzleBox=l(193701,{13,14})}l.Rogue.Subtlety={PotionofSpectralAgility=l(171270),Healthstone=l(5512),HealPot=l(191380),CosmicHealPot=l(187802),PhialofSerenity=l(177278),ManicGrieftorch=l(194308,{13,14}),StormEatersBoon=l(194302,{13,14}),BeaconToTheBeyond=l(203963,{13,14}),AshesoftheEmbersoul=l(207167,{13,14}),WitherbarksBranch=l(109999,{13,14}),BandolierOfTwistedBlades=l(207165,{13,14}),Mirror=l(207581,{13,14})}function q.StealthSpell()return j.Rogue.Commons.Subterfuge:IsAvailable()and j.Rogue.Commons.Stealth2 or j.Rogue.Commons.Stealth end;function q.VanishBuffSpell()return j.Rogue.Commons.Subterfuge:IsAvailable()and j.Rogue.Commons.VanishBuff2 or j.Rogue.Commons.VanishBuff end;function q.Stealth(v,w)u=0;t=0;if(s.Commons.StealthOOC=="Always"or s.Commons.StealthOOC=="w/ Target"and o.TargetIsValid())and v:IsCastable()and g:StealthDown()and not g:DebuffUp(j(319070))then if n.Cast(v,nil)then t=200;return"Cast Stealth (OOC)"end else t=0 end;return false end;do local x=j(185311)function q.CrimsonVial()u=0;t=0;if x:IsCastable()and g:HealthPercentage()<=s.Commons.CrimsonVialHP then if n.Cast(x,nil)then t=201;return"Cast Crimson Vial (Defensives)"end end;return false end end;do local y=j(1966)local z=j(423647)function q.Feint()u=0;t=0;local A=y:IsCastable()and g:BuffDown(y)and g:HealthPercentage()<=s.Commons.FeintHP;if A and z:IsAvailable()and y:Charges()>1 then if n.Cast(y,nil)then t=202;return"Cast Feint (Defensives)"end elseif A and not z:IsAvailable()then if n.Cast(y,nil)then t=202;return"Cast Feint (Defensives)"end end end end;do local B=j(5277)function q.Evasion()u=0;t=0;if B:IsCastable()and g:BuffDown(B)and g:HealthPercentage()<=s.Commons.EvasionHP then if n.Cast(B,nil)then t=5277;return"Cast Evasion (Defensives)"end end end end;do local C=j(3408)local D=j(2823)local E=j(315584)local F=j(5761)local G=j(8679)local H=j(381637)function q.Poisons()u=0;t=0;local I=g:AffectingCombat()and 180 or 900;local J;if j(8679):IsAvailable()and s.Commons.LethalPoison=="Wound Poison"then J=g:BuffRemains(j(8679))if J<I and not g:IsCasting(j(8679))then if n.Cast(j(8679))then t=203;return"Wound Poison Refresh"end end elseif j(2823):IsAvailable()and s.Commons.LethalPoison=="Deadly Poison"then J=g:BuffRemains(j(2823))if J<I and not g:IsCasting(j(2823))then if n.Cast(j(2823))then t=208;return"Deadly Poison Refresh"end end elseif j(315584):IsAvailable()and s.Commons.LethalPoison=="Instant Poison"then J=g:BuffRemains(j(315584))if J<I and not g:IsCasting(j(315584))then if n.Cast(j(315584))then t=205;return"Instant Poison Refresh"end end end;if j(381637):IsAvailable()and s.Commons.NonLethalPoison=="Atrophic Poison"then J=g:BuffRemains(j(381637))if J<I and not g:IsCasting(j(381637))then if n.Cast(j(381637))then t=381637;return"Atropic Poison Refresh"end end elseif j(5761):IsAvailable()and s.Commons.NonLethalPoison=="Numbing Poison"then J=g:BuffRemains(j(5761))if J<I and not g:IsCasting(F)then if n.Cast(j(5761))then t=204;return"Numbing Poison Refresh"end end end end end;do local K=j.Rogue.Assassination;local L=j.Rogue.Subtlety;local function M()if K.Nightstalker:IsAvailable()and g:StealthUp(true,false,true)then return 1+0.05*K.Nightstalker:TalentRank()end;return 1 end;local function N()if K.ImprovedGarrote:IsAvailable()and(g:BuffUp(K.ImprovedGarroteAura,nil,true)or g:BuffUp(K.ImprovedGarroteBuff,nil,true)or g:BuffUp(K.SepsisBuff,nil,true))then return 1.5 end;return 1 end;K.Rupture:RegisterPMultiplier(M,{L.FinalityRuptureBuff,1.3})K.Garrote:RegisterPMultiplier(M,N)K.CrimsonTempest:RegisterPMultiplier(M)end;do local O={Counter=0,LastMH=0,LastOH=0}function q.TimeToSht(P)if O.Counter>=P then return 0 end;local Q,R=UnitAttackSpeed("player")local S=mathmax(O.LastMH+Q,GetTime())local T=mathmax(O.LastOH+R,GetTime())local U={}for V=0,2 do tableinsert(U,S+V*Q)tableinsert(U,T+V*R)end;table.sort(U)local W=p(5,mathmax(1,P-O.Counter))return U[W]-GetTime()end;d:RegisterForSelfCombatEvent(function()O.Counter=0;O.LastMH=GetTime()O.LastOH=GetTime()end,"PLAYER_ENTERING_WORLD")d:RegisterForSelfCombatEvent(function(X,X,X,X,X,X,X,X,X,X,X,Y)if Y==196911 then O.Counter=0 end end,"SPELL_ENERGIZE")d:RegisterForSelfCombatEvent(function(X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,Z)O.Counter=O.Counter+1;if Z then O.LastOH=GetTime()else O.LastMH=GetTime()end end,"SWING_DAMAGE")d:RegisterForSelfCombatEvent(function(X,X,X,X,X,X,X,X,X,X,X,X,X,X,X,Z)if Z then O.LastOH=GetTime()else O.LastMH=GetTime()end end,"SWING_MISSED")end;function q.MfDSniping(_)u=0;t=0;if _:IsCastable()and(g:AffectingCombat()or HeroRotationCharDB.Toggles[6])then local a0,a1=nil,60;local a2=i:IsInRange(30)and i:TimeToDie()or 11111;for X,a3 in pairs(g:GetEnemiesInRange(30))do local a4=a3:TimeToDie()if not a3:IsMfDBlacklisted()and a4<g:ComboPointsDeficit()*1.5 and a4<a1 then if a2-a4>1 then a0,a1=a3,a4 else a0,a1=i,a2 end end end;if a0 and a0:GUID()~=h:GUID()then n.CastLeftNameplate(a0,_)if a0:GUID()==f("mouseover"):GUID()and s.Subtlety.TargetSwap=="Mouseover"then u=1117 elseif s.Subtlety.TargetSwap=="AutoSwap"and a0:GUID()~=h:GUID()and not r then u=999 end end end end;function q.CanDoTUnit(a3,a5)return o.CanDoTUnit(a3,a5)end;do local a6=j(193531)local a7=j(394321)local a8=j(394320)function q.CPMaxSpend()return 5+(a6:IsAvailable()and 1 or 0)+(a7:IsAvailable()and 1 or 0)+(a8:IsAvailable()and 1 or 0)end end;function q.CPSpend()return p(g:ComboPoints(),q.CPMaxSpend())end;do function q.AnimachargedCP()if g:BuffUp(j.Rogue.Commons.EchoingReprimand2)then return 2 elseif g:BuffUp(j.Rogue.Commons.EchoingReprimand3)then return 3 elseif g:BuffUp(j.Rogue.Commons.EchoingReprimand4)then return 4 elseif g:BuffUp(j.Rogue.Commons.EchoingReprimand5)then return 5 end;return-1 end;function q.EffectiveComboPoints(a9)if a9==2 and g:BuffUp(j.Rogue.Commons.EchoingReprimand2)or a9==3 and g:BuffUp(j.Rogue.Commons.EchoingReprimand3)or a9==4 and g:BuffUp(j.Rogue.Commons.EchoingReprimand4)or a9==5 and g:BuffUp(j.Rogue.Commons.EchoingReprimand5)then return 7 end;return a9 end end;do local aa=j.Rogue.Assassination.DeadlyPoisonDebuff;local ab=j.Rogue.Assassination.WoundPoisonDebuff;local ac=j.Rogue.Assassination.AmplifyingPoisonDebuff;local ad=j.Rogue.Assassination.CripplingPoisonDebuff;local ae=j.Rogue.Assassination.AtrophicPoisonDebuff;function q.Poisoned(a3)return(a3:DebuffUp(aa)or a3:DebuffUp(ac)or a3:DebuffUp(ad)or a3:DebuffUp(ab)or a3:DebuffUp(ae))and true or false end end;do local af=j.Rogue.Assassination.Garrote;local ag=j.Rogue.Assassination.GarroteDeathmark;local ah=j.Rogue.Assassination.Rupture;local ai=j.Rogue.Assassination.RuptureDeathmark;local aj=j.Rogue.Assassination.InternalBleeding;local ak=0;function q.PoisonedBleeds()ak=0;for X,a3 in pairs(g:GetEnemiesInRange(50))do if q.Poisoned(a3)then if a3:DebuffUp(af)then ak=ak+1;if a3:DebuffUp(ag)then ak=ak+1 end end;if a3:DebuffUp(ah)then ak=ak+1;if a3:DebuffUp(ai)then ak=ak+1 end end;if a3:DebuffUp(aj)then ak=ak+1 end end end;return ak end end;do local al,am=j(340094),4;function q.MasterAssassinsMarkRemains()if g:BuffRemains(al)<0 then return g:GCDRemains()+am else return g:BuffRemains(al)end end end;function q.ReturnSpell()if t==0 then return 0 else return t end end;function q.ReturnSpellMO()if u==0 then return 0 else return u end end