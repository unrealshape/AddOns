local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.MultiSpell;local l=d.Item;local m=d.Utils.MergeTableByKey;local n=HeroRotation;if not j.Evoker then j.Evoker={}end;j.Evoker.Commons={TailSwipe=j(368970),WingBuffet=j(357214),AzureStrike=j(362969),BlessingoftheBronze=j(364342),DeepBreath=j(357210),Disintegrate=j(356995),EmeraldBlossom=j(355913),FireBreath=k(357208,382266),LivingFlame=j(361469),AncientFlame=j(369990),BlastFurnace=j(375510),LeapingFlames=j(369939),ObsidianScales=j(363916),ScarletAdaptation=j(372469),SourceofMagic=j(369459),TipTheScales=j(370553),Unravel=j(368432),VerdantEmbrace=j(360995),AncientFlameBuff=j(375583),BlessingoftheBronzeBuff=j(381748),FireBreathDebuff=j(357209),HoverBuff=j(358267),LeapingFlamesBuff=j(370901),ScarletAdaptationBuff=j(372470),SourceofMagicBuff=j(369459),SpoilsofNeltharusCrit=j(381954),SpoilsofNeltharusHaste=j(381955),SpoilsofNeltharusMastery=j(381956),SpoilsofNeltharusVers=j(381957),Quell=j(351338),Pool=j(999910)}j.Evoker.Augmentation=m(j.Evoker.Commons,{BlackAttunement=j(403264),BronzeAttunement=j(403265),BlisteringScales=j(360827),BreathofEons=j(403631),DreamofSpring=j(414969),EbonMight=j(395152),Eruption=j(395160),FontofMagic=j(408083),InterwovenThreads=j(412713),Prescience=j(409311),PupilofAlexstrasza=j(407814),TimeSkip=j(404977),Upheaval=j(408092),BlackAttunementBuff=j(403264),BlisteringScalesBuff=j(360827),BronzeAttunementBuff=j(403265),EbonMightOtherBuff=j(395152),EbonMightSelfBuff=j(395296),EssenceBurstBuff=j(392268),PrescienceBuff=j(410089),TremblingEarthBuff=j(424368),TemporalWoundDebuff=j(409560)})j.Evoker.Devastation=m(j.Evoker.Commons,{Animosity=j(375797),ArcaneVigor=j(386342),Burnout=j(375801),Catalyze=j(386283),Causality=j(375777),ChargedBlast=j(370455),Dragonrage=j(375087),EngulfingBlaze=j(370837),EssenceAttunement=j(375722),EternitySurge=k(359073,382411),EternitysSpan=j(375757),EventHorizon=j(411164),EverburningFlame=j(370819),EyeofInfinity=j(369375),FeedtheFlames=j(369846),Firestorm=j(368847),FontofMagic=j(375783),ImminentDestruction=j(370781),Pyre=j(357211),RagingInferno=j(405659),RubyEmbers=j(365937),Scintillation=j(370821),ShatteringStar=j(370452),Snapfire=j(370783),Tyranny=j(376888),Volatility=j(369089),BlazingShardsBuff=j(409848),BurnoutBuff=j(375802),ChargedBlastBuff=j(370454),EmeraldTranceBuff=j(424155),EssenceBurstBuff=j(359618),IridescenceBlueBuff=k(386399,399370),IridescenceRedBuff=j(386353),LimitlessPotentialBuff=j(394402),PowerSwellBuff=j(376850),SnapfireBuff=j(370818),LivingFlameDebuff=j(361500)})if not l.Evoker then l.Evoker={}end;l.Evoker.Commons={AshesoftheEmbersoul=l(207167,{13,14}),BalefireBranch=l(159630,{13,14}),BeacontotheBeyond=l(203963,{13,14}),BelorrelostheSuncaller=l(207172,{13,14}),DragonfireBombDispenser=l(202610,{13,14}),IrideusFragment=l(193743,{13,14}),MirrorofFracturedTomorrows=l(207581,{13,14}),NeltharionsCalltoChaos=l(204201,{13,14}),NymuesUnravelingSpindle=l(208615,{13,14}),SpoilsofNeltharus=l(193773,{13,14}),Dreambinder=l(208616,{16}),Iridal=l(208321,{16}),KharnalexTheFirstLight=l(195519,{16}),ShadowedOrbofTorment=l(186428,{13,14})}l.Evoker.Augmentation=m(l.Evoker.Commons,{})l.Evoker.Devastation=m(l.Evoker.Commons,{})