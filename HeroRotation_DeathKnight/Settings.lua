local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.DeathKnight={Commons={UseDefensives=true,HealthstoneHP=50,HealPotHP=0,PhialHP=0,UseDeathStrikeHP=60,UseDarkSuccorHP=80,IceboundFortitudeHP=30,LichborneHP=30,AntiMagicShellHP=40,DeathPactHP=40,Enabled={Potions=true,TopTrinket=true,BottomTrinket=true,Racials=true},DisplayStyle={}},Blood={RuneTapThreshold=65,IceboundFortitudeThreshold=30,VampiricBloodThreshold=50,BonestormPower=50,DisplayStyle={},GCDasOffGCD={},OffGCDasOffGCD={}},Frost={DisableBoSPooling=false,Using2H=false,TargetSwap="AutoSwap",DisplayStyle={},GCDasOffGCD={}},Unholy={DisableAotD=HeroRotationCharDB.Toggles[10],TargetSwap="AutoSwap",GCDasOffGCD={},UHCooldowns=0,IncludedCooldowns={Apocalypse=false,DarkTransformation=false,ArmyoftheDead=true,UnholyBlight=false,SacrificalPact=true},UHSmallCooldowns=0,IncludedSmallCooldowns={Apocalypse=true,DarkTransformation=true,ArmyoftheDead=false,UnholyBlight=true,SacrificalPact=false}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"DeathKnight")local l=f(k,"Blood")local m=f(k,"Frost")local n=f(k,"Unholy")g("CheckButton",k,"APL.DeathKnight.Commons.UseDefensives","Use Defensives","Toggle on to show Defensive Abilities")g("Slider",k,"APL.DeathKnight.Commons.HealthstoneHP",{0,100,1},"Healthstone HP %","Set the HP threshold to use Healthstone")g("Slider",k,"APL.DeathKnight.Commons.HealPotHP",{0,100,0},"Healing Potion HP %","Set the HP threshold to use Healing Potion")g("Slider",k,"APL.DeathKnight.Commons.PhialHP",{0,100,0},"Phial of Serenity HP %","Set the HP threshold to use Phial of Serenity")g("Slider",k,"APL.DeathKnight.Commons.UseDeathStrikeHP",{0,100,1},"Death Strike HP %","Set the HP threshold to use Death Strike")g("Slider",k,"APL.DeathKnight.Commons.UseDarkSuccorHP",{0,100,1},"Death Strike w/ Dark Succor HP %","Set the HP threshold to use Death Strike to Consume Dark Succor")g("Slider",k,"APL.DeathKnight.Commons.IceboundFortitudeHP",{0,100,1},"Icebound Fortitude HP %","Set the HP threshold to use Icebound Fortitude")g("Slider",k,"APL.DeathKnight.Commons.LichborneHP",{0,100,1},"Lichborne HP %","Set the HP threshold to use Lichborne")g("Slider",k,"APL.DeathKnight.Commons.AntiMagicShellHP",{0,100,1},"Anti-Magic Shell HP %","Set the HP threshold to use Anti-Magic Shell")g("Slider",k,"APL.DeathKnight.Commons.DeathPactHP",{0,100,1},"Death Pact HP %","Set the HP threshold to use Death Pact")i(k,"APL.DeathKnight.Commons")g("Slider",l,"APL.DeathKnight.Blood.RuneTapThreshold",{5,100,5},"Rune Tap Health Threshold","Suggest Rune Tap when below this health percentage.")g("Slider",l,"APL.DeathKnight.Blood.IceboundFortitudeThreshold",{5,100,5},"Icebound Fortitude Health Threshold","Suggest Icebound Fortitude when below this health percentage.")g("Slider",l,"APL.DeathKnight.Blood.VampiricBloodThreshold",{5,100,5},"Vampiric Blood Health Threshold","Suggest Vampiric Blood when below this health percentage.")g("Slider",l,"APL.DeathKnight.Blood.BonestormPower",{5,100,5},"Bonestorm RP Threshold","Minumum RP to store before using Bonestorm")i(l,"APL.DeathKnight.Blood")g("Dropdown",m,"APL.DeathKnight.Frost.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",m,"APL.DeathKnight.Frost.DisableBoSPooling","Disable BoS Pooling","Enable this option to bypass the BoS Pooling function.")g("CheckButton",m,"APL.DeathKnight.Frost.Using2H","Using a 2H Weapon","Enable this option if you are using a 2-handed weapon.")i(m,"APL.DeathKnight.Frost")g("CheckButton",n,"APL.DeathKnight.Unholy.DisableAotD","Disable AotD","Disable Army of the Dead suggestions.")g("Dropdown",n,"APL.DeathKnight.Unholy.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("Slider",n,"APL.DeathKnight.Unholy.UHCooldowns",{0,0,0},"--Spells to include in Cooldowns--","This slider does nothing, select spells below")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedCooldowns.Apocalypse","Apocalypse","Include Apocalypse in Cooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedCooldowns.DarkTransformation","Dark Transformation","Include Dark Transformation in Cooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedCooldowns.ArmyoftheDead","Army of the Dead","Include Army of the Dead in Cooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedCooldowns.UnholyBlight","Unholy Blight","Include Unholy Blight in Cooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedCooldowns.SacrificalPact","Sacrifical Pact","Include Sacrifical Pact in Cooldowns")g("Slider",n,"APL.DeathKnight.Unholy.UHSmallCooldowns",{0,0,0},"--Spells to include in SmallCooldowns--","This slider does nothing, select spells below")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedSmallCooldowns.Apocalypse","Apocalypse","Include Apocalypse in SmallCooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedSmallCooldowns.DarkTransformation","Dark Transformation","Include Dark Transformation in SmallCooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedSmallCooldowns.ArmyoftheDead","Army of the Dead","Include Army of the Dead in SmallCooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedSmallCooldowns.UnholyBlight","Unholy Blight","Include Unholy Blight in SmallCooldowns")g("CheckButton",n,"APL.DeathKnight.Unholy.IncludedSmallCooldowns.SacrificalPact","Sacrifical Pact","Include Sacrifical Pact in SmallCooldowns")i(n,"APL.DeathKnight.Unholy")