local a, b = ...
local c = HeroLib;
local d = HeroCache;
local e = c.Unit;
local f = e.Player;
local g = e.Target;
local h = c.Spell;
local i = c.Item;
local j = c.GUI;
local k = j.CreatePanelOption;
local l = math.max;
local m = math.min;
local pairs = pairs;
local select = select;
local n;
local o = {}
local p;
local q;
local r, s;
local t = { General = b.GUISettings.General }
local function u(v, w) if w then
        v.__MSQ_Normal:Hide()
        v.Texture:SetAllPoints(v)
        if v.CooldownFrame then v.CooldownFrame:SetAllPoints(v) end
        ;
        if v.Backdrop then
            v.Backdrop:Show()
            v.Backdrop:SetFrameLevel(m(v.Backdrop:GetFrameLevel(), 7))
        end
    else if v.Backdrop then v.Backdrop:Hide() end end end
;
local function x(y, z, A, B, C, D, E, w) if y == b and o and q then
        local F = q[z]
        if F then if type(F.Icon) == "table" then for G, H in pairs(F.Icon) do u(H, w) end else u(F, w) end end
    end end
;
BINDING_HEADER_HEROROTATION = "HeroRotation"
BINDING_NAME_HEROROTATION_CDS = "Toggle CDs"
BINDING_NAME_HEROROTATION_AOE = "Toggle AoE"
BINDING_NAME_HEROROTATION_TOGGLE = "Toggle On/Off"
BINDING_NAME_HEROROTATION_UNLOCK = "Unlock the addon to move icons"
BINDING_NAME_HEROROTATION_LOCK = "Lock the addon in place"
b.MainFrame = CreateFrame("Frame", "HeroRotation_MainFrame", UIParent)
b.MainFrame:SetFrameStrata(b.GUISettings.General.MainFrameStrata)
b.MainFrame:SetFrameLevel(10)
b.MainFrame:SetWidth(112)
b.MainFrame:SetHeight(96)
b.MainFrame:SetClampedToScreen(true)
function b.MainFrame:ResizeUI(I)
    local J = { { b.MainFrame, 112, 96 }, { b.MainIconFrame, 64, 64 }, { b.SmallIconFrame, 64, 32 },
        { b.SmallIconFrame.Icon[1], b.GUISettings.General.BlackBorderIcon and 30 or 32, b.GUISettings.General.BlackBorderIcon and 30 or 32 },
        { b.SmallIconFrame.Icon[2], b.GUISettings.General.BlackBorderIcon and 30 or 32, b.GUISettings.General.BlackBorderIcon and 30 or 32 },
        { b.LeftIconFrame, 48, 48 }, { b.SuggestedIconFrame, 32, 32 }, { b.RightSuggestedIconFrame, 32, 32 },
        { b.MainIconPartOverlayFrame, 64, 64 } }
    for G, K in pairs(J) do
        K[1]:SetWidth(K[2] * I)
        K[1]:SetHeight(K[3] * I)
    end
    ;
    for L = 1, b.MaxQueuedCasts do
        b.MainIconFrame.Part[L]:SetWidth(64 * I)
        b.MainIconFrame.Part[L]:SetHeight(64 * I)
    end
    ;
    b.SuggestedIconFrame:SetPoint("BOTTOM", b.MainIconFrame, "LEFT", -b.LeftIconFrame:GetWidth() / 2,
        b.LeftIconFrame:GetHeight() / 2 + (b.GUISettings.General.BlackBorderIcon and 3 * I or 4 * I))
    b.RightSuggestedIconFrame:SetPoint("BOTTOM", b.MainIconFrame, "RIGHT", b.LeftIconFrame:GetWidth() / 2,
        b.LeftIconFrame:GetHeight() / 2 + (b.GUISettings.General.BlackBorderIcon and 3 * I or 4 * I))
    HeroRotationDB.GUISettings["Scaling.ScaleUI"] = I
end

;
function b.MainFrame:ResizeButtons(I)
    local J = { { b.ToggleIconFrame, 64, 20 }, { b.ToggleIconFrame.Button[1], 30, 20 },
        { b.ToggleIconFrame.Button[2], 30, 20 }, { b.ToggleIconFrame.Button[3], 30, 20 },
        { b.ToggleIconFrame.Button[4], 30, 20 }, { b.ToggleIconFrame.Button[5], 30, 20 } }
    for M, K in pairs(J) do
        K[1]:SetWidth(K[2] * I)
        K[1]:SetHeight(K[3] * I)
    end
    ;
    for L = 1, 5 do b.ToggleIconFrame.Button[L]:SetPoint("LEFT", b.ToggleIconFrame, "LEFT",
            b.ToggleIconFrame.Button[L]:GetWidth() * (L - 3.1) + L, 0) end
    ;
    HeroRotationDB.GUISettings["Scaling.ScaleButtons"] = I
