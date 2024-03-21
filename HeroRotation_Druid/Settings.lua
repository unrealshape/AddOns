local a,b=...local c=HeroRotation;local d=HeroLib;local e=d.GUI;local f=e.CreateChildPanel;local g=e.CreatePanelOption;local h=c.GUI.CreateARPanelOption;local i=c.GUI.CreateARPanelOptions;c.GUISettings.APL.Druid={Commons={Enabled={Potions=true,TopTrinket=true,BotTrinket=true},TopTrinketHP=0,BotTrinketHP=0,DisplayStyle={},GCDasOffGCD={},OffGCDasOffGCD={}},Balance={TargetSwap="Mouseover",AoeMode="Aggresive",BarkskinHP=50,RenewalHP=40,ShowMoonkinFormOOC=false,UseBarkskinDefensively=false,GCDasOffGCD={},OffGCDasOffGCD={}},Feral={FillerSpell="Rake Non-Snapshot",ShowCatFormOOC=false,UseOwlweave=false,GCDasOffGCD={BsInc=true},OffGCDasOffGCD={SkullBash=true,TigersFury=true}},Guardian={TargetSwap="Mouseover",UseRageDefensively=true,UseBarkskinDefensively=false,SwapForConvoke=false},Guardian2={BarkskinHP=50,RenewalHP=60,FrenziedRegenHP=70,SurvivalInstinctsHP=30,BristlingFurRage=50,HealthstoneHP=50,HealPotHP=0,PhialHP=60,MTRegrowth=80,IGuardianOfUrsoc=25},Restoration={AVGHeal=75,UseBarkskin=true,BarkskinHP=50,UseRenewal=true,RenewalHP=50,UseIronbark=true,IronbarkHP=70,UseAdaptiveSwarmForHeal=true,UseAdaptiveSwarmForDPS=true,UseLifebloomTank=true,LifebloomTankHP=70,UseLifebloom=true,LifebloomHP=50,UseConvokeTheSpiritsForHeal=true,ConvokeTheSpiritsGroup=3,ConvokeTheSpiritsHP=60,UseNaturesSwiftness=true,NaturesSwiftnessHP=30,UseGroveGuardians=false,GroveGuardiansHP=81,GroveGuardiansGroup=3,FlourishHP=70,FlourishGroup=3,TranquilityHP=50,TranquilityGroup=3,TranquilityTreeHP=50,TranquilityTreeGroup=3,UseWildgrowth=true,WildgrowthHP=60,WildgrowthGroup=3,UseRegrowth=true,RegrowthHP=60,UseRejuvenation=true,RejuvenationHP=80,UseRegrowthRefresh=true,RegrowthRefreshHP=70,UseCenarionWard=true,CenarionWardHP=70}}c.GUI.LoadSettingsRecursively(c.GUISettings)local j=c.GUI.Panel;local k=f(j,"Druid")local l=f(k,"Balance")local m=f(k,"Feral")local n=f(k,"Guardian")local o=f(k,"Guardian Defensives")local p=f(k,"Restoration")i(k,"APL.Druid.Commons")g("Slider",k,"APL.Druid.Commons.TopTrinketHP",{0,100,1},"Top Trinket Defensive Threshold","Set the HP percentage threshold of when to use Top Trinket. Set to 0 if not defensive")g("Slider",k,"APL.Druid.Commons.BotTrinketHP",{0,100,1},"Bottom Trinket Defensive Threshold","Set the HP percentage threshold of when to use Bottom Trinket. Set to 0 if not defensive")g("Slider",p,"APL.Druid.Restoration.AVGHeal",{0,100,1},"Average Heal","Set the Average Healing HP threshold.")g("CheckButton",p,"APL.Druid.Restoration.UseBarkskin","Use Barkskin Defensive","Enable this if you want Use as Defensives")g("Slider",p,"APL.Druid.Restoration.BarkskinHP",{0,100,1},"Barkskin HP","Set the Barkskin HP threshold.")g("CheckButton",p,"APL.Druid.Restoration.UseRenewal","Use Renewal Defensive","Enable this if you want Use as Defensives")g("Slider",p,"APL.Druid.Restoration.RenewalHP",{0,100,1},"Renewal HP","Set the Renewal HP threshold.")g("CheckButton",p,"APL.Druid.Restoration.UseIronbark","Use Ironbark","Enable this if you want Use")g("Slider",p,"APL.Druid.Restoration.IronbarkHP",{0,100,1},"Ironbark HP","Set the Ironbark HP threshold.")g("CheckButton",p,"APL.Druid.Restoration.UseAdaptiveSwarmForHeal","Use Adaptive Swarm for Heal","Enable this if you want Use")g("CheckButton",p,"APL.Druid.Restoration.UseAdaptiveSwarmForDPS","Use Adaptive Swarm for DPS","Enable this if you want Use")g("CheckButton",p,"APL.Druid.Restoration.UseLifebloomTank","Use Lifebloom Tank","Enable this if you want Use")g("Slider",p,"APL.Druid.Restoration.LifebloomTankHP",{0,100,1},"Lifebloom Tank HP","Set the Ironbark HP threshold.")g("CheckButton",p,"APL.Druid.Restoration.UseLifebloom","Use Lifebloom","Enable this if you want Use")g("Slider",p,"APL.Druid.Restoration.LifebloomHP",{0,100,1},"Lifebloom HP","Set the Ironbark HP threshold.")g("CheckButton",p,"APL.Druid.Restoration.UseConvokeTheSpiritsForHeal","Use Convoke for Heal","Enable this if you want Use in Healing ")g("Slider",p,"APL.Druid.Restoration.ConvokeTheSpiritsHP",{0,100,1},"HP % for Convoke","Set the min User for Convoke.")g("Slider",p,"APL.Druid.Restoration.ConvokeTheSpiritsGroup",{0,5,1},"min Member for Convoke","Set the min User for Convoke.")g("CheckButton",p,"APL.Druid.Restoration.UseNaturesSwiftness","Natures Swiftness for Heal","Enable this if you want Use in Healing with Regrowth")g("Slider",p,"APL.Druid.Restoration.NaturesSwiftnessHP",{0,100,1},"HP % for NaturesSwiftnessHP","Set the  NaturesSwiftness HP threshold")p["APL.Druid.Restoration.NaturesSwiftnessHP"]:SetPoint("TOPLEFT",225,-30)g("CheckButton",p,"APL.Druid.Restoration.UseGroveGuardians","Natures Swiftness for Heal","Enable this if you want Use in Healing")g("Slider",p,"APL.Druid.Restoration.GroveGuardiansHP",{0,100,1},"HP % for Grove Guardians HP","Set the  Grove Guardians HP threshold")g("Slider",p,"APL.Druid.Restoration.GroveGuardiansGroup",{0,5,1},"min Member for Grove Guardians","Set the min User for Grove Guardians.")g("Slider",p,"APL.Druid.Restoration.FlourishHP",{0,100,1},"HP % for Flourish HP","Set the  NaturesSwiftness HP threshold")g("Slider",p,"APL.Druid.Restoration.FlourishGroup",{0,5,1},"min Member for Flourish ","Set the min User for Flourish.")g("Slider",p,"APL.Druid.Restoration.TranquilityHP",{0,100,1},"HP % for Tranquility HP","Set the  Tranquility HP threshold")g("Slider",p,"APL.Druid.Restoration.TranquilityGroup",{0,5,1},"min Member for Tranquility","Set the min User for Tranquility.")g("Slider",p,"APL.Druid.Restoration.TranquilityTreeHP",{0,100,1},"HP % for Tranquility Tree HP","Set the  Tranquility Tree HP threshold")g("Slider",p,"APL.Druid.Restoration.TranquilityTreeGroup",{0,5,1},"min Member for Tranquility Tree","Set the min User for Tranquility Tree.")p["APL.Druid.Restoration.TranquilityTreeGroup"]:SetPoint("TOPLEFT",440,-20)g("CheckButton",p,"APL.Druid.Restoration.UseWildgrowth","Wildgrowth for Heal","Enable this if you want Use in Healing with Regrowth")g("Slider",p,"APL.Druid.Restoration.WildgrowthHP",{0,100,1},"HP % for Wildgrowth HP","Set the  Wildgrowth HP threshold")g("Slider",p,"APL.Druid.Restoration.WildgrowthGroup",{0,5,1},"min Member for Wildgrowth","Set the min User for Wildgrowth.")g("CheckButton",p,"APL.Druid.Restoration.UseRegrowth","Regrowth for Heal","Enable this if you want Use in Healing")g("Slider",p,"APL.Druid.Restoration.RegrowthHP",{0,100,1},"HP % for Regrowth HP","Set the  Regrowth HP threshold")g("CheckButton",p,"APL.Druid.Restoration.UseRejuvenation","Rejuvenation for Heal","Enable this if you want Use in Healing")g("Slider",p,"APL.Druid.Restoration.RejuvenationHP",{0,100,1},"HP % for Rejuvenation  HP","Set the  Rejuvenation  HP threshold")g("CheckButton",p,"APL.Druid.Restoration.UseRegrowthRefresh","Refresh Rejuvenation for Heal","Enable this if you want Use in Healing")g("Slider",p,"APL.Druid.Restoration.RegrowthRefreshHP",{0,100,1},"HP % for Refresh Rejuvenation  HP","Set the Refresh Rejuvenation HP threshold")g("CheckButton",p,"APL.Druid.Restoration.UseCenarionWard","Use CenarionWard for Heal","Enable this if you want Use in Healing")g("Slider",p,"APL.Druid.Restoration.CenarionWardHP",{0,100,1},"HP % for CenarionWard HP","Set the Refresh CenarionWard HP threshold")i(p,"APL.Druid.Restoration")g("Dropdown",l,"APL.Druid.Balance.AoeMode",{"Aggresive","Conservative"},"AoE Detection Mode","Aggresive: Scans nameplates on your screen and runs them through a filter to check for combat (Bad when pack of mobs is split up)\nConservative: Uses party/raid member casts to detect enemies in range (Slower than Aggresive mode but better when pack is split up)\nAggressive is best used when solo or with a decent tank in M+, Conservative will be best used in Raid or with a bad tank in M+")g("Dropdown",l,"APL.Druid.Balance.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",l,"APL.Druid.Balance.ShowMoonkinFormOOC","Show Moonkin Form Out of Combat","Enable this if you want the addon to show you the Moonkin Form reminder out of combat.")i(l,"APL.Druid.Balance")g("Dropdown",m,"APL.Druid.Feral.FillerSpell",{"Shred","Rake Non-Snapshot","Rake Snapshot","Moonfire","Swipe"},"Preferred Filler Spell","Select which spell to use as your filler spell. The SimC APL default is Rake Non-Snapshot.")g("CheckButton",m,"APL.Druid.Feral.ShowCatFormOOC","Show Cat Form Out of Combat","Enable this if you want the addon to show you the Cat Form reminder out of combat.")g("CheckButton",m,"APL.Druid.Feral.UseOwlweave","Utilize Owleaving","Enable this if you want Owlweaving spell suggestions when talented into Balance Affinity.")i(m,"APL.Druid.Feral")i(n,"APL.Druid.Guardian")g("Dropdown",n,"APL.Druid.Guardian.TargetSwap",{"Mouseover","AutoSwap"},"DoT Spread Method","Choose Which Method to use to spread DoTs")g("CheckButton",n,"APL.Druid.Guardian.UseRageDefensively","Use Rage Defensively","Enable this if you want to save rage for defensive use, disabling Maul suggestions.")g("CheckButton",n,"APL.Druid.Guardian.UseBarkskinDefensively","Use Barkskin Defensively","Enable this if you want to save Barkskin for defensive use, disabling offensive Barkskin with Brambles.")g("CheckButton",n,"APL.Druid.Guardian.SwapForConvoke","Swap Forms For Convoke","Enable this if you want to swap to your affinity form before convoking")i(o,"APL.Druid.Guardian2")g("Slider",o,"APL.Druid.Guardian2.BarkskinHP",{0,100,1},"Barkskin Threshold","Set the HP percentage threshold of when to use Barkskin.")g("Slider",o,"APL.Druid.Guardian2.FrenziedRegenHP",{0,100,1},"Frenzied Regen Threshold","Set the HP percentage threshold of when to use Frenzied Regeneration.")g("Slider",o,"APL.Druid.Guardian2.RenewalHP",{0,100,1},"Renewal Threshold","Set the HP percentage threshold of when to use Renewal.")g("Slider",o,"APL.Druid.Guardian2.SurvivalInstinctsHP",{0,100,1},"Survival Instincts Threshold","Set the HP percentage threshold of when to use Survival Instincts.")g("Slider",o,"APL.Druid.Guardian2.BristlingFurRage",{0,100,1},"Bristling Fur Threshold","Set the Rage threshold of when to use Bristling Fur.")g("Slider",o,"APL.Druid.Guardian2.HealthstoneHP",{0,100,1},"Healthstone HP %","Set the HP threshold to use Healthstone")g("Slider",o,"APL.Druid.Guardian2.HealPotHP",{0,100,1},"Healing Potion HP %","Set the HP threshold to use Healing Potion")g("Slider",o,"APL.Druid.Guardian2.PhialHP",{0,100,1},"Phial of Serenity HP %","Set the HP threshold to use Phial of Serenity")g("Slider",o,"APL.Druid.Guardian2.MTRegrowth",{0,100,1},"Mage Tower HP %","Set the HP threshold to use Regrowth in the Mage Tower")g("Slider",o,"APL.Druid.Guardian2.IGuardianOfUrsoc",{0,100,1},"Incarnation: Guardian of Ursoc %","Set the HP threshold to use Incarnation: Guardian of Ursoc")