local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Hunter={Commons={Enabled={Potions=true,Trinkets=true},SummonPetSlot=1,ExhilarationHP=20,MendPetHighHP=40,MendPetLowHP=80,AutoMisdirect=true},BeastMastery={TargetSwap="AutoSwap",DBMSupport=false,AspectoftheWild="CDs",Stampede="CDs",BestialWrathCD="Small CDs",Bloodshed="Small CDs"},Marksmanship={TargetSwap="AutoSwap",HideAimedWhileMoving=false,GCDasOffGCD={},OffGCDasOffGCD={}},Survival={AspectOfTheEagle=true,TargetSwap="AutoSwap",GCDasOffGCD={},OffGCDasOffGCD={}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Hunter")local l=f(j,"BeastMastery")local m=f(j,"Marksmanship")local n=f(j,"Survival")g("Slider",k,"APL.Hunter.Commons.ExhilarationHP",{0,100,1},"Exhilaration HP","Set the Exhilaration HP threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.MendPetHighHP",{0,100,1},"Mend Pet High HP","Set the Mend Pet HP High Priority (ASAP) threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.MendPetLowHP",{0,100,1},"Mend Pet Low HP","Set the Mend Pet HP Low Priority (Pooling) threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.SummonPetSlot",{0,5,1},"Summon Pet Slot","Which pet stable slot to suggest when summoning a pet.")g("CheckButton",k,"APL.Hunter.Commons.AutoMisdirect","AutoMisdirect","Enable Auto Misdirect on your focus")i(k,"APL.Hunter.Commons")g("Dropdown",l,"APL.Hunter.BeastMastery.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",l,"APL.Hunter.BeastMastery.DBMSupport","DBM Enabled?","Enable this option if you have DBM - BETA")g("Dropdown",l,"APL.Hunter.BeastMastery.AspectoftheWild",{"CDs","Small CDs","Always"},"CDs: Aspect of the Wild","")g("Dropdown",l,"APL.Hunter.BeastMastery.Stampede",{"CDs","Small CDs","Always"},"CDs: Stampede","")g("Dropdown",l,"APL.Hunter.BeastMastery.BestialWrathCD",{"CDs","Small CDs","Always"},"CDs: Beastial Wrath","")g("Dropdown",l,"APL.Hunter.BeastMastery.Bloodshed",{"CDs","Small CDs","Always"},"CDs: Bloodshed","")l["APL.Hunter.BeastMastery.Bloodshed"]:SetPoint("TOPLEFT",180,-110)l["APL.Hunter.BeastMastery.BestialWrathCD"]:SetPoint("TOPLEFT",180,-160)i(l,"APL.Hunter.BeastMastery")g("Dropdown",m,"APL.Hunter.Marksmanship.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",m,"APL.Hunter.Marksmanship.HideAimedWhileMoving","Hide Moving Aimed Shot","Enable this option to hide Aimed Shot while your character is moving.")i(m,"APL.Hunter.Marksmanship")g("Dropdown",n,"APL.Hunter.Survival.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",n,"APL.Hunter.Survival.AspectoftheEagle","Show Aspect of the Eagle","Show Aspect of the Eagle when out of Melee Range.")i(n,"APL.Hunter.Survival")