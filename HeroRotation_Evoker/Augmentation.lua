local a,b=...local c=HeroDBC.DBC;local d=HeroLib;local e=HeroCache;local f=d.Unit;local g=f.Player;local h=f.Target;local i=f.Pet;local j=d.Spell;local k=d.Item;local l=HeroRotation;local m=l.AoEON;local n=l.CDsON;local o=l.Cast;local p=l.CastPooling;local q=l.CastAnnotated;local r=l.CastSuggested;local s=l.Commons.Evoker;local t=l.Commons.Everyone.num;local u=l.Commons.Everyone.bool;local v=math.max;local w=math.min;local x=0;local y=0;local z=0;local A=0;local B=j.Evoker.Augmentation;local C=k.Evoker.Augmentation;local D={C.AshesoftheEmbersoul:ID(),C.BalefireBranch:ID(),C.BeacontotheBeyond:ID(),C.BelorrelostheSuncaller:ID(),C.IrideusFragment:ID(),C.MirrorofFracturedTomorrows:ID(),C.NymuesUnravelingSpindle:ID(),C.SpoilsofNeltharus:ID()}local E=g:GetEquipment()local F=E[13]and k(E[13])or k(0)local G=E[14]and k(E[14])or k(0)local H=l.Commons.Everyone;local I={General=l.GUISettings.General,Commons=l.GUISettings.APL.Evoker.Commons,Augmentation=l.GUISettings.APL.Evoker.Augmentation}local function t(J)if J then return 1 else return 0 end end;local function u(J)return J~=0 end;local K={}local L=B.FontofMagic:IsAvailable()and 4 or 3;local M=B.FontofMagic:IsAvailable()and 0.8 or 1;local N=11111;local O=11111;local P=g:GCD()+0.25;local Q=2;local R,S;local T,U;local V=true;local W=I.Augmentation.MinOpenerDelay;local X=0;local Y=false;local Z=HeroRotationCharDB.Toggles[4]local _=HeroRotationCharDB.Toggles[5]local a0=not HeroRotationCharDB.Toggles[15]local a1=HeroRotationCharDB.Toggles[191]local a2=HeroRotationCharDB.Toggles[190]local a3=HeroRotationCharDB.Toggles[3]local a4;local a5=WeakAuras.GetRegion('PT: List').PreList;local a6=a5['party1']local a7=a5['party2']local a8=a5['party3']local a9=a5['party4']local aa=a5['player']local ab=GetNumGroupMembers()local ac={102560,359844,191427,288613,12472,365350,190319,375087,10060,391109,152279,47568,384376,51271,212283,393961,383883,383882}local function ad(ae)local af=false;for ag=1,25 do local ah,ai,ai,ai,ai,aj,ak,ai,ai,al=UnitAura(ae,ag)if ah~=nil and aj>0 then local am=aj-GetTime()if am>6 and al==410089 and ak=='player'then af=true;break end end end;return af end;local function an(ae)local ao=false;for ap=1,25 do local ah,ai,ai,ai,ai,ai,ai,ai,ai,al=UnitAura(ae,ap)if ah~=nil and tContains(ac,al)then ao=true;break end end;return ao end;local function aq()local ar=0;local as="DAMAGER"a6=a5['party1']a7=a5['party2']a8=a5['party3']a9=a5['party4']aa=a5['player']if ab>0 and ab<6 then for at=1,ab do local ae='party'..at;local au=false;local av=false;local aw=IsSpellInRange(B.Prescience:Name(),ae)local ax=UnitGroupRolesAssigned(ae)if UnitExists(ae)and UnitIsDeadOrGhost(ae)~=true and aw==1 then if ae=="party1"and a6 and ax==as or ae=="party2"and a7 and ax==as or ae=="party3"and a8 and ax==as or ae=="party4"and a9 and ax==as then local af=false;local ao=false;ao=an(ae)af=ad(ae)if not af and ao then ar=at;break end;au=true end;if ae=="party1"and a6 and ax==as or ae=="party2"and a7 and ax==as or ae=="party3"and a8 and ax==as or ae=="party4"and a9 and ax==as then local af=false;af=an(ae)if not af then ar=at;break end;av=true else if ax=="TANK"and au and av then local af=false;af=ad(ae)if not af then ar=at;break end end end end end end;return ar end;local ay={{B.TailSwipe,"Cast Tail Swipe (Interrupt)",function()return true end},{B.WingBuffet,"Cast Wing Buffet (Interrupt)",function()return true end}}d:RegisterForEvent(function()N=11111;O=11111 end,"PLAYER_REGEN_ENABLED")d:RegisterForEvent(function()E=g:GetEquipment()F=E[13]and k(E[13])or k(0)G=E[14]and k(E[14])or k(0)end,"PLAYER_EQUIPMENT_CHANGED")d:RegisterForEvent(function()L=B.FontofMagic:IsAvailable()and 4 or 3;M=B.FontofMagic:IsAvailable()and 0.8 or 1 end,"SPELLS_CHANGED","LEARNED_SPELL_IN_TAB")local function az()end;local function aA()local aB;if UnitInRaid("player")then aB=f.Raid elseif UnitInParty("player")then aB=f.Party else return false end;local aC=nil;for ai,aD in pairs(aB)do if aD:Exists()and aD:BuffUp(B.SourceofMagicBuff)then aC=aD end end;if aC==nil then return true end;return false end;local function aE()local ar=0;local ab=GetNumGroupMembers()if ab>0 and ab<6 then for at=1,ab do local ae='party'..at;local aF=IsSpellInRange(B.BlisteringScales:Name(),ae)local ax=UnitGroupRolesAssigned(ae)if UnitExists(ae)and UnitIsDeadOrGhost(ae)~=true and aF==1 and ax=="TANK"then local aG=false;for ag=1,25 do local ah,ai,aH,ai,ai,ai,ai,ai,ai,al=UnitAura(ae,ag)if al==360827 and aH>2 then aG=true;break end end;if not aG then ar=at;break end end end end;return ar end;local function aI()local aB;if UnitInRaid("player")then aB=f.Raid elseif UnitInParty("player")then aB=f.Party else aB=g end;if aB==g then return g:BuffStack(B.BlisteringScalesBuff)else for aJ,aD in pairs(aB)do if aD:Exists()and(aD:IsTankingAoE(8)or aD:IsTanking(h))and UnitGroupRolesAssigned(aJ)=="TANK"then return aD:BuffStack(B.BlisteringScalesBuff)end end end;return 0 end;local function aK(aL)local aM=0;for ai,aN in pairs(aL)do local aO=aN:DebuffRemains(B.TemporalWoundDebuff)aM=v(aO,aM)end;return aM end;local function aP()return B.EbonMightSelfBuff:BaseDuration()*(1+g:CritChancePct()/100)end;local function aQ()local aB;local aR=0;if UnitInRaid("player")then aB=f.Raid elseif UnitInParty("player")then aB=f.Party else return 0 end;for ai,aN in pairs(aB)do if aN:Exists()then aR=aR+1 end end;return aR end;local function aS()V=true;W=I.Augmentation.MinOpenerDelay;if not B.InterwovenThreads:IsAvailable()then X=W else X=W+(X or 0)end;Y=false;local aT=F:ID()R=aT==C.IrideusFragment:ID()or aT==C.BalefireBranch:ID()or aT==C.AshesoftheEmbersoul:ID()or aT==C.NymuesUnravelingSpindle:ID()or aT==C.MirrorofFracturedTomorrows:ID()or aT==C.SpoilsofNeltharus:ID()local aU=G:ID()S=aU==C.IrideusFragment:ID()or aU==C.BalefireBranch:ID()or aU==C.AshesoftheEmbersoul:ID()or aU==C.NymuesUnravelingSpindle:ID()or aU==C.MirrorofFracturedTomorrows:ID()or aU==C.SpoilsofNeltharus:ID()T=R or aT==C.BeacontotheBeyond:ID()or aT==C.BelorrelostheSuncaller:ID()U=S or aU==C.BeacontotheBeyond:ID()or aU==C.BelorrelostheSuncaller:ID()if B.BlessingoftheBronze:IsCastable()and H.GroupBuffMissing(B.BlessingoftheBronzeBuff)then if o(B.BlessingoftheBronze,nil)then x=364342;return"blessing_of_the_bronze precombat"end end;if B.BlackAttunement:IsCastable()and g:BuffDown(B.BlackAttunementBuff)then if o(B.BlackAttunement)then x=403264;return"black_attunement precombat"end end;if B.BronzeAttunement:IsCastable()and(g:BuffDown(B.BronzeAttunementBuff)and g:BuffUp(B.BlackAttunementBuff)and not g:BuffUp(B.BlackAttunementBuff,false))then if o(B.BronzeAttunement)then x=403265;return"bronze_attunement precombat"end end;if B.BlisteringScales:IsCastable()and aI()<10 then if o(B.BlisteringScales,nil,nil)then x=360827;A=aE()return"blistering_scales precombat 2"end end;if B.LivingFlame:IsCastable()then if o(B.LivingFlame,nil,nil,not h:IsSpellInRange(B.LivingFlame))then x=361469;return"living_flame precombat 10"end end end;local function aV()if B.EbonMight:IsReady()then if o(B.EbonMight,nil)then x=395152;return"ebon_might ebon_logic 2"end end end;local function aW()if not Y then X=w(X,W)end;X=X-1;if not Y then Y=true end;if C.NymuesUnravelingSpindle:IsEquippedAndReady()then X=X-2 end;if B.LivingFlame:IsReady()and(EnemiesCount8ySplash==1 or B.PupilofAlexstrasza:IsAvailable())then if o(B.LivingFlame,nil,nil,not h:IsSpellInRange(B.LivingFlame))then x=361469;return"living_flame opener_filler 4"end end;if B.AzureStrike:IsCastable()then if o(B.AzureStrike,nil,nil,not h:IsSpellInRange(B.AzureStrike))then x=362969;return"azure_strike opener_filler 6"end end end;local function aX()if I.Commons.Enabled.TopTrinket or I.Commons.Enabled.BottomTrinket then if C.NymuesUnravelingSpindle:IsEquippedAndReady()and B.BreathofEons:CooldownRemains()<=3 then if C.NymuesUnravelingSpindle:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket NymuesUnravelingSpindle"elseif C.NymuesUnravelingSpindle:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket NymuesUnravelingSpindle"end end;if h:DebuffUp(B.TemporalWoundDebuff)or O<=30 and g:BuffUp(B.EbonMightSelfBuff)then if C.IrideusFragment:IsEquippedAndReady()then if C.IrideusFragment:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket IrideusFragment"elseif C.IrideusFragment:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket IrideusFragment"end end;if C.AshesoftheEmbersoul:IsEquippedAndReady()then if C.AshesoftheEmbersoul:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket AshesoftheEmbersoul"elseif C.AshesoftheEmbersoul:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket AshesoftheEmbersoul"end end;if C.MirrorofFracturedTomorrows:IsEquippedAndReady()then if C.MirrorofFracturedTomorrows:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket MirrorofFracturedTomorrows"elseif C.MirrorofFracturedTomorrows:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket MirrorofFracturedTomorrows"end end;if C.BalefireBranch:IsEquippedAndReady()then if C.BalefireBranch:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket BalefireBranch"elseif C.BalefireBranch:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket BalefireBranch"end end end;if C.SpoilsofNeltharus:IsEquippedAndReady()and(g:BuffUp(B.SpoilsofNeltharusMastery)and(not((F:ID()==C.IrideusFragment:ID()or F:ID()==C.MirrorofFracturedTomorrows:ID())and F:CooldownUp()or(G:ID()==C.IrideusFragment:ID()or G:ID()==C.MirrorofFracturedTomorrows:ID())and G:CooldownUp())or not(d.CombatTime()%120<=20 or O>=190 and O<=250 and d.CombatTime()%60<=25 or O<=25)))then if C.SpoilsofNeltharus:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket SpoilsofNeltharus"elseif C.SpoilsofNeltharus:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket SpoilsofNeltharus"end end;if C.BeacontotheBeyond:IsEquippedAndReady()and(h:DebuffDown(B.TemporalWoundDebuff)and((F:CooldownRemains()>=20 or not R)and(G:CooldownRemains()>=20 or not S))or R and S or O<20)then if C.BeacontotheBeyond:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket BeacontotheBeyond"elseif C.BeacontotheBeyond:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket BeacontotheBeyond"end end;if C.BelorrelostheSuncaller:IsEquippedAndReady()and(h:DebuffDown(B.TemporalWoundDebuff)and((F:CooldownRemains()>=20 or not R)and(G:CooldownRemains()>=20 or not S))or R and S or O<20)then if C.BelorrelostheSuncaller:ID()==TopTrinketID and I.Commons.Enabled.TopTrinket then x=13;return"top trinket BelorrelostheSuncaller"elseif C.BelorrelostheSuncaller:ID()==BotTrinketID and I.Commons.Enabled.BottomTrinket then x=14;return"bot trinket BelorrelostheSuncaller"end end;local aY=g:GetUseableTrinkets(D)if aY and n()and(h:DebuffDown(B.TemporalWoundDebuff)and(B.BreathofEons:CooldownRemains()>=30 or not S)and not T)then if aY then if l.Cast(aY,nil,nil)then if aY:ID()==GetInventoryItemID("player",13)and I.Commons.Enabled.TopTrinket then x=13;return"Generic use_items for "..aY:Name()elseif aY:ID()==GetInventoryItemID("player",14)and I.Commons.Enabled.BottomTrinket then x=14;return"Generic use_items for "..aY:Name()end end end end end end;local function aZ()if n()and B.TipTheScales:IsCastable()and(B.FireBreath:CooldownUp()and g:BuffUp(B.EbonMightSelfBuff))then if o(B.TipTheScales,nil)then x=370553;return"tip_the_scales fb 2"end end;local a_=0;if B.FireBreath:IsCastable()then if g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>16 then a_=1 elseif g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>12 then a_=2 elseif g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>8 then a_=3 elseif g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>4 then a_=4 elseif g:BuffUp(B.TipTheScales)and not C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>8 then a_=3 elseif g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and not C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>16 then a_=1 elseif g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and not C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>12 then a_=2 elseif g:BuffRemains(B.EbonMightSelfBuff)>B.FireBreath:ExecuteTime()and not C.NeltharionsCalltoChaos:IsEquipped()and h:TimeToDie()>8 then a_=3 end;if a_>0 then if q(B.FireBreath,false,a_,not h:IsInRange(25))then x=357208;if true then z=a_;return"EmpowerShouldcast = "..z end;return"fire_breath empower_to="..a_.." fb 4"end end end end;local function b0()if B.LivingFlame:IsReady()and((g:BuffUp(B.AncientFlameBuff)or g:Mana()>=200000 or not B.DreamofSpring:IsAvailable()or V==0)and(EnemiesCount8ySplash==1 or B.PupilofAlexstrasza:IsAvailable()))then if o(B.LivingFlame,nil,nil,not h:IsSpellInRange(B.LivingFlame))then x=361469;return"living_flame filler 2"end end;if B.AzureStrike:IsCastable()then if o(B.AzureStrike,nil,nil,not h:IsSpellInRange(B.AzureStrike))then x=362969;return"azure_strike filler 4"end end end;local function b1()Z=HeroRotationCharDB.Toggles[4]_=HeroRotationCharDB.Toggles[5]a0=not HeroRotationCharDB.Toggles[15]a1=HeroRotationCharDB.Toggles[191]a2=HeroRotationCharDB.Toggles[190]end;local function b2()Enemies25y=g:GetEnemiesInRange(25)Enemies8ySplash=h:GetEnemiesInSplashRange(8)if m()then EnemiesCount8ySplash=h:GetEnemiesInSplashRangeCount(8)else EnemiesCount8ySplash=1 end;if not a3 then y=0;x=0 end;if y>0 then y=0 end;if x>0 then x=0 end;if z>0 then z=0 end;if A>0 then A=0 end;local a4=b1()if l.QueuedCast()then x=l.QueuedCast()return"Custom Queue "..j(x):ID()end;if a2 and B.BreathofEons:IsUsableP()and B.BreathofEons:CooldownRemains(BypassRecovery)==0 then if l.Cast(B.BreathofEons,nil,nil,nil)then x=403631;return"queue BreathofEons"end elseif(not B.BreathofEons:IsUsableP()or B.BreathofEons:CooldownRemains()>0)and a2 then HeroRotationCharDB.Toggles[190]=not HeroRotationCharDB.Toggles[190]l.Print("BreathofEons Queue is now "..(HeroRotationCharDB.Toggles[190]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if a1 and B.DeepBreath:IsUsableP()and B.DeepBreath:CooldownRemains(BypassRecovery)==0 then if l.Cast(B.DeepBreath,nil,nil,nil)then x=357210;return"queue DeepBreath"end elseif(not B.DeepBreath:IsUsableP()or B.DeepBreath:CooldownRemains()>0)and a1 then HeroRotationCharDB.Toggles[191]=not HeroRotationCharDB.Toggles[191]l.Print("DeepBreath Queue is now "..(HeroRotationCharDB.Toggles[191]and"|cff00ff00on|r."or"|cffff0000off|r."))end;if H.TargetIsValid()or g:AffectingCombat()then N=d.BossFightRemains()O=N;if O==11111 then O=d.FightRemains(Enemies25y,false)end;P=g:GCD()+0.25 end;if H.TargetIsValid()and(g:AffectingCombat()or _)then if not g:AffectingCombat()and not g:IsCasting()then local a4=aS()if a4 then return a4 end end;local a4=H.Interrupt(25,B.Quell,I.Commons.OffGCDasOffGCD.Quell,ay)if a4 then return a4 end;if B.Unravel:IsReady()then if o(B.Unravel,nil,nil,not h:IsSpellInRange(B.Unravel))then x=368432;return"unravel main 2"end end;VarTempWound=aK(Enemies25y)if B.Prescience:IsCastable()and((B.Prescience:FullRechargeTime()<=P*3 or B.EbonMight:CooldownRemains()<=P*3 and g:BuffRemains(B.EbonMightSelfBuff)-P*3<=aP()*0.4 or VarTempWound>=P+B.Eruption:CastTime()or O<=30)and g:BuffStack(B.TremblingEarthBuff)+B.PrescienceBuff:AuraActiveCount()<=5+t(B.Prescience:FullRechargeTime()<=P*3))then if o(B.Prescience,nil,nil)then x=409311;A=aq()return"prescience main 4"end end;if g:BuffRemains(B.EbonMightSelfBuff)-B.EbonMight:CastTime()<=aP()*0.4 and(B.PrescienceBuff:AuraActiveCount()>=2 and d.CombatTime()<=10 or B.PrescienceBuff:AuraActiveCount()>=3 or g:BuffRemains(B.EbonMightSelfBuff)>=B.EbonMight:CastTime()or aQ()<=2)then local a4=aV()if a4 then return a4 end end;if X>0 and d.CombatTime()<X then local a4=aW()if a4 then return a4 end;if q(B.Pool,false,"WAIT")then return"Wait for OpenerFiller()"end end;if I.Commons.Enabled.Trinkets or I.Commons.Enabled.Items then local a4=aX()if a4 then return a4 end end;if B.DeepBreath:IsCastable()then if o(B.DeepBreath,nil,nil,not h:IsInRange(50))then x=357210;return"deep_breath main 8"end end;if B.TimeSkip:IsAvailable()and B.TimeSkip:CooldownUp()and not B.InterwovenThreads:IsAvailable()then local a4=aZ()if a4 then return a4 end end;if B.Upheaval:IsCastable()and(g:BuffRemains(B.EbonMightSelfBuff)>g:EmpowerCastTime(1)and B.TimeSkip:IsAvailable()and B.TimeSkip:CooldownUp()and not B.InterwovenThreads:IsAvailable())then if q(B.Upheaval,false,"1",not h:IsInRange(25),nil)then x=396286;if true then z=1 end;return"upheaval empower_to=1 main 10"end end;if B.LivingFlame:IsReady()and(g:BuffUp(B.LeapingFlamesBuff)and B.FireBreathDebuff:CooldownUp())then if o(B.LivingFlame,nil,nil,not h:IsSpellInRange(B.LivingFlame))then x=361469;return"living_flame main 14"end end;local a4=aZ()if a4 then return a4 end;if B.Upheaval:IsCastable()and g:BuffRemains(B.EbonMightSelfBuff)>g:EmpowerCastTime(1)then if q(B.Upheaval,false,"1",not h:IsInRange(25),nil)then x=396286;if true then z=1 end;return"upheaval empower_to=1 main 16"end end;if n()and B.TimeSkip:IsCastable()and B.FireBreath:CooldownRemains()+B.Upheaval:CooldownRemains()+B.Prescience:FullRechargeTime()>35 then if o(B.TimeSkip,nil)then x=374968;return"time_skip main 18"end end;if B.EmeraldBlossom:IsReady()and(B.DreamofSpring:IsAvailable()and g:BuffUp(B.EssenceBurstBuff)and(V==2 or V==1 and g:BuffDown(B.AncientFlameBuff))and(g:BuffUp(B.EbonMightSelfBuff)or g:EssenceDeficit()==0 or g:BuffStack(B.EssenceBurstBuff)==Q and B.EbonMight:CooldownRemains()>4))then if o(B.EmeraldBlossom,nil)then x=355913;return"emerald_blossom main 20"end end;if B.Eruption:IsReady()and(g:BuffRemains(B.EbonMightSelfBuff)>B.Eruption:ExecuteTime()or g:EssenceDeficit()==0 or g:BuffStack(B.EssenceBurstBuff)==Q and B.EbonMight:CooldownRemains()>4)then if o(B.Eruption,nil,nil,not h:IsInRange(25))then x=395160;return"eruption main 22"end end;if B.BlisteringScales:IsCastable()and(aI()==0 and g:BuffDown(B.EbonMightSelfBuff))then if o(B.BlisteringScales,nil,nil)then x=360827;A=aE()return"blistering_scales main 24"end end;if B.EmeraldBlossom:IsReady()and(g:BuffDown(B.EbonMightSelfBuff)and B.AncientFlame:IsAvailable()and B.ScarletAdaptation:IsAvailable()and not B.DreamofSpring:IsAvailable()and g:BuffDown(B.AncientFlameBuff)and EnemiesCount8ySplash==1)then if o(B.EmeraldBlossom,nil)then x=355913;return"emerald_blossom main 26"end end;if B.VerdantEmbrace:IsReady()and(g:BuffDown(B.EbonMightSelfBuff)and B.AncientFlame:IsAvailable()and B.ScarletAdaptation:IsAvailable()and g:BuffDown(B.AncientFlameBuff)and(not B.DreamofSpring:IsAvailable()or g:Mana()>=200000)and EnemiesCount8ySplash==1)then if o(B.VerdantEmbrace,nil)then x=360995;return"verdant_embrace main 28"end end;local a4=b0()if a4 then return a4 end;if q(B.Pool,false,"WAIT")then return"Wait/Pool"end end end;function ReturnSpell1()if x==0 then return 0 else return x end end;function ReturnSpell()if x==0 then return 0 else return x end end;function ReturnSpellMO()if y==0 then return 0 else return y end end;function ReturnSpellEP()if z==0 then return 0 else return z end end;function ReturnSpellT()if A==0 then return 0 else return A end end;local function b3()B.PrescienceBuff:RegisterAuraTracking()l.Print("Augmentation Evoker rotation has been updated for patch 10.2.0.")end;l.SetAPL(1473,b2,b3)