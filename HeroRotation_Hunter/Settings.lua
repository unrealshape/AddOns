local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Hunter={Commons={Enabled={Potions=true,Trinkets=true},SummonPetSlot=1,ExhilarationHP=20,MendPetHighHP=40,MendPetLowHP=80},BeastMastery={TargetSwap="AutoSwap"},Marksmanship={TargetSwap="AutoSwap",HideAimedWhileMoving=false,GCDasOffGCD={},OffGCDasOffGCD={}},Survival={AspectOfTheEagle=true,GCDasOffGCD={Butchery=false,CoordinatedAssault=true,Harpoon=true},OffGCDasOffGCD={AspectOfTheEagle=true,Muzzle=true}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Hunter")local l=f(j,"BeastMastery")local m=f(j,"Marksmanship")local n=f(j,"Survival")g("Slider",k,"APL.Hunter.Commons.ExhilarationHP",{0,100,1},"Exhilaration HP","Set the Exhilaration HP threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.MendPetHighHP",{0,100,1},"Mend Pet High HP","Set the Mend Pet HP High Priority (ASAP) threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.MendPetLowHP",{0,100,1},"Mend Pet Low HP","Set the Mend Pet HP Low Priority (Pooling) threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.SummonPetSlot",{1,5,1},"Summon Pet Slot","Which pet stable slot to suggest when summoning a pet.")i(k,"APL.Hunter.Commons")g("Dropdown",l,"APL.Hunter.BeastMastery.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")i(l,"APL.Hunter.BeastMastery")g("Dropdown",m,"APL.Hunter.Marksmanship.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",m,"APL.Hunter.Marksmanship.HideAimedWhileMoving","Hide Moving Aimed Shot","Enable this option to hide Aimed Shot while your character is moving.")i(m,"APL.Hunter.Marksmanship")g("CheckButton",n,"APL.Hunter.Survival.AspectoftheEagle","Show Aspect of the Eagle","Show Aspect of the Eagle when out of Melee Range.")i(n,"APL.Hunter.Survival")