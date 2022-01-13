local a,b=...local c=HeroLib;local d,e=HeroCache,c.Utils;local f=c.Unit;local g=f.Player;local h=f.Target;local i=c.Spell;local j=c.Item;local k=math.min;local print=print;local select=select;local l=string.lower;local strsplit=strsplit;local tostring=tostring;HeroRotation=b;function b.Print(...)print("[|cFFFF6600Hero Rotation|r]",...)end;b.APLs={}b.APLInits={}function b.SetAPL(m,n,o)b.APLs[m]=n;b.APLInits[m]=o end;function b.GetTexture(p)local q=p.SpellID;if q then local r=d.Persistent.Texture.Spell;if not r[q]then if q>=999900 then r[q]="Interface\\Addons\\HeroRotation\\Textures\\"..tostring(q)elseif p.TextureSpellID then r[q]=GetSpellTexture(p.TextureSpellID)else r[q]=GetSpellTexture(q)end end;return r[q]end;local s=p.ItemID;if s then local r=d.Persistent.Texture.Item;if not r[s]then local t,t,t,t,t,t,t,t,t,u=GetItemInfo(s)r[s]=u end;return r[s]end end;local v=i(61304)local w,x,y;local function z(p,A,B)local C,D;local E=GetTime()if g:IsCasting()or g:IsChanneling()then C=g:CastStart()D=g:CastDuration()else C,D=v:CooldownInfo()end;if w~=p then w=p;x=E;y=0 end;if A then local F;if B then F=B else F=g.TimeToXResourceMap[p:CostInfo(nil,"type")](p:Cost())end;if F and F>0 then if F>C+D-E then local G=E-x+F;if y==0 and G>0.25 or y>G or G-y>0.5 then y=G end;C=x;D=y end end end;if C+D<E then C=0;D=0;w=nil end;b.MainIconFrame:SetCooldown(C,D)end;b.CastOffGCDOffset=1;function b.Cast(p,H,I,J,B)local K=b.GetTexture(p)local L=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(K)if H or I=="Cooldown"then if b.CastOffGCDOffset==1 or b.CastOffGCDOffset==2 and b.SmallIconFrame:GetIcon(1)~=K then b.SmallIconFrame:ChangeIcon(b.CastOffGCDOffset,K,L,J)b.CastOffGCDOffset=b.CastOffGCDOffset+1;p.LastDisplayTime=GetTime()return false end elseif I=="Suggested"then b.CastSuggested(p,J)elseif I=="SuggestedRight"then b.CastRightSuggested(p,J)else local M=999910;local N=p.SpellID==M or p:IsUsable()local O=I=="Pooling"local J=J or false;b.MainIconFrame:ChangeIcon(K,L,N,J)z(p,O,B)p.LastDisplayTime=GetTime()return true end;return nil end;function b.CastAnnotated(p,H,P)local Q=b.Cast(p,H)if not H then b.MainIconFrame:OverlayText(P)end;return Q end;function b.CastPooling(p,B,J)return b.Cast(p,false,"Pooling",J,B)end;local R,S,T,U;b.MaxQueuedCasts=3;local function V(...)R={...}S=k(#R,b.MaxQueuedCasts)T={}U={}for W=1,S do T[W]=b.GetTexture(R[W])R[W].LastDisplayTime=GetTime()U[W]=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(T[W])end;b.MainIconFrame:ChangeIcon(T[1],U[1],R[1]:IsUsable())b.MainIconFrame:SetupParts(T,U)end;function b.CastQueue(...)V(...)z()return"Should Return"end;function b.CastQueuePooling(B,...)V(...)if B then z(R[1],true,B)else local X,Y=nil,0;for W=1,#R do if R[W]:Cost()>Y then Y=R[W]:Cost()X=R[W]end end;z(X,true)end;return"Should Return"end;b.CastLeftOffset=1;function b.CastLeftCommon(p)local Z=b.GetTexture(p)local L=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(Z)b.LeftIconFrame:ChangeIcon(Z,L)b.CastLeftOffset=b.CastLeftOffset+1;p.LastDisplayTime=GetTime()end;function b.CastLeft(p)if b.CastLeftOffset==1 then b.CastLeftCommon(p)end;return false end;function b.CastLeftNameplate(_,p)if b.CastLeftOffset==1 and b.Nameplate.AddIcon(_,p)then b.CastLeftCommon(p)end;return false end;b.CastSuggestedOffset=1;function b.CastSuggested(p,J)if b.CastSuggestedOffset==1 then local Z=b.GetTexture(p)local L=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(Z)b.SuggestedIconFrame:ChangeIcon(Z,L,J)b.CastSuggestedOffset=b.CastSuggestedOffset+1;p.LastDisplayTime=GetTime()end;return false end;b.CastRightSuggestedOffset=1;function b.CastRightSuggested(p,J)if b.CastRightSuggestedOffset==1 then local Z=b.GetTexture(p)local L=not b.GUISettings.General.HideKeyBinds and c.Action.TextureHotKey(Z)b.RightSuggestedIconFrame:ChangeIcon(Z,L,J)b.CastRightSuggestedOffset=b.CastRightSuggestedOffset+1;p.LastDisplayTime=GetTime()end;return false end;function b.CmdHandler(a0)local a1,a2,a3=strsplit(" ",l(a0))if a1=="cds"then HeroRotationCharDB.Toggles[1]=not HeroRotationCharDB.Toggles[1]b.ToggleIconFrame:UpdateButtonText(1)b.Print("CDs are now "..(HeroRotationCharDB.Toggles[1]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="aoe"then HeroRotationCharDB.Toggles[2]=not HeroRotationCharDB.Toggles[2]b.ToggleIconFrame:UpdateButtonText(2)b.Print("AoE is now "..(HeroRotationCharDB.Toggles[2]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="toggle"then HeroRotationCharDB.Toggles[3]=not HeroRotationCharDB.Toggles[3]b.ToggleIconFrame:UpdateButtonText(3)b.Print("HeroRotation is now "..(HeroRotationCharDB.Toggles[3]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="covenants"then HeroRotationCharDB.Toggles[4]=not HeroRotationCharDB.Toggles[4]b.ToggleIconFrame:UpdateButtonText(4)b.Print("Covenants are now "..(HeroRotationCharDB.Toggles[4]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="smallcds"then HeroRotationCharDB.Toggles[5]=not HeroRotationCharDB.Toggles[5]b.ToggleIconFrame:UpdateButtonText(5)b.Print("Small Cooldowns are now "..(HeroRotationCharDB.Toggles[5]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="opener"then HeroRotationCharDB.Toggles[6]=not HeroRotationCharDB.Toggles[6]b.ToggleIconFrame:UpdateButtonText(6)b.Print("Opener is now "..(HeroRotationCharDB.Toggles[6]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="unlock"then b.MainFrame:Unlock()b.Print("HeroRotation UI is now |cff00ff00unlocked|r.")elseif a1=="lock"then b.MainFrame:Lock()b.Print("HeroRotation UI is now |cffff0000locked|r.")elseif a1=="scale"then if a2 and a3 then a3=tonumber(a3)if a3 and type(a3)=="number"and a3>0 and a3<=10 then if a2=="ui"then b.MainFrame:ResizeUI(a3)elseif a2=="buttons"then b.MainFrame:ResizeButtons(a3)elseif a2=="all"then b.MainFrame:ResizeUI(a3)b.MainFrame:ResizeButtons(a3)else b.Print("Invalid |cff88ff88[Type]|r for Scale.")b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")b.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")end else b.Print("Invalid |cffff8888[Size]|r for Scale.")b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")b.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")end else b.Print("Invalid arguments for Scale.")b.Print("Should be |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r.")b.Print("Type accepted are |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r.")b.Print("Size accepted are |cffff8888number > 0 and <= 10|r.")end elseif a1=="resetbuttons"then b.ToggleIconFrame:ResetAnchor()elseif a1=="help"then b.Print("|cffffff00--[Toggles]--|r")b.Print("  On/Off: |cff8888ff/hr toggle|r")b.Print("  CDs: |cff8888ff/hr cds|r")b.Print("  AoE: |cff8888ff/hr aoe|r")b.Print("|cffffff00--[User Interface]--|r")b.Print("  UI Lock: |cff8888ff/hr lock|r")b.Print("  UI Unlock: |cff8888ff/hr unlock|r")b.Print("  UI Scale: |cff8888ff/hr scale|r |cff88ff88[Type]|r |cffff8888[Size]|r")b.Print("    [Type]: |cff88ff88ui|r, |cff88ff88buttons|r, |cff88ff88all|r")b.Print("    [Size]: |cffff8888number > 0 and <= 10|r")b.Print("  Button Anchor Reset : |cff8888ff/hr resetbuttons|r")elseif a1=="holdaotd"then HeroRotationCharDB.Toggles[10]=not HeroRotationCharDB.Toggles[10]b.Print("Army of the Dead is now "..(HeroRotationCharDB.Toggles[10]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="holdsacpac"then HeroRotationCharDB.Toggles[11]=not HeroRotationCharDB.Toggles[11]b.Print("Sacrifical Pact is now "..(HeroRotationCharDB.Toggles[11]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="stopautoswap"then HeroRotationCharDB.Toggles[12]=not HeroRotationCharDB.Toggles[12]b.Print("Auto Swap is now "..(HeroRotationCharDB.Toggles[12]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="amz"then HeroRotationCharDB.Toggles[13]=not HeroRotationCharDB.Toggles[13]b.Print("Anti-Magic Zone Queue is now "..(HeroRotationCharDB.Toggles[13]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="deathgrip"then HeroRotationCharDB.Toggles[14]=not HeroRotationCharDB.Toggles[14]b.Print("Death Grip Queue is now "..(HeroRotationCharDB.Toggles[14]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="holdpot"then HeroRotationCharDB.Toggles[15]=not HeroRotationCharDB.Toggles[15]b.Print("DPS Pots are now "..(HeroRotationCharDB.Toggles[15]and"|cffff0000disabled|r."or"|cff00ff00enabled|r. Requires Show:Potions checked in settings"))elseif a1=="asphyxiate"then HeroRotationCharDB.Toggles[16]=not HeroRotationCharDB.Toggles[16]b.Print("Asphyxiate Queue is now "..(HeroRotationCharDB.Toggles[16]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="funnelaoe"then HeroRotationCharDB.Toggles[20]=not HeroRotationCharDB.Toggles[20]b.Print("Funnel AoE is now "..(HeroRotationCharDB.Toggles[20]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="holdvanish"then HeroRotationCharDB.Toggles[21]=not HeroRotationCharDB.Toggles[21]b.Print("Vanish is now "..(HeroRotationCharDB.Toggles[21]and"|cffff0000disabled|r."or"|cff00ff00enabled|r. Requires Use Vanish checked in settings"))elseif a1=="cheapshot"then HeroRotationCharDB.Toggles[22]=not HeroRotationCharDB.Toggles[22]b.Print("Cheap Shot Queue is now "..(HeroRotationCharDB.Toggles[22]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="kidney"then HeroRotationCharDB.Toggles[23]=not HeroRotationCharDB.Toggles[23]b.Print("Kidney Shot Queue is now "..(HeroRotationCharDB.Toggles[23]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="blind"then HeroRotationCharDB.Toggles[24]=not HeroRotationCharDB.Toggles[24]b.Print("Blind Queue is now "..(HeroRotationCharDB.Toggles[24]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="sap"then HeroRotationCharDB.Toggles[25]=not HeroRotationCharDB.Toggles[25]b.Print("Sap Queue is now "..(HeroRotationCharDB.Toggles[25]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="shurikentornado"then HeroRotationCharDB.Toggles[26]=not HeroRotationCharDB.Toggles[26]b.Print("Shuriken Tornado Queue is now "..(HeroRotationCharDB.Toggles[26]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="feint"then HeroRotationCharDB.Toggles[27]=not HeroRotationCharDB.Toggles[27]b.Print("Feint Queue is now "..(HeroRotationCharDB.Toggles[27]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="flagellation"then HeroRotationCharDB.Toggles[28]=not HeroRotationCharDB.Toggles[28]b.Print("Flagellation Queue is now "..(HeroRotationCharDB.Toggles[28]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="holdshurikentornado"then HeroRotationCharDB.Toggles[29]=not HeroRotationCharDB.Toggles[29]b.Print("Shuriken Tornado is now "..(HeroRotationCharDB.Toggles[29]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="racial"then HeroRotationCharDB.Toggles[30]=not HeroRotationCharDB.Toggles[30]b.Print("Racial Ability Queue is now "..(HeroRotationCharDB.Toggles[30]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="holdwdp"then HeroRotationCharDB.Toggles[31]=not HeroRotationCharDB.Toggles[31]b.Print("Whirling Dragon Punch is now "..(HeroRotationCharDB.Toggles[31]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="holdfsk"then HeroRotationCharDB.Toggles[32]=not HeroRotationCharDB.Toggles[32]b.Print("Flying Serpant Kick is now "..(HeroRotationCharDB.Toggles[32]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="holdfof"then HeroRotationCharDB.Toggles[33]=not HeroRotationCharDB.Toggles[33]b.Print("Fist of Fury is now "..(HeroRotationCharDB.Toggles[33]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="legsweep"then HeroRotationCharDB.Toggles[34]=not HeroRotationCharDB.Toggles[34]b.Print("Leg Sweep Queue is now "..(HeroRotationCharDB.Toggles[34]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="paralysis"then HeroRotationCharDB.Toggles[35]=not HeroRotationCharDB.Toggles[35]b.Print("Paralysis Queue is now "..(HeroRotationCharDB.Toggles[35]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="ringofpeace"then HeroRotationCharDB.Toggles[36]=not HeroRotationCharDB.Toggles[36]b.Print("Ring of Peace Queue is now "..(HeroRotationCharDB.Toggles[36]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="bonedust"then HeroRotationCharDB.Toggles[37]=not HeroRotationCharDB.Toggles[37]b.Print("Bone Dust Brew Queue is now "..(HeroRotationCharDB.Toggles[37]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="cancelfof"then HeroRotationCharDB.Toggles[38]=not HeroRotationCharDB.Toggles[38]b.Print("Cancelling of Fists of Fury is now "..(HeroRotationCharDB.Toggles[38]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="holdmovement"then HeroRotationCharDB.Toggles[40]=not HeroRotationCharDB.Toggles[40]b.Print("Fel Rush and Vengeful Retreat are now "..(HeroRotationCharDB.Toggles[40]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="imprison"then HeroRotationCharDB.Toggles[41]=not HeroRotationCharDB.Toggles[41]b.Print("Imprison Queue is now "..(HeroRotationCharDB.Toggles[41]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="holdimmolation"then HeroRotationCharDB.Toggles[42]=not HeroRotationCharDB.Toggles[42]b.Print("Immolation Aura is now "..(HeroRotationCharDB.Toggles[42]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="holdfelblade"then HeroRotationCharDB.Toggles[43]=not HeroRotationCharDB.Toggles[43]b.Print("Fel Blade is now "..(HeroRotationCharDB.Toggles[43]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="consumemagic"then HeroRotationCharDB.Toggles[44]=not HeroRotationCharDB.Toggles[44]b.Print("Consume Magic is now "..(HeroRotationCharDB.Toggles[44]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="gouge"then HeroRotationCharDB.Toggles[50]=not HeroRotationCharDB.Toggles[50]b.Print("Gouge Queue is now "..(HeroRotationCharDB.Toggles[50]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="bladerushmelee"then HeroRotationCharDB.Toggles[51]=not HeroRotationCharDB.Toggles[51]b.Print("Blade Rush Melee Only is now "..(HeroRotationCharDB.Toggles[51]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="holdkillingspree"then HeroRotationCharDB.Toggles[52]=not HeroRotationCharDB.Toggles[52]b.Print("Killing Spree is now "..(HeroRotationCharDB.Toggles[52]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="grapplinghook"then HeroRotationCharDB.Toggles[53]=not HeroRotationCharDB.Toggles[53]b.Print("Grappling Hook Queue is now "..(HeroRotationCharDB.Toggles[53]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="forceaoe"then HeroRotationCharDB.Toggles[60]=not HeroRotationCharDB.Toggles[60]b.Print("ForceAoE is now "..(HeroRotationCharDB.Toggles[60]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="massdispel"then HeroRotationCharDB.Toggles[61]=not HeroRotationCharDB.Toggles[61]b.Print("Mass Dispel Queue is now "..(HeroRotationCharDB.Toggles[61]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="startweave"then HeroRotationCharDB.Toggles[70]=not HeroRotationCharDB.Toggles[70]b.Print("Weaving is now "..(HeroRotationCharDB.Toggles[70]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="holdincarn"then HeroRotationCharDB.Toggles[71]=not HeroRotationCharDB.Toggles[71]b.Print("Incarn/Berserk is now "..(HeroRotationCharDB.Toggles[71]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))elseif a1=="AutoTaunt"then HeroRotationCharDB.Toggles[72]=not HeroRotationCharDB.Toggles[72]b.Print("AutoTaunt is now "..(HeroRotationCharDB.Toggles[72]and"|cff00ff00enabled|r."or"|cffff0000disabled|r."))elseif a1=="vortex"then HeroRotationCharDB.Toggles[73]=not HeroRotationCharDB.Toggles[73]b.Print("Ursol's Vortex is now "..(HeroRotationCharDB.Toggles[73]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="typhoon"then HeroRotationCharDB.Toggles[74]=not HeroRotationCharDB.Toggles[74]b.Print("Typhoon Queue is now "..(HeroRotationCharDB.Toggles[74]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="stampedingroar"then HeroRotationCharDB.Toggles[75]=not HeroRotationCharDB.Toggles[75]b.Print("Stampeding Roar Queue is now "..(HeroRotationCharDB.Toggles[75]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="incapacitatingroar"then HeroRotationCharDB.Toggles[76]=not HeroRotationCharDB.Toggles[76]b.Print("Incapacitating Roar Queue is now "..(HeroRotationCharDB.Toggles[76]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="mightybash"then HeroRotationCharDB.Toggles[77]=not HeroRotationCharDB.Toggles[77]b.Print("Mighty Bash Queue is now "..(HeroRotationCharDB.Toggles[77]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="gorefiend"then HeroRotationCharDB.Toggles[80]=not HeroRotationCharDB.Toggles[80]b.Print("Gorefiend's Grasp Queue is now "..(HeroRotationCharDB.Toggles[80]and"|cff00ff00on|r."or"|cffff0000off|r."))elseif a1=="holdearthelemental"then HeroRotationCharDB.Toggles[81]=not HeroRotationCharDB.Toggles[81]b.Print("Earth Elemental is now "..(HeroRotationCharDB.Toggles[81]and"|cffff0000disabled|r."or"|cff00ff00enabled|r."))else b.Print("Invalid arguments.")b.Print("Type |cff8888ff/hr help|r for more infos.")end end;SLASH_HEROROTATION1="/hr"SLASH_HEROROTATION2="/ar"SlashCmdList["HEROROTATION"]=b.CmdHandler;function b.CDsON()return HeroRotationCharDB.Toggles[1]end;do local a4={[120651]=true}function b.AoEON()return HeroRotationCharDB.Toggles[2]and not a4[h:NPCID()]end end;function b.ON()return HeroRotationCharDB.Toggles[3]end;function b.Locked()return HeroRotationDB.Locked end