end

;
local N = h(18282)
function b.MainFrame:Unlock()
    b.ResetIcons()
    b.Cast(N)
    b.Cast(N, { true })
    b.Cast(N, { true })
    b.CastLeft(N)
    b.CastSuggested(N)
    b.CastRightSuggested(N)
    for M, K in pairs(p) do K:EnableMouse(true) end
    ;
    b.MainFrame:SetMovable(true)
    b.ToggleIconFrame:SetMovable(true)
    HeroRotationDB.Locked = false
end

;
function b.MainFrame:Lock()
    for M, K in pairs(p) do K:EnableMouse(false) end
    ;
    b.MainFrame:SetMovable(false)
    b.ToggleIconFrame:SetMovable(false)
    HeroRotationDB.Locked = true
end

;
function b.MainFrame:ToggleLock() if HeroRotationDB.Locked then
        b.MainFrame:Unlock()
        b.Print("HeroRotation UI is now |cff00ff00unlocked|r.")
    else
        b.MainFrame:Lock()
        b.Print("HeroRotation UI is now |cffff0000locked|r.")
    end end

;
local function O(self) self:StartMoving() end
;
b.MainFrame:SetScript("OnMouseDown", O)
local function P(self)
    self:StopMovingOrSizing()
    if not HeroRotationDB then HeroRotationDB = {} end
    ;
    local Q, R, S, T, U, V;
    Q, R, S, T, U = self:GetPoint()
    if not R then V = "UIParent" else V = R:GetName() end
    ;
    HeroRotationDB.IconFramePos = { Q, V, S, T, U }
