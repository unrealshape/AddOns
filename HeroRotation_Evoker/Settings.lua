local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Evoker={Commons={EmpoweredFontSize=36,DisintegrateFontSize=22,Enabled={Potions=true,Items=true,TopTrinket=true,BottomTrinket=true,Racials=true},DisplayStyle={},GCDasOffGCD={},OffGCDasOffGCD={}},Augmentation={MinOpenerDelay=0,PresRaid=false,EBThreshold=80,VEThreshold=50,RBThreshold=50,UpheavalRank1Only=true,DisplayStyle={},PotionType={Selected="Power"},GCDasOffGCD={}},Devastation={UseDefensives=true,UseGreen=true,ShowChainClip=true,ObsidianScalesThreshold=60,PotionType={Selected="Power"},GCDasOffGCD={DeepBreath=true,Dragonrage=true}}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Evoker")local l=f(k,"Augmentation")local m=f(k,"Devastation")i(k,"APL.Evoker.Commons")g("Slider",k,"APL.Evoker.Commons.EmpoweredFontSize",{1,100,1},"Empowered Spell Font Size","Select the font size you would like shown for the overlay on your empowered spell casts (Fire Breath/Eternity Surge).")g("Slider",k,"APL.Evoker.Commons.DisintegrateFontSize",{1,100,1},"Disintegrate Spell Font Size","Select the font size you would like shown for the overlay on your Disintegrate spell casts.")i(l,"APL.Evoker.Augmentation")g("Slider",l,"APL.Evoker.Augmentation.EBThreshold",{5,100,5},"AutoHeal with Emerald Blossom for Player & Party Threshold","Suggest Emerald Blossom  when below this health percentage.")g("Slider",l,"APL.Evoker.Augmentation.VEThreshold",{5,100,5},"AutoHeal with Verdant Embrace for Player & Party Threshold","Suggest Verdant Embrace   when below this health percentage.")g("Slider",l,"APL.Evoker.Augmentation.RBThreshold",{5,100,5},"AutoHeal with Renewing Blaze for Player Threshold","Suggest Renewing Blaze when below this health percentage.")g("CheckButton",l,"APL.Evoker.Augmentation.PresRaid","Gives Prescience on Tank(only RAID feature)","Enable this option to only suggest DPS Dealer for Prescience on Raids.")g("CheckButton",m,"APL.Evoker.Devastation.UseDefensives","Suggest Defensives","Enable this option to have the addon suggest defensive spells.")g("CheckButton",m,"APL.Evoker.Devastation.UseGreen","Suggest Green Spells","Enable this option to have the addon suggest Green Evoker spells, as per the APL. Disable if you want to decide for yourself when to use them.")g("CheckButton",m,"APL.Evoker.Devastation.ShowChainClip","Show Chain/Clip Suggestions","Enable this option to have the addon overlay 'CLIP' and 'CHAIN' onto casts when Disintegrate should be clipped or chained. (Note: This is currently only for single target rotations.)")g("Slider",m,"APL.Evoker.Devastation.ObsidianScalesThreshold",{5,100,5},"Obsidian Scales Threshold","Suggest Obsidian Scales when below this health percentage.")i(m,"APL.Evoker.Devastation")