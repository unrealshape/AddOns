local a, b = ...
local c = HeroRotation;
local d = HeroLib;
local e = d.GUI;
local f = e.CreateChildPanel;
local g = e.CreatePanelOption;
local h = c.GUI.CreateARPanelOption;
local i = c.GUI.CreateARPanelOptions;
c.GUISettings.APL.Druid = { Commons = { Enabled = { Potions = true, TopTrinket = true, BotTrinket = true },
    TopTrinketHP = 0, BotTrinketHP = 0, DisplayStyle = {}, GCDasOffGCD = {}, OffGCDasOffGCD = {} },
    Balance = { TargetSwap = "Mouseover", AoeMode = "Aggresive", BarkskinHP = 50, RenewalHP = 40,
        ShowMoonkinFormOOC = false, UseBarkskinDefensively = false, GCDasOffGCD = {}, OffGCDasOffGCD = {} },
    Feral = { FillerSpell = "Rake Non-Snapshot", ShowCatFormOOC = false, UseOwlweave = false, GCDasOffGCD = { BsInc = true },
        OffGCDasOffGCD = { SkullBash = true, TigersFury = true } },
    Guardian = { TargetSwap = "Mouseover", UseRageDefensively = true, UseBarkskinDefensively = false,
        SwapForConvoke = false },
    Guardian2 = { BarkskinHP = 50, RenewalHP = 60, FrenziedRegenHP = 70, SurvivalInstinctsHP = 30, BristlingFurRage = 50,
        HealthstoneHP = 50, HealPotHP = 0, PhialHP = 60, MTRegrowth = 80, IGuardianOfUrsoc = 25 } }
c.GUI.LoadSettingsRecursively(c.GUISettings)
local j = c.GUI.Panel;
local k = f(j, "Druid")
local l = f(k, "Balance")
local m = f(k, "Feral")
local n = f(k, "Guardian")
local o = f(k, "Guardian Defensives")
i(k, "APL.Druid.Commons")
g("Slider", k, "APL.Druid.Commons.TopTrinketHP", { 0, 100, 1 }, "Top Trinket Defensive Threshold",
    "Set the HP percentage threshold of when to use Top Trinket. Set to 0 if not defensive")
g("Slider", k, "APL.Druid.Commons.BotTrinketHP", { 0, 100, 1 }, "Bottom Trinket Defensive Threshold",
    "Set the HP percentage threshold of when to use Bottom Trinket. Set to 0 if not defensive")
g("Dropdown", l, "APL.Druid.Balance.AoeMode", { "Aggresive", "Conservative" }, "AoE Detection Mode",
    "Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")
g("Dropdown", l, "APL.Druid.Balance.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method",
    "Choose Which Method to use to spread DoTs")
g("Slider", l, "APL.Druid.Balance.BarkskinHP", { 0, 100, 1 }, "Barkskin HP", "Set the Barkskin HP threshold.")
g("Slider", l, "APL.Druid.Balance.RenewalHP", { 0, 100, 1 }, "Renewal HP", "Set the Renewal HP threshold.")
g("CheckButton", l, "APL.Druid.Balance.ShowMoonkinFormOOC", "Show Moonkin Form Out of Combat",
    "Enable this if you want the addon to show you the Moonkin Form reminder out of combat.")
i(l, "APL.Druid.Balance")
g("Dropdown", m, "APL.Druid.Feral.FillerSpell", { "Shred", "Rake Non-Snapshot", "Rake Snapshot", "Moonfire", "Swipe" },
    "Preferred Filler Spell",
    "Select which spell to use as your filler spell. The SimC APL default is Rake Non-Snapshot.")
g("CheckButton", m, "APL.Druid.Feral.ShowCatFormOOC", "Show Cat Form Out of Combat",
    "Enable this if you want the addon to show you the Cat Form reminder out of combat.")
g("CheckButton", m, "APL.Druid.Feral.UseOwlweave", "Utilize Owleaving",
    "Enable this if you want Owlweaving spell suggestions when talented into Balance Affinity.")
i(m, "APL.Druid.Feral")
i(n, "APL.Druid.Guardian")
g("Dropdown", n, "APL.Druid.Guardian.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method",
    "Choose Which Method to use to spread DoTs")
g("CheckButton", n, "APL.Druid.Guardian.UseRageDefensively", "Use Rage Defensively",
    "Enable this if you want to save rage for defensive use, disabling Maul suggestions.")
g("CheckButton", n, "APL.Druid.Guardian.UseBarkskinDefensively", "Use Barkskin Defensively",
    "Enable this if you want to save Barkskin for defensive use, disabling offensive Barkskin with Brambles.")
g("CheckButton", n, "APL.Druid.Guardian.SwapForConvoke", "Swap Forms For Convoke",
    "Enable this if you want to swap to your affinity form before convoking")
i(o, "APL.Druid.Guardian2")
g("Slider", o, "APL.Druid.Guardian2.BarkskinHP", { 0, 100, 1 }, "Barkskin Threshold",
    "Set the HP percentage threshold of when to use Barkskin.")
g("Slider", o, "APL.Druid.Guardian2.FrenziedRegenHP", { 0, 100, 1 }, "Frenzied Regen Threshold",
    "Set the HP percentage threshold of when to use Frenzied Regeneration.")
g("Slider", o, "APL.Druid.Guardian2.RenewalHP", { 0, 100, 1 }, "Renewal Threshold",
    "Set the HP percentage threshold of when to use Renewal.")
g("Slider", o, "APL.Druid.Guardian2.SurvivalInstinctsHP", { 0, 100, 1 }, "Survival Instincts Threshold",
    "Set the HP percentage threshold of when to use Survival Instincts.")
g("Slider", o, "APL.Druid.Guardian2.BristlingFurRage", { 0, 100, 1 }, "Bristling Fur Threshold",
    "Set the Rage threshold of when to use Bristling Fur.")
g("Slider", o, "APL.Druid.Guardian2.HealthstoneHP", { 0, 100, 1 }, "Healthstone HP %",
    "Set the HP threshold to use Healthstone")
g("Slider", o, "APL.Druid.Guardian2.HealPotHP", { 0, 100, 1 }, "Healing Potion HP %",
    "Set the HP threshold to use Healing Potion")
g("Slider", o, "APL.Druid.Guardian2.PhialHP", { 0, 100, 1 }, "Phial of Serenity HP %",
    "Set the HP threshold to use Phial of Serenity")
g("Slider", o, "APL.Druid.Guardian2.MTRegrowth", { 0, 100, 1 }, "Mage Tower HP %",
    "Set the HP threshold to use Regrowth in the Mage Tower")
g("Slider", o, "APL.Druid.Guardian2.IGuardianOfUrsoc", { 0, 100, 1 }, "Incarnation: Guardian of Ursoc %",
    "Set the HP threshold to use Incarnation: Guardian of Ursoc")
