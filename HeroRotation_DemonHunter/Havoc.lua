local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=HeroRotationCharDB.Toggles[4]local p=HeroRotationCharDB.Toggles[5]local q=HeroRotationCharDB.Toggles[6]local r=HeroRotationCharDB.Toggles[12]local s=HeroRotationCharDB.Toggles[15]local t=HeroRotationCharDB.Toggles[40]local u=HeroRotationCharDB.Toggles[42]local v=HeroRotationCharDB.Toggles[41]local w=false;local x=false;local y=false;local z=false;local A=l.Cast;local B=l.CastSuggested;local C=string.match;local D=j.DemonHunter.Havoc;local E=k.DemonHunter.Havoc;local F={}local G=g:GetEquipment()local H=k(0)local I=k(0)local J,K=GetInventoryItemID("player",13)local L,K=GetInventoryItemID("player",14)if G[13]then H=k(G[13])end;if G[14]then I=k(G[14])end;local M;local N,O;local P,Q;local R=g:HasLegendaryEquipped(20)local S=g:HasLegendaryEquipped(23)local T=g:HasLegendaryEquipped(25)local U=l.Commons.Everyone;local V={General=l.GUISettings.General,Commons=l.GUISettings.APL.DemonHunter.Commons,Havoc=l.GUISettings.APL.DemonHunter.Havoc}local W={{D.FelEruption,"Cast Fel Eruption (Interrupt)",function()return true end},{D.ChaosNova,"Cast Chaos Nova (Interrupt)",function()return true end}}local X=0;local Y=0;local Z=false;local _=false;local a0=false;local a1=false;local a2=false;local a3=false;local a4=false;local a5=0;local a6=false;d:RegisterForEvent(function()_=false;a0=false;a1=false;a2=false;a3=false;a4=false end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()G=g:GetEquipment()H=k(0)I=k(0)if G[13]then H=k(G[13])end;if G[14]then I=k(G[14])end;R=g:HasLegendaryEquipped(20)S=g:HasLegendaryEquipped(23)T=g:HasLegendaryEquipped(25)end,"PLAYER_EQUIPMENT_CHANGED")local function a7(a8)if a8 then return 1 else return 0 end end;local function a9(a8)return a8~=0 end;local function aa(ab)if D.Felblade:TimeSinceLastCast()<=g:GCD()then return true elseif D.VengefulRetreat:TimeSinceLastCast()<1.0 and D.VengefulRetreat:TimeSinceLastCast()>0.25 or D.FelRush:TimeSinceLastCast()<1.0 then return false end;return ab and h:IsInMeleeRange(ab)or h:IsInMeleeRange(5)end;local function ac()return true end;local function ad(ae)return ae:DebuffRemains(D.BurningWoundDebuff)end;local function af(ae)if T and ae:DebuffRemains(D.BurningWoundDebuff)<4 and ae:IsInRange(8)and ae:GUID()==f("mouseover"):GUID()and V.Havoc.TargetSwap=="Mouseover"then Y=111;return true elseif T and ae:DebuffRemains(D.BurningWoundDebuff)<4 and ae:IsInRange(8)and V.Havoc.TargetSwap=="AutoSwap"and ae:GUID()~=h:GUID()and not r then Y=999;return true elseif T and ae:DebuffRemains(D.BurningWoundDebuff)<4 and ae:GUID()==h:GUID()and h:IsInRange(8)then X=162243;return true elseif T and ae:DebuffRemains(D.BurningWoundDebuff)<4 then return true end end;local function ag(ae)return ae:DebuffRemains(D.BurningWoundDebuff)end;local function ah(ae)if T and ae:DebuffRemains(D.BurningWoundDebuff)<4 and ae:IsInRange(8)and ae:GUID()==f("mouseover"):GUID()and V.Havoc.TargetSwap=="Mouseover"then Y=111;return true elseif T and ae:DebuffRemains(D.BurningWoundDebuff)<4 and ae:IsInRange(8)and V.Havoc.TargetSwap=="AutoSwap"and ae:GUID()~=h:GUID()and not r then Y=999;return true elseif T and ae:DebuffRemains(D.BurningWoundDebuff)<4 and ae:IsInRange(8)and ae:GUID()==h:GUID()then X=162243;return true elseif T and ae:DebuffRemains(D.BurningWoundDebuff)<4 then return true end end;local function ai()if H:TrinketHasStatAnyDps()and not I:TrinketHasStatAnyDps()then a5=1 end;if I:TrinketHasStatAnyDps()and not H:TrinketHasStatAnyDps()then a5=2 end;if H:TrinketHasStatAnyDps()and I:TrinketHasStatAnyDps()or not(H:TrinketHasStatAnyDps()and I:TrinketHasStatAnyDps())then a5=0 end;a6=D.BlindFury:IsAvailable()and(R or D.DemonBlades:IsAvailable())if not h:IsInMeleeRange(5)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and h:IsInRange(15)and D.FelRush:IsCastable()and w then if A(D.FelRush,nil,nil,not h:IsInRange(15))then X=195072;return"fel_rush precombat 2"end end;if h:IsInMeleeRange(5)and(D.DemonsBite:IsCastable()or D.DemonBlades:IsAvailable())then if A(D.DemonsBite,nil,nil,not h:IsInMeleeRange(5))then X=162243;return"demons_bite or demon_blades precombat 4"end end end;local function aj()if D.Metamorphosis:IsCastable()and y and h:IsInRange(8)and(not D.Demonic:IsAvailable()and(D.EyeBeam:CooldownRemains()>20 or not z)and(not D.SinfulBrand:IsAvailable()or h:DebuffDown(D.SinfulBrandDebuff))or d.BossFilteredFightRemains("<",25))then if A(D.Metamorphosis,nil,nil,not h:IsInRange(40))then X=191427;return"metamorphosis cooldown 2"end end;if D.Metamorphosis:IsCastable()and y and h:IsInRange(8)and(D.Demonic:IsAvailable()and((D.EyeBeam:CooldownRemains()>20 or not z)and(not a0 or D.BladeDance:CooldownRemains()>g:GCD()))and(not D.SinfulBrand:IsAvailable()or h:DebuffDown(D.SinfulBrandDebuff))or d.BossFilteredFightRemains("<",25))then if A(D.Metamorphosis,nil,nil,not h:IsInRange(40))then X=191427;return"metamorphosis cooldown 4"end end;if(E.PotionofPhantomFire:IsReady()or E.PotionofSpectralAgility:IsReady())and h:IsInMeleeRange(8)and l.CDsON()and s and V.Commons.Enabled.Potions and(g:BuffRemains(D.MetamorphosisBuff)>25 or d.BossFilteredFightRemains("<",60))then if A(E.PotionofPhantomFire,nil,nil)then X=4;return"potion cooldown 6"end end;if H:IsReady()and h:IsInRange(10)and V.Commons.Enabled.TopTrinket and l.CDsON()and(a5==1 and(g:BuffUp(D.MetamorphosisBuff)or not D.Demonic:IsAvailable()and(D.Metamorphosis:CooldownRemains()>d.FightRemains(O)or not y)or d.BossFilteredFightRemains("<=",20))or a5==2 and not I:IsReady()or a5==0)then if A(H,nil,nil)then if H:ID()==J then X=20;return"top trinket 1"elseif H:ID()==L then X=25;return"bot trinket 1"end end end;if I:IsReady()and h:IsInRange(10)and V.Commons.Enabled.BottomTrinket and l.CDsON()and(a5==2 and(g:BuffUp(D.MetamorphosisBuff)or not D.Demonic:IsAvailable()and(D.Metamorphosis:CooldownRemains()>d.FightRemains(O)or not y)or d.BossFilteredFightRemains("<=",20))or a5==1 and not H:IsReady()or a5==0)then if A(I,nil,nil)then if I:ID()==J then X=20;return"top trinket 1"elseif I:ID()==L then X=25;return"bot trinket 1"end end end;if D.SinfulBrand:IsCastable()and h:IsInMeleeRange(30)and o and h:DebuffDown(D.SinfulBrandDebuff)then if A(D.SinfulBrand,nil,nil,not h:IsSpellInRange(D.SinfulBrand))then X=317009;return"sinful_brand cooldown 12"end end;if D.TheHunt:IsCastable()and h:IsInRange(40)and o and(not D.Demonic:IsAvailable()and not a4 and not _ or g:BuffUp(D.FuriousGazeBuff))then if A(D.TheHunt,nil,nil,not h:IsSpellInRange(D.TheHunt))then X=323639;return"the_hunt cooldown 14"end end;if D.ElysianDecree:IsCastable()and h:IsInRange(30)and o and P>0 then if A(D.ElysianDecree,nil,nil,not h:IsInRange(30))then X=306830;return"elysian_decree cooldown 16"end end end;local function ak()if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(D.UnboundChaos:IsAvailable()and g:BuffUp(D.UnboundChaosBuff)and D.FelRush:Charges()==2)and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 2"end end;if D.DeathSweep:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and a0 then if A(D.DeathSweep,nil,nil,not aa(8))then X=210152;return"death_sweep demonic 4"end end;if D.GlaiveTempest:IsReady()and h:IsInMeleeRange(8)and P>0 then if A(D.GlaiveTempest,nil,nil,not h:IsInMeleeRange(8))then X=342817;return"glaive_tempest demonic 6"end end;if D.ThrowGlaive:IsCastable()and h:IsInMeleeRange(30)and D.VengefulRetreat:TimeSinceLastCast()>1 and(D.SerratedGlaive:ConduitEnabled()and(D.EyeBeam:CooldownRemains()<6 and z)and g:BuffDown(D.MetamorphosisBuff)and h:DebuffDown(D.ExposedWoundDebuff))then if A(D.ThrowGlaive,nil,nil,not h:IsSpellInRange(D.ThrowGlaive))then X=185123;return"throw_glaive demonic 8"end end;if D.EyeBeam:IsReady()and z and not h:IsCasting(j(355806))and h:IsInMeleeRange(10)and D.VengefulRetreat:TimeSinceLastCast()>=1 and(P>0 and(not a6 or P>1 or g:Fury()<70))then if A(D.EyeBeam,nil,nil,not h:IsInRange(20))then X=198013;return"eye_beam demonic 10"end end;if D.BladeDance:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and(a0 and not D.Metamorphosis:CooldownUp()and(D.EyeBeam:CooldownRemains()>5 or not z))then if A(D.BladeDance,nil,nil,not aa(8))then X=188499;return"blade_dance demonic 12"end end;if D.ImmolationAura:IsCastable()and not u and D.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and g:BuffDown(D.ImmolationAuraBuff)then if A(D.ImmolationAura,nil,nil,not aa(8))then X=258920;return"immolation_aura demonic 14"end end;if D.Annihilation:IsReady()and h:IsInRange(8)and h:IsInMeleeRange(8)and not a1 then if A(D.Annihilation,nil,nil,not h:IsSpellInRange(D.Annihilation))then X=201427;return"annihilation demonic 16"end end;if D.Felblade:IsCastable()and h:IsInRange(15)and(h:IsInRange(8)or not t)and g:FuryDeficit()>=40 and(not aa()or D.VengefulRetreat:TimeSinceLastCast()>=1.0)then if A(D.Felblade,nil,nil,not h:IsSpellInRange(D.Felblade))then X=183226;return"felblade demonic 18"end end;if D.EssenceBreak:IsCastable()and h:IsInMeleeRange(10)and D.VengefulRetreat:TimeSinceLastCast()>1 then if A(D.EssenceBreak,nil,nil,not aa(10))then X=258860;return"essence_break demonic 20"end end;if D.ChaosStrike:IsReady()and h:IsInMeleeRange(8)and(not a1 and not a2)then if A(D.ChaosStrike,nil,nil,not h:IsSpellInRange(D.ChaosStrike))then X=162794;return"chaos_strike demonic 22"end end;if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(D.DemonBlades:IsAvailable()and not D.EyeBeam:CooldownUp()and ac())and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 24"end end;if D.DemonsBite:IsCastable()then if T and h:DebuffRemains(D.BurningWoundDebuff)<4 then if A(D.DemonsBite,nil,nil,not h:IsSpellInRange(D.DemonsBite))then X=162243;return"demons_bite 26T"end end;if U.CastTargetIf(D.DemonsBite,N,"min",ag,ah)then return"demons_bite demonic 26"end end;if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not D.DemonBlades:IsAvailable()and P>1 and D.FelRush:Charges()==2)and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 28"end end;if D.DemonsBite:IsCastable()and h:IsInMeleeRange(8)and not T then if A(D.DemonsBite,nil,nil,not h:IsSpellInRange(D.DemonsBite))then X=162243;return"demons_bite demonic 30"end end;if D.ThrowGlaive:IsCastable()and h:IsInRange(30)and not aa()then if A(D.ThrowGlaive,nil,nil,not h:IsSpellInRange(D.ThrowGlaive))then X=185123;return"throw_glaive demonic 32"end end;if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not aa()and ac())and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 34"end end;if D.VengefulRetreat:IsCastable()and D.EyeBeam:TimeSinceLastCast()>1 and h:IsInRange(5)and x and not t and not aa()then if A(D.VengefulRetreat,nil)then X=198793;return"vengeful_retreat demonic 36"end end;if D.ThrowGlaive:IsCastable()and h:IsInRange(30)and D.DemonBlades:IsAvailable()then if A(D.ThrowGlaive,nil,nil,not h:IsSpellInRange(D.ThrowGlaive))then X=185123;return"throw_glaive demonic 38"end end end;local function al()if D.VengefulRetreat:IsCastable()and D.EyeBeam:TimeSinceLastCast()>1 and h:IsInRange(5)and x and not t and(D.Momentum:IsAvailable()and g:BuffDown(D.PreparedBuff)and d.CombatTime()>1)then if A(D.VengefulRetreat,nil)then X=198793;return"vengeful_retreat normal 2"end end;if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and((g:BuffUp(D.UnboundChaosBuff)or a4 and(not D.UnboundChaos:IsAvailable()or not D.ImmolationAura:CooldownUp()))and ac())and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 34"end end;if D.FelBarrage:IsCastable()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and P>1 then if A(D.FelBarrage,nil,nil,not aa(8))then X=211053;return"fel_barrage normal 6"end end;if D.DeathSweep:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and a0 then if A(D.DeathSweep,nil,nil,not aa(8))then X=210152;return"death_sweep normal 8"end end;if D.ImmolationAura:IsCastable()and not u and D.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and g:BuffDown(D.ImmolationAuraBuff)then if A(D.ImmolationAura,nil,nil,not aa(8))then X=258920;return"immolation_aura normal 10"end end;if D.GlaiveTempest:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and(not a4 and P>0)then if A(D.GlaiveTempest,nil)then X=342817;return"glaive_tempest normal 12"end end;if D.ThrowGlaive:IsCastable()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInRange(30)and(D.SerratedGlaive:ConduitEnabled()and(D.EyeBeam:CooldownRemains()<6 and z)and g:BuffDown(D.MetamorphosisBuff)and h:DebuffDown(D.ExposedWoundDebuff))then if A(D.ThrowGlaive,nil,nil,not h:IsSpellInRange(D.ThrowGlaive))then X=185123;return"throw_glaive normal 14"end end;if D.EyeBeam:IsReady()and z and not h:IsCasting(j(355806))and h:IsInMeleeRange(10)and D.VengefulRetreat:TimeSinceLastCast()>=1 and(not a4 and(Q>0 and(not a6 or P>1 or g:Fury()<70)))then if A(D.EyeBeam,nil,nil,not aa(20))then X=198013;return"eye_beam normal 16"end end;if D.BladeDance:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>=1 and h:IsInMeleeRange(8)and a0 then if A(D.BladeDance,nil,nil,not aa(8))then X=188499;return"blade_dance normal 18"end end;if D.Felblade:IsCastable()and h:IsInMeleeRange(15)and(h:IsInRange(8)or not t)and g:FuryDeficit()>=40 and(not aa()or D.VengefulRetreat:TimeSinceLastCast()>=1.0)then if A(D.Felblade,nil,nil,not h:IsSpellInRange(D.Felblade))then X=183226;return"felblade normal 20"end end;if D.EssenceBreak:IsCastable()and h:IsInMeleeRange(10)and D.VengefulRetreat:TimeSinceLastCast()>1 then if A(D.EssenceBreak,nil,nil,not aa(10))then X=258860;return"essence_break normal 22"end end;if D.Annihilation:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and((D.DemonBlades:IsAvailable()or not a4 or g:FuryDeficit()<30 or g:BuffRemains(D.MetamorphosisBuff)<5)and not a1)then if A(D.Annihilation,nil,nil,not h:IsSpellInRange(D.Annihilation))then X=201427;return"annihilation normal 24"end end;if D.ChaosStrike:IsReady()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and((D.DemonBlades:IsAvailable()or not a4 or g:FuryDeficit()<30)and not _ and not a1)then if A(D.ChaosStrike,nil,nil,not h:IsSpellInRange(D.ChaosStrike))then X=162794;return"chaos_strike normal 26"end end;if D.EyeBeam:IsReady()and z and not h:IsCasting(j(355806))and h:IsInMeleeRange(10)and D.VengefulRetreat:TimeSinceLastCast()>=1 and D.BlindFury:IsAvailable()then if A(D.EyeBeam,nil,nil,not h:IsInRange(20))then X=198013;return"eye_beam normal 28"end end;if D.DemonsBite:IsCastable()and D.VengefulRetreat:TimeSinceLastCast()>1 then if T and h:DebuffRemains(D.BurningWoundDebuff)<4 then if A(D.DemonsBite,nil,nil,not h:IsSpellInRange(D.DemonsBite))then X=162243;return"demons_bite 26T"end end;if U.CastTargetIf(D.DemonsBite,N,"min",ad,af)then return"demons_bite normal 28"end end;if D.DemonsBite:IsCastable()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInMeleeRange(8)and not T then if A(D.DemonsBite,nil,nil,not h:IsSpellInRange(D.DemonsBite))then X=162243;return"demons_bite normal 30"end end;if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not D.Momentum:IsAvailable()and D.DemonBlades:IsAvailable()and ac())and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 34"end end;if D.Felblade:IsCastable()and h:IsInRange(15)and(not aa()and not t)then if A(D.Felblade,nil,nil,not h:IsSpellInRange(D.Felblade))then X=183226;return"felblade normal 34"end end;if D.FelRush:IsCastable()and h:IsInRange(15)and D.VengefulRetreat:TimeSinceLastCast()>0.75 and not t and(not aa()and not D.Momentum:IsAvailable()and ac())and w then if A(D.FelRush,nil,nil)then X=195072;return"fel_rush demonic 34"end end;if D.VengefulRetreat:IsCastable()and D.EyeBeam:TimeSinceLastCast()>1 and h:IsInRange(5)and x and not t and not aa()then if A(D.VengefulRetreat,nil)then X=198793;return"vengeful_retreat normal 38"end end;if D.ThrowGlaive:IsCastable()and D.VengefulRetreat:TimeSinceLastCast()>1 and h:IsInRange(30)and D.DemonBlades:IsAvailable()then if A(D.ThrowGlaive,nil,nil,not h:IsSpellInRange(D.ThrowGlaive))then X=185123;return"throw_glaive normal 40"end end end;local function am()if m()then N=g:GetEnemiesInMeleeRange(8)O=g:GetEnemiesInMeleeRange(20)P=#N;Q=#O else P=1;Q=1 end;q=HeroRotationCharDB.Toggles[6]o=HeroRotationCharDB.Toggles[4]p=HeroRotationCharDB.Toggles[5]r=HeroRotationCharDB.Toggles[12]s=HeroRotationCharDB.Toggles[15]t=HeroRotationCharDB.Toggles[40]v=HeroRotationCharDB.Toggles[41]u=HeroRotationCharDB.Toggles[42]w=V.Havoc.FelRushMode=="All In"or V.Havoc.FelRushMode=="Safe"and D.Felblade:CooldownRemains(BypassRecovery)<=0 or V.Havoc.FelRushMode=="w/ Gap Closer"and(D.Felblade:CooldownRemains(BypassRecovery)<=0 or D.Metamorphosis:CooldownRemains(BypassRecovery)<=0 and y or D.FelRush:Charges()==2 or D.TheHunt:CooldownRemains(BypassRecovery)<=0 and o)x=V.Havoc.VengefulRetreatMode=="All In"or V.Havoc.VengefulRetreatMode=="Safe"and D.Felblade:CooldownRemains(BypassRecovery)<=0 or V.Havoc.VengefulRetreatMode=="w/ Gap Closer"and(D.Felblade:CooldownRemains(BypassRecovery)<=0 or D.Metamorphosis:CooldownRemains(BypassRecovery)<=0 and y or D.FelRush:CooldownRemains(BypassRecovery)<=0 or D.TheHunt:CooldownRemains(BypassRecovery)<=0 and o)y=false;z=false;if V.Havoc.IncludedCooldowns.Metamorphosis and l.CDsON()or V.Havoc.IncludedSmallCooldowns.Metamorphosis and(l.CDsON()or p)or not V.Havoc.IncludedSmallCooldowns.Metamorphosis and not V.Havoc.IncludedCooldowns.Metamorphosis then y=true end;if V.Havoc.IncludedCooldowns.EyeBeam and l.CDsON()or V.Havoc.IncludedSmallCooldowns.EyeBeam and(l.CDsON()or p)or not V.Havoc.IncludedSmallCooldowns.EyeBeam and not V.Havoc.IncludedCooldowns.EyeBeam then z=true end;if not BotOn then Y=0;X=0 end;if Y>0 then Y=0 end;if X>0 then X=0 end;Z=false;if g:IsChanneling(D.EyeBeam)then if A(D.Pool)then X=9999;return"casting EB"end end;if v and D.Imprison:IsUsableP()and D.Imprison:CooldownRemains(BypassRecovery)<=0 and f("mouseover"):GUID()~=nil then if A(D.Imprison,nil,nil,nil)then Y=231;return"queue Imprison MO"end elseif v and D.Imprison:IsUsableP()and D.Imprison:CooldownRemains(BypassRecovery)<=0 and U.TargetIsValid()then if A(D.Imprison,nil,nil,nil)then X=217832;return"queue Imprison"end elseif(not D.Imprison:IsUsableP()or D.Imprison:CooldownRemains()>0 or not U.TargetIsValid())and v then HeroRotationCharDB.Toggles[41]=not HeroRotationCharDB.Toggles[41]l.Print("Imprison Queue is now "..(HeroRotationCharDB.Toggles[41]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if g:FuryDeficit()>=35 and not g:IsChanneling(D.EyeBeam)or not g:AffectingCombat()then Z=true end;if U.TargetIsValid()then if not g:AffectingCombat()and q then local M=ai()if M then return M end end;if not S and not R then a0=D.FirstBlood:IsAvailable()or P>=3-a7(D.TrailofRuin:IsAvailable())end;if S then a0=g:BuffDown(D.ChaosTheoryBuff)or D.FirstBlood:IsAvailable()and P>=2-a7(D.TrailofRuin:IsAvailable())or not D.CycleofHatred:IsAvailable()and P>=4-a7(D.TrailofRuin:IsAvailable())end;if R then a0=D.FirstBlood:IsAvailable()or(g:BuffUp(D.MetamorphosisBuff)or D.TrailofRuin:IsAvailable()or h:DebuffUp(D.EssenceBreakDebuff))and P>=3-a7(D.TrailofRuin:IsAvailable())or not D.Demonic:IsAvailable()and P>=4 end;if D.EssenceBreak:IsAvailable()and D.EssenceBreak:CooldownUp()then a0=false end;_=not D.Demonic:IsAvailable()and(D.Metamorphosis:CooldownRemains()<6 and y)and g:FuryDeficit()>30;a1=a0 and g:Fury()<75-a7(D.FirstBlood:IsAvailable())*20;a2=D.Demonic:IsAvailable()and not D.BlindFury:IsAvailable()and(D.EyeBeam:CooldownRemains()<g:GCD()*2 and z)and g:FuryDeficit()>20;a4=D.Momentum:IsAvailable()and g:BuffDown(D.MomentumBuff)and not t;local M=U.Interrupt(10,D.Disrupt,V.Commons.OffGCDasOffGCD.Disrupt,W)if M then return M end;if n()or o and g:AffectingCombat()then local M=aj()if M then return M end end;if D.Blur:IsCastable()and g:HealthPercentage()<=V.Havoc.BlurHealthThreshold and g:AffectingCombat()then if A(D.Blur,nil)then X=198589;return"Blur defensives (Danger)"end end;if D.ThrowGlaive:IsCastable()and D.VengefulRetreat:TimeSinceLastCast()>1 and g:AffectingCombat()and(g:BuffStack(D.FelBombardmentBuff)==5 and(g:BuffUp(D.ImmolationAuraBuff)or g:BuffDown(D.MetamorphosisBuff)))then if A(D.ThrowGlaive,nil,nil,not h:IsSpellInRange(D.ThrowGlaive))then X=185123;return"throw_glaive fel_bombardment"end end;if D.Demonic:IsAvailable()and g:AffectingCombat()then local M=ak()if M then return M end end;if true and g:AffectingCombat()then local M=al()if M then return M end end end end;local function an()end;function ReturnSpell()if X==0 then return 0 else return X end end;function ReturnSpellMO()if Y==0 then return 0 else return Y end end;function ShouldOrb()return Z end;l.SetAPL(577,am,an)