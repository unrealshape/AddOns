local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Priest={Commons={Enabled={Potions=true,Trinkets=true},DisplayStyle={},GCDasOffGCD={},OffGCDasOffGCD={}},Shadow={TargetSwap="Mouseover",DispersionHP=30,SelfPI=true,SpriestCooldowns=0,IncludedCooldowns={PowerInfusion=true,VoidErruption=false,VoidTorrent=false,ShadowCrash=false,MindBender=false},SpriestSmallCooldowns=0,IncludedSmallCooldowns={PowerInfusion=false,VoidErruption=true,VoidTorrent=true,ShadowCrash=true,MindBender=true},GCDasOffGCD={},OffGCDasOffGCD={}},Discipline={GCDasOffGCD={Mindbender=true,PowerInfusion=true,ShadowCovenant=true},OffGCDasOffGCD={}},Holy={GCDasOffGCD={Apotheosis=true,DivineStar=true,Halo=true},OffGCDasOffGCD={}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Priest")local l=f(k,"Shadow")local m=f(k,"Discipline")local n=f(k,"Holy")i(k,"APL.Priest.Commons")g("Dropdown",l,"APL.Priest.Shadow.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("Slider",l,"APL.Priest.Shadow.DispersionHP",{0,100,1},"Dispersion HP","Set the Dispersion HP threshold.")g("CheckButton",l,"APL.Priest.Shadow.SelfPI","Assume Self-Power Infusion","Assume the player will be using Power Infusion on themselves.")g("Slider",l,"APL.Priest.Shadow.SpriestCooldowns",{0,0,0},"--Spells to include in Cooldowns--","This slider does nothing, select spells below")g("CheckButton",l,"APL.Priest.Shadow.IncludedCooldowns.PowerInfusion","Power Infusion","Include Power Infusion in Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedCooldowns.VoidErruption","Void Erruption","Include Void Erruption in Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedCooldowns.VoidTorrent","Void Torrent","Include Void Torrent in Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedCooldowns.ShadowCrash","Shadow Crash","Include Shadow Crash in Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedCooldowns.MindBender","MindBender/Shadowfiend","Include MindBender/Shadowfiend in Cooldowns")g("Slider",l,"APL.Priest.Shadow.SpriestSmallCooldowns",{0,0,0},"--Spells to include in SmallCooldowns--","This slider does nothing, select spells below")g("CheckButton",l,"APL.Priest.Shadow.IncludedSmallCooldowns.PowerInfusion","Power Infusion","Include PowerInfusion in Small Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedSmallCooldowns.VoidErruption","Void Erruption","Include Void Erruption in Small Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedSmallCooldowns.VoidTorrent","Void Torrent","Include Void Torrent in Small Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedSmallCooldowns.ShadowCrash","Shadow Crash","Include Shadow Crash in Small Cooldowns")g("CheckButton",l,"APL.Priest.Shadow.IncludedSmallCooldowns.MindBender","MindBender/Shadowfiend","Include MindBender/Shadowfiend in Small Cooldowns")i(l,"APL.Priest.Shadow")i(m,"APL.Priest.Discipline")i(n,"APL.Priest.Holy")