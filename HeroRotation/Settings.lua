--- ============================ HEADER ============================
--- ======= LOCALIZE =======
  -- Addon
  local addonName, HR = ...;
  -- HeroLib
  local HL = HeroLib;
  -- File Locals
  local GUI = HL.GUI;
  local CreatePanel = GUI.CreatePanel;
  local CreateChildPanel = GUI.CreateChildPanel;
  local CreatePanelOption = GUI.CreatePanelOption;


--- ============================ CONTENT ============================
  -- Default settings
  HR.GUISettings = {
    General = {
      -- Main Frame Strata
      MainFrameStrata = "BACKGROUND",
      -- Nameplate Icon Anchor
      NamePlateIconAnchor = "Clickable Area",
      -- Show while mounted
      ShowWhileMounted = false,	  
      -- Black Border Icon (Enable if you want clean black borders)
      BlackBorderIcon = false,
      HideKeyBinds = false,
      -- Interrupt
      InterruptTH = 20,
      InterruptEnabled = false,
      InterruptWithStun = false, -- EXPERIMENTAL
      UseRaidList = false,
      UseMouseOverForKicks = false,
      -- SoloMode try to maximize survivability at the cost of dps
      SoloMode = false,
      -- Remove the toggle icon buttons.
      HideToggleIcons = false,
      --
      NotEnoughManaEnabled = false,
      RotationDebugOutput = false,
	  OpenerReset = 0,
      SetAlpha = 1,
	  TickRate = 0,
	  HoldPotforBL = false,
	  SilentMode = false,
	  MiniMap = false,
	  
      AdaptivePerformance = true,
	  TargetFrames = 60
    },
	Scaling = {
      ScaleUI = 1,
      ScaleButtons = 1,
      ScaleHotkey = 1,
    },
    APL = {}
  };

  function HR.GUI.CorePanelSettingsInit ()
    -- GUI
    local ARPanel = CreatePanel(HR.GUI, "HeroRotation", "PanelFrame", HR.GUISettings, HeroRotationDB.GUISettings);
    -- Child Panel
    local CP_General = CreateChildPanel(ARPanel, "General");
	local CP_Scaling = CreateChildPanel(ARPanel, "Scaling");
    -- Controls
    CreatePanelOption("Dropdown", CP_General, "General.MainFrameStrata", {"HIGH", "MEDIUM", "LOW", "BACKGROUND"}, "Main Frame Strata", "Choose the frame strata to use for icons.", {ReloadRequired = true});
    CreatePanelOption("Dropdown", CP_General, "General.NamePlateIconAnchor", {"Clickable Area", "Life Bar", "Disable"}, "Nameplate Icon Anchor", "Choose the frame to anchor the Nameplate icon to (or disable it).", {ReloadRequired = true});
    CreatePanelOption("CheckButton", CP_General, "General.ShowWhileMounted", "Show While Mounted", "Enable if you want the HeroRotation icon to show while mounted.");
    CreatePanelOption("CheckButton", CP_General, "General.BlackBorderIcon", "Black Border Icon", "Enable if you want clean black borders icons.", {ReloadRequired = true});
    CreatePanelOption("CheckButton", CP_General, "General.HideKeyBinds", "Hide Keybinds", "Enable if you want to hide the keybind on the icons.");
    CreatePanelOption("Slider", CP_General, "General.InterruptTH",{0, 100, 1}, "Interrupt %", "Set which % they have to interrupt.");

    CreatePanelOption("CheckButton", CP_General, "General.InterruptEnabled", "Interrupt", "Enable if you want to interrupt.");
    CreatePanelOption("CheckButton", CP_General, "General.UseMouseOverForKicks", "UseMouseOverForKicks", "Use MouseOver for Kicks");
    CreatePanelOption("CheckButton", CP_General, "General.UseRaidList", "UseRaidList", "Use Raid Kick List");
    CreatePanelOption("CheckButton", CP_General, "General.InterruptWithStun", "Interrupt With Stun", "EXPERIMENTAL: Enable if you want to interrupt with stuns.");
    CreatePanelOption("CheckButton", CP_General, "General.SoloMode", "Solo Mode", "Enable if you want to try to maximize survivability at the cost of dps.");
    CreatePanelOption("CheckButton", CP_General, "General.HideToggleIcons", "Hide toggle icons", "Enable if you want to hide the toggle buttons on the icon frame.", {ReloadRequired = true});
    CreatePanelOption("CheckButton", CP_General, "General.NotEnoughManaEnabled", "Not enough mana/energy", "Enable if you want a faded icon when you have not enough mana or energy.");
    CreatePanelOption("CheckButton", CP_General, "General.RotationDebugOutput", "Debug Output", "DEBUG: Enable if you want output rotation selection as text for debugging purposes.");

	CreatePanelOption("CheckButton", CP_General, "General.HoldPotforBL", "Hold Pot for BL", "Hold pot until we bloodlust?");
	CreatePanelOption("CheckButton", CP_General, "General.SilentMode", "Silent Mode", "Enable if you want to remove the prints from the chat window");
	--CreatePanelOption("CheckButton", CP_General, "General.MiniMap", "Toggle MiniMap Icon", "Toggle show/hide the minimap icon", {ReloadRequired = true});
	CreatePanelOption("Slider", CP_General, "General.OpenerReset", {0, 10, 1}, "Opener Macro Reset", "Time before the Opener macro will reset to off (set to 0 to keep it on forever).");
	CreatePanelOption("Slider", CP_General, "General.TickRate", {0, 250, 5}, "Refresh Rate", "Addon Refresh Rate in ms.\n0 = refresh with every frame\nIncrease this number if you experience frame drops");
	CP_General["General.OpenerReset"]:SetPoint("TOPLEFT", 225, -30)
    CreatePanelOption("CheckButton", CP_General, "General.AdaptivePerformance", "Adaptive Performance", "Enable to have the Refresh Rate automatically adjusted to reach your target frames");
	CreatePanelOption("Slider", CP_General, "General.TargetFrames", {0, 200, 5}, "Target Frames", "Target Frames to hit when using Adaptive Performance");
	CP_General["General.AdaptivePerformance"]:SetPoint("TOPLEFT", 440, -20)
  end