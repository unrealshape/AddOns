local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.Druid then j.Druid={}end;j.Druid.Balance={Berserking=j(26297),Barkskin=j(22812),CelestialAlignment=j(194223),EclipseLunar=j(48518),EclipseSolar=j(48517),Innervate=j(29166),Moonfire=j(8921),MoonfireDebuff=j(164812),MoonkinForm=j(24858),Starfall=j(191034),StarfallBuff=j(191034),Starfire=j(194153),Starsurge=j(78674),Sunfire=j(93402),SunfireDebuff=j(164815),Wrath=j(190984),ForceofNature=j(205636),FuryofElune=j(202770),Incarnation=j(102560),NaturesBalance=j(202430),Solstice=j(343647),SolsticeBuff=j(343648),SouloftheForest=j(114107),Starlord=j(202345),StarlordBuff=j(279709),StellarDrift=j(202354),StellarFlare=j(202347),StellarFlareDebuff=j(202347),TwinMoons=j(279620),WarriorofElune=j(202425),WarriorofEluneBuff=j(202425),FullMoon=j(274283),HalfMoon=j(274282),NewMoon=j(274281),AdaptiveSwarm=j(325727),AdaptiveSwarmDebuff=j(325733),AdaptiveSwarmHeal=j(325748),ConvoketheSpirits=j(323764),EmpowerBond=j(326647),KindredSpirits=j(326434),KindredEmpowermentEnergizeBuff=j(327022),RavenousFrenzy=j(323546),RavenousFrenzyBuff=j(323546),RavenousFrenzySHBuff=j(355315),ThrillSeeker=j(331586),ThrillSeekerBuff=j(331939),PreciseAlignment=j(340706),BOATArcaneBuff=j(339946),BOATNatureBuff=j(339943),OnethsClearVisionBuff=j(339797),OnethsPerceptionBuff=j(339800),PAPBuff=j(338825),TimewornDreambinderBuff=j(340049),Pool=j(999910)}j.Druid.Feral={Berserking=j(26297),Shadowmeld=j(58984),Barkskin=j(22812),Berserk=j(106951),CatForm=j(768),Clearcasting=j(135700),FerociousBite=j(22568),Maim=j(22570),Moonfire=j(155625),MoonfireDebuff=j(155625),Prowl=j(5215),Rake=j(1822),RakeDebuff=j(155722),Rip=j(1079),RipDebuff=j(1079),Shred=j(5221),SkullBash=j(106839),SouloftheForest=j(158476),SurvivalInstincts=j(61336),Swipe=j(106785),Thrash=j(106830),ThrashDebuff=j(106830),TigersFury=j(5217),BalanceAffinity=j(197488),Bloodtalons=j(319439),BloodtalonsBuff=j(145152),BrutalSlash=j(202028),FeralFrenzy=j(274837),HeartoftheWild=j(319454),HeartoftheWildBuff=j(108291),Incarnation=j(102543),LunarInspiration=j(155580),MightyBash=j(5211),Predator=j(202021),PrimalWrath=j(285381),Sabertooth=j(202031),SavageRoar=j(52610),WildCharge=j(49376),MoonfireOwl=j(8921),MoonkinForm=j(197625),Starsurge=j(197626),Sunfire=j(197630),AdaptiveSwarm=j(325727),AdaptiveSwarmDebuff=j(325733),AdaptiveSwarmHeal=j(325748),ConvoketheSpirits=j(323764),EmpowerBond=j(326647),Fleshcraft=j(324631),KindredSpirits=j(326434),KindredEmpowermentEnergizeBuff=j(327022),RavenousFrenzy=j(323546),RavenousFrenzyBuff=j(323546),DeepAllegiance=j(341378),PustuleEruption=j(351094),SuddenAmbushBuff=j(340698),TasteForBlood=j(340682),VolatileSolvent=j(323074),ApexPredatorsCravingBuff=j(339140),Pool=j(999910)}j.Druid.Guardian={Berserking=j(26297),Barkskin=j(22812),BearForm=j(5487),Berserk=j(50334),BerserkBuff=j(50334),CatForm=j(768),EclipseLunar=j(48518),EclipseSolar=j(48517),FerociousBite=j(22568),FrenziedRegeneration=j(22842),FrenziedRegenerationBuff=j(22842),IncapacitatingRoar=j(99),Ironfur=j(192081),IronfurBuff=j(192081),LycarasFleetingGlimpse=j(340060),Mangle=j(33917),Maul=j(6807),Moonfire=j(8921),MoonfireDebuff=j(164812),MoonkinForm=j(197625),OathofElderDruidBuff=j(338643),Prowl=j(5215),Rake=j(1822),RakeDebuff=j(155722),Rebirth=j(20484),RemoveCorruption=j(2782),Renewal=j(108238),Rip=j(1079),SkullBash=j(106839),StampedingRoar=j(106898),Starfire=j(197628),Starsurge=j(197626),Sunfire=j(197630),SunfireDebuff=j(164815),SurvivalInstincts=j(61336),Swipe=j(213771),Thrash=j(77758),ThrashDebuff=j(192090),Typhoon=j(132469),UrsolsVortex=j(102793),Soothe=j(2908),Wrath=j(5176),Brambles=j(203953),BalanceAffinity=j(197488),BristlingFur=j(155835),GalacticGuardianBuff=j(213708),BalanceAffinity=j(197488),FeralAffinity=j(202155),RestorationAffinity=j(197492),HeartoftheWild=j(319454),Incarnation=j(102558),IncarnationBuff=j(102558),Pulverize=j(80313),ToothandClawBuff=j(135286),WildCharge=j(16979),AdaptiveSwarm=j(325727),AdaptiveSwarmDebuff=j(325733),AdaptiveSwarmHeal=j(325748),ConvoketheSpirits=j(323764),EmpowerBond=j(326647),Fleshcraft=j(324631),KindredSpirits=j(326434),KindredEmpowermentEnergizeBuff=j(327022),RavenousFrenzy=j(323546),RavenousFrenzyBuff=j(323546),FirstStrike=j(325069),FirstStrikeBuff=j(325381),PustuleEruption=j(351094),SavageCombatantBuff=j(340613),VolatileSolvent=j(323074),Pool=j(999910)}if not l.Druid then l.Druid={}end;l.Druid.Balance={PotionofSpectralIntellect=l(171273),EmpyrealOrdinance=l(180117),InscrutableQuantumDevice=l(179350),InstructorsDivineBell=l(184842),ShadowedOrbofTorment=l(186428),SoullettingRuby=l(178809)}l.Druid.Feral={PotionofSpectralAgility=l(171270),Jotungeirr=l(186404)}l.Druid.Guardian={PotionofPhantomFire=l(171349),Jotungeirr=l(186404),Healthstone=l(5512),HealPot=l(171267),PhialofSerenity=l(177278)}