end
;
b.MainFrame:SetScript("OnMouseUp", P)
b.MainFrame:SetScript("OnHide", P)
b.MainFrame:RegisterEvent("ADDON_LOADED")
b.MainFrame:SetScript("OnEvent",
    function(self, W, X) if W == "ADDON_LOADED" then if X == "HeroRotation" then
                q = { ["Main Icon"] = b.MainIconFrame,["Top Icons"] = b.SmallIconFrame,["Left Icon"] = b.LeftIconFrame,
                    ["Suggested Icon"] = b.SuggestedIconFrame,["Right Suggested Icon"] = b.RightSuggestedIconFrame,
                    ["Part Overlay"] = b.MainIconPartOverlayFrame }
                if not n then
                    n = LibStub("Masque", true)
                    if n then
                        n:Register("HeroRotation", x, b)
                        for Y, v in pairs(q) do o[v] = n:Group(a, Y) end
                    end
                end
                ;
                if type(HeroRotationDB) ~= "table" then HeroRotationDB = {} end
                ;
                if type(HeroRotationCharDB) ~= "table" then HeroRotationCharDB = {} end
                ;
                if type(HeroRotationDB.GUISettings) ~= "table" then HeroRotationDB.GUISettings = {} end
                ;
                if type(HeroRotationCharDB.GUISettings) ~= "table" then HeroRotationCharDB.GUISettings = {} end
                ;
                b.GUI.LoadSettingsRecursively(b.GUISettings)
                b.GUI.CorePanelSettingsInit()
                if HeroRotationDB and type(HeroRotationDB.IconFramePos) == "table" and #HeroRotationDB.IconFramePos == 5 then
                    b.MainFrame:SetPoint(HeroRotationDB.IconFramePos[1], _G[HeroRotationDB.IconFramePos[2]],
                        HeroRotationDB.IconFramePos[3], HeroRotationDB.IconFramePos[4], HeroRotationDB.IconFramePos[5]) else
                    b.MainFrame:SetPoint("CENTER", UIParent, "CENTER", -200, 0) end
                ;
                b.MainFrame:SetFrameStrata(b.GUISettings.General.MainFrameStrata)
                b.MainFrame:Show()
                b.MainIconFrame:Init()
                b.SmallIconFrame:Init()
                b.LeftIconFrame:Init()
                b.SuggestedIconFrame:Init()
                b.RightSuggestedIconFrame:Init()
                b.ToggleIconFrame:Init()
                if HeroRotationDB.GUISettings["Scaling.ScaleUI"] then b.MainFrame:ResizeUI(HeroRotationDB.GUISettings
                    ["Scaling.ScaleUI"]) end
                ;
                if HeroRotationDB.GUISettings["Scaling.ScaleButtons"] then b.MainFrame:ResizeButtons(HeroRotationDB
                    .GUISettings["Scaling.ScaleButtons"]) end
                ;
                for F, Z in pairs(q) do if type(Z.Icon) == "table" then for G, H in pairs(Z.Icon) do
                            H.GetNormalTexture = function(self) return nil end;
                            H.SetNormalTexture = function(self, _) self.Texture = _ end
                        end else
                        Z.GetNormalTexture = function(self) return nil end;
                        Z.SetNormalTexture = function(self, _) self.Texture = _ end
                    end end
                ;
                if o then
                    for F, Z in pairs(o) do if type(F.Icon) == "table" then for G, H in pairs(F.Icon) do if Z then Z
                                        :AddButton(H, { Icon = H.Texture, Cooldown = H.CooldownFrame or nil }) end end else if Z then
                                Z:AddButton(F, { Icon = F.Texture, Cooldown = F.CooldownFrame }) end end end
                    ;
                    for F, Z in pairs(o) do if Z then Z:ReSkin() end end
                end
                ;
                p = { b.MainFrame, b.MainIconFrame, b.MainIconPartOverlayFrame, b.MainIconFrame.Part[1],
                    b.MainIconFrame.Part[2], b.MainIconFrame.Part[3], b.SmallIconFrame, b.SmallIconFrame.Icon[1],
                    b.SmallIconFrame.Icon[2], b.LeftIconFrame, b.SuggestedIconFrame, b.RightSuggestedIconFrame,
                    b.ToggleIconFrame }
                local a0 = j.GetPanelByName("General")
                if a0 then
                    k("Slider", a0, "General.SetAlpha", { 0, 1, 0.05 }, "Addon Alpha",
                        "Change the addon's alpha setting.")
                    k("Button", a0, "ButtonMove", "Lock/Unlock", "Enable the moving of the frames.",
                        function() b.MainFrame:ToggleLock() end)
                    k("Button", a0, "ButtonReset", "Reset Buttons", "Resets the anchor of buttons.",
                        function() b.ToggleIconFrame:ResetAnchor() end)
                end
                ;
                local a1 = j.GetPanelByName("Scaling")
                if a1 then
                    k("Slider", a1, "Scaling.ScaleUI", { 0.5, 5, 0.1 }, "UI Scale", "Scale of the Icons.",
                        function(a2) b.MainFrame:ResizeUI(a2) end)
                    k("Slider", a1, "Scaling.ScaleButtons", { 0.5, 5, 0.1 }, "Buttons Scale", "Scale of the Buttons.",
                        function(a2) b.MainFrame:ResizeButtons(a2) end)
                    k("Slider", a1, "Scaling.ScaleHotkey", { 0.5, 5, 0.1 }, "Hotkey Scale", "Scale of the Hotkeys.")
                end
                ;
                C_Timer.After(2, function()
                    b.MainFrame:UnregisterEvent("ADDON_LOADED")
                    b.PulsePreInit()
                    b.PulseInit()
                end)
            end end end)
function b.PulsePreInit() b.MainFrame:Lock() end

;
local a3 = { [250] = "HeroRotation_DeathKnight",[251] = "HeroRotation_DeathKnight",[252] = "HeroRotation_DeathKnight",
    [577] = "HeroRotation_DemonHunter",[581] = "HeroRotation_DemonHunter",[102] = "HeroRotation_Druid",
    [103] = "HeroRotation_Druid",[104] = "HeroRotation_Druid",[105] = "HeroRotation_Druid",[1465] = "HeroRotation_Evoker",
    [1467] = "HeroRotation_Evoker",[253] = "HeroRotation_Hunter",[254] = "HeroRotation_Hunter",
    [255] = "HeroRotation_Hunter",[62] = "HeroRotation_Mage",[63] = "HeroRotation_Mage",[64] = "HeroRotation_Mage",
    [268] = "HeroRotation_Monk",[269] = "HeroRotation_Monk",[270] = "HeroRotation_Monk",[65] = "HeroRotation_Paladin",
    [66] = "HeroRotation_Paladin",[70] = "HeroRotation_Paladin",[256] = "HeroRotation_Priest",
    [257] = "HeroRotation_Priest",[258] = "HeroRotation_Priest",[259] = "HeroRotation_Rogue",[260] = "HeroRotation_Rogue",
    [261] = "HeroRotation_Rogue",[262] = "HeroRotation_Shaman",[263] = "HeroRotation_Shaman",
    [264] = "HeroRotation_Shaman",[265] = "HeroRotation_Warlock",[266] = "HeroRotation_Warlock",
    [267] = "HeroRotation_Warlock",[71] = "HeroRotation_Warrior",[72] = "HeroRotation_Warrior",
    [73] = "HeroRotation_Warrior" }
