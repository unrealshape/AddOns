local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=l.Cast;local p=l.CastSuggested;local q=l.CastAnnotated;local r=l.Commons.Everyone.num;local s=l.Commons.Everyone.bool;local t=l.Commons.DemonHunter;local GetTime=GetTime;local u=math.max;local v=math.min;local w=table.insert;local x=j.DemonHunter.Vengeance;local y=k.DemonHunter.Vengeance;local z={}local A=l.Commons.Everyone;local B={General=l.GUISettings.General,Commons=l.GUISettings.APL.DemonHunter.Commons,Vengeance=l.GUISettings.APL.DemonHunter.Vengeance}local C,D,E;local F=x.SoulSigils:IsAvailable()and 4 or 3;local G,H;local I;local J;local K;local L;local M,N,O,P,Q,R;local S=11111;local T=11111;local U;local V=0;local W=0;local X;local Y=HeroRotationCharDB.Toggles[167]local Z=HeroRotationCharDB.Toggles[168]local _=HeroRotationCharDB.Toggles[169]local a0=HeroRotationCharDB.Toggles[72]local a1=not HeroRotationCharDB.Toggles[15]local a2=HeroRotationCharDB.Toggles[5]local a3=HeroRotationCharDB.Toggles[3]local a4=HeroRotationCharDB.Toggles[46]local a5=HeroRotationCharDB.Toggles[184]local a6=HeroRotationCharDB.Toggles[185]local a7=HeroRotationCharDB.Toggles[186]local a8=HeroRotationCharDB.Toggles[187]local a9=HeroRotationCharDB.Toggles[188]local aa=HeroRotationCharDB.Toggles[189]local ab=HeroRotationCharDB.Toggles[189]local ac=GetInventoryItemID("player",13)local ad=GetInventoryItemID("player",14)d:RegisterForEvent(function()S=11111;T=11111 end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()F=x.SoulSigils:IsAvailable()and 4 or 3 end,"SPELLS_CHANGED","LEARNED_SPELL_IN_TAB")local function ae()if x.Felblade:TimeSinceLastCast()<g:GCD()or x.InfernalStrike:TimeSinceLastCast()<g:GCD()then G=true;H=true;return end;G=h:IsInMeleeRange(5)H=G or L>0 end;local function af(ag)return ag:DebuffRemains(x.FieryBrandDebuff)end;local function ah(ag)return ag:DebuffUp(x.FieryBrandDebuff)end;local function ai(aj)local ak=0;if aj~=nil then for al,am in pairs(aj)do if not g:IsTanking(am)and am:GUID()~=h:GUID()and am:AffectingCombat()then ak=ak+1 end end end;return ak end;local function an(ag)if not g:IsTanking(ag)and a0 and ag:AffectingCombat()and ag:GUID()==f("mouseover"):GUID()and ag:NPCID()~=118044 then V=1185245;return true elseif not g:IsTanking(ag)and a0 and ag:AffectingCombat()and ag:GUID()==h:GUID()and ag:NPCID()~=118044 then W=185245;return true elseif not g:IsTanking(ag)and a0 and ag:AffectingCombat()and ag:NPCID()~=118044 then return true end end;local function ao()V=999 end;local function ap()if x.SigilofFlame:IsCastable()then if o(x.SigilofFlame,nil,nil,not h:IsInRange(30))then W=389810;return"sigil_of_flame precombat 2"end end;if x.Felblade:IsCastable()and not G then if o(x.Felblade,nil,nil,not h:IsInRange(15))then W=232893;return"felblade precombat 5"end end;if x.ImmolationAura:IsCastable()then if o(x.ImmolationAura)then W=258920;return"immolation_aura precombat 4"end end;if x.Fracture:IsCastable()and G then if o(x.Fracture)then W=263642;return"fracture precombat 8"end end;if x.Shear:IsCastable()and G then if o(x.Shear)then W=203782;return"shear precombat 10"end end end;local function aq()if x.DemonSpikes:IsCastable()and g:BuffDown(x.DemonSpikesBuff)and g:BuffDown(x.MetamorphosisBuff)and(L==1 and g:BuffDown(x.FieryBrandDebuff)or L>1)then if x.DemonSpikes:ChargesFractional()>1.9 then if o(x.DemonSpikes,nil,nil)then W=203720;return"demon_spikes defensives (Capped)"end elseif I or g:HealthPercentage()<=B.Vengeance.DemonSpikesHealthThreshold then if o(x.DemonSpikes,nil,nil)then W=203720;return"demon_spikes defensives (Danger)"end end end;if x.Metamorphosis:IsCastable()and g:HealthPercentage()<=B.Vengeance.MetamorphosisHealthThreshold and(g:BuffDown(x.MetamorphosisBuff)or h:TimeToDie()<15)then if o(x.Metamorphosis,nil,nil)then W=187827;return"metamorphosis defensives"end end;if x.FieryBrand:IsCastable()and(I or g:HealthPercentage()<=B.Vengeance.FieryBrandHealthThreshold)then if o(x.FieryBrand,nil,nil,not h:IsSpellInRange(x.FieryBrand))then W=204021;return"fiery_brand defensives"end end end;local function ar()if x.SpiritBomb:IsReady()and g:HealthPercentage()<B.Vengeance.Spiritbomb then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then W=247454;return"spirit_bomb prio HEAL"end end;if not a8 and x.FieryBrand:IsCastable()and(x.FieryBrandDebuff:AuraActiveCount()==0 and(x.SigilofFlame:CooldownRemains()<=x.FieryBrand:ExecuteTime()+g:GCDRemains()or x.SoulCarver:CooldownRemains()<x.FieryBrand:ExecuteTime()+g:GCDRemains()or x.FelDevastation:CooldownRemains()<x.FieryBrand:ExecuteTime()+g:GCDRemains())or x.DowninFlames:IsAvailable()and x.FieryBrand:FullRechargeTime()<x.FieryBrand:ExecuteTime()+g:GCDRemains())then if o(x.FieryBrand,nil,nil,not h:IsSpellInRange(x.FieryBrand))then W=204021;return"fiery_brand maintenance 2"end end;if x.SigilofFlame:IsCastable()and(x.AscendingFlame:IsAvailable()or x.SigilofFlameDebuff:AuraActiveCount()==0)then if o(x.SigilofFlame,nil,nil,not h:IsInRange(30))then W=389810;return"sigil_of_flame maintenance 4"end end;if x.ImmolationAura:IsCastable()then if o(x.ImmolationAura)then W=258920;return"immolation_aura maintenance 6"end end;if x.BulkExtraction:IsCastable()and(5-C<=L and C<=2)then if o(x.BulkExtraction,nil,nil,not h:IsInMeleeRange(8))then W=320341;return"bulk_extraction maintenance 8"end end;if VarNoMaintCleave and not R then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and R then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then W=247454;return"spirit_bomb maintenance 10"end end;if x.Felblade:IsReady()and((not x.SpiritBomb:IsAvailable()or L==1)and g:FuryDeficit()>=40 or x.FelDevastation:CooldownRemains()<=x.Felblade:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Felblade,nil,nil,not h:IsSpellInRange(x.Felblade))then W=232893;return"felblade maintenance 12"end end;if x.Fracture:IsCastable()and(x.FelDevastation:CooldownRemains()<=x.Fracture:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Fracture,nil,nil,not G)then W=263642;return"fracture maintenance 14"end end;if x.Shear:IsCastable()and(x.FelDevastation:CooldownRemains()<=x.Fracture:ExecuteTime()+g:GCDRemains()and g:Fury()<50)then if o(x.Shear,nil,nil,not G)then W=203782;return"shear maintenance 16"end end;if g:FuryDeficit()<=30 and L>1 and D>=4 and C<4 then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and(g:FuryDeficit()<=30 and L>1 and C>=4)then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then W=247454;return"spirit_bomb maintenance 18"end end;if x.SoulCleave:IsReady()and not VarNoMaintCleave and g:FuryDeficit()<=40 then if o(x.SoulCleave,nil,nil,not G)then W=228477;return"soul_cleave maintenance 20"end end end;local function as()if x.ImmolationAura:IsCastable()then if o(x.ImmolationAura)then W=258920;return"immolation_aura fiery_demise 2"end end;if x.SigilofFlame:IsCastable()and(x.AscendingFlame:IsAvailable()or x.SigilofFlameDebuff:AuraActiveCount()==0)then if o(x.SigilofFlame,nil,nil,not h:IsInRange(30))then W=389810;return"sigil_of_flame fiery_demise 4"end end;if x.Felblade:IsReady()and((not x.SpiritBomb:IsAvailable()or x.FelDevastation:CooldownRemains()<=x.Felblade:ExecuteTime()+g:GCDRemains())and g:Fury()<50)then if o(x.Felblade,nil,nil,not h:IsSpellInRange(x.Felblade))then W=232893;return"felblade fiery_demise 6"end end;if x.FelDevastation:IsReady()and not aa then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation fiery_demise 8"end end;if x.SoulCarver:IsCastable()and D<3 then if o(x.SoulCarver,nil,nil,not G)then W=214743;return"soul_carver fiery_demise 10"end end;if x.TheHunt:IsCastable()and n()and not ab then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then W=323639;return"the_hunt fiery_demise 12"end end;if x.ElysianDecree:IsCastable()and x.ElysianDecree:TimeSinceLastCast()>=1.85 and g:Fury()>=40 then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then W=389815;return"elysian_decree fiery_demise 14"end end;if VarNoMaintCleave and not R then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and R then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then W=247454;return"spirit_bomb fiery_demise 16"end end end;local function at()if not a9 and x.SigilofChains:IsCastable()and x.CycleofBinding:IsAvailable()then if o(x.SigilofChains,nil,nil,not h:IsInRange(30))then W=202138;return"sigil_of_chains filler 2"end end;if x.Felblade:IsReady()then if o(x.Felblade,nil,nil,not h:IsSpellInRange(x.Felblade))then W=232893;return"felblade filler 8"end end;if x.Shear:IsCastable()then if o(x.Shear,nil,nil,not G)then W=203782;return"shear filler 10"end end;if x.ThrowGlaive:IsCastable()then if o(x.ThrowGlaive,nil,nil,not h:IsSpellInRange(x.ThrowGlaive))then W=204157;return"throw_glaive filler 10"end end end;local function au()if x.TheHunt:IsCastable()and n()and not ab then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then W=323639;return"the_hunt single_target 2"end end;if x.SoulCarver:IsCastable()then if o(x.SoulCarver,nil,nil,not G)then W=214743;return"soul_carver single_target 4"end end;if not aa and x.FelDevastation:IsReady()and(x.CollectiveAnguish:IsAvailable()or x.StoketheFlames:IsAvailable()and x.BurningBlood:IsAvailable())then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation single_target 6"end end;if x.ElysianDecree:IsCastable()then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then W=389815;return"elysian_decree single_target 8"end end;if not aa and x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation single_target 10"end end;if x.SoulCleave:IsReady()and not M then if o(x.SoulCleave,nil,nil,not G)then W=228477;return"soul_cleave single_target 12"end end;if x.Fracture:IsCastable()then if o(x.Fracture,nil,nil,not G)then W=263642;return"fracture single_target 14"end end;if x.Shear:IsCastable()then if o(x.Shear,nil,nil,not G)then W=203782;return"shear single_target 16"end end;local av=at()if av then return av end end;local function aw()if x.TheHunt:IsCastable()and n()and not ab then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then W=323639;return"the_hunt small_aoe 2"end end;if not aa and x.FelDevastation:IsReady()and(x.CollectiveAnguish:IsAvailable()or x.StoketheFlames:IsAvailable()and x.BurningBlood:IsAvailable())then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation small_aoe 4"end end;if x.ElysianDecree:IsCastable()and x.ElysianDecree:TimeSinceLastCast()>=1.85 and(g:Fury()>=40 and(D<=1 or D>=4))then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then W=389815;return"elysian_decree small_aoe 6"end end;if not aa and x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation small_aoe 8"end end;if x.SoulCarver:IsCastable()and D<3 then if o(x.SoulCarver,nil,nil,not G)then W=214743;return"soul_carver small_aoe 10"end end;if x.SoulCleave:IsReady()and((C<=1 or not x.SpiritBomb:IsAvailable())and not M)then if o(x.SoulCleave,nil,nil,not G)then W=228477;return"soul_cleave small_aoe 14"end end;if x.Fracture:IsCastable()then if o(x.Fracture,nil,nil,not G)then W=263642;return"fracture small_aoe 16"end end;local av=at()if av then return av end end;local function ax()if not aa and x.FelDevastation:IsReady()and(x.CollectiveAnguish:IsAvailable()or x.StoketheFlames:IsAvailable())then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation big_aoe 2"end end;if x.TheHunt:IsCastable()and n()and not ab then if o(x.TheHunt,nil,nil,not h:IsInRange(50))then W=323639;return"the_hunt big_aoe 4"end end;if x.ElysianDecree:IsCastable()and x.ElysianDecree:TimeSinceLastCast()>=1.85 and(g:Fury()>=40 and(D<=1 or D>=4))then if o(x.ElysianDecree,nil,nil,not h:IsInRange(30))then W=389815;return"elysian_decree big_aoe 6"end end;if not aa and x.FelDevastation:IsReady()then if o(x.FelDevastation,nil,nil,not h:IsInMeleeRange(20))then W=212084;return"fel_devastation big_aoe 8"end end;if x.SoulCarver:IsCastable()and D<3 then if o(x.SoulCarver,nil,nil,not G)then W=214743;return"soul_carver big_aoe 10"end end;if D>=4 and C<4 then if q(x.Pool,false,"WAIT")then return"Wait for Spirit Bomb"end end;if x.SpiritBomb:IsReady()and C>=4 then if o(x.SpiritBomb,nil,nil,not h:IsInMeleeRange(8))then W=247454;return"spirit_bomb big_aoe 12"end end;if x.SoulCleave:IsReady()and(not x.SpiritBomb:IsAvailable()or not M)then if o(x.SoulCleave,nil,nil,not G)then W=228477;return"soul_cleave big_aoe 14"end end;if x.Fracture:IsCastable()then if o(x.Fracture,nil,nil,not G)then W=263642;return"fracture big_aoe 14"end end;if x.SoulCleave:IsReady()and not M then if o(x.SoulCleave,nil,nil,not G)then W=228477;return"soul_cleave big_aoe 18"end end;local av=at()if av then return av end end;local function ay()end;local function az()Y=HeroRotationCharDB.Toggles[167]Z=HeroRotationCharDB.Toggles[168]a1=not HeroRotationCharDB.Toggles[15]a2=HeroRotationCharDB.Toggles[5]a3=HeroRotationCharDB.Toggles[3]a4=HeroRotationCharDB.Toggles[46]_=HeroRotationCharDB.Toggles[169]a5=HeroRotationCharDB.Toggles[184]a6=HeroRotationCharDB.Toggles[185]a7=HeroRotationCharDB.Toggles[186]a8=HeroRotationCharDB.Toggles[187]a9=HeroRotationCharDB.Toggles[188]aa=HeroRotationCharDB.Toggles[189]ab=HeroRotationCharDB.Toggles[189]ac=GetInventoryItemID("player",13)ad=GetInventoryItemID("player",14)if not B.Commons.Enabled.TopTrinket and not B.Commons.Enabled.BottomTrinket then z={ac,ad}elseif not B.Commons.Enabled.TopTrinket and B.Commons.Enabled.BottomTrinket then z={ac}elseif not B.Commons.Enabled.BottomTrinket and B.Commons.Enabled.TopTrinket then z={ad}end end;local function aA()if not a3 then V=0;W=0 end;if V>0 then V=0 end;if W>0 then W=0 end;X=g:GetEnemiesInRange(40,x.DarkCommand)K=g:GetEnemiesInMeleeRange(8)if m()then L=#K>0 and#K or 1 else L=1 end;if g:IsChanneling(x.FelDevestation)then if l.CastAnnotated(x.Pool,false,"WAIT")then W=99999;return"Pool During not HFelDevestation"end end;az()if l.QueuedCast()then W=l.QueuedCast()return"Custom Queue "..j(W):ID()end;if Y and x.InfernalStrike:IsUsableP()and x.InfernalStrike:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,x.InfernalStrike)then if l.Cast(x.InfernalStrike,nil,nil,nil)then W=189110;return"queue InfernalStrike "end elseif(not x.InfernalStrike:IsUsableP()or x.InfernalStrike:CooldownRemains()>0 or g:PrevGCD(1,x.InfernalStrike))and Y then HeroRotationCharDB.Toggles[167]=not HeroRotationCharDB.Toggles[167]l.Print("InfernalStrike Queue is now "..(HeroRotationCharDB.Toggles[167]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if Z and x.SigilofSilence:IsUsableP()and x.SigilofSilence:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,x.SigilofSilence)then if l.Cast(x.SigilofSilence,nil,nil,nil)then W=202137;return"queue SigilofSilence "end elseif(not x.SigilofSilence:IsUsableP()or x.SigilofSilence:CooldownRemains()>0 or g:PrevGCD(1,x.SigilofSilence))and Z then HeroRotationCharDB.Toggles[168]=not HeroRotationCharDB.Toggles[168]l.Print("SigilofSilence Queue is now "..(HeroRotationCharDB.Toggles[168]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a4 and x.ChaosNova:IsUsableP()and x.ChaosNova:CooldownRemains(BypassRecovery)<=0 then if l.Cast(x.ChaosNova,nil,nil,nil)then W=179057;return"queue ChaosNova"end elseif(not x.ChaosNova:IsUsableP()or x.ChaosNova:CooldownRemains(BypassRecovery)>0)and a4 then HeroRotationCharDB.Toggles[46]=not HeroRotationCharDB.Toggles[46]l.Print("Chaos Nova Queue is now "..(HeroRotationCharDB.Toggles[46]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if _ and x.Metamorphosis:IsUsableP()and x.Metamorphosis:CooldownRemains(BypassRecovery)<=0 then if l.Cast(x.Metamorphosis,nil,nil,nil)then W=187827;return"queue Metamorphosis"end elseif(not x.Metamorphosis:IsUsableP()or x.Metamorphosis:CooldownRemains(BypassRecovery)>0)and _ then HeroRotationCharDB.Toggles[169]=not HeroRotationCharDB.Toggles[169]l.Print("Metamorphosis Queue is now "..(HeroRotationCharDB.Toggles[169]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a5 and x.FieryBrand:IsUsableP()and x.FieryBrand:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,x.FieryBrand)then if l.Cast(x.FieryBrand,nil,nil,nil)then W=204021;return"queue FieryBrand"end elseif(not x.FieryBrand:IsUsableP()or x.FieryBrand:CooldownRemains()>0 or g:PrevGCD(1,x.FieryBrand))and a5 then HeroRotationCharDB.Toggles[184]=not HeroRotationCharDB.Toggles[184]l.Print("FieryBrand Queue is now "..(HeroRotationCharDB.Toggles[184]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a6 and x.SigilofChains:IsUsableP()and x.SigilofChains:CooldownRemains(BypassRecovery)<=0 and not g:PrevGCD(1,x.SigilofChains)then if l.Cast(x.SigilofChains,nil,nil,nil)then W=202138;return"queue SigilofChains "end elseif(not x.SigilofChains:IsUsableP()or x.SigilofChains:CooldownRemains()>0 or g:PrevGCD(1,x.SigilofChains))and a6 then HeroRotationCharDB.Toggles[185]=not HeroRotationCharDB.Toggles[185]l.Print("SigilofChains Queue is now "..(HeroRotationCharDB.Toggles[185]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a7 and x.FelDevastation:IsUsableP()and x.FelDevastation:CooldownRemains(BypassRecovery)<=0 then if l.Cast(x.FelDevastation,nil,nil,nil)then W=212084;return"queue FelDevastation"end elseif(not x.FelDevastation:IsUsableP()or x.FelDevastation:CooldownRemains(BypassRecovery)>0)and a7 then HeroRotationCharDB.Toggles[186]=not HeroRotationCharDB.Toggles[186]l.Print("FelDevastation Queue is now "..(HeroRotationCharDB.Toggles[186]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if A.TargetIsValid()or g:AffectingCombat()then S=d.BossFightRemains()T=S;if T==11111 then T=d.FightRemains(K,false)end;C=t.Souls.AuraSouls;E=t.Souls.IncomingSouls;D=C+E;ae()I=g:ActiveMitigationNeeded()J=g:IsTankingAoE(8)or g:IsTanking(h)end;if A.TargetIsValid()and(g:AffectingCombat()or a2)then if not g:AffectingCombat()then local av=ap()if av then return av end end;N=x.FieryBrand:IsAvailable()and x.FieryDemise:IsAvailable()and x.FieryBrandDebuff:AuraActiveCount()>0;O=L==1;P=L>=2 and L<=5;Q=L>=6;M=x.FelDevastation:CooldownRemains()<=x.SoulCleave:ExecuteTime()+g:GCDRemains()and g:Fury()<80 or(E>1 or D>=5)and not O;if N then R=O and C>=5 or P and C>=4 or Q and C>=3 else R=P and C>=5 or Q and C>=4 end;if N then VarNoMaintCleave=O and D>=5 or P and D>=4 or Q and D>=3 else VarNoMaintCleave=P and D>=5 or Q and D>=4 end;local av=A.Interrupt(10,x.Disrupt,B.Commons.OffGCDasOffGCD.Disrupt,false)if av then return av end;if J then local av=aq()if av then return av end end;U=ai(EnemiesMeleeCount)if A.TargetIsValid()then end;if B.Commons.Enabled.Potions then local aB=A.PotionSelected()if aB then if aB:IsReady()and n()and a1 and(g:BloodlustUp()and l.GUISettings.General.HoldPotforBL or not l.GUISettings.General.HoldPotforBL)then if o(aB,nil)then W=50;return"potion cooldowns 6"end end end end;if B.Commons.Enabled.BottomTrinket or B.Commons.Enabled.TopTrinket then local aC=g:GetUseableTrinkets(z,13)if aC then if o(aC,nil,nil)then W=30;return"trinket1 main 10"end end;local aD=g:GetUseableTrinkets(z,14)if aD then if o(aD,nil,nil)then W=40;return"trinket2 main 12"end end end;if x.FieryBrand:IsAvailable()and x.FieryDemise:IsAvailable()and x.FieryBrandDebuff:AuraActiveCount()>0 then local av=as()if av then return av end end;local av=ar()if av then return av end;if O then local av=au()if av then return av end;if q(x.Pool,false,"WAIT")then return"Wait for SingleTarget()"end end;if P then local av=aw()if av then return av end;if q(x.Pool,false,"WAIT")then return"Wait for SmallAoE()"end end;if Q then local av=ax()if av then return av end;if q(x.Pool,false,"WAIT")then return"Wait for BigAoE()"end end;if q(x.Pool,false,"WAIT")then return"Wait/Pool Resources"end end end;function ReturnSpellVen()if W==0 then return 0 else return W end end;function ReturnSpellVenMO()if V==0 then return 0 else return V end end;local function aE()x.FieryBrandDebuff:RegisterAuraTracking()x.SigilofFlameDebuff:RegisterAuraTracking()l.Print("Vengeance Demon Hunter rotation has been updated for patch 10.2.0.")end;l.SetAPL(581,aA,aE)