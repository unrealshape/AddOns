local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.Hunter then j.Hunter={}end;j.Hunter.BeastMastery={AMurderofCrows=j(131894),AnimalCompanion=j(267116),ArcaneShot=j(185358),AspectoftheWild=j(193530),BarbedShot=j(217200),Barrage=j(120360),BestialWrath=j(19574),ChimaeraShot=j(53209),CobraShot=j(193455),CounterShot=j(147362),DireBeast=j(120679),Exhilaration=j(109304),Flare=j(1543),FreezingTrap=j(187650),HuntersMark=j(257284),Intimidation=j(19577),KillCommand=j(34026),KillerInstinct=j(273887),KillShot=j(53351),Misdirection=j(34477),MultiShot=j(2643),Stampede=j(201430),TarTrap=j(187698),TranqualizingShot=j(19801),Bindingshot=j(109248),MendPet=j(136),RevivePet=j(982),SummonPet=j(883),SummonPet2=j(83242),SummonPet3=j(83243),SummonPet4=j(83244),SummonPet5=j(83245),Bite=j(17253,"pet"),BloodBolt=j(288962,"pet"),Claw=j(16827,"pet"),Growl=j(2649,"pet"),Smack=j(49966,"pet"),Bloodshed=j(321530),OneWithThePack=j(199528),ScentOfBlood=j(193532),SpittingCobra=j(257891),Stomp=j(199530),DeathChakram=j(325028),FlayedShot=j(324149),Fleshcraft=j(324631),ResonatingArrow=j(308491),WildSpirits=j(328231),WildSpiritsBuff=j(328275),PustuleEruption=j(351094),VolatileSolvent=j(323074),NesingwarysTrappingApparatusBuff=j(336744),SoulforgeEmbersDebuff=j(336746),WailingArrow=j(355589),Bloodletting=j(341440),NewfoundResolve=j(351149),AspectoftheWildBuff=j(193530),BeastCleavePetBuff=j(118455,"pet"),BeastCleaveBuff=j(268877),BerserkingBuff=j(26297),BestialWrathBuff=j(19574),BestialWrathPetBuff=j(186254,"pet"),BloodFuryBuff=j(20572),FrenzyPetBuff=j(272790,"pet"),AncestralCall=j(274738),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),RocketBarrage=j(69041),PoolFocus=j(999910)}j.Hunter.Marksmanship={SummonPet=j(883),HuntersMark=j(257284),Trueshot=j(288613),AimedShot=j(19434),RapidFire=j(257044),CarefulAim=j(260228),ExplosiveShot=j(212431),Barrage=j(120360),AMurderofCrows=j(131894),SerpentSting=j(271788),ArcaneShot=j(185358),TarTrap=j(187698),SteadyShot=j(56641),Flare=j(1543),KillShot=j(53351),Multishot=j(257620),CounterShot=j(147362),Exhilaration=j(109304),WildSpirits=j(328231),DeathChakram=j(325028),ResonatingArrow=j(308491),FlayedShot=j(324149),Fleshcraft=j(324631),EffusiveAnimaAccelerator=j(352188),PustuleEruption=j(351094),VolatileSolvent=j(323074),Berserking=j(26297),BloodFury=j(20572),AncestralCall=j(274738),Fireblood=j(265221),LightsJudgment=j(255647),BagofTricks=j(312411),PiercingShot=j(198670),CallingtheShots=j(260404),DoubleTap=j(260402),MasterMarksman=j(260309),SteadyFocus=j(193533),Volley=j(260243),ChimaeraShot=j(342049),DeadEye=j(321460),Streamline=j(260367),VolleyBuff=j(260243),MasterMarksmanBuff=j(269576),PreciseShotsBuff=j(260242),SteadyFocusBuff=j(193534),DeadEyeBuff=j(321461),TrickShotsBuff=j(257622),LockandLoadBuff=j(194594),FlayersMark=j(324156),SerpentStingDebuff=j(271788),HuntersMarkDebuff=j(257284),ResonatingArrowDebuff=j(308498),WildMarkDebuff=j(328275),EagletalonsTrueFocusBuff=j(336851),WailingArrow=j(355589)}j.Hunter.Survival={AncestralCall=j(274738),ArcaneTorrent=j(50613),BagofTricks=j(312411),Berserking=j(26297),BloodFury=j(20572),Fireblood=j(265221),LightsJudgment=j(255647),MendPet=j(136),RevivePet=j(982),SummonPet=j(883),SummonPet2=j(83242),SummonPet3=j(83243),SummonPet4=j(83244),SummonPet5=j(83245),AspectoftheEagle=j(186289),Carve=j(187708),CoordinatedAssault=j(266779),Exhilaration=j(109304),Flare=j(1543),Harpoon=j(190925),Intimidation=j(19577),KillCommand=j(259489),KillShot=j(320976),LatentPoison=j(273283),Misdirection=j(34477),Muzzle=j(187707),RaptorStrike=k(186270,265189),SerpentSting=j(259491),TranqualizingShot=j(19801),Bindingshot=j(109248),FreezingTrap=j(187650),SteelTrap=j(162488),SteelTrapDebuff=j(162487),TarTrap=j(187698),TarTrapDebuff=j(135299),PheromoneBomb=j(270323),PheromoneBombDebuff=j(270332),ShrapnelBomb=j(270335),ShrapnelBombDebuff=j(270339),VolatileBomb=j(271045),VolatileBombDebuff=j(271049),WildfireBomb=j(259495),WildfireBombDebuff=j(269747),AlphaPredator=j(269737),AMurderofCrows=j(131894),BirdsofPrey=j(260331),BloodseekerDebuff=j(259277),Butchery=j(212436),Chakrams=j(259391),FlankingStrike=j(269751),HydrasBite=j(260241),MongooseBite=k(259387,265888),MongooseFuryBuff=j(259388),TermsofEngagement=j(265895),TipoftheSpearBuff=j(260286),VipersVenom=j(268501),WildfireInfusion=j(271014),CoordinatedAssaultBuff=j(266779),InternalBleedingDebuff=j(270343),LatentPoisonDebuff=j(273286),SerpentStingDebuff=j(259491),VipersVenomBuff=j(268552),MadBombardierBuff=j(364490),DeathChakram=j(325028),FlayedShot=j(324149),Fleshcraft=j(324631),ResonatingArrow=j(308491),WildSpirits=j(328231),WildSpiritsDebuff=j(328275),PustuleEruption=j(351094),VolatileSolvent=j(323074),NessingwarysTrappingBuff=j(336744),SoulforgeEmbersDebuff=j(336746),PoolFocus=j(999910)}if not l.Hunter then l.Hunter={}end;l.Hunter.BeastMastery={PotionOfSpectralAgility=l(171270)}l.Hunter.Marksmanship={PotionOfSpectralAgility=l(171270)}l.Hunter.Survival={PotionOfSpectralAgility=l(171270),DreadfireVessel=l(184030,{13,14}),Jotungeirr=l(186404)}