local a4 = 0;
local a5 = GetTime()
local a6 = 0;
function b.PulseInit()
    local a7 = GetSpecialization()
    if a7 == nil then
        c.PulseInitialized = false;
        C_Timer.After(1, function() b.PulseInit() end)
    else
        d.Persistent.Player.Spec = { GetSpecializationInfo(a7) }
        local a8 = d.Persistent.Player.Spec[1]
        if a8 == nil then
            c.PulseInitialized = false;
            C_Timer.After(1, function() b.PulseInit() end)
        else
            if a3[a8] and not IsAddOnLoaded(a3[a8]) then
                LoadAddOn(a3[a8])
                c.LoadOverrides(a8)
            end
            ;
            if a4 ~= a8 then
                if a3[a8] and b.APLs[a8] then
                    for M, K in pairs(p) do K:Show() end
                    ;
                    b.MainFrame:SetScript("OnUpdate", b.Pulse)
                    f:RegisterListenedSpells(a8)
                    c.UnregisterAuraTracking()
                    f:FilterTriggerGCD(a8)
                    h:FilterProjectileSpeed(a8)
                    if b.APLInits[a8] then b.APLInits[a8]() end
                    ;
                    if GetCVar("nameplateShowEnemies") ~= "1" then b.Print(
                            "It looks like enemy nameplates are disabled, you should enable them in order to get proper AoE rotation.") end
                else
                    b.Print("No Rotation found for this class/spec (SpecID: " ..
                    a8 ..
                    "), addon disabled. This is likely due to the rotation being unsupported at this time. Please check supported rotations here: https://github.com/herotc/hero-rotation#supported-rotations")
                    for M, K in pairs(p) do K:Hide() end
                    ;
                    b.MainFrame:SetScript("OnUpdate", nil)
                end
                ;
                a4 = a8
            end
            ;
            if not c.PulseInitialized then c.PulseInitialized = true end
        end
    end
end

;
b.Timer = { Pulse = 0 }
function b.Pulse()
    if not t.General.AdaptivePerformance then a6 = t.General.TickRate else
        local a9 = GetFramerate()
        if GetTime() > a5 + 2 then if t.General.TargetFrames - a9 >= 0 then if a6 + t.General.TargetFrames - a9 >= 250 then
                    a6 = 250;
                    a5 = GetTime()
                else
                    a6 = a6 + t.General.TargetFrames - a9;
                    a5 = GetTime()
                end else if a6 + t.General.TargetFrames - a9 <= 0 then
                    a6 = 0;
                    a5 = GetTime()
                else
                    a6 = a6 + t.General.TargetFrames - a9;
                    a5 = GetTime()
                end end end
    end
    ;
    if GetTime() > b.Timer.Pulse and b.Locked() then
        b.Timer.Pulse = GetTime() + 0.066 + a6 / 1000;
        b.ResetIcons()
        local a8 = d.Persistent.Player.Spec[1]
        if a8 then
            if b.ON() and b.Ready() then
                c.CacheHasBeenReset = false;
                d.Reset()
                if b.GUISettings.General.RotationDebugOutput then
                    s = b.APLs[a8]()
                    if s and s ~= r then
                        b.Print(s)
                        r = s
                    end
                else b.APLs[a8]() end
            end
            ;
            if o then for F, Z in pairs(o) do if Z then Z:ReSkin() end end end
        end
    end
end

;
function b.Ready()
    local aa;
    if b.GUISettings.General.ShowWhileMounted then aa = not f:IsDeadOrGhost() and not f:IsInVehicle() and
            not C_PetBattles.IsInBattle() else aa = not f:IsDeadOrGhost() and not f:IsMounted() and not f:IsInVehicle() and
            not C_PetBattles.IsInBattle() end
    ;
    return aa
end

;
function b.ChangePulseTimer(ab)
    b.ResetIcons()
    b.Timer.Pulse = GetTime() + ab
end

;
TickTimeCustom = function() if a6 then return a6 else return 0 end end
