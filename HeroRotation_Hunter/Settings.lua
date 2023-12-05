local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Hunter={Commons={Enabled={Potions=true,TopTrinket=true,BottomTrinket=true},SummonPetSlot=1,ExhilarationHP=20,TurtleHP=0,MendPetHighHP=40,MendPetLowHP=80,HealthstoneHP=30,HealPotHP=25,AutoMisdirect=true},Commons2={SummonPetSlot=1,ExhilarationHP=20,MendPetHP=40,GCDasOffGCD={Exhilaration=true,ExplosiveShot=false,Flare=false,FreezingTrap=false,MendPet=false,RevivePet=false,Stampede=false,SteelTrap=false,SummonPet=false,TarTrap=false},OffGCDasOffGCD={CounterShot=true}},BeastMastery={TargetSwap="AutoSwap",PotionType={Selected="Power"},DBMSupport=false,AspectoftheWild="CDs",Stampede="CDs",BestialWrathCD="Small CDs",Bloodshed="Small CDs",CalloftheWildCD="CDs",DeathChakramAutomaticUsing=true},Marksmanship={TargetSwap="AutoSwap",PotionType={Selected="Power"},HideAimedWhileMoving=false,DeathChakram=true,GCDasOffGCD={},OffGCDasOffGCD={}},Survival={AspectOfTheEagle=true,SerpantStingTargetSwap="AutoSwap",KillCommandTargetSwap="AutoSwap",PotionType={Selected="Power"},KCFish=true,SerpantStingRange=10,BombRange=10,GCDasOffGCD={},OffGCDasOffGCD={}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Hunter")local l=f(k,"BeastMastery")local m=f(k,"Marksmanship")local n=f(k,"Survival")local o=f(j,"Hunter 2")g("Slider",k,"APL.Hunter.Commons.ExhilarationHP",{0,100,1},"Exhilaration HP","Set the Exhilaration HP threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.TurtleHP",{0,100,1},"Aspect of the Turtle HP","Set the Aspect of the Turtle HP threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.MendPetHighHP",{0,100,1},"Mend Pet High HP","Set the Mend Pet HP High Priority (ASAP) threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.MendPetLowHP",{0,100,1},"Mend Pet Low HP","Set the Mend Pet HP Low Priority (Pooling) threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.SummonPetSlot",{0,5,1},"Summon Pet Slot","Which pet stable slot to suggest when summoning a pet.")g("Slider",k,"APL.Hunter.Commons.HealthstoneHP",{0,100,1},"Healthstone HP","Set the Healthstone HP threshold. Set to 0 to disable.")g("Slider",k,"APL.Hunter.Commons.HealPotHP",{0,100,1},"Heal Pot HP","Set the Heal Potion HP threshold. Set to 0 to disable.")g("CheckButton",k,"APL.Hunter.Commons.AutoMisdirect","AutoMisdirect","Enable Auto Misdirect on your focus")i(k,"APL.Hunter.Commons")g("Slider",o,"APL.Hunter.Commons2.ExhilarationHP",{0,100,1},"Exhilaration HP","Set the Exhilaration HP threshold. Set to 0 to disable.")g("Slider",o,"APL.Hunter.Commons2.MendPetHP",{0,100,1},"Mend Pet High HP","Set the Mend Pet HP threshold. Set to 0 to disable.")g("Slider",o,"APL.Hunter.Commons2.SummonPetSlot",{1,5,1},"Summon Pet Slot","Which pet stable slot to suggest when summoning a pet.")i(o,"APL.Hunter.Commons2")g("Dropdown",l,"APL.Hunter.BeastMastery.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",l,"APL.Hunter.BeastMastery.DBMSupport","DBM Enabled?","Enable this option if you have DBM - BETA")g("Dropdown",l,"APL.Hunter.BeastMastery.AspectoftheWild",{"CDs","Small CDs","Always"},"CDs: Aspect of the Wild","")g("Dropdown",l,"APL.Hunter.BeastMastery.Stampede",{"CDs","Small CDs","Always"},"CDs: Stampede","")g("Dropdown",l,"APL.Hunter.BeastMastery.Bloodshed",{"CDs","Small CDs","Always"},"CDs: Bloodshed","")g("Dropdown",l,"APL.Hunter.BeastMastery.BestialWrathCD",{"CDs","Small CDs","Always"},"CDs: Beastial Wrath","")g("Dropdown",l,"APL.Hunter.BeastMastery.CalloftheWildCD",{"CDs","Small CDs","Always"},"CDs: Call of the Wild","")g("CheckButton",l,"APL.Hunter.BeastMastery.DeathChakramAutomaticUsing","Death Chakram Automatical use ","Enable this option if want to use DC automatically otherwise use Que Macro")l["APL.Hunter.BeastMastery.Bloodshed"]:SetPoint("TOPLEFT",180,-110)i(l,"APL.Hunter.BeastMastery")g("Dropdown",m,"APL.Hunter.Marksmanship.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",m,"APL.Hunter.Marksmanship.HideAimedWhileMoving","Hide Moving Aimed Shot","Enable this option to hide Aimed Shot while your character is moving.")g("CheckButton",m,"APL.Hunter.Marksmanship.DeathChakram","Death Chakram Automatically ","Enable this option to automatically add DeathChakram(Not for Manual USE)")i(m,"APL.Hunter.Marksmanship")g("Dropdown",n,"APL.Hunter.Survival.SerpantStingTargetSwap",{"Mouseover","AutoSwap"},"Serpant Sting Spread Method","Choose Which Method to use to spread Serpant Sting DoT")g("Dropdown",n,"APL.Hunter.Survival.KillCommandTargetSwap",{"Mouseover","AutoSwap"},"Kill Command Spread Method","Choose Which Method to use to spread Kill Command DoT")g("CheckButton",n,"APL.Hunter.Survival.AspectoftheEagle","Show Aspect of the Eagle","Show Aspect of the Eagle when out of Melee Range.")g("CheckButton",n,"APL.Hunter.Survival.KCFish","Kill Command Fishing","Fish for Mad Bombardier procs in AoE when we have 2+ tier pieces")g("Slider",n,"APL.Hunter.Survival.SerpantStingRange",{8,40,1},"Serpant Sting Range","Set the maximum range to use Serpant Sting")g("Slider",n,"APL.Hunter.Survival.BombRange",{8,40,1},"Bomb Range","Set the maximum range to use Wildfire Bombs")i(n,"APL.Hunter.Survival")function SetPet(p)k["APL.Hunter.Commons.SummonPetSlot"]:SetValue(p)end