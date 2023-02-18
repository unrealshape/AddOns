local a, b = ...
local c = HeroLib;
local d = HeroCache;
local e = c.Unit;
local f = e.Player;
local g = e.Target;
local h = c.Spell;
local i = c.Item;
local pairs = pairs;
local j = string.lower;
local tostring = tostring;
b.MainIconFrame = CreateFrame("Frame", "HeroRotation_MainIconFrame", UIParent)
b.MainIconPartOverlayFrame = CreateFrame("Frame", "HeroRotation_MainIconPartOverlayFrame", UIParent)
b.MainIconFrame.Part = {}
b.MainIconFrame.CooldownFrame = CreateFrame("Cooldown", "HeroRotation_MainIconCooldownFrame", b.MainIconFrame,
    "AR_CooldownFrameTemplate")
b.SmallIconFrame = CreateFrame("Frame", "HeroRotation_SmallIconFrame", UIParent)
b.LeftIconFrame = CreateFrame("Frame", "HeroRotation_LeftIconFrame", UIParent)
b.NameplateIconFrame = CreateFrame("Frame", "HeroRotation_NameplateIconFrame", UIParent)
b.SuggestedIconFrame = CreateFrame("Frame", "HeroRotation_SuggestedIconFrame", UIParent)
b.RightSuggestedIconFrame = CreateFrame("Frame", "HeroRotation_RightSuggestedIconFrame", UIParent)
b.ToggleIconFrame = CreateFrame("Frame", "HeroRotation_ToggleIconFrame", UIParent)
local k = b.GetTexture(h(999900))
function b.ResetIcons()
    b.MainIconFrame:Hide()
    if b.GUISettings.General.BlackBorderIcon then b.MainIconFrame.Backdrop:Hide() end
    ;
    b.MainIconPartOverlayFrame:Hide()
    b.MainIconFrame:HideParts()
    b.SmallIconFrame:HideIcons()
    b.CastOffGCDOffset = 1;
    b.Nameplate.HideIcons()
    b.CastLeftOffset = 1;
    b.SuggestedIconFrame:HideIcon()
    if b.GUISettings.General.BlackBorderIcon then b.SuggestedIconFrame.Backdrop:Hide() end
    ;
    b.CastSuggestedOffset = 1;
    b.RightSuggestedIconFrame:HideIcon()
    if b.GUISettings.General.BlackBorderIcon then b.RightSuggestedIconFrame.Backdrop:Hide() end
    ;
    b.CastRightSuggestedOffset = 1;
    if b.GUISettings.General.HideToggleIcons then b.ToggleIconFrame:Hide() end
    ;
    if not b.GUISettings.General.HideToggleIcons then b.ToggleIconFrame:SetAlpha(b.GUISettings.General.SetAlpha) end
end

;
function b:CreateBackdrop(l)
    if l.Backdrop or not b.GUISettings.General.BlackBorderIcon then return end
    ;
    local m = CreateFrame("Frame", nil, l, BackdropTemplateMixin and "BackdropTemplate")
    l.Backdrop = m;
    m:ClearAllPoints()
    m:SetPoint("TOPLEFT", l, "TOPLEFT", -1, 1)
    m:SetPoint("BOTTOMRIGHT", l, "BOTTOMRIGHT", 1, -1)
    m:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 0, edgeSize = 1,
        insets = { left = 0, right = 0, top = 0, bottom = 0 } })
    m:SetBackdropBorderColor(0, 0, 0)
    m:SetBackdropColor(0, 0, 0, 1)
    m:SetFrameStrata(b.MainFrame:GetFrameStrata())
    if l:GetFrameLevel() - 2 >= 0 then m:SetFrameLevel(l:GetFrameLevel() - 2) else m:SetFrameLevel(0) end
end

