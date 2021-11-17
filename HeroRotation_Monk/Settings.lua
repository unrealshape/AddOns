local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Monk={Commons={UseDefensives=true,HealthstoneHP=50,HealPotHP=0,FortifyingBrew=20,TouchofKarma=0,Enabled={Potions=false,TopTrinket=true,BottomTrinket=true},GCDasOffGCD={},OffGCDasOffGCD={}},Brewmaster={NoBrewmasterPooling=false,ShowCelestialBrewCD=true,ShowDampenHarmCD=true,Purify={Enabled=true,Low=true,Medium=true,High=true},GCDasOffGCD={CelestialBrew=true,DampenHarm=true,FortifyingBrew=true,InvokeNiuzaoTheBlackOx=true,TouchOfDeath=true},OffGCDasOffGCD={BlackOxBrew=true,PurifyingBrew=true}},Windwalker={TargetSwap="Mouseover",ShowFortifyingBrewCD=false,IgnoreFSK=true,SEFEcoCharge=1.75,GCDasOffGCD={},OffGCDasOffGCD={},UHCooldowns=0,IncludedCooldowns={Xuen=true,SEFFull=true,SEFEco=false},UHSmallCooldowns=0,IncludedSmallCooldowns={Xuen=false,SEFFull=false,SEFEco=true}},Mistweaver={ShowFortifyingBrewCD=false,NoMistweaverPooling=false,GCDasOffGCD={InvokeYulonTheJadeSerpent=true,InvokeChiJiTheRedCrane=true,SummonJadeSerpentStatue=true,RenewingMist=true,TouchOfDeath=true,FortifyingBrew=true},OffGCDasOffGCD={ThunderFocusTea=true}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Monk")local l=f(k,"Windwalker")local m=f(k,"Brewmaster")local n=f(k,"Mistweaver")i(k,"APL.Monk.Commons")g("Slider",k,"APL.Monk.Commons.FortifyingBrew",{0,100,1},"Fortifying Brew HP %","Set the HP threshold to use Fortifying Brew")g("Slider",k,"APL.Monk.Commons.TouchofKarma",{0,100,1},"TouchofKarma HP %","Set the HP threshold to use Touch of Karma")i(l,"APL.Monk.Windwalker")g("Dropdown",l,"APL.Monk.Windwalker.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",l,"APL.Monk.Windwalker.IgnoreFSK","Ignore Flying Serpent Kick","Enable this setting to allow you to ignore Flying Serpent Kick without stalling the rotation. (NOTE: Flying Serpent Kick will never be suggested if this is enabled)")g("Slider",l,"APL.Monk.Windwalker.SEFEcoCharge",{1,2,0.1},"SEF Eco Charges","Set the Storm, Earth and Fire Eco Charge threshold.")g("Slider",l,"APL.Monk.Windwalker.UHCooldowns",{0,0,0},"--Spells to include in Cooldowns--","This slider does nothing, select spells below")g("CheckButton",l,"APL.Monk.Windwalker.IncludedCooldowns.Xuen","Invoke Xuen","Include Invoke Xuen in Cooldowns")g("CheckButton",l,"APL.Monk.Windwalker.IncludedCooldowns.SEFFull","Storm, Earth and Fire Full","Use all SEF charges in Cooldowns")g("CheckButton",l,"APL.Monk.Windwalker.IncludedCooldowns.SEFEco","Storm, Earth and Fire Eco Mode","Use only SEF Eco charges in Cooldowns")g("Slider",l,"APL.Monk.Windwalker.UHSmallCooldowns",{0,0,0},"--Spells to include in SmallCooldowns--","This slider does nothing, select spells below")g("CheckButton",l,"APL.Monk.Windwalker.IncludedSmallCooldowns.Xuen","Invoke Xuen","Include Invoke Xuen in Small Cooldowns")g("CheckButton",l,"APL.Monk.Windwalker.IncludedSmallCooldowns.SEFFull","Storm, Earth and Fire Full","Use all SEF charges in Small Cooldowns")g("CheckButton",l,"APL.Monk.Windwalker.IncludedSmallCooldowns.SEFEco","Storm, Earth and Fire Eco","Use SEF Eco charges in Small Cooldowns")i(m,"APL.Monk.Brewmaster")g("CheckButton",m,"APL.Monk.Brewmaster.NoBrewmasterPooling","No Pooling","If you want to ignore energy pooling.")g("CheckButton",m,"APL.Monk.Brewmaster.ShowCelestialBrewCD","Celestial Brew","Enable or disable Celestial Brew recommendations.")g("CheckButton",m,"APL.Monk.Brewmaster.ShowDampenHarmCD","Dampen Harm","Enable or disable Dampen Harmrecommendations.")g("CheckButton",m,"APL.Monk.Brewmaster.Purify.Enabled","Purify","Enable or disable Purify recommendations.")i(n,"APL.Monk.Mistweaver")