local a, b = ...
local c = HeroDBC.DBC
local d = HeroLib
local e = HeroCache
local f = d.Unit
local g = f.Player
local h = f.Target
local i = f.Pet
local j = d.Spell
local k = d.MultiSpell
local l = d.Item
local m = d.Utils.MergeTableByKey
local n = HeroRotation
if not j.Paladin then
  j.Paladin = {}
end
j.Paladin.Commons = {
  AncestralCall = j(274738),
  ArcanePulse = j(260364),
  ArcaneTorrent = j(50613),
  BagofTricks = j(312411),
  Berserking = j(26297),
  BloodFury = j(20572),
  Fireblood = j(265221),
  GiftoftheNaaru = j(59542),
  LightsJudgment = j(255647),
  Consecration = j(26573),
  CrusaderStrike = j(35395),
  DivineShield = j(642),
  DivineSteed = j(190784),
  FlashofLight = j(19750),
  HammerofJustice = j(853),
  HandofReckoning = j(62124),
  Judgment = j(20271),
  Rebuke = j(96231),
  ShieldoftheRighteous = j(53600),
  WordofGlory = j(85673),
  AvengingWrath = j(31884),
  HammerofWrath = j(24275),
  HolyAvenger = j(105809),
  LayonHands = j(633),
  Seraphim = j(152262),
  ZealotsParagon = j(391142),
  ConcentrationAura = j(317920),
  CrusaderAura = j(32223),
  DevotionAura = j(465),
  RetributionAura = j(183435),
  AvengingWrathBuff = j(31884),
  BlessingofDuskBuff = j(385126),
  ConsecrationBuff = j(188370),
  DivinePurposeBuff = j(223819),
  HolyAvengerBuff = j(105809),
  SeraphimBuff = j(152262),
  ShieldoftheRighteousBuff = j(132403),
  ConsecrationDebuff = j(204242),
  JudgmentDebuff = j(197277),
  Pool = j(999910)
}
j.Paladin.Protection =
  m(
  j.Paladin.Commons,
  {
    Judgment = j(275779),
    ArdentDefender = j(31850),
    AvengersShield = j(31935),
    BastionofLight = j(378974),
    BlessedHammer = j(204019),
    CrusadersJudgment = j(204023),
    DivineToll = j(375576),
    EyeofTyr = j(387174),
    GuardianofAncientKings = j(86659),
    HammeroftheRighteous = j(53595),
    MomentofGlory = j(327193),
    ArdentDefenderBuff = j(31850),
    BastionofLightBuff = j(378974),
    GuardianofAncientKingsBuff = j(86659),
    MomentofGloryBuff = j(327193),
    ShiningLightFreeBuff = j(327510)
  }
)
j.Paladin.Retribution =
  m(
  j.Paladin.Commons,
  {
    TemplarsVerdict = j(85256),
    AshestoDust = j(383300),
    BladeofJustice = j(184575),
    BladeofWrath = j(231832),
    Crusade = j(231895),
    DivineResonance = j(384027),
    DivineStorm = j(53385),
    DivineToll = j(375576),
    EmpyreanLegacy = j(387170),
    EmpyreanPower = j(326732),
    ExecutionSentence = j(343527),
    ExecutionersWrath = j(387196),
    Exorcism = j(383185),
    Expurgation = j(383344),
    FinalReckoning = j(343721),
    FinalVerdict = j(383328),
    FiresofJustice = j(203316),
    JusticarsVengeance = j(215661),
    RadiantDecree = j(383469),
    RadiantDecreeTalent = j(384052),
    RighteousVerdict = j(267610),
    ShieldofVengeance = j(184662),
    VanguardsMomentum = j(383314),
    WakeofAshes = j(255937),
    Zeal = j(269569),
    CrusadeBuff = j(231895),
    DivineResonanceBuff = j(384029),
    EmpyreanLegacyBuff = j(387178),
    EmpyreanPowerBuff = j(326733),
    TemplarsVerdict = j(85256),
    AshestoDust = j(383300),
    BladeofJustice = j(184575),
    BladeofWrath = j(231832),
    BlessedChampion = j(403010),
    BoundlessJudgment = j(405278),
    Crusade = j(231895),
    CrusadingStrikes = j(404542),
    DivineAuxiliary = j(406158),
    DivineHammer = j(198034),
    DivineResonance = j(384027),
    DivineStorm = j(53385),
    DivineToll = j(375576),
    EmpyreanLegacy = j(387170),
    EmpyreanPower = j(326732),
    ExecutionSentence = j(343527),
    ExecutionersWrath = j(387196),
    Exorcism = j(383185),
    Expurgation = j(383344),
    FinalReckoning = j(343721),
    FinalVerdict = j(383328),
    FiresofJustice = j(203316),
    HolyBlade = j(383342),
    Jurisdiction = j(402971),
    JusticarsVengeance = j(215661),
    RadiantDecree = j(383469),
    RadiantDecreeTalent = j(384052),
    RighteousVerdict = j(267610),
    ShieldofVengeance = j(184662),
    TemplarSlash = j(406647),
    TemplarStrike = j(407480),
    VanguardsMomentum = j(383314),
    WakeofAshes = j(255937),
    Zeal = j(269569),
    CrusadeBuff = j(231895),
    DivineArbiterBuff = j(406975),
    DivineResonanceBuff = j(384029),
    EmpyreanLegacyBuff = j(387178),
    EmpyreanPowerBuff = j(326733)
  }
)
j.Paladin.Holy =
  m(
  j.Paladin.Commons,
  {
    DivineProtection = j(498),
    HolyShock = j(20473),
    Judgment = j(275773),
    LightofDawn = j(85222),
    InfusionofLightBuff = j(54149),
    AvengingCrusader = j(216331),
    Awakening = j(248033),
    BestowFaith = j(223306),
    CrusadersMight = j(196926),
    GlimmerofLight = j(325966),
    GlimmerofLightDebuff = j(325966),
    HolyPrism = j(114165),
    LightsHammer = j(114158)
  }
)
if not l.Paladin then
  l.Paladin = {}
end
l.Paladin.Commons = {AlgetharPuzzleBox = l(193701, {13, 14})}
l.Paladin.Protection = m(l.Paladin.Commons, {})
l.Paladin.Retribution =
  m(
  l.Paladin.Commons,
  {
    PotionofSpectralAgility = l(171270),
    Healthstone = l(5512),
    HealPot = l(191380),
    CosmicHealPot = l(187802),
    PhialofSerenity = l(177278)
  }
)
l.Paladin.Holy = m(l.Paladin.Commons, {})