;
function b.MainIconFrame:Init()
    self:SetFrameStrata(b.MainFrame:GetFrameStrata())
    self:SetFrameLevel(b.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(64)
    self:SetHeight(64)
    self:SetPoint("BOTTOMRIGHT", b.MainFrame, "BOTTOMRIGHT", 0, 0)
    self.Texture = self:CreateTexture(nil, "ARTWORK")
    self.Texture:SetAllPoints(self)
    self.CooldownFrame:SetAllPoints(self)
    b.MainIconPartOverlayFrame:SetFrameStrata(self:GetFrameStrata())
    b.MainIconPartOverlayFrame:SetFrameLevel(self:GetFrameLevel() + 1)
    b.MainIconPartOverlayFrame:SetWidth(64)
    b.MainIconPartOverlayFrame:SetHeight(64)
    b.MainIconPartOverlayFrame:SetPoint("Left", self, "Left", 0, 0)
    b.MainIconPartOverlayFrame.Texture = b.MainIconPartOverlayFrame:CreateTexture(nil, "ARTWORK")
    b.MainIconPartOverlayFrame.Texture:SetAllPoints(b.MainIconPartOverlayFrame)
    local n = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = n;
    n:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    n:SetAllPoints(true)
    n:SetJustifyH("RIGHT")
    n:SetJustifyV("TOP")
    n:SetPoint("TOPRIGHT")
    n:SetTextColor(0.8, 0.8, 0.8, 1)
    n:SetText("")
    local o = self:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.Text = o;
    o:SetAllPoints(true)
    o:SetJustifyH("CENTER")
    o:SetJustifyV("CENTER")
    o:SetPoint("CENTER")
    o:SetTextColor(1, 1, 1, 1)
    o:SetText("")
    if b.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        b:CreateBackdrop(self)
    end
    ;
    self:InitParts()
    self:Show()
end

;
function b.MainIconFrame:ChangeIcon(p, q, r, s, t)
    self.ID = t;
    self.Texture:SetTexture(p)
    if b.GUISettings.General.NotEnoughManaEnabled and not r then self.Texture:SetVertexColor(0.5, 0.5, 1.0) elseif s then
        self.Texture:SetVertexColor(1.0, 0.5, 0.5) else self.Texture:SetVertexColor(1.0, 1.0, 1.0) end
    ;
    self.Texture:SetAllPoints(self)
    if q then
        self.Keybind:SetText(q)
        self.Keybind:SetScale(b.GUISettings.Scaling.ScaleHotkey)
    else self.Keybind:SetText("") end
    ;
    self.Text:SetText("")
    if b.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then self.Backdrop:Show() end
    ;
    self:SetAlpha(b.GUISettings.General.SetAlpha)
    if not self:IsVisible() then self:Show() end
end

;
function b.MainIconFrame:OverlayText(u) self.Text:SetText(u) end

;
function b.MainIconFrame:SetCooldown(v, w)
    if v == 0 or w == 0 then
        self.CooldownFrame:SetCooldown(0, 0)
        self.CooldownFrame:Hide()
        return
    end
    ;
    self.CooldownFrame:SetCooldown(v, w)
end

;
function b.MainIconFrame:InitParts()
    b.MainIconPartOverlayFrame:Show()
    for x = 1, b.MaxQueuedCasts do
        local y = CreateFrame("Frame", "HeroRotation_MainIconPartFrame" .. tostring(x), UIParent)
        self.Part[x] = y;
        y:SetFrameStrata(self:GetFrameStrata())
        y:SetFrameLevel(self:GetFrameLevel() + 1)
        y:SetWidth(64)
        y:SetHeight(64)
        y:SetPoint("Left", self, "Left", 0, 0)
        y.Texture = y:CreateTexture(nil, "BACKGROUND")
        y.Keybind = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        y.Keybind:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
        y.Keybind:SetAllPoints(true)
        y.Keybind:SetJustifyH("RIGHT")
        y.Keybind:SetJustifyV("TOP")
        y.Keybind:SetPoint("TOPRIGHT")
        y.Keybind:SetTextColor(0.8, 0.8, 0.8, 1)
        y.Keybind:SetText("")
        if b.GUISettings.General.BlackBorderIcon then
            y.Texture:SetTexCoord(.08, .92, .08, .92)
            b:CreateBackdrop(y)
        end
        ;
        y:Show()
    end
end

;
local z, A;
function b.MainIconFrame:SetupParts(B, C)
    z = #B;
    A = b.MainIconPartOverlayFrame.Texture:GetWidth() / z;
    local D, E, F, G, H, I, J, K = b.MainIconPartOverlayFrame.Texture:GetTexCoord()
    for x = 1, z do
        local y = self.Part[x]
        y:SetWidth(A)
        y:SetHeight(A * z)
        y:ClearAllPoints()
        local L, M = b.MainIconPartOverlayFrame.Texture:GetPoint()
        if b.MainIconPartOverlayFrame.__MSQ_NormalColor then if x == b.MaxQueuedCasts or x == z then y:SetPoint("Center",
                    M, "Center", A / (4 - z), 0) else y:SetPoint("Center", M, "Center", A / (4 - z) * (x - 2), 0) end else
            y:SetPoint("Left", M, "Left", A * (x - 1), 0) end
        ;
        y.Texture:SetTexture(B[x])
        y.Texture:SetAllPoints(y)
        if y.Backdrop then if b.MainIconPartOverlayFrame.__MSQ_NormalColor then y.Backdrop:Hide() else y.Backdrop:Show() end end
        ;
        local N = b.GUISettings.General.BlackBorderIcon and not b.MainIconPartOverlayFrame.__MSQ_NormalColor;
        local O = (x - 1) / z;
        local P = x / z;
        y.Texture:SetTexCoord(x == 1 and (N and D + 0.08 or D) or H * O, x == 1 and (N and E + 0.08 or E) or
        (N and I + 0.08 or I), x == 1 and (N and F + 0.08 or F) or J * O,
            x == 1 and (N and G - 0.08 or G) or (N and K - 0.08 or K), x == z and N and H * P - 0.08 or H * P,
            N and I + 0.08 or I, x == z and N and J * P - 0.08 or J * P, N and K - 0.08 or K)
        if C then
            y.Keybind:SetText(C[x])
            y.Keybind:SetScale(b.GUISettings.Scaling.ScaleHotkey)
        else y.Keybind:SetText("") end
        ;
        if not y:IsVisible() then
            b.MainIconPartOverlayFrame:Show()
            y:Show()
        end
    end
end

;
function b.MainIconFrame:HideParts()
    self.ID = nil;
    b.MainIconPartOverlayFrame:Hide()
    for x = 1, #self.Part do
        self.Part[x].Keybind:SetText("")
        self.Part[x]:Hide()
    end
end

;
function b.MainIconFrame:getIconID()
    if self.ID then return self.ID end
    ;
    return nil
end

;
function b.SmallIconFrame:Init()
    self:SetFrameStrata(b.MainFrame:GetFrameStrata())
    self:SetFrameLevel(b.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(64)
    self:SetHeight(32)
    self:SetPoint("BOTTOMLEFT", b.MainIconFrame, "TOPLEFT", 0, b.GUISettings.General.BlackBorderIcon and 1 or 0)
    self.Icon = {}
    self:CreateIcons(1, "LEFT")
    self:CreateIcons(2, "RIGHT")
    self:Show()
end

;
function b.SmallIconFrame:CreateIcons(Q, R)
    local S = CreateFrame("Frame", "HeroRotation_SmallIconFrame" .. tostring(Q), UIParent)
    self.Icon[Q] = S;
    S:SetFrameStrata(self:GetFrameStrata())
    S:SetFrameLevel(self:GetFrameLevel() - 1)
    S:SetWidth(b.GUISettings.General.BlackBorderIcon and 30 or 32)
    S:SetHeight(b.GUISettings.General.BlackBorderIcon and 30 or 32)
    S:SetPoint(R, self, R, 0, 0)
    S.Texture = S:CreateTexture(nil, "ARTWORK")
    local q = S:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    S.Keybind = q;
    q:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    q:SetAllPoints(true)
    q:SetJustifyH("RIGHT")
    q:SetJustifyV("TOP")
    q:SetPoint("TOPRIGHT")
    q:SetTextColor(0.8, 0.8, 0.8, 1)
    q:SetText("")
    if b.GUISettings.General.BlackBorderIcon then
        S.Texture:SetTexCoord(.08, .92, .08, .92)
        b:CreateBackdrop(S)
    end
    ;
    S:Show()
end

;
function b.SmallIconFrame:ChangeIcon(T, p, q, s)
    local S = self.Icon[T]
    S.Texture:SetTexture(p)
    S.Texture:SetAllPoints(S)
    if s then S.Texture:SetVertexColor(1.0, 0.5, 0.5) else S.Texture:SetVertexColor(1.0, 1.0, 1.0) end
    ;
    if q then
        S.Keybind:SetText(q)
        S.Keybind:SetScale(b.GUISettings.Scaling.ScaleHotkey * 0.85)
    else S.Keybind:SetText("") end
    ;
    S:SetAlpha(b.GUISettings.General.SetAlpha)
    if not S:IsVisible() then S:Show() end
end

;
function b.SmallIconFrame:GetIcon(T)
    local S = self.Icon[T]
    if S and S:IsVisible() then return S.Texture:GetTexture() end
    ;
    return nil
end

;
function b.SmallIconFrame:GetKeybind(T)
    local S = self.Icon[T]
    if S and S:IsVisible() then return S.Keybind:GetText() end
    ;
    return ""
end

;
function b.SmallIconFrame:HideIcons() for x = 1, #self.Icon do self.Icon[x]:Hide() end end

;
function b.LeftIconFrame:Init()
    self:SetFrameStrata(b.MainFrame:GetFrameStrata())
    self:SetFrameLevel(b.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(48)
    self:SetHeight(48)
    self:SetPoint("RIGHT", b.MainIconFrame, "LEFT", b.GUISettings.General.BlackBorderIcon and -1 or 0, 0)
    self.Texture = self:CreateTexture(nil, "BACKGROUND")
    if b.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        b:CreateBackdrop(self)
    end
    ;
    local n = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = n;
    n:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    n:SetAllPoints(true)
    n:SetJustifyH("RIGHT")
    n:SetJustifyV("TOP")
    n:SetPoint("TOPRIGHT")
    n:SetTextColor(0.8, 0.8, 0.8, 1)
    n:SetText("")
    self:Show()
end

;
function b.LeftIconFrame:ChangeIcon(p, q)
    self.Texture:SetTexture(p)
    self.Texture:SetAllPoints(self)
    if b.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then self.Backdrop:Show() end
    ;
    if q then
        self.Keybind:SetText(q)
        self.Keybind:SetScale(b.GUISettings.Scaling.ScaleHotkey)
    else self.Keybind:SetText("") end
    ;
    self:SetAlpha(b.GUISettings.General.SetAlpha)
    if not self:IsVisible() then self:Show() end
end

;
b.Nameplate = { Initialized = false }
function b.Nameplate.AddIcon(U, V)
    if b.GUISettings.General.NamePlateIconAnchor == "Disable" then return true end
    ;
    local W = j(U.UnitID)
    local X = C_NamePlate.GetNamePlateForUnit(W)
    if X then
        local Y = GetScreenHeight()
        local Z = Y > 768 and 768 / Y or 1;
        local _ = X:GetHeight() / Z;
        local a0;
        if b.GUISettings.General.NamePlateIconAnchor == "Life Bar" then if _G.ElvUI and _G.ElvUI[1].charSettings.profile.nameplates.enable then
                a0 = X.unitFrame.Health;
                _ = a0:GetWidth() / 3.5
            elseif _G.ShestakUI and _G.ShestakUI[2].nameplate.enable then
                a0 = X.unitFrame.Health;
                _ = a0:GetWidth() / Z / 3.5
            else
                a0 = X.UnitFrame.healthBar;
                _ = a0:GetWidth() / Z / 3.5
            end end
        ;
        local S = b.NameplateIconFrame;
        if not b.Nameplate.Initialized then
            S:SetFrameStrata(X:GetFrameStrata())
            S:SetFrameLevel(X:GetFrameLevel() + 50)
            S:SetWidth(_)
            S:SetHeight(_)
            S.Texture = S:CreateTexture(nil, "BACKGROUND")
            if b.GUISettings.General.BlackBorderIcon then
                S.Texture:SetTexCoord(.08, .92, .08, .92)
                b:CreateBackdrop(S)
            end
            ;
            b.Nameplate.Initialized = true
        end
        ;
        S.Texture:SetTexture(b.GetTexture(V))
        S.Texture:SetAllPoints(S)
        local a1 = 1;
        if V.SpellName then if V:BookIndex() ~= nil then a1 = U:IsSpellInRange(V) and 1 or 0.4 else a1 = 1 end else a1 = 1 end
        ;
        S.Texture:SetAlpha(a1)
        S:ClearAllPoints()
        S:SetAlpha(b.GUISettings.General.SetAlpha)
        if not S:IsVisible() then
            if b.GUISettings.General.NamePlateIconAnchor == "Life Bar" then S:SetPoint("CENTER", a0) else S:SetPoint(
                    "CENTER", X) end
            ;
            S:Show()
        end
        ;
        b.LastUnitCycled = U;
        b.LastUnitCycledTime = GetTime()
        return true
    end
    ;
    return false
end

;
function b.Nameplate.HideIcons()
    b.NameplateIconFrame:Hide()
    b.LeftIconFrame:Hide()
end

;
function b.SuggestedIconFrame:Init()
    self:SetFrameStrata(b.MainFrame:GetFrameStrata())
    self:SetFrameLevel(b.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(32)
    self:SetHeight(32)
    self:SetPoint("BOTTOM", b.MainIconFrame, "LEFT", -b.LeftIconFrame:GetWidth() / 2,
        b.LeftIconFrame:GetHeight() / 2 + (b.GUISettings.General.BlackBorderIcon and 3 or 4))
    self.Texture = self:CreateTexture(nil, "BACKGROUND")
    if b.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        b:CreateBackdrop(self)
    end
    ;
    local n = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = n;
    n:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    n:SetAllPoints(true)
    n:SetJustifyH("RIGHT")
    n:SetJustifyV("TOP")
    n:SetPoint("TOPRIGHT")
    n:SetTextColor(0.8, 0.8, 0.8, 1)
    n:SetText("")
    self:Show()
end

;
function b.SuggestedIconFrame:ChangeIcon(p, q, s, t)
    self.ID = t;
    self.Texture:SetTexture(p)
    self.Texture:SetAllPoints(self)
    if s then self.Texture:SetVertexColor(1.0, 0.5, 0.5) else self.Texture:SetVertexColor(1.0, 1.0, 1.0) end
    ;
    if b.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then self.Backdrop:Show() end
    ;
    if q then
        self.Keybind:SetText(q)
        self.Keybind:SetScale(b.GUISettings.Scaling.ScaleHotkey * 0.85)
    else self.Keybind:SetText("") end
    ;
    self:SetAlpha(b.GUISettings.General.SetAlpha)
    if not self:IsVisible() then self:Show() end
end

;
function b.SuggestedIconFrame:HideIcon()
    self.ID = nil;
    b.SuggestedIconFrame:Hide()
end

;
function b.SuggestedIconFrame:getIconID()
    if self.ID then return self.ID end
    ;
    return nil
end

;
function b.RightSuggestedIconFrame:Init()
    self:SetFrameStrata(b.MainFrame:GetFrameStrata())
    self:SetFrameLevel(b.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(32)
    self:SetHeight(32)
    self:SetPoint("BOTTOM", b.MainIconFrame, "LEFT", b.LeftIconFrame:GetWidth() / 2,
        b.LeftIconFrame:GetHeight() / 2 + (b.GUISettings.General.BlackBorderIcon and 3 or 4))
    self.Texture = self:CreateTexture(nil, "BACKGROUND")
    if b.GUISettings.General.BlackBorderIcon then
        self.Texture:SetTexCoord(.08, .92, .08, .92)
        b:CreateBackdrop(self)
    end
    ;
    local n = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.Keybind = n;
    n:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    n:SetAllPoints(true)
    n:SetJustifyH("RIGHT")
    n:SetJustifyV("TOP")
    n:SetPoint("TOPRIGHT")
    n:SetTextColor(0.8, 0.8, 0.8, 1)
    n:SetText("")
    self:Show()
end

;
function b.RightSuggestedIconFrame:ChangeIcon(p, q, s, t)
    self.ID = t;
    self.Texture:SetTexture(p)
    self.Texture:SetAllPoints(self)
    if s then self.Texture:SetVertexColor(1.0, 0.5, 0.5) else self.Texture:SetVertexColor(1.0, 1.0, 1.0) end
    ;
    if b.GUISettings.General.BlackBorderIcon and not self.Backdrop:IsVisible() then self.Backdrop:Show() end
    ;
    if q then
        self.Keybind:SetText(q)
        self.Keybind:SetScale(b.GUISettings.Scaling.ScaleHotkey * 0.85)
    else self.Keybind:SetText("") end
    ;
    self:SetAlpha(b.GUISettings.General.SetAlpha)
    if not self:IsVisible() then self:Show() end
end

;
function b.RightSuggestedIconFrame:HideIcon()
    self.ID = nil;
    b.RightSuggestedIconFrame:Hide()
end

;
function b.RightSuggestedIconFrame:getIconID()
    if self.ID then return self.ID end
    ;
    return nil
end

;
function b.ToggleIconFrame:Init()
    self:SetFrameStrata(b.MainFrame:GetFrameStrata())
    self:SetFrameLevel(b.MainFrame:GetFrameLevel() - 1)
    self:SetWidth(64)
    self:SetHeight(20)
    if HeroRotationDB and HeroRotationDB.ButtonsFramePos and type(HeroRotationDB.ButtonsFramePos[2]) ~= "string" then
        self:ResetAnchor() end
    ;
    if HeroRotationDB and HeroRotationDB.ButtonsFramePos then self:SetPoint(HeroRotationDB.ButtonsFramePos[1],
            _G[HeroRotationDB.ButtonsFramePos[2]], HeroRotationDB.ButtonsFramePos[3], HeroRotationDB.ButtonsFramePos[4],
            HeroRotationDB.ButtonsFramePos[5]) else self:SetPoint("TOPLEFT", b.MainIconFrame, "BOTTOMLEFT", 0,
            b.GUISettings.General.BlackBorderIcon and -3 or 0) end
    ;
    local function a2(self) self:StartMoving() end
    ;
    self:SetScript("OnMouseDown", a2)
    local function a3(self)
        self:StopMovingOrSizing()
        if not HeroRotationDB then HeroRotationDB = {} end
        ;
        local a4, a5, a6, a7, a8, a9;
        a4, a5, a6, a7, a8 = self:GetPoint()
        if not a5 then a9 = "UIParent" else a9 = a5:GetName() end
        ;
        HeroRotationDB.ButtonsFramePos = { a4, a9, a6, a7, a8 }
    end
    ;
    self:SetScript("OnMouseUp", a3)
    self:SetScript("OnHide", a3)
    self:Show()
    self.Button = {}
    self:AddButton("CDs", 1, "CDs", "cds")
    self:AddButton("AoE", 2, "AoE", "aoe")
    self:AddButton("On", 3, "On/Off", "toggle")
    self:AddButton("SCd", 4, "SmallCDs", "smallcds")
    self:AddButton("Open", 5, "Opener", "opener")
end

;
function b.ToggleIconFrame:ResetAnchor()
    self:SetPoint("TOPLEFT", b.MainIconFrame, "BOTTOMLEFT", 0, b.GUISettings.General.BlackBorderIcon and -3 or 0)
    HeroRotationDB.ButtonsFramePos = false
end

;
function b.ToggleIconFrame:AddButton(u, x, aa, ab)
    local ac = CreateFrame("Button", "$parentButton" .. tostring(x), self)
    ac:SetFrameStrata(self:GetFrameStrata())
    ac:SetFrameLevel(self:GetFrameLevel() - 1)
    ac:SetWidth(20)
    ac:SetHeight(20)
    ac:SetPoint("LEFT", self, "LEFT", 20 * (x - 1) + x, 0)
    if aa then
        ac:SetScript("OnEnter",
            function()
                Mixin(GameTooltip, BackdropTemplateMixin)
                GameTooltip:SetOwner(b.ToggleIconFrame, "ANCHOR_BOTTOM", 0, 0)
                GameTooltip:ClearLines()
                GameTooltip:SetBackdropColor(0, 0, 0, 1)
                GameTooltip:SetText(aa, nil, nil, nil, 1, true)
                GameTooltip:Show()
            end)
        ac:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
    ;
    ac:SetNormalFontObject("GameFontNormalSmall")
    ac.text = u;
    local ad = ac:CreateTexture()
    ad:SetTexture("Interface/Buttons/UI-Silver-Button-Up")
    ad:SetTexCoord(0, 0.625, 0, 0.7875)
    ad:SetAllPoints()
    ac:SetNormalTexture(ad)
    local ae = ac:CreateTexture()
    ae:SetTexture("Interface/Buttons/UI-Silver-Button-Highlight")
    ae:SetTexCoord(0, 0.625, 0, 0.7875)
    ae:SetAllPoints()
    ac:SetHighlightTexture(ae)
    local af = ac:CreateTexture()
    af:SetTexture("Interface/Buttons/UI-Silver-Button-Down")
    af:SetTexCoord(0, 0.625, 0, 0.7875)
    af:SetAllPoints()
    ac:SetPushedTexture(af)
    if type(HeroRotationCharDB) ~= "table" then HeroRotationCharDB = {} end
    ;
    if type(HeroRotationCharDB.Toggles) ~= "table" then HeroRotationCharDB.Toggles = {} end
    ;
    if type(HeroRotationCharDB.Toggles[x]) ~= "boolean" then HeroRotationCharDB.Toggles[x] = true end
    ;
    ac:SetScript("OnMouseDown", function(self, ag) if ag == "LeftButton" then b.CmdHandler(ab) end end)
    self.Button[x] = ac;
    b.ToggleIconFrame:UpdateButtonText(x)
    ac:Show()
end

;
function b.ToggleIconFrame:UpdateButtonText(x) if HeroRotationCharDB.Toggles[x] then self.Button[x]:SetFormattedText(
            "|cff00ff00%s|r", self.Button[x].text) else self.Button[x]:SetFormattedText("|cffff0000%s|r",
            self.Button[x].text) end end
