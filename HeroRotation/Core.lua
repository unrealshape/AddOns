local a,b=...local c=HeroLib;local d,e=HeroCache,c.Utils;local f=c.Unit;local g=f.Player;local h=f.Target;local i=c.Spell;local j=c.Item;local k=math.min;local print=print;local select=select;local l=string.lower;local strsplit=strsplit;local tostring=tostring;local m=_G.DBM;local n=_G.BigWigsLoader;local o=false;HeroRotation=b;b.BossMods={EngagedBosses={}}local p=b.BossMods.EngagedBosses;function b.Print(...)print("[|cFFFF6600Hero Rotation|r]",...)end;b.APLs={}b.APLInits={}function b.SetAPL(q,r,s)b.APLs[q]=r;b.APLInits[q]=s end;function b.GetTexture(t)local u=t.SpellID;if u then local v=d.Persistent.Texture.Spell;if not v[u]then if u>=999900 then v[u]="Interface\\Addons\\HeroRotation\\Textures\\"..tostring(u)elseif t.TextureSpellID then v[u]=GetSpellTexture(t.TextureSpellID)else v[u]=GetSpellTexture(u)end end;return v[u]end;local w=t.ItemID;if w then local v=d.Persistent.Texture.Item;if not v[w]then local x,x,x,x,x,x,x,x,x,y=GetItemInfo(w)v[w]=y end;return v[w]end end;local z=i(61304)local A,B,C;local function D(t,E,F)local G,H;local I=GetTime()if g:IsCasting()or g:IsChanneling()then G=g:CastStart()H=g:CastDuration()else G,H=z:CooldownInfo()end;if A~=t then A=t;B=I;C=0 end;if E then local J;if F then J=F else J=g.TimeToXResourceMap[t:CostInfo(nil,"type")](t:Cost())end;if J and J>0 then if J>G+H-I then local K=I-B+J;if C==0 and K>0.25 or C>K or K-C>0.5 then C=K end;G=B;H=C end end end;if G+H<I then G=0;H=0;A=nil end;b.MainIconFrame:SetCooldown(G,H)end;b.CastOffGCDOffset=1;function b.Cast(t,L,M,N,F)local O=b.GetTexture(t)local P=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(O)if L or M=="Cooldown"then if b.CastOffGCDOffset==1 or b.CastOffGCDOffset==2 and b.SmallIconFrame:GetIcon(1)~=O then b.SmallIconFrame:ChangeIcon(b.CastOffGCDOffset,O,P,N)b.CastOffGCDOffset=b.CastOffGCDOffset+1;t.LastDisplayTime=GetTime()return false end elseif M=="Suggested"then b.CastSuggested(t,N)elseif M=="SuggestedRight"then b.CastRightSuggested(t,N)else local Q=999910;local R=t.SpellID==Q or t:IsUsable()local S=M=="Pooling"local N=N or false;b.MainIconFrame:ChangeIcon(O,P,R,N)D(t,S,F)t.LastDisplayTime=GetTime()return true end;return nil end;function b.CastAnnotated(t,L,T)local U=b.Cast(t,L)if not L then b.MainIconFrame:OverlayText(T)end;return U end;function b.CastPooling(t,F,N)return b.Cast(t,false,"Pooling",N,F)end;local V,W,X,Y;b.MaxQueuedCasts=3;local function Z(...)V={...}W=k(#V,b.MaxQueuedCasts)X={}Y={}for _=1,W do X[_]=b.GetTexture(V[_])V[_].LastDisplayTime=GetTime()Y[_]=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(X[_])end;b.MainIconFrame:ChangeIcon(X[1],Y[1],V[1]:IsUsable())b.MainIconFrame:SetupParts(X,Y)end;function b.CastQueue(...)Z(...)D()return"Should Return"end;function b.CastQueuePooling(F,...)Z(...)if F then D(V[1],true,F)else local a0,a1=nil,0;for _=1,#V do if V[_]:Cost()>a1 then a1=V[_]:Cost()a0=V[_]end end;D(a0,true)end;return"Should Return"end;b.CastLeftOffset=1;function b.CastLeftCommon(t)local a2=b.GetTexture(t)local P=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(a2)b.LeftIconFrame:ChangeIcon(a2,P)b.CastLeftOffset=b.CastLeftOffset+1;t.LastDisplayTime=GetTime()end;function b.CastLeft(t)if b.CastLeftOffset==1 then b.CastLeftCommon(t)end;return false end;function b.CastLeftNameplate(a3,t)if b.CastLeftOffset==1 and b.Nameplate.AddIcon(a3,t)then b.CastLeftCommon(t)end;return false end;b.CastSuggestedOffset=1;function b.CastSuggested(t,N)if b.CastSuggestedOffset==1 then local a2=b.GetTexture(t)local P=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(a2)b.SuggestedIconFrame:ChangeIcon(a2,P,N)b.CastSuggestedOffset=b.CastSuggestedOffset+1;t.LastDisplayTime=GetTime()end;return false end;b.CastRightSuggestedOffset=1;function b.CastRightSuggested(t,N)if b.CastRightSuggestedOffset==1 then local a2=b.GetTexture(t)local P=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(a2)b.RightSuggestedIconFrame:ChangeIcon(a2,P,N)b.CastRightSuggestedOffset=b.CastRightSuggestedOffset+1;t.LastDisplayTime=GetTime()end;return false end;function b.CmdHandler(a4)local a5,a6,a7=strsplit(" ",l(a4))if a5=="cds"then HeroRotationCharDB.Toggles[1]=not HeroRotationCharDB.Toggles[1]b.ToggleIconFrame:UpdateButtonText(1)b.Print("CDs are now "..(HeroRotationCharDB.Toggles[1]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="aoe"then HeroRotationCharDB.Toggles[2]=not HeroRotationCharDB.Toggles[2]b.ToggleIconFrame:UpdateButtonText(2)b.Print("AoE is now "..(HeroRotationCharDB.Toggles[2]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="toggle"then HeroRotationCharDB.Toggles[3]=not HeroRotationCharDB.Toggles[3]b.ToggleIconFrame:UpdateButtonText(3)b.Print("HeroRotation is now "..(HeroRotationCharDB.Toggles[3]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="covenants"then HeroRotationCharDB.Toggles[4]=not HeroRotationCharDB.Toggles[4]b.ToggleIconFrame:UpdateButtonText(4)b.Print("Covenants are now "..(HeroRotationCharDB.Toggles[4]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="smallcds"then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]b.ToggleIconFrame:UpdateButtonText(5)b.Print("Small Cooldowns are now "..(HeroRotationCharDB.Toggles[5]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="opener"then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]b.ToggleIconFrame:UpdateButtonText(6)b.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="unlock"then b.MainFrame:Unlock()b.Print("HeroRotation UI is now |cff00ff00unlocked|r.")elseif a5=="lock"then b.MainFrame:Lock()b.Print("HeroRotation UI is now |cffff0000locked|r.")elseif a5=="scale"then if a6 and a7 then a7=tonumber(a7)if a7 and type(a7)=="number"and a7>0 and a7<=10 then if a6=="ui"then b.MainFrame:ResizeUI(a7)elseif a6=="buttons"then b.MainFrame:ResizeButtons(a7)elseif a6=="all"then b.MainFrame:ResizeUI(a7)b.MainFrame:ResizeButtons(a7)else b.Print("Invalid |cff88ff88[Type]|r for Scale.")b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")b.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")end else b.Print("Invalid |cffff8888[Size]|r for Scale.")b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")b.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")end else b.Print("Invalid arguments for Scale.")b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")b.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")b.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")end elseif a5=="resetbuttons"then b.ToggleIconFrame:ResetAnchor()elseif a5=="help"then b.Print("|cffffff00--[Toggles]--|r")b.Print("  On/Off: |cff8888ff/hr toggle|r")b.Print("  CDs: |cff8888ff/hr cds|r")b.Print("  AoE: |cff8888ff/hr aoe|r")b.Print("|cffffff00--[User Interface]--|r")b.Print("  UI Lock: |cff8888ff/hr lock|r")b.Print("  UI Unlock: |cff8888ff/hr unlock|r")b.Print("  UI Scale: |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r")b.Print("    [Type]: |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r")b.Print("    [Size]: |cffff8888number > 0 and <= 10|r")b.Print("  Button Anchor Reset : |cff8888ff/hr resetbuttons|r")elseif a5=="holdaotd"then HeroRotationCharDB.Toggles[10]=not HeroRotationCharDB.Toggles[10]b.Print("Army of the Dead is now "..(HeroRotationCharDB.Toggles[10]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdsacpac"then HeroRotationCharDB.Toggles[11]=not HeroRotationCharDB.Toggles[11]b.Print("Sacrifical Pact is now "..(HeroRotationCharDB.Toggles[11]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="stopautoswap"then HeroRotationCharDB.Toggles[12]=not HeroRotationCharDB.Toggles[12]b.Print("Auto Swap is now "..(HeroRotationCharDB.Toggles[12]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="amz"then HeroRotationCharDB.Toggles[13]=not HeroRotationCharDB.Toggles[13]b.Print("Anti-Magic Zone Queue is now "..(HeroRotationCharDB.Toggles[13]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="deathgrip"then HeroRotationCharDB.Toggles[14]=not HeroRotationCharDB.Toggles[14]b.Print("Death Grip Queue is now "..(HeroRotationCharDB.Toggles[14]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdpot"then HeroRotationCharDB.Toggles[15]=not HeroRotationCharDB.Toggles[15]b.Print("DPS Pots are now "..(HeroRotationCharDB.Toggles[15]and"|cffff0000disabled|r."or"|cff00ff00enabled|r. Requires Show:Potions checked in settings"))elseif a5=="asphyxiate"then HeroRotationCharDB.Toggles[16]=not HeroRotationCharDB.Toggles[16]b.Print("Asphyxiate Queue is now "..(HeroRotationCharDB.Toggles[16]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="funnelaoe"then HeroRotationCharDB.Toggles[20]=not HeroRotationCharDB.Toggles[20]b.Print("Funnel AoE is now "..(HeroRotationCharDB.Toggles[20]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="holdvanish"then HeroRotationCharDB.Toggles[21]=not HeroRotationCharDB.Toggles[21]b.Print("Vanish is now "..(HeroRotationCharDB.Toggles[21]and"|cffff0000disabled|r."or"|cff00ff00enabled|r. Requires Use Vanish checked in settings"))elseif a5=="cheapshot"then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]b.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="kidney"then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]b.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="blind"then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]b.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="sap"then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]b.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="shurikentornado"then HeroRotationCharDB.Toggles[26]=not HeroRotationCharDB.Toggles[26]b.Print("Shuriken Tornado Queue is now "..(HeroRotationCharDB.Toggles[26]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="feint"then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]b.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="flagellation"then HeroRotationCharDB.Toggles[28]=not HeroRotationCharDB.Toggles[28]b.Print("Flagellation Queue is now "..(HeroRotationCharDB.Toggles[28]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdshurikentornado"then HeroRotationCharDB.Toggles[29]=not HeroRotationCharDB.Toggles[29]b.Print("Shuriken Tornado is now "..(HeroRotationCharDB.Toggles[29]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="racial"then HeroRotationCharDB.Toggles[30]=not HeroRotationCharDB.Toggles[30]b.Print("Racial Ability Queue is now "..(HeroRotationCharDB.Toggles[30]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdwdp"then HeroRotationCharDB.Toggles[31]=not HeroRotationCharDB.Toggles[31]b.Print("Whirling Dragon Punch is now "..(HeroRotationCharDB.Toggles[31]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdfsk"then HeroRotationCharDB.Toggles[32]=not HeroRotationCharDB.Toggles[32]b.Print("Flying Serpant Kick is now "..(HeroRotationCharDB.Toggles[32]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdfof"then HeroRotationCharDB.Toggles[33]=not HeroRotationCharDB.Toggles[33]b.Print("Fist of Fury is now "..(HeroRotationCharDB.Toggles[33]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="legsweep"then HeroRotationCharDB.Toggles[34]=not HeroRotationCharDB.Toggles[34]b.Print("Leg Sweep Queue is now "..(HeroRotationCharDB.Toggles[34]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="paralysis"then HeroRotationCharDB.Toggles[35]=not HeroRotationCharDB.Toggles[35]b.Print("Paralysis Queue is now "..(HeroRotationCharDB.Toggles[35]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="ringofpeace"then HeroRotationCharDB.Toggles[36]=not HeroRotationCharDB.Toggles[36]b.Print("Ring of Peace Queue is now "..(HeroRotationCharDB.Toggles[36]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="bonedust"then HeroRotationCharDB.Toggles[37]=not HeroRotationCharDB.Toggles[37]b.Print("Bone Dust Brew Queue is now "..(HeroRotationCharDB.Toggles[37]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="cancelfof"then HeroRotationCharDB.Toggles[38]=not HeroRotationCharDB.Toggles[38]b.Print("Cancelling of Fists of Fury is now "..(HeroRotationCharDB.Toggles[38]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="holdtod"then HeroRotationCharDB.Toggles[39]=not HeroRotationCharDB.Toggles[39]b.Print("Touch of Death is now "..(HeroRotationCharDB.Toggles[39]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdmovement"then HeroRotationCharDB.Toggles[40]=not HeroRotationCharDB.Toggles[40]b.Print("Fel Rush and Vengeful Retreat are now "..(HeroRotationCharDB.Toggles[40]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="imprison"then HeroRotationCharDB.Toggles[41]=not HeroRotationCharDB.Toggles[41]b.Print("Imprison Queue is now "..(HeroRotationCharDB.Toggles[41]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdimmolation"then HeroRotationCharDB.Toggles[42]=not HeroRotationCharDB.Toggles[42]b.Print("Immolation Aura is now "..(HeroRotationCharDB.Toggles[42]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdfelblade"then HeroRotationCharDB.Toggles[43]=not HeroRotationCharDB.Toggles[43]b.Print("Fel Blade is now "..(HeroRotationCharDB.Toggles[43]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="consumemagic"then HeroRotationCharDB.Toggles[44]=not HeroRotationCharDB.Toggles[44]b.Print("Consume Magic is now "..(HeroRotationCharDB.Toggles[44]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="feleruption"then HeroRotationCharDB.Toggles[45]=not HeroRotationCharDB.Toggles[45]b.Print("Fel Eruption Queue is now "..(HeroRotationCharDB.Toggles[45]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="chaosnova"then HeroRotationCharDB.Toggles[46]=not HeroRotationCharDB.Toggles[46]b.Print("Chaos Nova Queue is now "..(HeroRotationCharDB.Toggles[46]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdeyebeam"then HeroRotationCharDB.Toggles[47]=not HeroRotationCharDB.Toggles[47]b.Print("Eye Beam is now "..(HeroRotationCharDB.Toggles[47]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="felrush"then HeroRotationCharDB.Toggles[48]=not HeroRotationCharDB.Toggles[48]b.Print("Fel Rush Queue is now "..(HeroRotationCharDB.Toggles[48]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="darkness"then HeroRotationCharDB.Toggles[49]=not HeroRotationCharDB.Toggles[49]b.Print("Darkness Queue is now "..(HeroRotationCharDB.Toggles[49]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="gouge"then HeroRotationCharDB.Toggles[50]=not HeroRotationCharDB.Toggles[50]b.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[50]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="bladerushmelee"then HeroRotationCharDB.Toggles[51]=not HeroRotationCharDB.Toggles[51]b.Print("Blade Rush Melee Only is now "..(HeroRotationCharDB.Toggles[51]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="holdkillingspree"then HeroRotationCharDB.Toggles[52]=not HeroRotationCharDB.Toggles[52]b.Print("Killing Spree is now "..(HeroRotationCharDB.Toggles[52]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="grapplinghook"then HeroRotationCharDB.Toggles[53]=not HeroRotationCharDB.Toggles[53]b.Print("Grappling Hook Queue is now "..(HeroRotationCharDB.Toggles[53]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdshiv"then HeroRotationCharDB.Toggles[54]=not HeroRotationCharDB.Toggles[54]b.Print("Shiv dispell is now "..(HeroRotationCharDB.Toggles[54]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="forceaoe"then HeroRotationCharDB.Toggles[60]=not HeroRotationCharDB.Toggles[60]b.Print("ForceAoE is now "..(HeroRotationCharDB.Toggles[60]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="massdispel"then HeroRotationCharDB.Toggles[61]=not HeroRotationCharDB.Toggles[61]b.Print("Mass Dispel Queue is now "..(HeroRotationCharDB.Toggles[61]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="shackleundead"then HeroRotationCharDB.Toggles[62]=not HeroRotationCharDB.Toggles[62]b.Print("Shackle Undead Queue is now "..(HeroRotationCharDB.Toggles[62]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="startweave"then HeroRotationCharDB.Toggles[70]=not HeroRotationCharDB.Toggles[70]b.Print("Weaving is now "..(HeroRotationCharDB.Toggles[70]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="holdincarn"then HeroRotationCharDB.Toggles[71]=not HeroRotationCharDB.Toggles[71]b.Print("Incarn/Berserk is now "..(HeroRotationCharDB.Toggles[71]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="autotaunt"then HeroRotationCharDB.Toggles[72]=not HeroRotationCharDB.Toggles[72]b.Print("AutoTaunt is now "..(HeroRotationCharDB.Toggles[72]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="vortex"then HeroRotationCharDB.Toggles[73]=not HeroRotationCharDB.Toggles[73]b.Print("Ursol's Vortex Queue is now "..(HeroRotationCharDB.Toggles[73]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="typhoon"then HeroRotationCharDB.Toggles[74]=not HeroRotationCharDB.Toggles[74]b.Print("Typhoon Queue is now "..(HeroRotationCharDB.Toggles[74]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="stampedingroar"then HeroRotationCharDB.Toggles[75]=not HeroRotationCharDB.Toggles[75]b.Print("Stampeding Roar Queue is now "..(HeroRotationCharDB.Toggles[75]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="incapacitatingroar"then HeroRotationCharDB.Toggles[76]=not HeroRotationCharDB.Toggles[76]b.Print("Incapacitating Roar Queue is now "..(HeroRotationCharDB.Toggles[76]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="mightybash"then HeroRotationCharDB.Toggles[77]=not HeroRotationCharDB.Toggles[77]b.Print("Mighty Bash Queue is now "..(HeroRotationCharDB.Toggles[77]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="zoomzoom"then HeroRotationCharDB.Toggles[78]=not HeroRotationCharDB.Toggles[78]b.Print("ZoomZoom Mode is now "..(HeroRotationCharDB.Toggles[78]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a5=="entanglingroot"then HeroRotationCharDB.Toggles[79]=not HeroRotationCharDB.Toggles[79]b.Print("Entangling Root Queue is now "..(HeroRotationCharDB.Toggles[79]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="gorefiend"then HeroRotationCharDB.Toggles[80]=not HeroRotationCharDB.Toggles[80]b.Print("Gorefiend's Grasp Queue is now "..(HeroRotationCharDB.Toggles[80]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="controlundead"then HeroRotationCharDB.Toggles[81]=not HeroRotationCharDB.Toggles[81]b.Print("Control Undead Queue is now "..(HeroRotationCharDB.Toggles[81]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holddancingruneweapon"then HeroRotationCharDB.Toggles[82]=not HeroRotationCharDB.Toggles[82]b.Print("Dancing Rune Weapon is now "..(HeroRotationCharDB.Toggles[82]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holddeathanddecay"then HeroRotationCharDB.Toggles[83]=not HeroRotationCharDB.Toggles[83]b.Print("Death and Decay is now "..(HeroRotationCharDB.Toggles[83]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdearthelemental"then HeroRotationCharDB.Toggles[90]=not HeroRotationCharDB.Toggles[90]b.Print("Earth Elemental is now "..(HeroRotationCharDB.Toggles[90]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="capacitortotem"then HeroRotationCharDB.Toggles[91]=not HeroRotationCharDB.Toggles[91]b.Print("Capacitor Totem Queue is now "..(HeroRotationCharDB.Toggles[91]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="healingstreamtotem"then HeroRotationCharDB.Toggles[92]=not HeroRotationCharDB.Toggles[92]b.Print("Healing Stream Totem Queue is now "..(HeroRotationCharDB.Toggles[92]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="tremortotem"then HeroRotationCharDB.Toggles[93]=not HeroRotationCharDB.Toggles[93]b.Print("Tremor Stream Totem Queue is now "..(HeroRotationCharDB.Toggles[93]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="windrushtotem"then HeroRotationCharDB.Toggles[94]=not HeroRotationCharDB.Toggles[94]b.Print("Wind Rush Totem Queue is now "..(HeroRotationCharDB.Toggles[94]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="hex"then HeroRotationCharDB.Toggles[95]=not HeroRotationCharDB.Toggles[95]b.Print("Hex Queue is now "..(HeroRotationCharDB.Toggles[95]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="faetransfusion"then HeroRotationCharDB.Toggles[96]=not HeroRotationCharDB.Toggles[96]b.Print("Fae Transfusion Queue is now "..(HeroRotationCharDB.Toggles[96]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="usepurge"then HeroRotationCharDB.Toggles[97]=not HeroRotationCharDB.Toggles[97]b.Print("Purge Use is now "..(HeroRotationCharDB.Toggles[97]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdfrozenorb"then HeroRotationCharDB.Toggles[100]=not HeroRotationCharDB.Toggles[100]b.Print("Frozen Orb is now "..(HeroRotationCharDB.Toggles[100]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="holdfrostwyrm"then HeroRotationCharDB.Toggles[110]=not HeroRotationCharDB.Toggles[110]b.Print("Frostwyrm's Fury is now "..(HeroRotationCharDB.Toggles[110]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="bindingshot"then HeroRotationCharDB.Toggles[120]=not HeroRotationCharDB.Toggles[120]b.Print("Binding Shot Queue is now "..(HeroRotationCharDB.Toggles[120]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="freezingtrap"then HeroRotationCharDB.Toggles[121]=not HeroRotationCharDB.Toggles[121]b.Print("Freezing Trap Queue is now "..(HeroRotationCharDB.Toggles[121]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="intimidation"then HeroRotationCharDB.Toggles[122]=not HeroRotationCharDB.Toggles[122]b.Print("Intimidation Queue is now "..(HeroRotationCharDB.Toggles[122]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="flare"then HeroRotationCharDB.Toggles[123]=not HeroRotationCharDB.Toggles[123]b.Print("Flare Queue is now "..(HeroRotationCharDB.Toggles[123]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="tartrap"then HeroRotationCharDB.Toggles[124]=not HeroRotationCharDB.Toggles[124]b.Print("Tar Trap Queue is now "..(HeroRotationCharDB.Toggles[124]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdmisdirection"then HeroRotationCharDB.Toggles[125]=not HeroRotationCharDB.Toggles[125]b.Print("Misdirection is now "..(HeroRotationCharDB.Toggles[125]and"|cffff0000disabled|r."or"|cff00ff00enabled|r. (Requires AutoMisdirect checked in settings)"))elseif a5=="huntersmark"then HeroRotationCharDB.Toggles[140]=not HeroRotationCharDB.Toggles[140]b.Print("Hunter's Mark Queue is now "..(HeroRotationCharDB.Toggles[140]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a5=="holdbombs"then HeroRotationCharDB.Toggles[141]=not HeroRotationCharDB.Toggles[141]b.Print("Wildfire Bombs are now "..(HeroRotationCharDB.Toggles[141]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a5=="shadowfury"then HeroRotationCharDB.Toggles[150]=not HeroRotationCharDB.Toggles[150]b.Print("Shadowfury Queue is now "..(HeroRotationCharDB.Toggles[150]and"|cff00ff00on|r."or"|cffff0000off|r."))else b.Print("Invalid arguments.")b.Print("Type |cff8888ff/hr help|r for more infos.")end end;SLASH_HEROROTATION1="/hr"SLASH_HEROROTATION2="/ar"SlashCmdList["HEROROTATION"]=b.CmdHandler;function b.CDsON()return HeroRotationCharDB.Toggles[1]end;local a8,a9;if m then local aa,ab={},{}o=true;DBM_TIMER_PULL=_G.DBM_CORE_L.TIMER_PULL;m:RegisterCallback("DBM_TimerStart",function(x,ac,ad,ae,af,ag,ah,ai)local aj;if type(ae)=="string"then aj=toNum[ae:match("%d+")]else aj=ae end;if not aa[ac]then aa[ac]={text=ad,start=GetTime(),duration=aj}else aa[ac].text=ad;aa[ac].start=GetTime()aa[ac].duration=aj end;if ah then aa[ac].spellid=ah;ab[ah]=aa[ac]end end)m:RegisterCallback("DBM_TimerStop",function(x,ac)if aa[ac]and aa[ac].spellid then ab[aa[ac].spellid]=nil end;aa[ac]=nil end)a8=function(ad)if ad then for ac,ak in pairs(aa)do if ak.text:match(ad)then local al=ak.start+ak.duration;local am=al-GetTime()if am<0 then am=0 end;return am,al end end else error("Bad argument 'text' (nil value) for function DBM_GetTimeRemaining")end;return 0,0 end;a9=function(an)if ab[an]then local al=ab[an].start+ab[an].duration;local am=al-GetTime()if am<0 then am=0 end;return am,al end;return 0,0 end;hooksecurefunc(m,"StartCombat",function(m,ao,ap,aq)if aq~="TIMER_RECOVERY"then local ar=ao.localization.general.name;local as=ao.id;if ar then p[ar]=ao;p[ar].AddonBaseName="DBM"end;if as then p[as]=ao;p[as].AddonBaseName="DBM"end end end)hooksecurefunc(m,"EndCombat",function(m,ao)local ar=ao.localization.general.name or""local as=ao.id or""p[ar]=nil;p[as]=nil end)end;function b.BossMods:HasAnyAddon()return o or HasBigWigs end;function b.BossMods:GetPullTimer()local am,al=0,0;if self:HasAnyAddon()then local at,au=0,0;local av,aw=0,0;if o then at,au=a8(DBM_TIMER_PULL)end;if self.HasBigWigs then av,aw=BigWigs_GetTimeRemaining(BIGWIGS_TIMER_PULL)end;if at>av then am=at;al=au else am=av;al=aw end end;return am end;do local ax={[120651]=true}function b.AoEON()return HeroRotationCharDB.Toggles[2]and not ax[h:NPCID()]end end;function b.BossMods:GetTimer(ay)local am,al=0,0;if ay and self:HasAnyAddon()then local at,au=0,0;local av,aw=0,0;if o then if type(ay)=="string"then at,au=a8(ay)else at,au=a9(ay)end end;if self.HasBigWigs then av,aw=BigWigs_GetTimeRemaining(ay)end;if at>av then am=at;al=au else am=av;al=aw end end;return am,al end;function b.BossMods:IsEngage(ay)if self:HasAnyAddon()then local az=ay and ay;for aA,aB in pairs(p)do if(not az or aA:match(az))and(aB.AddonBaseName=="DBM"and aB.inCombat or aB.AddonBaseName=="BigWigs"and aB.isEngaged)then return true,aA end end end end;function b.ON()return HeroRotationCharDB.Toggles[3]end;function b.Locked()return HeroRotationDB.Locked end