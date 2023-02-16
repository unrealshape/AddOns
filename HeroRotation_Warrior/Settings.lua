local a, b = ...
local c = HeroRotation;
local d = HeroLib;
local e = d.GUI;
local f = e.CreateChildPanel;
local g = e.CreatePanelOption;
local h = c.GUI.CreateARPanelOption;
local i = c.GUI.CreateARPanelOptions;
c.GUISettings.APL.Warrior = {
    Commons = { Enabled = { Potions = false, TopTrinket = true, BottomTrinket = true }, DisplayStyle = {}, VictoryRushHP = 80, OffGCDasOffGCD = {} },
    Arms = { TargetSwap = "Mouseover", GCDasOffGCD = {}, OffGCDasOffGCD = {} },
    Fury = { TargetSwap = "AutoSwap", UseDefensives = true, RallyingCry = 20, IgnorePain = 50, EnragedRegneration = 30, UseCharge = false, OffGCDasOffGCD = {}, GCDasOffGCD = {} },
    Protection = { DisplayStyle = { Defensive = "Suggested" }, OffGCDasOffGCD = {}, GCDasOffGCD = { DemoralizingShout = false, DragonRoar = false, Avatar = false } } }
c.GUI.LoadSettingsRecursively(c.GUISettings)
local j = c.GUI.Panel;
local k = f(j, "Warrior")
local l = f(k, "Arms")
local m = f(k, "Fury")
local n = f(k, "Protection")
i(k, "APL.Warrior.Commons")
g("Slider", k, "APL.Warrior.Commons.VictoryRushHP", { 0, 100, 1 }, "Victory Rush HP",
    "Set the Victory Rush/Impending Victory HP threshold. Set to 0 to disable.")
i(l, "APL.Warrior.Arms")
g("Dropdown", l, "APL.Warrior.Arms.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method",
    "Choose Which Method to use to spread DoTs")
i(m, "APL.Warrior.Fury")
g("Dropdown", m, "APL.Warrior.Fury.TargetSwap", { "Mouseover", "AutoSwap" }, "DoT Spread Method",
    "Choose Which Method to use to spread DoTs")
g("CheckButton", m, "APL.Warrior.Fury.UseCharge", "Use Charge", "Suggest Charge in the Rotation")
g("CheckButton", m, "APL.Warrior.Fury.UseDefensives", "Use Defensives", "Toggle on to show Defensive Abilities")
g("Slider", m, "APL.Warrior.Fury.RallyingCry", { 0, 100, 1 }, "Rallying Cry HP %",
    "Set the HP threshold to use Rallying Cry")
g("Slider", m, "APL.Warrior.Fury.IgnorePain", { 0, 100, 1 }, "Ignore Pain HP %",
    "Set the HP threshold to use Ignore Pain")
g("Slider", m, "APL.Warrior.Fury.EnragedRegneration", { 0, 100, 1 }, "Enraged Regneration HP %",
    "Set the HP threshold to use Enraged Regneration")
i(n, "APL.Warrior.Protection")
