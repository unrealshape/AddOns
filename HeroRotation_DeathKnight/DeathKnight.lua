local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.DeathKnight then j.DeathKnight={}end;j.DeathKnight.Blood={Asphyxiate=j(221562),BloodBoil=j(50842),DancingRuneWeapon=j(49028),DeathAndDecay=j(43265),DeathsCaress=j(195292),DeathStrike=j(49998),HeartStrike=j(206930),IceboundFortitude=j(48792),Marrowrend=j(195182),RaiseDead=j(46585),RuneTap=j(194679),SacrificialPact=j(327574),VampiricBlood=j(55233),Blooddrinker=j(206931),BloodTap=j(221699),Bonestorm=j(194844),Consumption=j(274156),Heartbreaker=j(221536),RapidDecomposition=j(194662),RelishinBlood=j(317610),Tombstone=j(219809),AbominationLimb=j(315443),AbominationLimbBuff=j(315443),DeathsDue=j(324128),Fleshcraft=j(324631),ShackleTheUnworthy=j(312202),SwarmingMist=j(311648),PustuleEruption=j(351094),BoneShieldBuff=j(195181),CrimsonScourgeBuff=j(81141),DancingRuneWeaponBuff=j(81256),DeathAndDecayBuff=j(188290),DeathsDueBuff=j(324165),HemostasisBuff=j(273947),IceboundFortitudeBuff=j(48792),RuneTapBuff=j(194679),UnholyStrengthBuff=j(53365),VampiricBloodBuff=j(55233),BloodPlagueDebuff=j(55078),AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),MindFreeze=j(47528),Pool=j(999910)}j.DeathKnight.Frost={ChainsofIce=j(45524),DeathAndDecay=j(43265),DeathStrike=j(49998),EmpowerRuneWeapon=j(47568),FrostStrike=j(49143),FrostwyrmsFury=j(279302),HowlingBlast=j(49184),Obliterate=j(49020),PillarofFrost=j(51271),RaiseDead=j(46585),RemorselessWinter=j(196770),SacrificialPact=j(327574),Asphyxiate=j(108194),Avalanche=j(207142),BreathofSindragosa=j(152279),ColdHeart=j(281208),Frostscythe=j(207230),FrozenPulse=j(194909),GatheringStorm=j(194912),GlacialAdvance=j(194913),HornofWinter=j(57330),HypothermicPresence=j(321995),Icecap=j(207126),IcyTalons=j(194878),Obliteration=j(281238),RunicAttenuation=j(207104),AbominationLimb=j(315443),DeathsDue=j(324128),Fleshcraft=j(324631),ShackleTheUnworthy=j(312202),SwarmingMist=j(311648),BitingCold=j(337988),EradicatingBlow=j(337934),Everfrost=j(337988),PustuleEruption=j(351094),UnleashedFrenzy=j(338492),ColdHeartBuff=j(281209),DeathAndDecayBuff=j(188290),DeathStrikeBuff=j(101568),DeathsDueBuff=j(324165),EmpowerRuneWeaponBuff=j(47568),EradicatingBlowBuff=j(337936),FrozenPulseBuff=j(194909),IcyTalonsBuff=j(194879),KillingMachineBuff=j(51124),PillarofFrostBuff=j(51271),RimeBuff=j(59052),UnholyStrengthBuff=j(53365),UnleashedFrenzyBuff=j(338501),FrostFeverDebuff=j(55095),RazoriceDebuff=j(51714),AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),MindFreeze=j(47528),PoolRange=j(999910)}j.DeathKnight.Unholy={Apocalypse=j(275699),ArmyoftheDead=j(42650),DarkTransformation=j(63560),DeathAndDecay=j(43265),DeathCoil=j(47541),DeathStrike=j(49998),Epidemic=j(207317),FesteringStrike=j(85948),Outbreak=j(77575),RaiseDead=j(46584),SacrificialPact=j(327574),ScourgeStrike=j(55090),AntiMagicZone=j(51052),DeathGrip=j(49576),IceboundFortitude=j(48792),AntiMagicShell=j(48707),Lichborne=j(49039),RaiseAlly=j(61999),ArmyoftheDamned=j(276837),Asphyxiate=j(108194),BurstingSores=j(207264),ClawingShadows=j(207311),Defile=j(152280),Pestilence=j(277234),SoulReaper=j(343294),SummonGargoyle=k(49206,207349),UnholyAssault=j(207289),UnholyBlight=j(115989),UnholyPact=j(319230),DeathPact=j(48743),AbominationLimb=j(315443),DeathsDue=j(324128),Fleshcraft=j(324631),ShackleTheUnworthy=j(312202),SwarmingMist=j(311648),ConvocationOfTheDead=j(338553),FrenziedMonstrosity=j(334896),LeadByExample=j(342156),MarrowedGemstoneEnhancement=j(327069),PustuleEruption=j(351094),ThrillSeeker=j(331939),DeathAndDecayBuff=j(188290),DeathStrikeBuff=j(101568),DeathsDueBuff=j(324165),RunicCorruptionBuff=j(51460),SuddenDoomBuff=j(81340),SwarmingMistBuff=j(311648),UnholyAssaultBuff=j(207289),UnholyStrengthBuff=j(53365),BloodPlagueDebuff=j(55078),FesteringWoundDebuff=j(194310),FrostFeverDebuff=j(55095),UnholyBlightDebuff=j(115994),VirulentPlagueDebuff=j(191587),AncestralCall=j(274738),ArcanePulse=j(260364),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),MindFreeze=j(47528),PoolResources=j(999910)}if not l.DeathKnight then l.DeathKnight={}end;l.DeathKnight.Blood={PotionofPhantomFire=l(171349)}l.DeathKnight.Frost={PotionofSpectralStrength=l(171275),InscrutableQuantumDevice=l(179350)}l.DeathKnight.Unholy={PotionofSpectralStrength=l(171275),DarkmoonDeckVoracity=l(173087),DreadfireVessel=l(184030),InscrutableQuantumDevice=l(179350),MacabreSheetMusic=l(184024),Healthstone=l(5512),HealPot=l(171267)}