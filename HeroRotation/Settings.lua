local a,b=...local c=HeroLib;local d=c.GUI;local e=d.CreatePanel;local f=d.CreateChildPanel;local g=d.CreatePanelOption;b.GUISettings={General={MainFrameStrata="BACKGROUND",NamePlateIconAnchor="Clickable Area",BlackBorderIcon=false,HideKeyBinds=false,SoloMode=false,HideToggleIcons=false,NotEnoughManaEnabled=false,RotationDebugOutput=false,OpenerReset=0,ScaleUI=1,ScaleButtons=1.1,ScaleHotkey=1,SetAlpha=1,TickRate=50},APL={}}function b.GUI.CorePanelSettingsInit()local h=e(b.GUI,"HeroRotation","PanelFrame",b.GUISettings,HeroRotationDB.GUISettings)local i=f(h,"General")g("Dropdown",i,"General.MainFrameStrata",{"HIGH","MEDIUM","LOW","BACKGROUND"},"Main Frame Strata","Choose the frame strata to use for icons.",{ReloadRequired=true})g("Dropdown",i,"General.NamePlateIconAnchor",{"Clickable Area","Life Bar","Disable"},"Nameplate Icon Anchor","Choose the frame to anchor the Nameplate icon to (or disable it).",{ReloadRequired=true})g("CheckButton",i,"General.BlackBorderIcon","Black Border Icon","Enable if you want clean black borders icons.",{ReloadRequired=true})g("CheckButton",i,"General.HideKeyBinds","Hide Keybinds","Enable if you want to hide the keybind on the icons.")g("CheckButton",i,"General.SoloMode","Solo Mode","Enable if you want to try to maximize survivability at the cost of dps.")g("CheckButton",i,"General.HideToggleIcons","Hide toggle icons","Enable if you want to hide the toggle buttons on the icon frame.",{ReloadRequired=true})g("CheckButton",i,"General.NotEnoughManaEnabled","Not enough mana/energy","Enable if you want a faded icon when you have not enough mana or energy.")g("CheckButton",i,"General.RotationDebugOutput","Debug Output","DEBUG: Enable if you want output rotation selection as text for debugging purposes.")g("Slider",i,"General.OpenerReset",{0,10,1},"Opener Macro Reset","Time before the Opener macro will reset to off (set to 0 to keep it on forever).")g("Slider",i,"General.TickRate",{0,100,5},"Refresh Rate","Addon Refresh Rate in ms.\n0 = refresh with every frame\nIncrease this number if you experience frame drops")i["General.OpenerReset"]:SetPoint("TOPLEFT",250,-30)end