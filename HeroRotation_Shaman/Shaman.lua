local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.MouseOver;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=HeroRotation;if not j.Shaman then j.Shaman={}end;j.Shaman.Enhancement={Bloodlust=j(2825),ChainLightning=j(188443),EarthElemental=j(198103),FlameShock=j(188389),FlameShockDebuff=j(188389),FlamentongueWeapon=j(318038),FrostShock=j(196840),LightningBolt=j(188196),LightningShield=j(192106),LightningShieldBuff=j(192106),WindShear=j(57994),CrashLightning=j(187874),FeralSpirit=j(51533),LavaLash=j(60103),Stormstrike=j(17364),Windstrike=j(115356),WindfuryTotem=j(8512),WindfuryTotemBuff=j(327942),WindfuryWeapon=j(33757),MaelstromWeaponBuff=j(344179),CrashLightningBuff=j(187878),Hex=j(51514),CleanseSpirit=j(51886),Purge=j(370),AstralShift=j(10871),CapacitorTotem=j(192058),HealingStreamTotem=j(5394),TremorTotem=j(8143),BloodFury=j(33697),Berserking=j(26297),Fireblood=j(265221),AncestralCall=j(274738),BagofTricks=j(312411),Ascendance=j(114051),AscendanceBuff=j(114051),Sundering=j(197214),Hailstorm=j(334195),HailstormBuff=j(334196),Stormkeeper=j(320137),StormkeeperBuff=j(320137),EarthenSpike=j(188089),EarthShield=j(974),FireNova=j(333974),LashingFlames=j(334046),LashingFlamesDebuff=j(334168),ElementalBlast=j(117014),Stormflurry=j(344357),HotHand=j(201900),HotHandBuff=j(215785),IceStrike=j(342240),CrashingStorm=j(192246),ElementalSpirits=j(262624),ForcefulWinds=j(262647),WindRushTotem=j(192077),CracklingSurgeBuff=j(224127),IcyEdgeBuff=j(224126),MoltenWeaponBuff=j(224125),FieldofBlossoms=j(319191),GroveInvigoration=j(322721),ChainHarvest=j(320674),FaeTransfusion=j(328923),PrimordialWave=j(326059),PrimordialWaveBuff=j(327164),VesperTotem=j(324386),Fleshcraft=j(324631),CallOfFlame=j(338303),PustuleEruption=j(351094),VolatileSolvent=j(323074),LeadByExample=j(342156),DoomWindsBuff=j(335903),DoomWindsDebuff=j(335904),PrimalLavaActuatorsBuff=j(335896),SplinteredElementsBuff=j(354648),AcquiredSwordBuff=j(368657),ScarsofFraternalStrifeBuff4=j(368638),Pool=j(999910)}j.Shaman.Elemental={Bloodlust=j(2825),ChainLightning=j(188443),CleanseSpirit=j(51886),EarthElemental=j(198103),FlameShock=j(188389),FlameShockDebuff=j(188389),FlamentongueWeapon=j(318038),FrostShock=j(196840),Hex=j(51514),LightningBolt=j(188196),LightningShield=j(192106),Purge=j(370),WindShear=j(57994),AstralShift=j(10871),HealingSurge=j(8004),CapacitorTotem=j(192058),HealingStreamTotem=j(5394),SpiritwalkersGrace=j(79206),SpiritwalkersGraceBuff=j(79206),TremorTotem=j(8143),BloodFury=j(33697),Berserking=j(26297),Fireblood=j(265221),AncestralCall=j(274738),BagofTricks=j(312411),EarthShock=j(8042),Earthquake=j(61882),FireElemental=j(198067),LavaBurst=j(51505),LavaSurgeBuff=j(77762),EarthenRage=j(170374),EchoOfTheElements=j(333919),StaticDischarge=j(342243),AncestralGuidance=j(108281),Aftershock=j(273221),EchoingShock=j(320125),EchoingShockBuff=j(320125),ElementalBlast=j(117014),EarthShield=j(974),MasterOfTheElements=j(16166),MasterOfTheElementsBuff=j(260734),StormElemental=j(192249),WindGustBuff=j(263806),LiquidMagmaTotem=j(192222),WindRushTotem=j(192077),SurgeOfPower=j(262303),PrimalElementalist=j(117013),Icefury=j(210714),IcefuryBuff=j(210714),UnlimitedPower=j(260895),Stormkeeper=j(191634),StormkeeperBuff=j(191634),Ascendance=j(114050),AscendanceBuff=j(114050),LavaBeam=j(114074),ChainHarvest=j(320674),FaeTransfusion=j(328923),PrimordialWave=j(326059),PrimordialWaveBuff=j(327164),VesperTotem=j(324386),Fleshcraft=j(324631),CallOfFlame=j(338303),PustuleEruption=j(351094),VolatileSolvent=j(323074),LeadByExample=j(342156),Meteor=j(117588),CallLightning=j(157348),CallLightningBuff=j(157348),EyeOfTheStorm=j(157375),EchoesofGreatSunderingBuff=j(336217),ElementalEquilibriumBuff=j(347348),SplinteredElementsBuff=j(354648),Pool=j(999910)}j.Shaman.Restoration={LightningBolt=j(188196),ChainLightning=j(188443),FlameShock=j(188389),FlameShockDebuff=j(188389),FrostShock=j(196840),LavaBurst=j(51505),LavaSurgeBuff=j(77762),WindShear=j(57994),SpiritwalkersGrace=j(79206),SpiritwalkersGraceBuff=j(79206),Fleshcraft=j(324631),VesperTotem=j(324386),Pool=j(999910)}if not l.Shaman then l.Shaman={}end;l.Shaman.Enhancement={PotionofSpectralAgility=l(171270),Healthstone=l(5512),HealPot=l(171267),PhialofSerenity=l(177278),CosmicHealPot=l(187802),CacheofAcquiredTreasures=l(188265,{13,14}),ScarsofFraternalStrife=l(188253,{13,14}),TheFirstSigil=l(188271,{13,14})}l.Shaman.Elemental={PotionofSpectralIntellect=l(171273),Healthstone=l(5512),HealPot=l(171267),PhialofSerenity=l(177278),CosmicHealPot=l(187802)}l.Shaman.Restoration={PotionofSpectralIntellect=l(171273)}