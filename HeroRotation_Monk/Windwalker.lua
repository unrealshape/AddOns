local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local v0, v1 = ...;
local v2 = HeroDBC.DBC;
local v3 = HeroLib;
local v4 = HeroCache;
local v5 = v3.Utils;
local v6 = v3.Unit;
local v7 = v6.Player;
local v8 = v6.Target;
local v9 = v6.Pet;
local v10 = v3.Spell;
local v11 = v3.MultiSpell;
local v12 = v3.Item;
local v13 = HeroRotation;
local v14 = v13.AoEON;
local v15 = v13.CDsON;
local v16 = v13.Cast;
local v17 = v13.CastAnnotated;
local v18 = v13.Commons.Everyone.num;
local v19 = v13.Commons.Everyone.bool;
local v20 = pairs;
local v21 = v10.Monk.Windwalker;
local v22 = v12.Monk.Windwalker;
local v23 = {};
local v24;
local v25;
local v26;
local v27 = 12530 - (374 + 1045);
local v28 = 8794 + 2317;
local v29;
local v30 = false;
local v31 = false;
local v32 = false;
local v33 = false;
local v34 = false;
local v35 = false;
local v36 = false;
local v37 = ((v21.Serenity:IsAvailable()) and (2 - 1)) or (640 - (448 + 190));
local v38 = v7:IsInDungeonArea();
local v39 = (v22.NeltharionsCalltoDominance:IsEquipped() or v22.AshesoftheEmbersoul:IsEquipped() or v22.MirrorofFracturedTomorrows:IsEquipped() or v22.WitherbarksBranch:IsEquipped()) and not v38;
local v40 = {{v21.LegSweep,LUAOBFUSACTOR_DECRYPT_STR_0("\242\194\200\49\166\151\194\25\145\240\204\32\227\171\135\86\226\215\206\43\175", "\126\177\163\187\69\134\219\167"),function()
	return true;
end},{v21.RingOfPeace,LUAOBFUSACTOR_DECRYPT_STR_0("\0\204\57\209\188\17\196\36\194\188\12\203\106\245\249\34\206\47\133\180\16\217\63\203\181", "\156\67\173\74\165"),function()
	return true;
end},{v21.Paralysis,LUAOBFUSACTOR_DECRYPT_STR_0("\23\182\90\2\252\22\71\38\182\69\15\175\47\85\116\255\122\2\169\40\15", "\38\84\215\41\118\220\70"),function()
	return true;
end}};
local v41 = HeroRotationCharDB.Toggles[568 - (510 + 54)];
local v42 = HeroRotationCharDB.Toggles[10 - 5];
local v43 = not HeroRotationCharDB.Toggles[51 - (13 + 23)];
local v44 = HeroRotationCharDB.Toggles[60 - 29];
local v45 = HeroRotationCharDB.Toggles[45 - 13];
local v46 = HeroRotationCharDB.Toggles[59 - 26];
local v47 = HeroRotationCharDB.Toggles[1122 - (830 + 258)];
local v48 = HeroRotationCharDB.Toggles[123 - 88];
local v49 = HeroRotationCharDB.Toggles[23 + 13];
local v50 = HeroRotationCharDB.Toggles[32 + 5];
local v51 = HeroRotationCharDB.Toggles[1479 - (860 + 581)];
local v52 = HeroRotationCharDB.Toggles[143 - 104];
local v53 = HeroRotationCharDB.Toggles[10 + 2];
local v54 = 241 - (237 + 4);
local v55 = 0 - 0;
local v56;
local v57 = 0 - 0;
local v58 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\64\26\35\11\251\66", "\158\48\118\66\114"), 24 - 11);
local v59 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\187\40\17\47\118\183", "\155\203\68\112\86\19\197"), 12 + 2);
local v60 = false;
local v61 = 0 + 0;
local function v18(v117)
	if v117 then
		return 3 - 2;
	else
		return 0 + 0;
	end
end
local function v19(v118)
	return v118 ~= (0 + 0);
end
local v62 = v7:GetEquipment();
local v63 = (v62[1439 - (85 + 1341)] and v12(v62[21 - 8])) or v12(0 - 0);
local v64 = (v62[386 - (45 + 327)] and v12(v62[25 - 11])) or v12(502 - (444 + 58));
local v65 = v13.Commons.Everyone;
local v66 = v13.Commons.Monk;
local v67 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\97\216\56\249\82\121\233", "\152\38\189\86\156\32\24\133")]=v13.GUISettings.General,[LUAOBFUSACTOR_DECRYPT_STR_0("\223\88\170\75\243\89\180", "\38\156\55\199")]=v13.GUISettings.APL.Monk.Commons,[LUAOBFUSACTOR_DECRYPT_STR_0("\159\116\114\44\4\117\246\72\173\111", "\35\200\29\28\72\115\20\154")]=v13.GUISettings.APL.Monk.Windwalker};
v3:RegisterForEvent(function()
	v61 = 0 + 0;
	v27 = 1912 + 9199;
	v28 = 5432 + 5679;
end, LUAOBFUSACTOR_DECRYPT_STR_0("\41\147\240\230\168\30\11\43\154\246\250\163\19\17\55\158\243\243\168\8", "\84\121\223\177\191\237\76"));
v3:RegisterForEvent(function()
	v37 = ((v21.Serenity:IsAvailable()) and (2 - 1)) or (1734 - (64 + 1668));
end, LUAOBFUSACTOR_DECRYPT_STR_0("\136\102\236\140\22\99\15\226\147\119\231\135\31\116", "\161\219\54\169\192\90\48\80"), LUAOBFUSACTOR_DECRYPT_STR_0("\101\103\33\23\103\103\36\26\122\114\37\9\101\125\41\11\118\118\33\7", "\69\41\34\96"));
v3:RegisterForEvent(function()
	v62 = v7:GetEquipment();
	v63 = (v62[1986 - (1227 + 746)] and v12(v62[39 - 26])) or v12(0 - 0);
	v64 = (v62[508 - (415 + 79)] and v12(v62[1 + 13])) or v12(491 - (142 + 349));
	v38 = v7:IsInDungeonArea();
	v39 = (v22.NeltharionsCalltoDominance:IsEquipped() or v22.AshesoftheEmbersoul:IsEquipped() or v22.MirrorofFracturedTomorrows:IsEquipped() or v22.WitherbarksBranch:IsEquipped()) and not v38;
end, LUAOBFUSACTOR_DECRYPT_STR_0("\140\239\246\51\39\25\131\230\230\63\43\27\145\230\249\62\61\8\148\226\249\45\39\15", "\75\220\163\183\106\98"));
v3:RegisterForEvent(function()
	v38 = v7:IsInDungeonArea();
	v39 = (v22.NeltharionsCalltoDominance:IsEquipped() or v22.AshesoftheEmbersoul:IsEquipped() or v22.MirrorofFracturedTomorrows:IsEquipped() or v22.WitherbarksBranch:IsEquipped()) and not v38;
end, LUAOBFUSACTOR_DECRYPT_STR_0("\56\149\165\18\230\33\146\170\25\254\39\158\180\25\252\53\133\170\5\252\35", "\185\98\218\235\87"));
local function v68()
	return math.floor((v7:EnergyTimeToMaxPredicted() * (5 + 5)) + (0.5 - 0)) / (5 + 5);
end
local function v69()
	return math.floor(v7:EnergyPredicted() + 0.5 + 0);
end
local function v70(v119)
	return not v7:PrevGCD(2 - 1, v119);
end
local function v71()
	if not v21.MarkoftheCrane:IsAvailable() then
		return 1864 - (1710 + 154);
	end
	local v120 = 318 - (200 + 118);
	for v161, v162 in v20(v25) do
		if v162:DebuffUp(v21.MarkoftheCraneDebuff) then
			v120 = v120 + 1 + 0;
		end
	end
	return v120;
end
local function v72(v121)
	if ((v121:IsInMeleeRange(17 - 7)) and (v121:GUID() == v6(LUAOBFUSACTOR_DECRYPT_STR_0("\198\51\50\245\219\165\221\57\53", "\202\171\92\71\134\190")):GUID())) then
		v54 = 1642563 - 535135;
		return true;
	elseif ((v121:IsInMeleeRange(9 + 1)) and (v67.Windwalker.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\8\212\56\135\26\214\45\152", "\232\73\161\76")) and (v121:GUID() ~= v8:GUID()) and not v53 and not string.find(v121:GUID(), 172878 + 1895)) then
		v54 = 537 + 462;
		return true;
	elseif ((v121:IsInMeleeRange(2 + 8)) and (v121:GUID() == v8:GUID())) then
		v55 = 232748 - 125320;
		return true;
	elseif ((v121:IsInMeleeRange(1260 - (363 + 887))) and not string.find(v121:GUID(), 305190 - 130417)) then
		return true325216;
	end
end
local function v73()
	if not v21.MarkoftheCrane:IsAvailable() then
		return 0 - 0;
	end
	local v122 = v71();
	local v123 = 1 + 0;
	local v124 = 0.18 - 0;
	if (v122 > (0 + 0)) then
		v123 = v123 * ((1665 - (674 + 990)) + (v122 * v124));
	end
	v123 = v123 * (1 + 0 + ((0.1 + 0) * v21.CraneVortex:TalentRank()));
	v123 = v123 * ((1 - 0) + ((1055.3 - (507 + 548)) * v18(v7:BuffUp(v21.KicksofFlowingMomentumBuff))));
	v123 = v123 * ((838 - (289 + 548)) + ((1818.05 - (821 + 997)) * v21.FastFeet:TalentRank()));
	return v123;
end
local function v74()
	if not v21.MarkoftheCrane:IsAvailable() then
		return true;
	end
	local v125 = v71();
	if ((v26 == v125) or (v125 >= (260 - (195 + 60)))) then
		return true;
	end
	return false;
end
local function v75()
	if not (v21.TouchofDeath:CooldownUp() or v7:BuffUp(v21.HiddenMastersForbiddenTouchBuff)) then
		return nil;
	end
	local v126, v127 = nil, nil;
	for v163, v164 in v20(v24) do
		if (not v164:IsFacingBlacklisted() and not v164:IsUserCycleBlacklisted() and (v164:AffectingCombat() or v164:IsDummy()) and ((v21.ImpTouchofDeath:IsAvailable() and (v164:HealthPercentage() <= (5 + 10))) or (v164:Health() < v7:Health())) and (not v127 or v5.CompareThis(LUAOBFUSACTOR_DECRYPT_STR_0("\182\216\90", "\126\219\185\34\61"), v164:Health(), v127))) then
			v126, v127 = v164, v164:Health();
		end
	end
	if (v126 and (v126 == v8)) then
		if not v21.TouchofDeath:IsReady() then
			return nil;
		end
	end
	return v126;
end
local function v76()
	local v128, v129 = nil, nil;
	for v165, v166 in v20(v25) do
		if (not v166:IsFacingBlacklisted() and not v166:IsUserCycleBlacklisted() and (v166:AffectingCombat() or v166:IsDummy()) and (not v129 or v5.CompareThis(LUAOBFUSACTOR_DECRYPT_STR_0("\1\207\70", "\135\108\174\62\18\30\23\147"), v166:TimeToDie(), v129))) then
			v128, v129 = v166, v166:TimeToDie();
		end
	end
	return v128;
end
local function v77(v130)
	if ((v130:IsInMeleeRange(1511 - (251 + 1250))) and (v130:GUID() == v6(LUAOBFUSACTOR_DECRYPT_STR_0("\187\230\63\216\29\161\37\194\164", "\167\214\137\74\171\120\206\83")):GUID())) then
		v54 = 3224852 - 2124068;
		return true;
	elseif ((v130:IsInMeleeRange(7 + 3)) and (v67.Windwalker.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\170\229\38\82\203\176\138\224", "\199\235\144\82\61\152")) and (v130:GUID() ~= v8:GUID()) and not v53) then
		v54 = 2031 - (809 + 223);
		return true;
	elseif ((v130:IsInMeleeRange(14 - 4)) and (v130:GUID() == v8:GUID())) then
		v55 = 302667 - 201883;
		return true;
	elseif (v130:IsInMeleeRange(33 - 23)) then
		return true;
	end
end
local function v78(v131)
	if ((v131:IsInMeleeRange(8 + 2)) and (v131:GUID() == v6(LUAOBFUSACTOR_DECRYPT_STR_0("\10\25\172\56\2\25\175\46\21", "\75\103\118\217")):GUID())) then
		v54 = 576415 + 524365;
		return true;
	elseif ((v131:IsInMeleeRange(627 - (14 + 603))) and (v67.Windwalker.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\230\65\100\27\138\9\198\68", "\126\167\52\16\116\217")) and (v131:GUID() ~= v8:GUID()) and not v53 and not string.find(v131:GUID(), 174902 - (118 + 11))) then
		v54 = 162 + 837;
		return true;
	elseif ((v131:IsInMeleeRange(9 + 1)) and (v131:GUID() == v8:GUID())) then
		v55 = 293702 - 192922;
		return true;
	elseif ((v131:IsInMeleeRange(959 - (551 + 398))) and not string.find(v131:GUID(), 110452 + 64321)) then
		return true;
	end
end
local function v79(v132)
	return v132:DebuffRemains(v21.MarkoftheCraneDebuff);
end
local function v80(v133)
	return v133:DebuffRemains(v21.MarkoftheCraneDebuff) + (v18(v133:DebuffUp(v21.SkyreachExhaustionDebuff)) * (8 + 12));
end
local function v81(v134)
	return v134:DebuffRemains(v21.MarkoftheCraneDebuff) + (v18(v8:DebuffDown(v21.SkyreachExhaustionDebuff)) * (17 + 3));
end
local function v82(v135)
	return v135:DebuffRemains(v21.MarkoftheCraneDebuff) - (v18(v74()) * (v135:TimeToDie() + (v135:DebuffRemains(v21.SkyreachCritDebuff) * (74 - 54))));
end
local function v83(v136)
	return v136:DebuffRemains(v21.JadefireBrandDebuff);
end
local function v84(v137)
	return v137:TimeToDie();
end
local function v85(v138)
	return v138:DebuffRemains(v21.SkyreachCritDebuff);
end
local function v86(v139)
	return v139:DebuffRemains(v21.JadefireBrandDebuff);
end
local function v87(v140)
	return v7:BuffUp(v21.PressurePointBuff) or (v140:DebuffRemains(v21.SkyreachExhaustionDebuff) > (126 - 71));
end
local function v88(v141)
	return v7:BuffUp(v21.KicksofFlowingMomentumBuff) or v7:BuffUp(v21.PressurePointBuff) or (v141:DebuffRemains(v21.SkyreachExhaustionDebuff) > (18 + 37));
end
local function v89(v142)
	return v142:DebuffRemains(v21.SkyreachExhaustionDebuff) > v7:BuffRemains(v21.CalltoDominanceBuff);
end
local function v90(v143)
	return v143:DebuffRemains(v21.SkyreachExhaustionDebuff) > (218 - 163);
end
local function v91()
	if (v21.SummonWhiteTigerStatue:IsCastable() and v15()) then
		if v16(v21.SummonWhiteTigerStatue, nil, nil, not v8:IsInRange(12 + 28)) then
			v55 = 388775 - (40 + 49);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\219\59\45\141\187\23\195\223\38\41\148\177\38\232\193\41\37\146\139\10\232\201\58\53\133\244\9\238\205\45\47\141\182\24\232\136\124", "\156\168\78\64\224\212\121");
		end
	end
	if (v21.ExpelHarm:IsReady() and (v7:Chi() < v7:ChiMax())) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(30 - 22)) then
			v55 = 322591 - (99 + 391);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\2\246\181\203\11\209\173\207\21\227\229\222\21\235\166\193\10\236\164\218\71\186", "\174\103\142\197");
		end
	end
	if (v21.ChiBurst:IsReady() and not v21.JadefireStomp:IsAvailable()) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(34 + 6)) then
			v55 = 545036 - 421050;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\85\32\86\7\39\75\234\69\60\31\40\55\91\251\89\37\93\57\49\30\174", "\152\54\72\63\88\69\62");
		end
	end
	if v21.ChiWave:IsReady() then
		if v16(v21.ChiWave, nil, nil, not v8:IsInRange(99 - 59)) then
			v55 = 112115 + 2983;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\215\204\231\99\195\197\248\89\148\212\252\89\215\203\227\94\213\208\174\4", "\60\180\164\142");
		end
	end
end
local function v92(v144, v145)
	if (v144:IsEquippedAndReady() and v145) then
		if v13.Cast(v144, nil, nil) then
			if (v144:ID() == v58) then
				v55 = 62 - 38;
				return v144:Name() .. LUAOBFUSACTOR_DECRYPT_STR_0("\24\74\10\57", "\114\56\62\101\73\71\141");
			elseif (v144:ID() == v59) then
				v55 = 1639 - (1032 + 572);
				return v144:Name() .. LUAOBFUSACTOR_DECRYPT_STR_0("\248\235\212\212", "\164\216\137\187");
			end
		end
	end
end
local function v93()
	if (v67.Commons.Enabled.TopTrinket or v67.Commons.Enabled.BotTrinket) then
		v92(v22.ManicGrieftorch, true);
	end
	if (v37 == (418 - (203 + 214))) then
		if (v67.Commons.Enabled.TopTrinket or v67.Commons.Enabled.BotTrinket) then
			v92(v22.AlgetharPuzzleBox, ((v29 or not v21.InvokeXuenTheWhiteTiger:IsAvailable()) and v7:BuffDown(v21.SerenityBuff)) or (v28 < (1842 - (568 + 1249))));
			v92(v22.EruptingSpearFragment, (v7:BuffUp(v21.SerenityBuff)));
			v92(v22.ManicGrieftorch, (v7:BuffDown(v21.SerenityBuff) and not v29) or ((v63:HasUseBuff() or v64:HasUseBuff()) and (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (24 + 6)) and v21.Serenity:CooldownDown()) or (v28 < (12 - 7)));
			v92(v22.BeacontotheBeyond, (v7:BuffDown(v21.SerenityBuff) and not v29) or ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (115 - 85)) and v21.Serenity:CooldownDown()) or (v28 < (1316 - (913 + 393))));
		end
		if (v67.Commons.Enabled.TopTrinket or v67.Commons.Enabled.BotTrinket) then
			v92(v22.DragonfireBombDispenser, ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (28 - 18)) and v21.Serenity:CooldownDown()) or (v28 < (14 - 4)));
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\230\195\2\134\231", "\107\178\134\81\210\198\158"));
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\58\27\132\192", "\202\88\110\226\166"), v15() and (((v29 or not v21.InvokeXuenTheWhiteTiger:IsAvailable()) and v7:BuffUp(v21.SerenityBuff)) or (v28 < (435 - (269 + 141)))));
			local v173 = v7:GetUseableTrinkets(v23);
			v173 = v7:GetUseableTrinkets(v23);
			if (v173 and v15() and (((v29 or not v21.InvokeXuenTheWhiteTiger:IsAvailable()) and v7:BuffUp(v21.SerenityBuff)) or (v28 < (55 - 30)))) then
				if v173 then
					if v13.Cast(v173, nil, nil) then
						if ((v173:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\211\3\131\238\207\209", "\170\163\111\226\151"), 1994 - (362 + 1619))) and v67.Commons.Enabled.TopTrinket) then
							v55 = 1649 - (950 + 675);
							return LUAOBFUSACTOR_DECRYPT_STR_0("\54\53\188\61\92\62\42\81\37\161\61\113\62\61\20\61\161\120\72\56\59\81", "\73\113\80\210\88\46\87") .. v173:Name();
						elseif ((v173:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\145\32\204\11\226\147", "\135\225\76\173\114"), 6 + 8)) and v67.Commons.Enabled.BottomTrinket) then
							v55 = 1214 - (216 + 963);
							return LUAOBFUSACTOR_DECRYPT_STR_0("\61\232\182\181\190\180\164\90\248\171\181\147\180\179\31\224\171\240\170\178\181\90", "\199\122\141\216\208\204\221") .. v173:Name();
						end
					end
				end
			end
			local v173 = v7:GetUseableTrinkets(v23);
			v173 = v7:GetUseableTrinkets(v23);
			if (v173 and v15() and (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (1317 - (485 + 802))) and v21.Serenity:CooldownDown()) then
				if v173 then
					if v13.Cast(v173, nil, nil) then
						if ((v173:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\189\209\17\233\125\228", "\150\205\189\112\144\24"), 572 - (432 + 127))) and v67.Commons.Enabled.TopTrinket) then
							v55 = 1097 - (1065 + 8);
							return LUAOBFUSACTOR_DECRYPT_STR_0("\2\129\177\73\22\129\18\80\48\151\186\115\13\156\20\29\54\196\185\67\22\200", "\112\69\228\223\44\100\232\113") .. v173:Name();
						elseif ((v173:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\196\19\6\202\179\110", "\230\180\127\103\179\214\28"), 8 + 6)) and v67.Commons.Enabled.BottomTrinket) then
							v55 = 1636 - (635 + 966);
							return LUAOBFUSACTOR_DECRYPT_STR_0("\171\0\81\67\246\72\227\204\16\76\67\219\72\244\137\8\76\6\226\78\242\204", "\128\236\101\63\38\132\33") .. v173:Name();
						end
					end
				end
			end
		end
	else
		if (v67.Commons.Enabled.TopTrinket or v67.Commons.Enabled.BotTrinket) then
			v92(v22.AlgetharPuzzleBox, ((v29 or not v21.InvokeXuenTheWhiteTiger:IsAvailable()) and v7:BuffDown(v21.StormEarthAndFireBuff)) or (v28 < (18 + 7)));
			v92(v22.EruptingSpearFragment, v7:BuffUp(v21.InvokersDelightBuff));
			v92(v22.ManicGrieftorch, not v29 or ((v63:HasUseBuff() or v64:HasUseBuff()) and (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (72 - (5 + 37)))) or (v28 < (12 - 7)));
			v92(v22.BeacontotheBeyond, (v7:BuffDown(v21.StormEarthAndFireBuff) and not v29) or (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (13 + 17)) or (v28 < (15 - 5)));
		end
		if (v67.Commons.Enabled.TopTrinket or v67.Commons.Enabled.BotTrinket) then
			v92(v22.DragonfireBombDispenser, ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (5 + 5)) and v21.Serenity:CooldownDown()) or (v28 < (20 - 10)));
			local v174 = v7:GetUseableTrinkets(v23);
			v174 = v7:GetUseableTrinkets(v23);
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\152\140\34\112\247", "\175\204\201\113\36\214\139"));
			if (v174 and v15() and (((v29 or not v21.InvokeXuenTheWhiteTiger:IsAvailable()) and v7:BuffUp(v21.StormEarthAndFireBuff)) or (v28 < (94 - 69)))) then
				if v174 then
					if v13.Cast(v174, nil, nil) then
						if ((v174:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\87\192\52\197\1\85", "\100\39\172\85\188"), 24 - 11)) and v67.Commons.Enabled.TopTrinket) then
							v55 = 57 - 33;
							return LUAOBFUSACTOR_DECRYPT_STR_0("\138\125\183\133\33\164\123\249\149\32\168\71\176\148\54\160\107\249\134\60\191\56", "\83\205\24\217\224") .. v174:Name();
						elseif ((v174:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\246\201\204\36\227\215", "\93\134\165\173"), 11 + 3)) and v67.Commons.Enabled.BottomTrinket) then
							v55 = 564 - (318 + 211);
							return LUAOBFUSACTOR_DECRYPT_STR_0("\153\247\207\199\40\199\177\62\171\225\196\253\51\218\183\115\173\178\199\205\40\142", "\30\222\146\161\162\90\174\210") .. v174:Name();
						end
					end
				end
			end
			local v174 = v7:GetUseableTrinkets(v23);
			v174 = v7:GetUseableTrinkets(v23);
			if (v174 and v15() and (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (147 - 117))) then
				if v174 then
					if v13.Cast(v174, nil, nil) then
						if ((v174:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\245\66\113\19\224\92", "\106\133\46\16"), 1600 - (963 + 624))) and v67.Commons.Enabled.TopTrinket) then
							v55 = 11 + 13;
							return LUAOBFUSACTOR_DECRYPT_STR_0("\127\37\125\249\72\73\91\96\102\239\95\127\81\52\118\241\73\0\94\47\97\188", "\32\56\64\19\156\58") .. v174:Name();
						elseif ((v174:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\74\196\228\79\95\224", "\224\58\168\133\54\58\146"), 860 - (518 + 328))) and v67.Commons.Enabled.BottomTrinket) then
							v55 = 81 - 46;
							return LUAOBFUSACTOR_DECRYPT_STR_0("\126\83\69\248\103\143\132\75\76\69\78\194\124\146\130\6\74\22\77\242\103\198", "\107\57\54\43\157\21\230\231") .. v174:Name();
						end
					end
				end
			end
		end
	end
end
local function v94()
	local v146 = v7:GetUseableTrinkets(v23);
	v146 = v7:GetUseableTrinkets(v23);
	if v146 then
		if v13.Cast(v146, nil, nil) then
			if ((v146:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\203\135\16\236\188\206", "\175\187\235\113\149\217\188"), 19 - 6)) and v67.Commons.Enabled.TopTrinket) then
				v55 = 341 - (301 + 16);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\27\170\143\73\241\112\123\124\186\146\73\220\112\108\57\162\146\12\229\118\106\124", "\24\92\207\225\44\131\25") .. v146:Name();
			elseif ((v146:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\91\223\185\85\30\111", "\29\43\179\216\44\123"), 41 - 27)) and v67.Commons.Enabled.BottomTrinket) then
				v55 = 98 - 63;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\154\220\46\73\175\208\35\12\168\202\37\115\180\205\37\65\174\153\38\67\175\153", "\44\221\185\64") .. v146:Name();
			end
		end
	end
end
local function v95()
	if (v21.SummonWhiteTigerStatue:IsCastable() and v15()) then
		if v16(v21.SummonWhiteTigerStatue, nil, nil, not v8:IsInRange(104 - 64)) then
			v55 = 352067 + 36619;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\18\242\69\82\124\15\216\95\87\122\21\226\119\75\122\6\226\90\96\96\21\230\92\74\118\65\232\88\90\125\4\245\8\13", "\19\97\135\40\63");
		end
	end
	if (v21.ExpelHarm:IsReady() and v21.ChiBurst:IsAvailable() and (v7:ChiDeficit() >= (2 + 1))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(16 - 8)) then
			v55 = 193780 + 128321;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\171\68\35\62\35\14\166\93\33\54\111\62\190\89\61\62\61\113\250", "\81\206\60\83\91\79");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1 + 1)) and v8:DebuffDown(v21.SkyreachExhaustionDebuff)) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInMeleeRange(15 - 10)) then
			v55 = 32528 + 68252;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\90\162\215\119\61\252\93\165\66\166\144\125\63\198\67\161\92\235\134", "\196\46\203\176\18\79\163\45");
		end
	end
	if (v21.ExpelHarm:IsReady() and v21.ChiBurst:IsAvailable() and (v7:Chi() == (1022 - (829 + 190)))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(28 - 20)) then
			v55 = 407567 - 85466;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\189\58\110\27\40\196\231\185\48\115\94\43\235\234\182\39\108\94\124", "\143\216\66\30\126\68\155");
		end
	end
	if (v21.ChiWave:IsReady() and (v7:ChiDeficit() >= (2 - 0))) then
		if v16(v21.ChiWave, nil, nil, not v8:IsInRange(99 - 59)) then
			v55 = 27278 + 87820;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\192\4\244\210\162\193\228\234\199\29\206\203\166\197\161\251\152", "\129\202\168\109\171\165\195\183");
		end
	end
	if v21.ExpelHarm:IsReady() then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(3 + 5)) then
			v55 = 977679 - 655578;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\39\64\39\221\210\43\238\35\74\58\152\209\4\227\44\93\37\152\143\70", "\134\66\56\87\184\190\116");
		end
	end
	if (v21.ChiBurst:IsReady() and (v7:Chi() > (1 + 0)) and (v7:ChiDeficit() >= (615 - (520 + 93)))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(316 - (259 + 17))) then
			v55 = 7142 + 116844;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\57\0\132\27\254\51\38\40\113\6\171\28\229\36\39\124\96\93", "\85\92\81\105\219\121\139\65");
		end
	end
end
local function v96()
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and (v26 > (2 + 1))) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\240\178\72", "\191\157\211\48\37\28"), v85, nil, not v8:IsInMeleeRange(30 - 21)) then
			v55 = 393574 - (396 + 195);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\204\11\230\21\49\218\32\251\26\5\203\23\241\35\45\214\17\240\16\53\205\27\180\30\62\221\32\231\25\46\202\15\180\78", "\90\191\127\148\124");
		end
	end
	if (v21.BonedustBrew:IsCastable() and v74() and (v7:Chi() >= (11 - 7))) then
		if v16(v21.BonedustBrew, nil, nil, not v8:IsInRange(1801 - (440 + 1321))) then
			v55 = 388105 - (1059 + 770);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\122\136\32\18\124\146\61\3\71\133\60\18\111\199\44\19\122\184\61\18\108\146\62\87\44", "\119\24\231\78");
		end
	end
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v7:ChiDeficit() >= (9 - 7)) and v7:BuffUp(v21.StormEarthAndFireBuff)) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\143\36\171", "\113\226\77\197\42\188\32"), v80, nil, not v8:IsInMeleeRange(550 - (424 + 121))) then
			v55 = 18370 + 82410;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\46\31\243\176\40\41\228\180\54\27\180\183\62\20\203\166\63\2\225\165\122\64", "\213\90\118\148");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and not v21.WhirlingDragonPunch:IsAvailable() and not v74()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\86\39\186", "\45\59\78\212\54"), v82, v77, not v8:IsInMeleeRange(1352 - (641 + 706))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\18\90\130\136\141\33\184\228\47\93\138\136\141\110\175\244\18\105\144\142\146\59\189\176\72", "\144\112\54\227\235\230\78\205");
		end
	end
	if (v21.RisingSunKick:IsReady() and v70(v21.RisingSunKick) and (v7:Chi() >= (2 + 3)) and v21.WhirlingDragonPunch:IsAvailable()) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\190\33\1", "\59\211\72\111\156\176"), v82, v72, not v8:IsInMeleeRange(445 - (249 + 191))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\92\142\240\36\64\128\220\62\91\137\220\38\71\132\232\109\76\131\225\18\93\130\247\56\94\199\178\125", "\77\46\231\131");
		end
	end
	if (v21.RisingSunKick:IsReady() and v70(v21.RisingSunKick) and (v26 >= (8 - 6)) and v21.WhirlingDragonPunch:IsAvailable()) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\183\93\184", "\32\218\52\214"), v82, v72, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\92\30\34\161\255\183\122\73\91\25\14\163\248\179\78\26\76\19\51\151\226\181\81\79\94\87\96\250", "\58\46\119\81\200\145\208\37");
		end
	end
end
local function v97()
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and ((not v31 and (v8:TimeToDie() > (96 - 71)) and v21.BonedustBrew:IsAvailable() and (v21.BonedustBrew:CooldownRemains() <= (432 - (183 + 244))) and (((v26 < (1 + 2)) and (v7:Chi() >= (733 - (434 + 296)))) or ((v26 >= (9 - 6)) and (v7:Chi() >= (514 - (169 + 343)))))) or (v28 < (22 + 3)))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(70 - 30)) then
			v55 = 363689 - 239785;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\34\130\38\163\162\184\9\51\153\53\162\150\169\62\46\179\39\164\160\169\51\20\152\57\171\172\175\118\40\136\15\191\172\187\118\127", "\86\75\236\80\204\201\221");
		end
	end
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and (v8:TimeToDie() > (21 + 4)) and (v28 > (340 - 220)) and (((v63:ID() ~= v22.AshesoftheEmbersoul:ID()) and (v63:ID() ~= v22.WitherbarksBranch:ID()) and (v64:ID() ~= v22.AshesoftheEmbersoul:ID()) and (v64:ID() ~= v22.WitherbarksBranch:ID())) or (((v63:ID() == v22.AshesoftheEmbersoul:ID()) or (v63:ID() == v22.WitherbarksBranch:ID())) and not (v63:CooldownRemains() > (1123 - (651 + 472)))) or (((v64:ID() == v22.AshesoftheEmbersoul:ID()) or (v64:ID() == v22.WitherbarksBranch:ID())) and not (v64:CooldownRemains() > (0 + 0))))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(18 + 22)) then
			v55 = 151219 - 27315;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\123\79\97\138\245\142\77\89\98\128\240\180\102\73\114\186\233\131\123\85\114\186\234\130\117\68\101\197\253\143\77\82\114\131\190\221", "\235\18\33\23\229\158");
		end
	end
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and (v28 < (543 - (397 + 86))) and ((v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (878 - (423 + 453))) or (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (6 + 49))) and (v26 < (1 + 2))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(35 + 5)) then
			v55 = 98883 + 25021;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\180\215\180\91\191\254\163\69\191\207\132\68\178\196\132\71\178\200\175\85\133\213\178\87\191\211\251\83\190\254\168\85\188\129\236", "\219\48\218\161");
		end
	end
	if (v21.StormEarthAndFire:IsCastable() and v21.BonedustBrew:IsAvailable() and (((v28 < (27 + 3)) and (v21.BonedustBrew:CooldownRemains() < (1194 - (50 + 1140))) and (v7:Chi() >= (4 + 0))) or v7:BuffUp(v21.BonedustBrewBuff) or (not v74() and (v26 >= (2 + 1)) and (v21.BonedustBrew:CooldownRemains() <= (1 + 1)) and (v7:Chi() >= (2 - 0)))) and (v29 or (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > v21.StormEarthAndFire:FullRechargeTime()))) then
		if v16(v21.StormEarthAndFire, nil) then
			v55 = 99592 + 38047;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\247\101\115\91\214\112\229\229\99\104\65\228\78\238\224\78\122\64\201\74\160\231\117\67\90\222\73\160\188", "\128\132\17\28\41\187\47");
		end
	end
	if (v21.StormEarthAndFire:IsCastable() and not v21.BonedustBrew:IsAvailable() and (v29 or ((v8:TimeToDie() > (611 - (157 + 439))) and (v21.StormEarthAndFire:FullRechargeTime() < v21.InvokeXuenTheWhiteTiger:CooldownRemains())))) then
		if v16(v21.StormEarthAndFire, nil) then
			v55 = 239337 - 101698;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\18\38\9\40\80\62\55\7\40\73\9\13\7\52\89\62\52\15\40\88\65\49\2\5\78\4\52\70\107\13", "\61\97\82\102\90");
		end
	end
	if (v21.BonedustBrew:IsCastable() and ((v7:BuffDown(v21.BonedustBrewBuff) and v7:BuffUp(v21.StormEarthAndFireBuff) and (v7:BuffRemains(v21.StormEarthAndFireBuff) < (36 - 25)) and v74()) or (v7:BuffDown(v21.BonedustBrewBuff) and (v28 < (88 - 58)) and (v28 > (928 - (782 + 136))) and v74() and (v7:Chi() >= (859 - (112 + 743)))) or (v28 < (1181 - (1026 + 145))) or (v8:DebuffDown(v21.SkyreachExhaustionDebuff) and (v26 >= (1 + 3)) and (v73() >= (720 - (493 + 225)))) or (v29 and v74() and (v26 >= (14 - 10))))) then
		if v16(v21.BonedustBrew, nil, nil, not v8:IsInRange(25 + 15)) then
			v55 = 1035649 - 649373;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\174\33\165\78\195\66\13\29\147\44\185\78\208\23\29\13\147\61\174\77\135\6\76", "\105\204\78\203\43\167\55\126");
		end
	end
	if (v7:BuffDown(v21.BonedustBrewBuff) and v21.BonedustBrew:IsAvailable() and (v21.BonedustBrew:CooldownRemains() <= (1 + 1)) and (((v28 > (171 - 111)) and ((v21.StormEarthAndFire:Charges() > (0 + 0)) or (v21.StormEarthAndFire:CooldownRemains() > (16 - 6))) and (v29 or (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (1605 - (210 + 1385))) or v31)) or ((v29 or (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (1702 - (1201 + 488)))) and ((v21.StormEarthAndFire:Charges() > (0 + 0)) or (v21.StormEarthAndFire:CooldownRemains() > (22 - 9)) or v7:BuffUp(v21.StormEarthAndFireBuff))))) then
		local v168 = v96();
		if v168 then
			return v168;
		end
	end
	if (v21.StormEarthAndFire:IsCastable() and ((v28 < (35 - 15)) or ((v21.StormEarthAndFire:Charges() == (587 - (352 + 233))) and (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > v21.StormEarthAndFire:FullRechargeTime()) and (v21.FistsofFury:CooldownRemains() <= (21 - 12)) and (v7:Chi() >= (2 + 0)) and (v21.WhirlingDragonPunch:CooldownRemains() <= (34 - 22))))) then
		if v16(v21.StormEarthAndFire, nil) then
			v55 = 138213 - (489 + 85);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\182\190\44\12\30\59\194\80\183\190\43\33\18\10\195\110\163\163\49\27\83\7\195\110\182\175\37\94\66\80", "\49\197\202\67\126\115\100\167");
		end
	end
	if v21.TouchofDeath:CooldownUp() then
		local v169 = nil;
		if v14() then
			v169 = v75();
		elseif v21.TouchofDeath:IsReady() then
			v169 = v8;
		end
		if v169 then
			if ((v38 and v7:BuffDown(v21.SerenityBuff) and v70(v21.TouchofDeath) and (v169:Health() < v7:Health())) or (v7:BuffRemains(v21.HiddenMastersForbiddenTouchBuff) < (1503 - (277 + 1224))) or (v7:BuffRemains(v21.HiddenMastersForbiddenTouchBuff) > v169:TimeToDie())) then
				if (v169:GUID() == v8:GUID()) then
					if v16(v21.TouchofDeath, v67.Windwalker.GCDasOffGCD.TouchOfDeath, nil, not v8:IsInMeleeRange(1498 - (663 + 830))) then
						v55 = 282929 + 39180;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\35\84\202\42\136\105\81\49\100\219\44\129\66\86\119\88\219\22\147\83\88\119\86\222\32\142\27\74\54\73\216\44\148\22\15\97", "\62\87\59\191\73\224\54");
					end
				end
			end
		end
		if (v169 and v70(v21.TouchofDeath)) then
			if v38 then
				if ((v169:TimeToDie() > (146 - 86)) or v169:DebuffUp(v21.BonedustBrewDebuff) or (v28 < (885 - (461 + 414)))) then
					if (v169:GUID() == v8:GUID()) then
						if v16(v21.TouchofDeath, v67.Windwalker.GCDasOffGCD.TouchOfDeath, nil, not v8:IsInMeleeRange(1 + 4)) then
							v55 = 128875 + 193234;
							return LUAOBFUSACTOR_DECRYPT_STR_0("\243\13\239\202\239\61\245\207\216\6\255\200\243\10\186\202\227\61\233\204\225\66\247\200\238\12\183\221\230\16\253\204\243\66\171\145", "\169\135\98\154");
						end
					end
				end
			elseif (v169:GUID() == v8:GUID()) then
				if v16(v21.TouchofDeath, v67.Windwalker.GCDasOffGCD.TouchOfDeath, nil, not v8:IsInMeleeRange(1 + 4)) then
					v55 = 317545 + 4564;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\223\120\49\87\245\12\199\205\72\32\81\252\39\192\139\116\32\107\238\54\206\139\122\37\93\243\126\220\202\101\35\81\233\115\154\155", "\168\171\23\68\52\157\83");
				end
			end
		end
	end
	if (v21.TouchofKarma:IsCastable() and not v67.Windwalker.IgnoreToK and ((v21.InvokeXuenTheWhiteTiger:IsAvailable() and ((v28 > (340 - (172 + 78))) or v29 or v31 or (v28 < (25 - 9)))) or (not v21.InvokeXuenTheWhiteTiger:IsAvailable() and ((v28 > (59 + 100)) or v31)))) then
		if v16(v21.TouchofKarma, nil, nil, not v8:IsInRange(28 - 8)) then
			v55 = 33398 + 89072;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\224\126\224\174\45\18\136\242\78\254\172\55\32\134\180\114\241\146\54\40\129\180\35\167", "\231\148\17\149\205\69\77");
		end
	end
	if (v21.AncestralCall:IsCastable() and ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (11 + 19)) or v31 or (v28 < (33 - 13)))) then
		if v16(v21.AncestralCall, nil) then
			v55 = 345836 - 71098;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\129\169\196\254\68\235\146\166\203\196\84\254\140\171\135\248\83\192\147\162\193\187\5\171", "\159\224\199\167\155\55");
		end
	end
	if (v21.BloodFury:IsCastable() and ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (8 + 22)) or v31 or (v28 < (12 + 8)))) then
		if v16(v21.BloodFury, nil) then
			v55 = 7323 + 13249;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\245\255\51\221\243\204\58\199\229\234\124\209\243\204\47\215\241\179\110\132", "\178\151\147\92");
		end
	end
	if (v21.Fireblood:IsCastable() and ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (119 - 89)) or v31 or (v28 < (23 - 13)))) then
		if v16(v21.Fireblood, nil) then
			v55 = 81329 + 183892;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\138\244\94\55\16\64\117\131\249\12\49\22\115\105\137\251\12\96\74", "\26\236\157\44\82\114\44");
		end
	end
	if (v21.Berserking:IsCastable() and ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (18 + 12)) or v31 or (v28 < (462 - (133 + 314))))) then
		if v16(v21.Berserking, nil) then
			v55 = 4572 + 21725;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\40\43\199\72\47\60\222\82\36\41\149\88\46\17\198\94\44\110\134\11", "\59\74\78\181");
		end
	end
	if (v21.BagofTricks:IsCastable() and (v7:BuffDown(v21.StormEarthAndFireBuff))) then
		if v16(v21.BagofTricks, nil) then
			v55 = 312624 - (199 + 14);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\39\208\93\101\188\35\238\78\72\186\38\218\73\26\176\33\238\73\95\181\101\130\8", "\211\69\177\58\58");
		end
	end
	if v21.LightsJudgment:IsCastable() then
		if v16(v21.LightsJudgment, nil) then
			v55 = 915172 - 659525;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\187\236\126\253\253\216\136\239\108\241\238\198\178\235\109\181\234\207\136\246\124\243\169\152\227", "\171\215\133\25\149\137");
		end
	end
end
local function v98()
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and (((v8:TimeToDie() > (1565 - (647 + 902))) and not v31 and v21.BonedustBrew:IsAvailable() and (v21.BonedustBrew:CooldownRemains() <= (2 - 1))) or v7:BloodlustUp() or (v28 < (258 - (85 + 148))))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(1329 - (426 + 863))) then
			v55 = 579887 - 455983;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\232\198\36\245\228\53\195\90\244\205\60\197\251\56\249\125\246\192\59\238\234\15\232\75\230\205\32\186\236\52\195\81\228\218\55\244\230\36\229\2\179", "\34\129\168\82\154\143\80\156");
		end
	end
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and ((v8:TimeToDie() > (1670 - (873 + 781))) or (v38 and (v21.Serenity:CooldownRemains() < (2 - 0)))) and (v28 > (324 - 204)) and (((v63:ID() ~= v22.AshesoftheEmbersoul:ID()) and (v63:ID() ~= v22.WitherbarksBranch:ID()) and (v64:ID() ~= v22.AshesoftheEmbersoul:ID()) and (v64:ID() ~= v22.WitherbarksBranch:ID())) or (((v63:ID() == v22.AshesoftheEmbersoul:ID()) or (v63:ID() == v22.WitherbarksBranch:ID())) and not (v63:CooldownRemains() > (0 + 0))) or (((v64:ID() == v22.AshesoftheEmbersoul:ID()) or (v64:ID() == v22.WitherbarksBranch:ID())) and not (v64:CooldownRemains() > (0 - 0))))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(57 - 17)) then
			v55 = 367916 - 244012;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\140\188\37\4\67\75\182\157\167\54\5\119\90\129\128\141\36\3\65\90\140\186\166\58\12\77\92\201\134\182\12\24\77\92\140\139\187\39\18\8\26", "\233\229\210\83\107\40\46");
		end
	end
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and (v8:TimeToDie() > (1963 - (414 + 1533))) and (v28 < (53 + 7)) and ((v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (557 - (443 + 112))) or (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (1534 - (888 + 591)))) and v21.Serenity:CooldownUp() and (v26 < (7 - 4))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(3 + 37)) then
			v55 = 466669 - 342765;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\200\76\36\217\14\196\125\42\195\0\207\125\38\222\0\254\85\58\223\17\196\125\38\223\2\196\80\114\213\1\254\81\55\196\0\207\75\38\207\69\151", "\101\161\34\82\182");
		end
	end
	if (v21.InvokeXuenTheWhiteTiger:IsCastable() and v38 and v21.BonedustBrew:IsAvailable() and (v8:TimeToDie() > (7 + 9)) and v21.Serenity:CooldownUp() and (v21.BonedustBrew:CooldownRemains() < (1 + 1))) then
		if v16(v21.InvokeXuenTheWhiteTiger, nil, nil, not v8:IsInRange(5 + 35)) then
			v55 = 236115 - 112211;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\225\3\79\241\208\231\189\54\253\8\87\193\207\234\135\17\255\5\80\234\222\221\150\39\239\8\75\190\216\230\189\61\237\31\92\240\210\246\155\110\176", "\78\136\109\57\158\187\130\226");
		end
	end
	if (v21.BonedustBrew:IsCastable() and (v7:BuffUp(v21.InvokersDelightBuff) or (v7:BuffDown(v21.BonedustBrewBuff) and v21.InvokeXuenTheWhiteTiger:CooldownDown() and not v29) or (v21.Serenity:CooldownRemains() > (27 - 12)) or ((v28 < (1708 - (136 + 1542))) and (v28 > (32 - 22))) or (v28 < (10 + 0)))) then
		if v16(v21.BonedustBrew, nil, nil, not v8:IsInRange(63 - 23)) then
			v55 = 279549 + 106727;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\60\48\247\244\58\42\234\229\1\61\235\244\41\127\250\245\1\44\252\227\59\49\240\229\39\127\168\161", "\145\94\95\153");
		end
	end
	if (v21.Serenity:IsCastable() and ((v39 and (v7:BuffUp(v21.InvokersDelightBuff) or (v31 and ((v21.DrinkingHornCover:IsAvailable() and (v28 > (596 - (68 + 418)))) or (not v21.DrinkingHornCover:IsAvailable() and (v28 > (284 - 179))))))) or not v21.InvokeXuenTheWhiteTiger:IsAvailable() or (v28 < (27 - 12)))) then
		if v16(v21.Serenity, nil) then
			v55 = 131360 + 20813;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\238\200\6\208\64\190\233\212\84\214\74\136\238\200\6\208\64\190\233\212\84\132\28", "\215\157\173\116\181\46");
		end
	end
	if (v21.Serenity:IsCastable() and not v39 and (v7:BuffUp(v21.InvokersDelightBuff) or (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > v28) or ((v28 > (v21.InvokeXuenTheWhiteTiger:CooldownRemains() + (1102 - (770 + 322)))) and (v28 > (6 + 84))))) then
		if v16(v21.Serenity, nil) then
			v55 = 44011 + 108162;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\38\177\153\247\212\60\160\146\178\217\49\139\152\247\200\48\186\130\230\195\117\229\223", "\186\85\212\235\146");
		end
	end
	if v21.TouchofDeath:CooldownUp() then
		local v170 = nil;
		if v14() then
			v170 = v75();
		elseif v21.TouchofDeath:IsReady() then
			v170 = v8;
		end
		if v170 then
			if ((v38 and v7:BuffDown(v21.SerenityBuff) and v70(v21.TouchofDeath) and (v170:Health() < v7:Health())) or (v7:BuffRemains(v21.HiddenMastersForbiddenTouchBuff) < (1 + 1)) or (v7:BuffRemains(v21.HiddenMastersForbiddenTouchBuff) > v170:TimeToDie())) then
				if (v170:GUID() == v8:GUID()) then
					if v16(v21.TouchofDeath, v67.Windwalker.GCDasOffGCD.TouchOfDeath, nil, not v8:IsInMeleeRange(7 - 2)) then
						v55 = 624579 - 302470;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\214\142\3\253\49\209\87\196\190\18\251\56\250\80\130\130\18\193\42\235\94\130\140\23\247\55\163\76\195\147\17\251\45\174\9\148", "\56\162\225\118\158\89\142");
					end
				elseif v13.CastLeftNameplate(v170, v21.TouchofDeath) then
					v55 = 877293 - 555184;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\72\10\213\172\42\231\83\3\255\171\39\217\72\13\128\172\38\231\79\0\198\239\45\222\90\72\212\174\48\223\89\17\128\254\116", "\184\60\101\160\207\66");
				end
			end
		end
		if (v170 and v70(v21.TouchofDeath)) then
			if v38 then
				if (((v170:TimeToDie() > (220 - 160)) or v170:DebuffUp(v21.BonedustBrewDebuff) or (v28 < (6 + 4))) and v7:BuffDown(v21.SerenityBuff)) then
					if (v170:GUID() == v8:GUID()) then
						if v16(v21.TouchofDeath, v67.Windwalker.GCDasOffGCD.TouchOfDeath, nil, not v8:IsInMeleeRange(7 - 2)) then
							v55 = 154518 + 167591;
							return LUAOBFUSACTOR_DECRYPT_STR_0("\37\141\105\191\57\189\115\186\14\134\121\189\37\138\60\191\53\189\111\185\55\194\113\189\56\140\49\168\48\144\123\185\37\194\45\228", "\220\81\226\28");
						end
					elseif v13.CastLeftNameplate(v170, v21.TouchofDeath) then
						v55 = 197464 + 124645;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\7\218\151\248\226\248\28\211\189\255\239\198\7\221\194\248\238\248\0\208\132\187\229\193\21\152\150\250\248\192\22\193\194\170\178", "\167\115\181\226\155\138");
					end
				end
			elseif v7:BuffDown(v21.SerenityBuff) then
				if (v170:GUID() == v8:GUID()) then
					if v16(v21.TouchofDeath, v67.Windwalker.GCDasOffGCD.TouchOfDeath, nil, not v8:IsInMeleeRange(4 + 1)) then
						v55 = 1212940 - 890831;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\246\45\242\95\115\78\201\228\29\227\89\122\101\206\162\33\227\99\104\116\192\162\47\230\85\117\60\210\227\48\224\89\111\49\148\178", "\166\130\66\135\60\27\17");
					end
				elseif v13.CastLeftNameplate(v170, v21.TouchofDeath) then
					v55 = 447410 - 125301;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\80\69\219\118\56\123\69\200\74\52\65\75\218\125\112\71\78\241\102\53\66\10\193\115\54\9\94\207\103\55\65\94\142\39\96", "\80\36\42\174\21");
				end
			end
		end
	end
	if (not v67.Windwalker.IgnoreToK and v21.TouchofKarma:IsCastable() and ((v28 > (31 + 59)) or (v28 < (46 - 36)))) then
		if v16(v21.TouchofKarma, nil) then
			v55 = 404844 - 282374;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\90\31\34\121\70\47\56\124\113\27\54\104\67\17\119\121\74\47\36\127\92\21\57\115\90\9\119\40\28", "\26\46\112\87");
		end
	end
	if (v7:BuffUp(v21.SerenityBuff) or (v28 < (9 + 11))) then
		if v21.AncestralCall:IsCastable() then
			if v16(v21.AncestralCall, nil) then
				v55 = 1359498 - 1084760;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\184\45\168\113\172\171\87\181\181\28\168\117\179\179\5\183\189\28\184\113\173\186\75\189\173\58\235\38\235", "\212\217\67\203\20\223\223\37");
			end
		end
		if v21.BloodFury:IsCastable() then
			if v16(v21.BloodFury, nil) then
				v55 = 21403 - (762 + 69);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\184\129\167\221\190\178\174\199\168\148\232\209\190\178\187\215\168\136\166\219\174\148\232\128\236", "\178\218\237\200");
			end
		end
		if v21.Fireblood:IsCastable() then
			if v16(v21.Fireblood, nil) then
				v55 = 858814 - 593593;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\176\188\244\213\180\185\233\223\178\245\229\212\137\166\227\194\179\187\239\196\175\245\180\136", "\176\214\213\134");
			end
		end
		if v21.Berserking:IsCastable() then
			if v16(v21.Berserking, nil) then
				v55 = 22657 + 3640;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\246\168\164\199\173\68\82\253\163\177\148\171\82\102\231\168\164\209\166\95\77\237\237\229\132", "\57\148\205\214\180\200\54");
			end
		end
		if v21.BagofTricks:IsCastable() then
			if v16(v21.BagofTricks, nil) then
				v55 = 202262 + 110149;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\16\252\50\11\121\20\194\33\38\127\17\246\38\116\117\22\194\38\49\100\23\243\60\32\111\82\174\103", "\22\114\157\85\84");
			end
		end
	end
	if v21.LightsJudgment:IsCastable() then
		if v16(v21.LightsJudgment, nil) then
			v55 = 618340 - 362693;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\200\194\20\204\73\229\151\206\222\23\195\80\243\166\208\139\16\192\98\229\173\214\206\29\205\73\239\232\151\159", "\200\164\171\115\164\61\150");
		end
	end
end
local function v99()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1 + 0))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(1 + 29)) then
			v55 = 1512445 - 1124252;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\180\245\7\64\133\183\230\6\122\144\170\251\14\85\195\173\241\17\64\141\183\224\26\122\130\177\241\15\80\144\170\180\81", "\227\222\148\99\37");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v7:HasTier(188 - (8 + 149), 1324 - (1199 + 121)) and v21.Thunderfist:IsAvailable()) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(14 - 5)) then
			v55 = 887226 - 494243;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\32\70\64\255\242\54\109\93\240\198\39\90\87\201\238\58\92\86\250\246\33\86\18\229\252\33\87\92\255\237\42\109\83\249\252\63\71\65\226\185\103", "\153\83\50\50\150");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:HasTier(110 - 79, 4 - 2)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(8 + 0)) then
			v55 = 103353 - (518 + 1289);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\78\102\122\18\125\162\67\90\73\112\14\114\165\72\98\125\122\31\120\235\94\88\100\118\18\122\191\84\98\119\124\25\127\190\94\73\54\37", "\45\61\22\19\124\19\203");
		end
	end
	if (v7:IsChanneling(v21.FistsofFury) and (v7:BuffStack(v21.ChiEnergyBuff) == (51 - 21))) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\242\38\34\197", "\217\161\114\109\149\98\16")) then
			v55 = 15082 + 98574;
			v55 = 165997 - 52341;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\20\41\43\104\175\75\29\38\7\122\169\102\11\31\59\125\178\119\23\44\120\111\185\102\23\46\49\104\165\75\19\47\61\112\169\103\6\96\96", "\20\114\64\88\28\220");
		end
	end
	if (v21.FistsofFury:IsReady() and (v21.JadeIgnition:IsAvailable())) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\60\0\202", "\221\81\97\178\212\152\176"), v85, nil, not v8:IsInMeleeRange(6 + 2)) then
			v55 = 114125 - (304 + 165);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\203\238\14\239\9\242\232\27\196\28\216\245\4\187\9\200\245\24\245\19\217\254\34\250\21\200\235\8\232\14\141\182\77", "\122\173\135\125\155");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(191 - (54 + 106), 1971 - (1618 + 351)) and v7:BuffUp(v21.BonedustBrewBuff) and (v26 > (3 + 1))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1024 - (10 + 1006))) then
			v55 = 25487 + 76059;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\151\209\9\183\49\56\198\131\254\3\171\62\63\205\187\202\9\186\52\113\219\129\211\5\183\54\37\209\187\192\15\188\51\36\219\144\129\81\235", "\168\228\161\96\217\95\81");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v7:HasTier(100 - 69, 1035 - (912 + 121)) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 102835 - (1140 + 149);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\200\193\39\82\33\94\213\214\17\95\61\86\213\212\17\87\38\84\208\145\61\89\61\82\213\216\58\69\16\86\212\212\34\73\60\67\155\128\122", "\55\187\177\78\60\79");
		end
	end
	if (v21.FistsofFury:IsReady() and v7:BuffUp(v21.InvokersDelightBuff) and v7:HasTier(20 + 11, 2 - 0) and (((v26 > (1 + 4)) and (v7:BuffStack(v21.TransferthePowerBuff) > (17 - 12))) or (v26 > (10 - 4)) or ((v26 > (1 + 3)) and not v21.CraneVortex:IsAvailable() and (v7:BuffStack(v21.TransferthePowerBuff) > (17 - 12))))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\32\207\71", "\224\77\174\63\139\38\175"), v85, nil, not v8:IsInMeleeRange(194 - (165 + 21))) then
			v55 = 113767 - (61 + 50);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\130\72\75\58\151\126\87\40\187\71\77\60\157\1\75\43\150\68\86\39\144\88\103\47\139\68\84\59\151\85\24\127\210", "\78\228\33\56");
		end
	end
	if (v21.FistsofFury:IsReady() and not v7:HasTier(13 + 17, 9 - 7) and v7:BuffDown(v21.InvokersDelightBuff) and v7:HasTier(62 - 31, 1 + 1) and (v7:BuffDown(v21.BonedustBrewBuff) or (v26 > (1470 - (1295 + 165)))) and (((v7:BuffStack(v21.TransferthePowerBuff) == (3 + 7)) and not v21.CraneVortex:IsAvailable()) or ((v26 > (3 + 2)) and v21.CraneVortex:IsAvailable() and (v7:BuffStack(v21.TransferthePowerBuff) == (1407 - (819 + 578)))) or (v26 > (1416 - (331 + 1071))) or ((v26 > (755 - (588 + 155))) and not v21.CraneVortex:IsAvailable()))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\195\127\170", "\229\174\30\210\99"), v85, nil, not v8:IsInMeleeRange(1290 - (546 + 736))) then
			v55 = 115593 - (1834 + 103);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\29\228\149\69\254\2\54\29\210\128\68\255\36\121\8\232\148\84\227\52\45\2\210\135\94\232\49\44\8\249\198\0\181", "\89\123\141\230\49\141\93");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and not v74() and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\254\120\248", "\42\147\17\150\108\112"), v82, v77, not v8:IsInMeleeRange(4 + 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\13\170\44\124\236\231\26\178\18\116\238\235\4\230\62\122\245\237\1\175\57\102\216\233\0\163\33\106\244\252\79\244\125", "\136\111\198\77\31\135");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (8 - 5)) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (1767 - (1536 + 230)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\15\0\169", "\201\98\105\199\54\221\132\119"), v82, v77, not v8:IsInMeleeRange(496 - (128 + 363))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\187\0\130\34\9\58\185\173\51\136\40\1\62\236\170\9\145\36\12\60\184\160\51\130\46\7\57\185\170\24\195\115\80", "\204\217\108\227\65\98\85");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(19 - 11)) then
			v55 = 26229 + 75317;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\77\211\252\235\34\201\80\196\202\230\62\193\80\198\202\238\37\195\85\131\230\224\62\197\80\202\225\252\19\193\81\198\249\240\63\212\30\145\161", "\160\62\163\149\133\76");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v7:HasTier(91 - 60, 4 - 2) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:PrevGCD(1 + 0, v21.BlackoutKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1017 - (615 + 394))) then
			v55 = 91674 + 9872;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\197\176\4\33\205\223\174\10\16\192\196\161\3\42\252\221\169\14\36\131\197\165\31\42\205\223\180\20\16\194\217\165\1\58\208\194\224\95\121", "\163\182\192\109\79");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:HasTier(30 + 1, 5 - 3) and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\57\47\14", "\149\84\70\96\160"), v82, v77, not v8:IsInMeleeRange(22 - 17)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\58\10\12\238\51\9\24\249\7\13\4\238\51\70\30\232\42\3\3\228\44\31\50\236\55\3\1\248\43\18\77\191\96", "\141\88\102\109");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (652.5 - (59 + 592)))) and v7:HasTier(68 - 37, 3 - 1) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(6 + 2)) then
			v55 = 101717 - (70 + 101);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\160\67\195\126\20\52\91\198\140\80\216\113\20\56\106\202\186\80\193\48\9\56\71\196\189\90\222\105\37\60\90\196\191\70\217\100\90\110\5", "\161\211\51\170\16\122\93\53");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v26 < (14 - 8)) and v70(v21.BlackoutKick) and v7:HasTier(22 + 9, 4 - 2)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\246\167\188", "\72\155\206\210"), v82, v77, not v8:IsInMeleeRange(246 - (123 + 118))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\68\118\85\13\56\73\111\64\49\56\79\121\95\78\32\67\104\81\0\58\82\99\107\15\60\67\118\65\29\39\6\41\6", "\83\38\26\52\110");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(8 + 22, 1 + 1))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\85\30\41", "\38\56\119\71"), v82, v72, not v8:IsInMeleeRange(1404 - (653 + 746))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\225\230\75\223\43\81\204\252\77\216\26\93\250\236\83\150\54\83\225\234\86\223\49\79\204\238\87\211\41\67\224\251\24\133\113", "\54\147\143\56\182\69");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:BuffUp(v21.CalltoDominanceBuff) and (v26 < (18 - 8))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\219\128\231", "\191\182\225\159\41"), v85, v89, not v8:IsInMeleeRange(11 - 3)) then
			v55 = 1052156 - 659173;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\6\58\92\128\130\253\36\20\23\65\131\130\253\60\27\38\81\135\136\208\47\82\59\80\153\130\204\34\6\49\106\138\136\199\39\7\59\65\203\212\148", "\162\75\114\72\53\235\231");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1 + 1))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(20 + 10)) then
			v55 = 339047 + 49146;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\134\61\64\231\85\11\158\57\123\241\71\13\129\44\4\241\86\16\137\50\77\246\74\61\141\51\65\238\70\17\152\124\23\186", "\98\236\92\36\130\51");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\169\24\20", "\80\196\121\108\218\37\200\213"), v85, nil, not v8:IsInMeleeRange(1 + 7)) then
			v55 = 61318 + 331665;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\19\103\16\118\64\11\181\15\117\61\107\67\11\181\23\122\12\123\71\1\152\4\51\17\122\89\11\132\9\103\27\64\74\1\143\12\102\17\107\11\90\218", "\234\96\19\98\31\43\110");
		end
	end
	if (v21.FistsofFury:IsReady() and (v7:BuffUp(v21.InvokersDelightBuff))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\11\30\74", "\235\102\127\50\167\204\18"), v85, nil, not v8:IsInMeleeRange(19 - 11)) then
			v55 = 108179 + 5477;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\86\168\230\55\87\17\95\167\202\37\81\60\73\225\230\38\86\43\94\168\225\58\123\47\95\164\249\54\87\58\16\245\167", "\78\48\193\149\67\36");
		end
	end
	if v7:IsChanneling(v21.FistsofFury) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\3\42\175\40", "\33\80\126\224\120")) then
			v55 = 209983 - 96327;
			v55 = 114890 - (885 + 349);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\234\161\16\208\79\211\167\5\251\90\249\186\26\251\95\237\166\0\193\80\172\187\6\214\89\226\161\23\221\99\237\167\6\200\73\255\188\67\144\8", "\60\140\200\99\164");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(21 - 13)) then
			v55 = 295378 - 193832;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\148\228\13\40\172\142\250\3\25\161\149\245\10\35\157\140\253\7\45\226\148\241\22\35\172\142\224\29\25\163\136\241\8\51\177\147\180\80\112", "\194\231\148\100\70");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v26 < (974 - (915 + 53))) and v70(v21.BlackoutKick) and v7:HasTier(831 - (768 + 33), 7 - 5)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\75\69\207", "\168\38\44\161\195\150"), v82, v77, not v8:IsInMeleeRange(8 - 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\130\240\131\117\59\231\163\2\191\247\139\117\59\168\165\19\146\249\140\127\36\241\137\23\143\249\142\99\35\252\246\66\216", "\118\224\156\226\22\80\136\214");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (329.5 - (287 + 41)))) and v70(v21.SpinningCraneKick) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(855 - (638 + 209))) then
			v55 = 52761 + 48785;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\81\254\80\142\76\231\87\135\125\237\75\129\76\235\102\139\75\237\82\192\81\235\75\133\76\231\77\153\125\239\86\133\78\251\74\148\2\187\9", "\224\34\142\57");
		end
	end
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v26 == (1691 - (96 + 1590)))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\211\174\203", "\110\190\199\165\189\19\145\61"), v81, v78, not v8:IsInMeleeRange(1677 - (741 + 931))) then
			v55 = 49500 + 51280;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\206\226\112\237\153\248\202\234\123\229\203\212\223\249\114\230\130\211\195\212\118\231\142\203\207\248\99\168\222\149", "\167\186\139\23\136\235");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(22 - 14)) then
			v55 = 545892 - 429045;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\8\160\155\5\19\187\143\50\16\180\140\8\37\162\129\3\30\245\155\8\8\176\134\4\14\172\183\12\21\176\132\24\9\161\200\88\78", "\109\122\213\232");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and (v26 >= (2 + 1)) and v70(v21.BlackoutKick)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\227\254\172", "\80\142\151\194"), v82, v77, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\202\118\79\8\201\98\88\60\205\126\79\8\134\100\73\17\195\121\69\23\223\72\77\12\195\123\89\16\210\55\25\85", "\44\99\166\23");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\113\246\49", "\196\28\151\73\86\83"), v85, nil, not v8:IsInMeleeRange(3 + 6)) then
			v55 = 1491294 - 1098311;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\224\23\59\25\137\93\39\121\245\60\61\24\135\103\15\127\253\7\37\31\144\92\88\101\246\17\44\30\139\76\1\73\242\12\44\28\151\75\12\54\166\91", "\22\147\99\73\112\226\56\120");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 414225 - 312679;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\171\101\235\251\131\177\123\229\202\142\170\116\236\240\178\179\124\225\254\205\171\112\240\240\131\177\97\251\202\140\183\112\238\224\158\172\53\180\165", "\237\216\21\130\149");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 152669 - (64 + 430);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\149\70\86\77\188\192\80\133\113\91\77\177\206\81\140\113\79\74\190\202\86\194\93\90\77\181\199\87\150\87\96\94\191\204\82\151\93\75\31\230\155", "\62\226\46\63\63\208\169");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(8 + 0)) then
			v55 = 117210 - (106 + 257);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\247\12\70\139\22\3\40\97\239\24\81\134\32\26\38\80\225\89\70\134\13\8\33\87\241\0\106\130\16\8\35\75\246\13\21\213\75", "\62\133\121\53\227\127\109\79");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\29\21\42", "\194\112\116\82\149\182\206"), v85, nil, not v8:IsInMeleeRange(4 + 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\59\164\77\27\203\237\27\45\151\71\17\195\233\78\42\173\94\29\206\235\26\32\151\77\23\197\238\27\42\188\12\78\150", "\110\89\200\44\120\160\130");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (724 - (496 + 225)))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(10 - 5)) then
			v55 = 490928 - 390148;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\191\202\76\67\81\117\43\76\167\206\11\85\70\88\62\67\162\215\82\121\66\69\62\65\190\208\95\6\21\18", "\45\203\163\43\38\35\42\91");
		end
	end
end
local function v100()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1659 - (256 + 1402)))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(1929 - (30 + 1869))) then
			v55 = 389562 - (213 + 1156);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\216\132\216\38\129\160\70\215\186\207\55\136\164\68\146\150\217\49\130\167\93\198\156\227\47\146\186\64\146\215", "\52\178\229\188\67\231\201");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (189.5 - (96 + 92)))) and (v7:BuffRemains(v21.SerenityBuff) < (1.5 + 0)) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(930 - (142 + 757), 2 + 0)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 101625 - (32 + 47);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\50\81\89\10\249\85\45\38\126\83\22\246\82\38\30\74\89\7\252\28\48\36\83\85\10\254\72\58\30\77\69\23\227\28\119", "\67\65\33\48\100\151\60");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1980 - (1053 + 924))) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (1 + 0))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\210\238\160", "\147\191\135\206\184"), v82, v77, not v8:IsInMeleeRange(8 - 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\134\36\167\194\211\92\167\144\23\173\200\219\88\242\151\45\180\196\214\90\166\157\23\170\212\203\71\242\210", "\210\228\72\198\161\184\51");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1649.5 - (685 + 963)))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(62 - 31, 2 - 0) and (v26 > (1711 - (541 + 1168)))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1605 - (645 + 952))) then
			v55 = 102384 - (669 + 169);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\37\89\250\30\125\199\56\78\204\19\97\207\56\76\204\27\122\205\61\9\224\21\97\203\56\64\231\9\76\194\35\90\231\80\43", "\174\86\41\147\112\19");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\86\1\149", "\203\59\96\237\107\69\111\113"), v85, nil, not v8:IsInMeleeRange(31 - 22)) then
			v55 = 853388 - 460405;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\55\2\190\232\58\245\232\43\16\147\245\57\245\232\51\31\162\229\61\255\197\32\86\191\228\35\245\217\45\2\181\222\61\229\196\48\86\253\177", "\183\68\118\204\129\81\144");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff) and (v26 > (1 + 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\3\164\126", "\226\110\205\16\132\107"), v82, v77, not v8:IsInMeleeRange(2 + 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\233\207\225\218\74\228\214\244\230\74\226\192\235\153\82\238\209\229\215\72\255\218\223\213\84\248\215\160\136\19", "\33\139\163\128\185");
		end
	end
	if (v21.RisingSunKick:IsReady() and v70(v21.RisingSunKick) and ((v26 < (768 - (181 + 584))) or not v7:HasTier(1426 - (665 + 730), 5 - 3))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\90\89\28", "\190\55\56\100"), v85, nil, not v8:IsInMeleeRange(10 - 5)) then
			v55 = 108778 - (540 + 810);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\68\166\47\23\29\228\204\69\186\50\33\24\234\240\93\239\47\27\1\230\253\95\187\37\33\31\246\224\66\239\109\74", "\147\54\207\92\126\115\131");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:PrevGCD(3 - 2, v21.FistsofFury) and v21.ShadowboxingTreads:IsAvailable() and v7:HasTier(85 - 54, 2 + 0) and not v21.DanceofChiji:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\0\56\59", "\30\109\81\85\29\109"), v82, v77, not v8:IsInMeleeRange(208 - (166 + 37))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\253\125\85\181\61\209\233\235\78\95\191\53\213\188\236\116\70\179\56\215\232\230\78\88\163\37\202\188\174\39", "\156\159\17\52\214\86\190");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1882.5 - (22 + 1859)))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:PrevGCD(1773 - (843 + 929), v21.FistsofFury) and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (317 - (30 + 232))) and v7:HasTier(88 - 57, 779 - (55 + 722))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(17 - 9)) then
			v55 = 103221 - (78 + 1597);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\189\255\180\178\160\230\179\187\145\236\175\189\160\234\130\183\167\236\182\252\189\234\175\185\160\230\169\165\145\227\168\175\186\175\236\228", "\220\206\143\221");
		end
	end
	if (v21.FistsofFury:IsReady() and v7:BuffUp(v21.InvokersDelightBuff) and ((v26 < (1 + 2)) or not v7:HasTier(29 + 2, 2 + 0))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\139\124\53", "\178\230\29\77\119\184\172"), v85, nil, not v8:IsInMeleeRange(557 - (305 + 244))) then
			v55 = 105441 + 8215;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\243\183\25\15\100\199\250\184\53\29\98\234\236\254\25\30\101\253\251\183\30\2\72\244\224\173\30\91\37\168", "\152\149\222\106\123\23");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (106.5 - (95 + 10)))) and v70(v21.SpinningCraneKick) and v74() and v7:BuffDown(v21.BlackoutReinforcementBuff) and (v26 > (2 + 0)) and v7:HasTier(98 - 67, 2 - 0)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(770 - (592 + 170))) then
			v55 = 354169 - 252623;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\206\54\255\77\187\212\40\241\124\182\207\39\248\70\138\214\47\245\72\245\206\35\228\70\187\212\50\239\124\185\200\53\226\3\231\143", "\213\189\70\150\35");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v74() and v7:BuffUp(v21.BlackoutReinforcementBuff) and (v26 > (1 + 1)) and v7:PrevGCD(1 + 0, v21.BlackoutKick) and v7:HasTier(74 - 43, 1 + 1)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(14 - 6)) then
			v55 = 102053 - (353 + 154);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\92\69\125\6\65\92\122\15\112\86\102\9\65\80\75\3\70\86\127\72\92\80\102\13\65\92\96\17\112\89\97\27\91\21\38\92", "\104\47\53\20");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and v74() and v7:BuffUp(v21.BonedustBrewBuff) and (v26 > (2 - 0)) and v7:HasTier(22 + 9, 2 + 0)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(6 + 2)) then
			v55 = 146740 - 45194;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\176\92\136\18\178\6\173\75\190\31\174\14\173\73\190\23\181\12\168\12\146\25\174\10\173\69\149\5\131\3\182\95\149\92\238\89", "\111\195\44\225\124\220");
		end
	end
	if (v7:IsChanneling(v21.FistsofFury) and ((v26 < (5 - 2)) or not v7:HasTier(72 - 41, 88 - (7 + 79)))) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\235\114\47\67", "\203\184\38\96\19\203")) then
			v55 = 53166 + 60490;
			v55 = 113837 - (24 + 157);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\122\106\85\221\6\124\127\126\200\44\97\96\126\205\56\125\122\68\194\121\96\124\83\203\55\122\109\88\241\53\102\106\85\142\107\43", "\174\89\19\25\33");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(16 - 8)) then
			v55 = 28855 + 72691;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\60\2\91\64\249\142\5\40\45\81\92\246\137\14\16\25\91\77\252\199\24\42\0\87\64\254\147\18\16\30\71\93\227\199\88\127", "\107\79\114\50\46\151\231");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:BuffUp(v21.BonedustBrewBuff) and v7:HasTier(411 - (262 + 118), 1085 - (1038 + 45))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(17 - 9)) then
			v55 = 101776 - (19 + 211);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\42\182\188\39\132\48\185\199\6\165\167\40\132\60\136\203\48\165\190\105\153\60\165\197\55\175\161\48\181\53\162\211\45\230\230\123", "\160\89\198\213\73\234\89\215");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\69\120\186", "\165\40\17\212\158"), v82, v77, not v8:IsInMeleeRange(118 - (88 + 25))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\231\213\9\48\45\234\204\28\12\45\236\218\3\115\53\224\203\13\61\47\241\192\55\63\51\246\205\72\96\114", "\70\133\185\104\83");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 94773 + 6773;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\23\85\77\36\199\13\75\67\21\202\22\68\74\47\246\15\76\71\33\137\23\64\86\47\199\13\81\93\21\197\17\86\80\106\154\82", "\169\100\37\36\74");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\13\134\186", "\48\96\231\194"), v85, nil, not v8:IsInMeleeRange(1041 - (1007 + 29))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\202\86\15\46\18\215\186\151\247\81\7\46\18\152\188\134\218\95\0\36\13\193\144\143\221\73\26\109\74\128", "\227\168\58\110\77\121\184\207");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(2 + 3)) then
			v55 = 371971 - 219796;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\108\52\182\82\189\210\127\162\68\56\173\65\182\212\127\154\107\41\177\67\185\155\98\160\105\57\177\73\165\194\78\169\110\47\171\0\229\139", "\197\27\92\223\32\209\187\17");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (14 - 11))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(2 + 3)) then
			v55 = 101591 - (340 + 471);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\23\86\196\254\17\96\211\250\15\82\131\232\6\77\198\245\10\75\218\196\15\74\208\239\67\11\145", "\155\99\63\163");
		end
	end
end
local function v101()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (2 - 1))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(619 - (276 + 313))) then
			v55 = 947655 - 559462;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\136\208\165\136\191\141\144\212\158\158\173\139\143\193\225\158\188\150\135\223\168\153\160\187\131\222\164\205\235", "\228\226\177\193\237\217");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v7:HasTier(29 + 2, 2 + 2) and v21.Thunderfist:IsAvailable()) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(1 + 8)) then
			v55 = 394955 - (495 + 1477);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\39\164\49\239\63\181\28\233\50\143\55\238\49\143\52\239\58\180\47\233\38\180\99\245\49\162\38\232\61\164\58\217\53\191\38\166\96", "\134\84\208\67");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:HasTier(21 + 10, 405 - (342 + 61))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 101711 - (4 + 161);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\0\188\143\82\29\165\136\91\44\175\148\93\29\169\185\87\26\175\141\28\0\169\148\89\29\165\146\69\44\173\137\89\83\250", "\60\115\204\230");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(97 - 66, 5 - 3) and v7:BuffUp(v21.BonedustBrewBuff) and (v26 > (501 - (322 + 175)))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(571 - (173 + 390))) then
			v55 = 25038 + 76508;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\244\42\226\126\233\51\229\119\216\57\249\113\233\63\212\123\238\57\224\48\244\63\249\117\233\51\255\105\216\59\228\117\167\98", "\16\135\90\139");
		end
	end
	if (v7:IsChanneling(v21.FistsofFury) and (v7:BuffStack(v21.ChiEnergyBuff) == (344 - (203 + 111)))) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\103\64\41\3", "\24\52\20\102\83\46\52")) then
			v55 = 7045 + 106611;
			v55 = 80144 + 33512;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\194\38\50\48\28\251\32\39\27\9\209\61\56\27\12\197\33\34\33\3\132\60\36\54\10\202\38\53\61\48\197\32\36\100\94\148", "\111\164\79\65\68");
		end
	end
	if (v21.FistsofFury:IsReady() and (v21.JadeIgnition:IsAvailable())) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\203\216\155", "\138\166\185\227\190\78"), v85, nil, not v8:IsInMeleeRange(23 - 15)) then
			v55 = 102666 + 10990;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\205\125\214\35\65\28\22\205\75\195\34\64\58\89\216\113\215\50\92\42\13\210\75\196\56\87\99\72\153", "\121\171\20\165\87\50\67");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (707.5 - (57 + 649)))) and v7:HasTier(415 - (328 + 56), 1 + 1) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(520 - (433 + 79))) then
			v55 = 9308 + 92238;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\213\40\176\56\183\11\200\63\134\53\171\3\200\61\134\61\176\1\205\120\170\51\171\7\200\49\173\47\134\3\201\61\249\103\237", "\98\166\88\217\86\217");
		end
	end
	if (v21.FistsofFury:IsReady() and v7:BuffUp(v21.InvokersDelightBuff) and v7:HasTier(26 + 5, 6 - 4) and (v7:BuffDown(v21.BonedustBrewBuff) or (v26 > (47 - 37))) and (((v7:BuffStack(v21.TransferthePowerBuff) == (8 + 2)) and not v21.CraneVortex:IsAvailable()) or ((v26 > (5 + 0)) and v21.CraneVortex:IsAvailable() and (v7:BuffStack(v21.TransferthePowerBuff) == (1046 - (562 + 474)))) or (v26 > (32 - 18)) or ((v26 > (23 - 11)) and not v21.CraneVortex:IsAvailable()))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\251\247\97", "\188\150\150\25\97\230"), v85, nil, not v8:IsInMeleeRange(913 - (76 + 829))) then
			v55 = 115329 - (1506 + 167);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\220\128\76\22\31\210\213\143\96\4\25\255\195\201\76\7\30\232\212\128\75\27\51\236\213\140\31\83\90", "\141\186\233\63\98\108");
		end
	end
	if ((not v7:HasTier(56 - 26, 268 - (58 + 208)) and v7:HasTier(19 + 12, 2 + 0) and (v7:BuffDown(v21.BonedustBrewBuff) or (v26 > (6 + 4))) and (((v7:BuffStack(v21.TransferthePowerBuff) == (40 - 30)) and not v21.CraneVortex:IsAvailable()) or ((v26 > (342 - (258 + 79))) and v21.CraneVortex:IsAvailable() and (v7:BuffStack(v21.TransferthePowerBuff) == (2 + 8))) or (v26 > (29 - 15)) or ((v26 > (1482 - (1219 + 251))) and not v21.CraneVortex:IsAvailable())) and v7:BuffDown(v21.BonedustBrewBuff)) or (v7:BuffStack(v21.FuryofXuenBuff) > (1761 - (1231 + 440)))) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\194\222\3\134", "\69\145\138\76\214")) then
			v55 = 113714 - (34 + 24);
			v55 = 65915 + 47741;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\118\198\154\157\172\41\127\201\182\143\170\4\105\240\138\136\177\21\117\195\201\154\186\4\117\193\128\157\166\41\113\192\140\201\238\78", "\118\16\175\233\233\223");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and not v74() and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\134\141\59", "\29\235\228\85\219\142\235"), v82, v77, not v8:IsInMeleeRange(9 - 4)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\216\187\222\124\65\50\70\2\223\179\222\124\14\52\87\47\209\180\212\99\87\24\83\50\209\250\143\39", "\50\93\180\218\189\23\46\71");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (2 + 1)) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (2 - 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\211\173\85", "\40\190\196\59\44\36\188"), v82, v77, not v8:IsInMeleeRange(15 - 10)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\62\73\221\183\241\114\24\40\122\215\189\249\118\77\47\64\206\177\244\116\25\37\122\221\187\255\61\95\110", "\109\92\37\188\212\154\29");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(26 - 18)) then
			v55 = 221735 - 120189;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\23\255\173\205\63\83\10\232\155\192\35\91\10\234\155\200\56\89\15\175\183\198\35\95\10\230\176\218\14\91\11\234\228\145\101", "\58\100\143\196\163\81");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1590.5 - (877 + 712)))) and v7:HasTier(19 + 12, 756 - (242 + 512)) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:PrevGCD(1 - 0, v21.BlackoutKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(635 - (92 + 535))) then
			v55 = 79941 + 21605;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\9\82\42\173\49\64\235\9\37\65\49\162\49\76\218\5\19\65\40\227\44\76\247\11\20\75\55\186\0\72\234\11\90\16\117", "\110\122\34\67\195\95\41\133");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:HasTier(63 - 32, 1 + 1) and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\120\184\85", "\182\21\209\59\42"), v82, v77, not v8:IsInMeleeRange(17 - 12)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\181\91\196\30\42\177\162\67\250\22\40\189\188\23\214\24\51\187\185\94\209\4\30\191\184\82\133\79\121", "\222\215\55\165\125\65");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v7:HasTier(22 + 9, 1 + 1) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:PrevGCD(1 - 0, v21.BlackoutKick)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(12 - 4)) then
			v55 = 103331 - (1476 + 309);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\193\207\20\252\200\227\77\19\210\212\27\252\196\210\65\37\210\205\90\225\196\255\79\34\216\210\3\205\192\226\79\108\130\150", "\42\76\177\166\122\146\161\141");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(1314 - (299 + 985), 1 + 1)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\168\131\11", "\22\197\234\101\174\25"), v82, v72, not v8:IsInMeleeRange(16 - 11)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\61\182\213\120\168\232\149\56\58\154\215\127\172\220\198\62\49\183\217\120\166\195\159\18\53\170\217\54\252\133", "\230\77\84\197\188\22\207\183");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(123 - (86 + 7), 8 - 6))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\244\29\200", "\85\153\116\166\156\236\193\144"), v82, v72, not v8:IsInMeleeRange(1 + 4)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\182\233\94\186\234\7\155\243\88\189\219\11\173\227\70\243\247\5\182\229\67\186\240\25\155\225\66\182\164\83\240", "\96\196\128\45\211\132");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:BuffUp(v21.CalltoDominanceBuff) and (v26 < (890 - (672 + 208)))) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\56\140\99", "\184\85\237\27\63\178\207\212"), v85, v89, not v8:IsInMeleeRange(4 + 5)) then
			v55 = 393115 - (14 + 118);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\27\77\27\86\3\92\54\80\14\102\29\87\13\102\30\86\6\93\5\80\26\93\73\76\13\75\12\81\1\77\16\96\9\86\12\31\91\15", "\63\104\57\105");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (447 - (339 + 106)))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(24 + 6)) then
			v55 = 195242 + 192951;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\134\160\65\13\142\182\65\52\148\176\75\6\151\228\87\14\149\161\74\2\147\189\123\10\136\161\4\88\223", "\36\107\231\196");
		end
	end
	if (v21.FistsofFury:IsReady() and (v7:BuffUp(v21.InvokersDelightBuff))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\80\180\186", "\231\61\213\194"), v85, nil, not v8:IsInMeleeRange(1403 - (440 + 955))) then
			v55 = 111984 + 1672;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\15\164\46\103\26\146\50\117\54\171\40\97\16\237\46\118\27\168\51\122\29\180\2\114\6\168\125\39\89", "\19\105\205\93");
		end
	end
	if v7:IsChanneling(v21.FistsofFury) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\154\60\241\177", "\95\201\104\190\225")) then
			v55 = 204180 - 90524;
			v55 = 37713 + 75943;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\194\210\218\188\244\206\200\144\205\212\220\182\244\194\207\161\200\196\194\239\216\196\220\170\197\200\218\182\244\192\193\170\139\149\156", "\174\207\171\161");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\224\255\21", "\183\141\158\109\147\152"), v85, nil, not v8:IsInMeleeRange(22 - 13)) then
			v55 = 269155 + 123828;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\29\244\5\39\12\217\3\42\54\242\4\41\54\241\5\34\13\234\3\62\13\166\31\41\27\227\2\37\29\255\51\45\6\227\76\120\93", "\108\76\105\134");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (354.5 - (260 + 93)))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(8 + 0)) then
			v55 = 232288 - 130742;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\248\213\184\239\192\226\203\182\222\205\249\196\191\228\241\224\204\178\234\142\248\192\163\228\192\226\209\168\222\207\228\192\241\181\152", "\174\139\165\209\129");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v26 < (10 - 4)) and v70(v21.BlackoutKick) and v7:HasTier(2004 - (1181 + 793), 1 + 1)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\174\186\236", "\24\195\211\130\161\166\99\16"), v82, v77, not v8:IsInMeleeRange(312 - (105 + 202))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\68\15\232\47\88\25\83\23\214\39\90\21\77\67\250\41\65\19\72\10\253\53\108\23\73\6\169\120\11", "\118\38\99\137\76\51");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(818 - (352 + 458))) then
			v55 = 409416 - 307870;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\238\54\12\28\7\41\243\33\58\17\27\33\243\35\58\25\0\35\246\102\22\23\27\37\243\47\17\11\54\33\242\35\69\71\89", "\64\157\70\101\114\105");
		end
	end
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v26 == (12 - 7))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\77\161\169", "\112\32\200\199\131"), v81, v78, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 294579 - 193799;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\89\91\189\209\148\50\45\92\81\248\208\174\48\41\94\85\172\218\148\35\35\85\28\237\145", "\66\76\48\60\216\163\203");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(957 - (438 + 511))) then
			v55 = 118230 - (1262 + 121);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\147\106\251\86\192\35\133\140\120\247\90\241\51\179\136\125\179\76\203\54\191\136\112\231\70\241\37\181\131\57\166\11", "\68\218\230\25\147\63\174");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and (v26 >= (1071 - (728 + 340))) and v70(v21.BlackoutKick)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\160\35\93", "\214\205\74\51\44"), v82, v77, not v8:IsInMeleeRange(1795 - (816 + 974))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\248\64\227\255\124\245\89\246\195\124\243\79\233\188\100\255\94\231\242\126\238\85\221\253\120\255\12\183\170", "\23\154\44\130\156");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\28\167\181", "\115\113\198\205\206\86"), v85, nil, not v8:IsInMeleeRange(27 - 18)) then
			v55 = 1414279 - 1021296;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\151\67\236\83\143\82\193\85\130\104\234\82\129\104\233\83\138\83\242\85\150\83\190\73\129\69\251\84\141\67\231\101\133\88\251\26\209\15", "\58\228\55\158");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (340.5 - (163 + 176)))) and v70(v21.SpinningCraneKick)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(22 - 14)) then
			v55 = 466665 - 365119;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\167\153\217\32\50\164\59\179\182\211\60\61\163\48\139\130\217\45\55\237\38\177\155\213\32\53\185\44\139\136\223\43\124\251\101", "\85\212\233\176\78\92\205");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(2 + 3)) then
			v55 = 153985 - (1564 + 246);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\80\129\240\70\81\134\229\117\92\154\227\77\87\134\221\90\77\134\225\66\24\155\231\88\93\134\235\94\65\183\227\69\93\200\180\24", "\130\42\56\232");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\231\180\60", "\95\138\213\68\131\32"), v85, nil, not v8:IsInMeleeRange(350 - (124 + 221))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\40\36\160\64\125\37\61\181\124\125\35\43\170\3\101\47\58\164\77\127\62\49\158\66\121\47\104\247\23", "\22\74\72\193\35");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (3 + 0))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(456 - (115 + 336))) then
			v55 = 221957 - 121177;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\112\227\93\62\70\244\89\32\116\164\75\41\107\225\86\37\109\253\103\45\118\225\24\122\47", "\56\76\25\132");
		end
	end
end
local function v102()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1 + 0))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(76 - (45 + 1))) then
			v55 = 20986 + 367207;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\84\192\175\35\201\87\211\174\25\220\74\206\166\54\143\77\196\185\35\193\87\213\178\25\155\74\129\249", "\175\62\161\203\70");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1991.5 - (1282 + 708)))) and (v7:BuffRemains(v21.SerenityBuff) < (1213.5 - (583 + 629))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(6 + 25, 5 - 3)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(5 + 3)) then
			v55 = 102716 - (943 + 227);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\47\205\202\29\59\53\211\196\44\54\46\220\205\22\10\55\212\192\24\117\47\216\209\22\59\53\201\218\44\97\40\157\151", "\85\92\189\163\115");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v7:HasTier(14 + 17, 1635 - (1539 + 92)) and v21.Thunderfist:IsAvailable()) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(1955 - (706 + 1240))) then
			v55 = 393241 - (81 + 177);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\58\184\34\49\34\169\15\55\47\147\36\48\44\147\39\49\39\168\60\55\59\168\112\43\44\190\53\54\32\184\41\7\125\184\112\110", "\88\73\204\80");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(288 - (212 + 45), 6 - 4)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1954 - (708 + 1238))) then
			v55 = 8446 + 93100;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\61\147\25\72\39\211\32\132\47\69\59\219\32\134\47\77\32\217\37\195\3\67\59\223\32\138\4\95\22\142\58\195\72", "\186\78\227\112\38\73");
		end
	end
	if (v7:IsChanneling(v21.FistsofFury) and not v7:HasTier(10 + 20, 1669 - (586 + 1081)) and (v7:BuffStack(v21.FuryofXuenBuff) > (601 - (348 + 163)))) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\207\99\210\101", "\26\156\55\157\53\51")) then
			v55 = 102077 + 11579;
			v55 = 113936 - (215 + 65);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\138\209\5\205\171\111\131\222\41\223\173\66\149\231\21\216\182\83\137\212\86\202\189\66\137\214\31\205\161\111\216\204\86\136\232", "\48\236\184\118\185\216");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:HasTier(1890 - (1541 + 318), 2 + 0) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(5 + 3)) then
			v55 = 76519 + 25027;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\246\173\94\62\193\61\235\186\104\51\221\53\235\184\104\59\198\55\238\253\68\53\221\49\235\180\67\41\240\96\241\253\6\98", "\84\133\221\55\80\175");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1753 - (1036 + 714))) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (1 + 0))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\176\238\42", "\60\221\135\68\198\167"), v82, v77, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\236\177\249\128\73\214\251\169\199\136\75\218\229\253\235\134\80\220\224\180\236\154\125\141\250\253\169\215", "\185\142\221\152\227\34");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:HasTier(1311 - (883 + 397), 592 - (563 + 27)) and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\85\204\89", "\151\56\165\55\154\35\83"), v82, v77, not v8:IsInMeleeRange(19 - 14)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\162\79\4\237\171\76\16\250\159\72\12\237\171\3\22\235\178\70\11\231\180\90\58\186\180\3\84\184", "\142\192\35\101");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1987.5 - (1369 + 617)))) and v7:HasTier(1518 - (85 + 1402), 1 + 1) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v21.CraneVortex:IsAvailable()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(20 - 12)) then
			v55 = 101949 - (274 + 129);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\197\101\32\173\233\133\162\17\233\118\59\162\233\137\147\29\223\118\34\227\244\137\190\19\216\124\61\186\216\216\184\86\135\45", "\118\182\21\73\195\135\236\204");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and not v21.BonedustBrew:IsAvailable()) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\5\53\20", "\157\104\92\122\32\100\109"), v82, v72, not v8:IsInMeleeRange(222 - (12 + 205))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\177\175\220\195\51\32\178\184\182\168\240\193\52\36\134\235\176\163\221\207\51\46\153\178\156\242\219\138\111\119", "\203\195\198\175\170\93\71\237");
		end
	end
	if (v21.FistsofFury:IsReady() and v7:BuffUp(v21.InvokersDelightBuff) and v7:HasTier(29 + 2, 7 - 5) and (v7:BuffStack(v21.TransferthePowerBuff) > (5 + 0)) and not v21.CraneVortex:IsAvailable() and v7:BloodlustUp()) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\35\74\38", "\156\78\43\94\181\49\113"), v85, nil, not v8:IsInMeleeRange(392 - (27 + 357))) then
			v55 = 114136 - (91 + 389);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\116\225\215\183\24\124\118\116\215\194\182\25\90\57\97\237\214\166\5\74\109\107\215\144\183\75\17\43", "\25\18\136\164\195\107\35");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(327 - (90 + 207), 1 + 1)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\229\36\167", "\216\136\77\201\47\18\220\161"), v82, v72, not v8:IsInMeleeRange(866 - (706 + 155))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\229\56\211\6\219\189\62\249\37\229\3\213\129\38\172\56\223\26\217\140\36\248\50\229\92\200\194\127\184", "\226\77\140\75\186\104\188");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(1825 - (730 + 1065), 1565 - (1339 + 224)))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\180\199\222", "\47\217\174\176\95"), v82, v72, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\170\212\101\11\188\83\71\53\173\211\73\9\187\87\115\102\171\216\100\7\188\93\108\63\135\137\98\66\224\2", "\70\216\189\22\98\210\52\24");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v7:HasTier(45 - 14, 845 - (268 + 575)) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1302 - (919 + 375))) then
			v55 = 279233 - 177687;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\201\207\170\137\221\211\209\164\184\208\200\222\173\130\236\209\214\160\140\147\201\218\177\130\221\211\203\186\184\135\206\159\241\223", "\179\186\191\195\231");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:BuffUp(v21.CalltoDominanceBuff)) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\244\62\0", "\132\153\95\120"), v85, v89, not v8:IsInMeleeRange(980 - (180 + 791))) then
			v55 = 394788 - (323 + 1482);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\162\166\28\36\252\223\159\190\180\49\57\255\223\159\166\187\0\41\251\213\178\181\242\29\40\229\223\174\184\166\23\18\163\206\224\226\226", "\192\209\210\110\77\151\186");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1920 - (1177 + 741)))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(2 + 28)) then
			v55 = 1455696 - 1067503;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\234\2\38\236\249\205\242\6\29\250\235\203\237\19\98\250\250\214\229\13\43\253\230\251\180\23\98\186\173", "\164\128\99\66\137\159");
		end
	end
	if (v21.FistsofFury:IsReady() and (v7:BuffUp(v21.InvokersDelightBuff))) then
		if v65.CastTargetIf(v21.FistsofFury, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\13\136\241", "\222\96\233\137"), v85, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 253866 - 140210;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\191\186\180\11\155\204\255\191\140\161\10\154\234\176\170\182\181\26\134\250\228\160\140\243\11\200\160\164", "\144\217\211\199\127\232\147");
		end
	end
	if v7:IsChanneling(v21.FistsofFury) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\203\27\17\24", "\36\152\79\94\72\181\37\98")) then
			v55 = 9504 + 104152;
			v55 = 113765 - (96 + 13);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\209\209\84\43\196\231\72\57\232\222\82\45\206\231\68\62\217\219\66\51\151\203\66\45\210\214\78\43\206\231\19\43\151\139\17", "\95\183\184\39");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\184\62\255", "\98\213\95\135\70\52\224"), v85, nil, not v8:IsInMeleeRange(1930 - (962 + 959))) then
			v55 = 981609 - 588626;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\237\183\219\126\95\251\156\198\113\107\234\171\204\72\67\247\173\205\123\91\236\167\137\100\81\236\166\199\126\64\231\156\157\99\20\173\251", "\52\158\195\169\23");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1359 - (461 + 890))) then
			v55 = 74484 + 27062;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\105\172\59\122\136\60\117\140\69\191\32\117\136\48\68\128\115\191\57\52\149\48\105\142\116\181\38\109\185\97\111\203\46\236", "\235\26\220\82\20\230\85\27");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:BuffUp(v21.PressurePointBuff))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\133\168\231", "\20\232\193\137\162"), v82, v72, not v8:IsInMeleeRange(19 - 14)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\48\214\214\175\233\139\40\98\55\209\250\173\238\143\28\49\49\218\215\163\233\133\3\104\29\139\209\230\179\222", "\17\66\191\165\198\135\236\119");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:HasTier(273 - (19 + 224), 2 + 0)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\2\166\160", "\177\111\207\206\115\159\136\140"), v82, v77, not v8:IsInMeleeRange(203 - (37 + 161))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\7\133\17\23\223\64\74\17\182\27\29\215\68\31\22\140\2\17\218\70\75\28\182\68\0\148\27\11", "\63\101\233\112\116\180\47");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 100150 + 1396;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\208\43\228\28\246\63\205\60\210\17\234\55\205\62\210\25\241\53\200\123\254\23\234\51\205\50\249\11\199\98\215\123\185\68", "\86\163\91\141\114\152");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\94\2\122", "\90\51\107\20\19"), v82, v77, not v8:IsInMeleeRange(66 - (60 + 1))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\143\252\132\236\54\130\229\145\208\54\132\243\142\175\46\136\226\128\225\52\153\233\186\187\41\205\164\221", "\93\237\144\229\143");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\24\247\232", "\38\117\150\144\121\107"), v85, nil, not v8:IsInMeleeRange(932 - (826 + 97))) then
			v55 = 380580 + 12403;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\62\175\252\51\38\190\209\53\43\132\250\50\40\132\249\51\35\191\226\53\63\191\174\41\40\169\235\52\36\175\247\5\121\175\174\111\125", "\90\77\219\142");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (3.5 - 2))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(16 - 8)) then
			v55 = 102231 - (375 + 310);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\245\20\40\55\66\14\116\225\59\34\43\77\9\127\217\15\40\58\71\71\105\227\22\36\55\69\19\99\217\80\53\121\25\85", "\26\134\100\65\89\44\103");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(2004 - (1864 + 135))) then
			v55 = 392654 - 240479;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\230\235\57\49\168\248\237\55\28\160\227\226\55\44\170\206\243\37\45\167\249\163\35\38\182\244\237\57\55\189\206\183\36\99\241\165", "\196\145\131\80\67");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(2 + 6)) then
			v55 = 39081 + 77766;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\12\165\21\0\17\230\25\143\12\9\28\237\33\167\15\6\28\168\13\181\20\13\22\225\10\169\57\92\12\168\75\230", "\136\126\208\102\104\120");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\117\139\214", "\49\24\234\174\35\207\50\93"), v85, nil, not v8:IsInMeleeRange(12 - 7)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\14\254\252\139\122\3\231\233\183\122\5\241\246\200\98\9\224\248\134\120\24\235\194\220\101\76\167\165", "\17\108\146\157\232");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (1134 - (314 + 817)))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(3 + 2)) then
			v55 = 100994 - (32 + 182);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\95\202\19\232\61\151\91\194\24\224\111\187\78\209\17\227\38\188\82\252\64\249\111\254\27", "\200\43\163\116\141\79");
		end
	end
end
local function v103()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1 + 0))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(104 - 74)) then
			v55 = 388258 - (39 + 26);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\181\55\57\134\182\253\241\186\9\46\151\191\249\243\255\37\56\145\181\250\234\171\47\2\208\164\180\177", "\131\223\86\93\227\208\148");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:HasTier(175 - (54 + 90), 200 - (45 + 153)) and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\238\76\184", "\213\131\37\214\214\125"), v82, v77, not v8:IsInMeleeRange(4 + 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\36\39\36\188\234\41\62\49\128\234\47\40\46\255\242\35\57\32\177\232\50\50\26\236\245\102\127", "\129\70\75\69\223");
		end
	end
	if (v21.TigerPalm:IsReady() and (v70(v21.TigerPalm))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\75\194\253", "\143\38\171\147\137\28"), v81, v78, not v8:IsInMeleeRange(557 - (457 + 95))) then
			v55 = 100128 + 652;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\196\139\190\246\17\220\196\209\142\180\179\16\230\198\213\140\176\231\26\220\135\196\194\239", "\180\176\226\217\147\99\131");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v74() and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(74 - 43, 7 - 5)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 350217 - 248671;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\192\169\38\9\221\176\33\0\236\186\61\6\221\188\16\12\218\186\36\71\192\188\61\2\221\176\59\30\236\234\59\71\139", "\103\179\217\79");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:BuffUp(v21.CalltoDominanceBuff)) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\71\182\4", "\195\42\215\124\181\33\236"), v85, v89, not v8:IsInMeleeRange(26 - 17)) then
			v55 = 393731 - (485 + 263);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\30\77\37\55\46\253\50\86\49\1\49\240\8\102\32\55\43\252\1\86\37\58\101\235\8\75\50\48\44\236\20\102\100\42\101\169\93", "\152\109\57\87\94\69");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\244\214\18", "\200\153\183\106\195\222\178\52"), v85, v90, not v8:IsInMeleeRange(716 - (575 + 132))) then
			v55 = 393844 - (750 + 111);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\33\247\154\52\66\95\13\236\142\2\93\82\55\220\159\52\71\94\62\236\154\57\9\73\55\241\141\51\64\78\43\220\219\41\9\11\96", "\58\82\131\232\93\41");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\142\94\222", "\95\227\55\176\117\61"), v82, v77, not v8:IsInMeleeRange(1015 - (445 + 565))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\26\114\34\72\160\23\107\55\116\160\17\125\40\11\184\29\108\38\69\162\12\103\28\24\191\88\47\119", "\203\120\30\67\43");
		end
	end
	if (v21.FistsofFury:IsReady() and v7:BuffUp(v21.InvokersDelightBuff) and not v7:HasTier(25 + 6, 1 + 1)) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\252\36\85", "\185\145\69\45\143"), v85, nil, not v8:IsInMeleeRange(13 - 5)) then
			v55 = 37936 + 75720;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\140\22\10\178\207\181\16\31\153\218\159\13\0\230\207\143\13\28\168\213\158\6\38\245\200\202\78\79", "\188\234\127\121\198");
		end
	end
	if (v7:IsChanneling(v21.FistsofFury) and (not v7:HasTier(341 - (189 + 121), 1 + 1) or (v7:BuffStack(v21.FuryofXuenBuff) > (1437 - (634 + 713))))) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\11\6\60\179", "\227\88\82\115")) then
			v55 = 114194 - (493 + 45);
			v55 = 114624 - (493 + 475);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\69\22\169\179\17\76\76\25\133\161\23\97\90\32\185\166\12\112\70\19\250\180\7\97\70\17\179\179\27\76\16\11\250\246\90", "\19\35\127\218\199\98");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v74() and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(815 - (158 + 626), 1 + 1) and v21.CraneVortex:IsAvailable()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(12 - 4)) then
			v55 = 22600 + 78946;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\15\235\3\236\18\242\4\229\35\248\24\227\18\254\53\233\21\248\1\162\15\254\24\231\18\242\30\251\35\168\30\162\78\171", "\130\124\155\106");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v74() and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:HasTier(1122 - (1035 + 56), 961 - (114 + 845)) and v7:PrevGCD(1 + 0, v21.BlackoutKick) and v21.CraneVortex:IsAvailable()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(20 - 12)) then
			v55 = 85366 + 16180;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\198\219\255\161\173\255\114\184\234\200\228\174\173\243\67\180\220\200\253\239\176\243\110\186\219\194\226\182\156\165\104\255\135\153", "\223\181\171\150\207\195\150\28");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:BuffDown(v21.PressurePointBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\65\51\237", "\105\44\90\131\206"), v82, v77, not v8:IsInMeleeRange(1054 - (179 + 870))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\253\236\179\186\3\49\234\244\141\178\1\61\244\160\161\188\26\59\241\233\166\160\55\109\235\160\224\237", "\94\159\128\210\217\104");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:BuffUp(v21.PressurePointBuff))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\93\240\8", "\26\48\153\102\223\63\31\153"), v82, v72, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\16\73\254\250\12\71\210\224\23\78\210\248\11\67\230\179\17\69\255\246\12\73\249\234\61\19\249\179\80\22", "\147\98\32\141");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(908 - (827 + 51), 5 - 3)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\21\74\237", "\43\120\35\131\170\102\54"), v82, v72, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\70\15\148\191\171\183\187\71\19\137\137\174\185\135\95\70\148\179\183\181\138\93\18\158\137\246\164\196\6\94", "\228\52\102\231\214\197\208");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(503 - (95 + 378), 1 + 1))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\19\233\123", "\182\126\128\21\170\138\235\121"), v82, v72, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\153\211\38\239\136\20\15\21\158\212\10\237\143\16\59\70\152\223\39\227\136\26\36\31\180\137\33\166\213\67", "\102\235\186\85\134\230\115\80");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (2 + 0))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(1041 - (334 + 677))) then
			v55 = 1453336 - 1065143;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\13\58\90\116\221\48\82\51\45\75\125\217\50\23\31\59\77\119\218\43\67\21\1\12\102\148\113\5", "\66\55\108\94\63\18\180");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\25\140\157", "\57\116\237\229\87\71"), v85, nil, not v8:IsInMeleeRange(1065 - (1049 + 7))) then
			v55 = 1716118 - 1323135;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\185\165\255\238\124\235\120\165\183\210\243\127\235\120\189\184\227\227\123\225\85\174\241\254\226\101\235\73\163\165\244\216\36\250\7\249\229", "\39\202\209\141\135\23\142");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v74() and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(3 + 5)) then
			v55 = 272247 - 170701;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\236\35\0\4\60\241\241\52\54\9\32\249\241\54\54\1\59\251\244\115\26\15\32\253\241\58\29\19\13\171\235\115\90\92", "\152\159\83\105\106\82");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:HasTier(60 - 30, 1 + 1)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\140\207\95", "\60\225\166\49\146\169"), v82, v77, not v8:IsInMeleeRange(1425 - (1004 + 416))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\45\18\46\41\10\8\58\10\16\33\8\4\36\94\60\47\19\2\33\23\59\51\62\84\59\94\124\114", "\103\79\126\79\74\97");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1958.5 - (1621 + 336)))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1947 - (337 + 1602))) then
			v55 = 103063 - (1014 + 503);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\111\218\125\80\19\180\120\236\112\76\27\180\122\236\120\87\25\177\63\192\118\76\31\180\118\199\106\97\73\174\63\135\35", "\122\218\31\179\19\62");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1017 - (446 + 569)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\190\223\195", "\37\211\182\173\161\169\193"), v82, v77, not v8:IsInMeleeRange(1 + 4)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\245\54\76\218\35\116\172\227\5\70\208\43\112\249\228\63\95\220\38\114\173\238\5\30\205\104\47\235", "\217\151\90\45\185\72\27");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\206\117\233", "\54\163\28\135\114"), v82, v77, not v8:IsInMeleeRange(14 - 9)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\42\215\92\129\69\112\61\207\98\137\71\124\35\155\78\135\92\122\38\210\73\155\113\44\60\155\9\214", "\31\72\187\61\226\46");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\206\7\91", "\68\163\102\35\178\39\30"), v85, nil, not v8:IsInMeleeRange(4 + 5)) then
			v55 = 816182 - 423199;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\173\100\200\206\8\176\188\30\184\79\206\207\6\138\148\24\176\116\214\200\17\177\195\2\187\98\223\201\10\161\154\46\237\100\154\147\85", "\113\222\16\186\167\99\213\227");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(513 - (223 + 282))) then
			v55 = 2929 + 98617;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\61\30\242\248\32\7\245\241\17\13\233\247\32\11\196\253\39\13\240\182\61\11\233\243\32\7\239\239\17\93\239\182\122\89", "\150\78\110\155");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(7 - 2)) then
			v55 = 222011 - 69836;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\146\205\46\243\168\23\177\71\186\193\53\224\163\17\177\127\149\208\41\226\172\94\172\69\151\192\41\232\176\7\128\19\145\133\115\185", "\32\229\165\71\129\196\126\223");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(678 - (623 + 47))) then
			v55 = 116892 - (32 + 13);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\209\156\215\137\136\219\196\182\206\128\133\208\252\158\205\143\133\149\208\140\214\132\143\220\215\144\251\210\149\149\150\217", "\181\163\233\164\225\225");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\93\138\38", "\23\48\235\94"), v85, nil, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\126\214\217\94\92\60\199\104\229\211\84\84\56\146\111\223\202\88\89\58\198\101\229\139\73\23\102\128", "\178\28\186\184\61\55\83");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (3 + 0))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(1806 - (1070 + 731))) then
			v55 = 96291 + 4489;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\208\196\64\57\224\49\229\197\193\74\124\225\11\231\193\195\78\40\235\49\166\208\141\18\104", "\149\164\173\39\92\146\110");
		end
	end
end
local function v104()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (1406 - (1257 + 147))) and not (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (1 + 1)) and v8:DebuffDown(v21.SkyreachExhaustionDebuff)) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(57 - 27)) then
			v55 = 388326 - (98 + 35);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\249\38\20\26\28\18\225\34\47\12\14\20\254\55\80\12\31\9\246\41\25\11\3\36\161\51\80\77", "\123\147\71\112\127\122");
		end
	end
	if (v21.TigerPalm:IsReady() and (v70(v21.TigerPalm))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\193\196\140", "\38\172\173\226\17"), v81, v78, not v8:IsInMeleeRange(3 + 2)) then
			v55 = 356922 - 256142;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\24\43\234\95\46\60\238\65\28\108\252\72\3\41\225\68\5\53\208\31\5\108\187", "\143\45\113\76");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (9 - 6)) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (1 + 0))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\181\177\18", "\92\216\216\124"), v82, v77, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\62\173\67\246\84\39\184\127\246\82\49\167\0\238\94\32\169\78\244\79\43\147\18\233\27\100", "\157\59\82\204\32");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:PrevGCD(558 - (395 + 162), v21.FistsofFury) and v7:HasTier(28 + 3, 1943 - (816 + 1125))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(11 - 3)) then
			v55 = 102694 - (701 + 447);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\43\46\234\244\231\227\221\182\7\61\241\251\231\239\236\186\49\61\232\186\250\239\193\180\54\55\247\227\214\184\199\241\96", "\209\88\94\131\154\137\138\179");
		end
	end
	if v21.RisingSunKick:IsReady() then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\37\168\202", "\66\72\193\164\28\126\67\81"), v82, v87, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\245\37\187\81\40\113\216\63\189\86\25\125\238\47\163\24\53\115\245\41\166\81\50\111\216\126\188\24\119\38", "\22\135\76\200\56\70");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(52 - 22, 1343 - (391 + 950))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\128\57\246", "\129\237\80\152\68\61"), v82, v72, not v8:IsInMeleeRange(13 - 8)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\67\161\23\250\18\16\103\66\189\10\204\23\30\91\90\232\23\246\14\18\86\88\188\29\204\78\3\24\0\250", "\56\49\200\100\147\124\119");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(75 - 45, 4 - 2))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\193\55\177", "\144\172\94\223"), v82, v72, not v8:IsInMeleeRange(4 + 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\54\6\177\78\42\8\157\84\49\1\157\76\45\12\169\7\55\10\176\66\42\6\182\94\27\93\182\7\117\91", "\39\68\111\194");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:BuffUp(v21.CalltoDominanceBuff)) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\219\167\255", "\215\182\198\135\167\25"), v85, v89, not v8:IsInMeleeRange(6 + 3)) then
			v55 = 1436922 - 1043939;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\158\93\248\65\134\76\213\71\139\118\254\64\136\118\253\65\131\77\230\71\159\77\170\91\136\91\239\70\132\93\243\119\223\93\170\25\219", "\40\237\41\138");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\202\117\226", "\42\167\20\154\152"), v85, v90, not v8:IsInMeleeRange(1531 - (251 + 1271))) then
			v55 = 349865 + 43118;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\234\176\75\122\36\117\241\164\125\101\41\79\193\181\75\127\37\70\241\176\70\49\50\79\236\167\76\120\53\83\193\240\86\49\112\18", "\65\42\158\194\34\17");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\23\46\92", "\142\122\71\50\108\77\141\123"), v82, v77, not v8:IsInMeleeRange(13 - 8)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\23\174\254\27\48\26\183\235\39\48\28\161\244\88\40\16\176\250\22\50\1\187\192\74\47\85\240\175", "\91\117\194\159\120");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(50 - 19, 1261 - (1147 + 112))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(2 + 6)) then
			v55 = 206242 - 104696;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\9\13\55\22\59\248\42\29\34\61\10\52\255\33\37\22\55\27\62\177\55\31\15\59\22\60\229\61\37\79\42\88\103\163", "\68\122\125\94\120\85\145");
		end
	end
	if (v21.FistsofFury:IsReady() and (v7:BuffUp(v21.InvokersDelightBuff))) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\26\29\215", "\218\119\124\175\62\168\185"), v85, nil, not v8:IsInMeleeRange(3 + 5)) then
			v55 = 114353 - (335 + 362);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\163\249\91\208\182\207\71\194\154\246\93\214\188\176\91\193\183\245\70\205\177\233\119\150\177\176\26\144", "\164\197\144\40");
		end
	end
	if v7:IsChanneling(v21.FistsofFury) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\176\196\133\187", "\214\227\144\202\235\189")) then
			v55 = 106520 + 7136;
			v55 = 171098 - 57442;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\235\172\148\111\3\140\92\58\210\163\146\105\9\140\80\61\227\166\130\119\80\160\86\46\232\171\142\111\9\140\1\40\173\247\209", "\92\141\197\231\27\112\211\51");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\235\254\146", "\177\134\159\234\195"), v85, nil, not v8:IsInMeleeRange(24 - 15)) then
			v55 = 1460257 - 1067274;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\174\255\45\169\194\184\212\48\166\246\169\227\58\159\222\180\229\59\172\198\175\239\127\179\204\175\238\49\169\221\164\212\109\180\137\239\179", "\169\221\139\95\192");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (4.5 - 3))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(87 - 56, 568 - (237 + 329))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(28 - 20)) then
			v55 = 66951 + 34595;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\205\155\118\49\44\47\208\140\64\60\48\39\208\142\64\52\43\37\213\203\108\58\48\35\208\130\107\38\29\116\202\203\44\111", "\70\190\235\31\95\66");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(1155 - (408 + 716), 7 - 5)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(829 - (344 + 477))) then
			v55 = 17284 + 84262;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\242\19\232\235\179\236\29\217\230\168\227\20\227\218\177\235\25\237\165\169\231\8\227\235\179\246\3\217\183\174\162\73\180", "\133\218\130\122\134");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:HasTier(1791 - (1188 + 573), 5 - 3)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\49\246\237", "\88\92\159\131\164\188\195"), v82, v77, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\130\34\190\72\220\228\200\148\17\180\66\212\224\157\147\43\173\78\217\226\201\153\17\237\95\151\184\137", "\189\224\78\223\43\183\139");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (6 - 4))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\35\245\132", "\161\78\156\234\118"), v82, v77, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\165\187\200\223\172\184\220\200\152\188\192\223\172\247\218\217\181\178\199\213\179\174\246\142\179\247\154\138", "\188\199\215\169");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v21.FistsofFury:CooldownRemains() > (12 - 7)) and v21.ShadowboxingTreads:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1530 - (508 + 1021)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\241\0\81", "\136\156\105\63\27"), v82, v77, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\25\128\120\55\16\131\108\32\36\135\112\55\16\204\106\49\9\137\119\61\15\149\70\102\15\204\42\108", "\84\123\236\25");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(1171 - (228 + 938))) then
			v55 = 152860 - (332 + 353);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\231\131\163\5\160\188\254\140\149\19\190\180\247\132\164\40\188\160\254\136\162\87\191\176\226\142\164\30\184\172\207\217\190\87\248\229", "\213\144\235\202\119\204");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\46\25\198", "\45\67\120\190\74\72\67"), v85, nil, not v8:IsInMeleeRange(6 - 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\34\46\236\166\242\135\251\253\31\41\228\166\242\200\253\236\50\39\227\172\237\145\209\187\52\98\185\247", "\137\64\66\141\197\153\232\142");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (7 - 4))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 50534 + 50246;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\23\217\37\163\154\60\192\35\170\133\67\195\39\180\141\13\217\54\191\183\81\196\98\242\220", "\232\99\176\66\198");
		end
	end
end
local function v105()
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (7 - 5)) and v8:DebuffDown(v21.SkyreachExhaustionDebuff)) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(453 - (18 + 405))) then
			v55 = 177886 + 210307;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\230\32\44\3\125\132\235\41\211\50\60\9\118\157\185\63\233\51\45\8\114\153\224\19\255\53\104\84", "\76\140\65\72\102\27\237\153");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and (v7:BuffRemains(v21.SerenityBuff) < (1.5 - 0)) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(1009 - (194 + 784), 1774 - (694 + 1076))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1912 - (122 + 1782))) then
			v55 = 95560 + 5986;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\202\31\220\217\8\176\77\229\21\192\214\15\187\117\209\31\209\220\65\173\79\200\19\220\222\21\167\117\201\2\146\131", "\222\42\186\118\178\183\97");
		end
	end
	if (v21.TigerPalm:IsReady() and v8:DebuffDown(v21.SkyreachExhaustionDebuff) and v70(v21.TigerPalm)) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 90709 + 10071;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\73\229\67\143\79\211\84\139\81\225\4\153\88\254\65\132\84\248\93\181\78\248\4\220", "\234\61\140\36");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (3 + 0)) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (2 - 1))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 102754 - (214 + 1756);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\35\209\187\113\4\46\200\174\77\4\40\222\177\50\28\36\207\191\124\6\53\196\133\97\27\97\133", "\111\65\189\218\18");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:HasTier(149 - 118, 1 + 3)) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(1 + 8)) then
			v55 = 393568 - (217 + 368);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\80\95\9\60\0\89\144\76\77\36\33\3\89\144\84\66\21\49\7\83\189\71\11\8\48\25\89\161\74\95\2\10\24\72\239\18\27", "\207\35\43\123\85\107\60");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v70(v21.RisingSunKick))) then
		if v16(v21.RisingSunKick, nil, nil, not v8:IsInMeleeRange(15 - 10)) then
			v55 = 70741 + 36687;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\98\163\179\227\119\119\149\179\255\119\79\161\169\233\114\48\185\165\248\124\126\163\180\243\70\99\190\224\187\43", "\25\16\202\192\138");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (2 + 0))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(2 + 28)) then
			v55 = 389082 - (844 + 45);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\247\202\169\231\175\253\239\206\146\241\189\251\240\219\237\241\172\230\248\197\164\246\176\203\238\223\237\179\253", "\148\157\171\205\130\201");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:BuffUp(v21.CalltoDominanceBuff) and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > v7:BuffRemains(v21.CalltoDominanceBuff))) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(293 - (242 + 42))) then
			v55 = 786635 - 393652;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\48\192\102\32\218\243\28\219\114\22\197\254\38\235\99\32\223\242\47\219\102\45\145\229\38\198\113\39\216\226\58\235\103\61\145\167\117", "\150\67\180\20\73\177");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (127 - 72))) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(1209 - (132 + 1068))) then
			v55 = 627472 - 234489;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\158\12\8\68\134\29\37\66\139\39\14\69\136\39\13\68\131\28\22\66\159\28\90\94\136\10\31\67\132\12\3\114\158\12\90\28\213", "\45\237\120\122");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:PrevGCD(1624 - (214 + 1409), v21.RisingSunKick) and v7:HasTier(24 + 7, 1636 - (497 + 1137))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(948 - (9 + 931))) then
			v55 = 101835 - (181 + 108);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\196\248\171\34\217\225\172\43\232\235\176\45\217\237\157\39\222\235\169\108\196\237\176\41\217\225\182\53\232\251\182\108\133\184", "\76\183\136\194");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:HasTier(19 + 12, 4 - 2) and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:PrevGCD(2 - 1, v21.RisingSunKick)) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(2 + 3)) then
			v55 = 62832 + 37952;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\120\234\228\59\91\64\1\110\217\238\49\83\68\84\105\227\247\61\94\70\0\99\217\246\44\16\29\70", "\116\26\134\133\88\48\47");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (477.5 - (296 + 180)))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:PrevGCD(1404 - (1183 + 220), v21.FistsofFury) and v7:HasTier(1296 - (1037 + 228), 2 - 0)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(23 - 15)) then
			v55 = 346965 - 245419;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\13\209\169\234\179\123\16\198\159\231\175\115\16\196\159\239\180\113\21\129\179\225\175\119\16\200\180\253\130\97\10\129\242\176", "\18\126\161\192\132\221");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff) and v7:PrevGCD(735 - (527 + 207), v21.FistsofFury) and v7:HasTier(558 - (187 + 340), 1872 - (1298 + 572))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\82\33\160", "\54\63\72\206\100"), v82, v77, not v8:IsInMeleeRange(12 - 7)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\202\85\68\121\238\116\221\77\122\113\236\120\195\25\86\127\247\126\198\80\81\99\218\104\220\25\23\44", "\27\168\57\37\26\133");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (171.5 - (144 + 26)))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(77 - 46, 4 - 2) and v7:PrevGCD(1 + 0, v21.FistsofFury)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(21 - 13)) then
			v55 = 235736 - 134190;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\62\186\117\166\217\36\164\123\151\212\63\171\114\173\232\38\163\127\163\151\62\175\110\173\217\36\190\101\151\196\57\234\46\255", "\183\77\202\28\200");
		end
	end
	if (v21.FistsofFury:IsReady() and (v7:BuffUp(v21.InvokersDelightBuff))) then
		if v16(v21.FistsofFury, nil, nil, not v8:IsInMeleeRange(38 - 30)) then
			v55 = 57724 + 55932;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\17\58\154\28\4\12\134\14\40\53\156\26\14\115\154\13\5\54\135\1\3\42\182\27\3\115\219\80", "\104\119\83\233");
		end
	end
	if v7:IsChanneling(v21.FistsofFury) then
		if v17(v21.StopFoF, false, LUAOBFUSACTOR_DECRYPT_STR_0("\198\204\8\18", "\35\149\152\71\66")) then
			v55 = 154267 - 40611;
			v55 = 106131 + 7525;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\31\225\81\164\41\38\231\68\143\60\12\250\91\143\57\24\230\65\181\54\89\251\71\162\63\23\225\86\169\5\10\252\2\227\106", "\90\121\136\34\208");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(233 - (5 + 197), 688 - (339 + 347))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(17 - 9)) then
			v55 = 357628 - 256082;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\212\30\92\16\201\7\91\25\248\13\71\31\201\11\106\21\206\13\94\94\212\11\71\27\201\7\65\7\248\29\65\94\148\92", "\126\167\110\53");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > v7:BuffRemains(v21.CalltoDominanceBuff))) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(385 - (365 + 11))) then
			v55 = 372406 + 20577;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\46\4\60\241\215\58\2\31\40\199\200\55\56\47\57\241\210\59\49\31\60\252\156\44\56\2\43\246\213\43\36\47\61\236\156\108\105", "\95\93\112\78\152\188");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:HasTier(115 - 85, 4 - 2)) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(929 - (837 + 87))) then
			v55 = 170900 - 70116;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\195\249\132\22\239\177\199\213\202\142\28\231\181\146\210\240\151\16\234\183\198\216\202\150\1\164\237\132", "\178\161\149\229\117\132\222");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(1675 - (837 + 833))) then
			v55 = 21501 + 79283;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\138\215\220\175\170\25\179\55\183\208\212\175\170\86\181\38\154\222\211\165\181\15\153\48\156\155\142\244", "\67\232\187\189\204\193\118\198");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1395 - (356 + 1031))) then
			v55 = 46178 + 55368;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\152\62\188\46\53\11\225\140\17\182\50\58\12\234\180\37\188\35\48\66\252\142\60\176\46\50\22\246\180\61\161\96\111\82", "\143\235\78\213\64\91\98");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(1651 - (73 + 1573))) then
			v55 = 153563 - (1307 + 81);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\154\64\141\251\124\191\131\79\187\237\98\183\138\71\138\214\96\163\131\75\140\169\99\179\159\77\138\224\100\175\178\91\144\169\36\228", "\214\237\40\228\137\16");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (237 - (7 + 227)))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(8 - 3)) then
			v55 = 100946 - (90 + 76);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\145\234\232\220\17\153\149\226\227\212\67\181\128\241\234\215\10\178\156\220\252\205\67\242\209", "\198\229\131\143\185\99");
		end
	end
end
local function v106()
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (3.5 - 2))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 83813 + 17733;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\66\156\161\125\95\133\166\116\110\143\186\114\95\137\151\120\88\143\163\51\85\137\174\114\68\128\188\76\80\131\173\51\3", "\19\49\236\200");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and not v21.HitCombo:IsAvailable() and v74() and v7:BuffUp(v21.BonedustBrewBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(31 - 23)) then
			v55 = 101806 - (197 + 63);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\237\39\255\185\234\179\240\48\201\180\246\187\240\50\201\188\237\185\245\119\242\178\226\187\235\59\226\136\229\181\251\119\162", "\218\158\87\150\215\132");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\246\31\193", "\173\155\126\185\130\86\66"), v85, nil, not v8:IsInMeleeRange(2 + 7)) then
			v55 = 93083 + 299900;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\246\178\168\206\131\233\218\169\188\248\156\228\224\153\173\206\134\232\233\169\168\195\200\232\224\160\187\210\132\248\218\167\181\194\200\186", "\140\133\198\218\167\232");
		end
	end
	if (v21.WhirlingDragonPunch:IsReady() and (v26 > (5 + 3))) then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(1 + 4)) then
			v55 = 191011 - 38836;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\162\38\189\111\136\188\32\179\66\128\167\47\179\114\138\138\62\161\115\135\189\110\176\120\130\180\59\184\105\187\180\33\177\61\220", "\228\213\78\212\29");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1370.5 - (618 + 751)))) and v7:BuffUp(v21.BonedustBrewBuff) and v70(v21.SpinningCraneKick) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(6 + 2)) then
			v55 = 103456 - (206 + 1704);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\148\92\191\11\229\142\66\177\58\232\149\77\184\0\212\140\69\181\14\171\131\73\176\4\254\139\88\137\4\228\130\12\231\85", "\139\231\44\214\101");
		end
	end
	if v21.FistsofFury:IsReady() then
		if v65.CastTargetIf(v21.FistsofFury, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\212\238\30", "\118\185\143\102\62\112\209\81"), v85, nil, not v8:IsInMeleeRange(13 - 5)) then
			v55 = 226907 - 113251;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\90\121\58\242\182\42\19\62\99\118\60\244\188\85\24\61\90\113\60\234\177\42\29\55\89\48\120\180", "\88\60\16\73\134\197\117\124");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.BonedustBrewBuff) and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(14 + 16, 1277 - (155 + 1120))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\93\227\246", "\33\48\138\152\168"), v82, v72, not v8:IsInMeleeRange(1511 - (396 + 1110))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\96\31\35\88\207\48\77\5\37\95\254\60\123\21\59\17\197\50\116\23\37\93\213\8\115\25\53\17\144\99", "\87\18\118\80\49\161");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (6 - 3)) and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\65\23\212", "\208\44\126\186\192"), v82, v77, not v8:IsInMeleeRange(2 + 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\245\22\165\197\31\243\220\90\200\17\173\197\31\188\205\75\241\27\177\202\0\195\200\65\242\90\245\144", "\46\151\122\196\166\116\156\169");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\232\228\72", "\155\133\141\38\122"), v82, v77, not v8:IsInMeleeRange(4 + 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\39\38\173\66\68\112\176\49\21\167\72\76\116\229\33\47\170\64\90\115\177\26\43\163\68\15\46\253", "\197\69\74\204\33\47\31");
		end
	end
	if (v21.WhirlingDragonPunch:IsReady() and (v26 >= (5 + 0))) then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(981 - (230 + 746))) then
			v55 = 152776 - (473 + 128);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\231\71\83\149\252\70\84\128\207\75\72\134\247\64\84\184\224\90\84\132\248\15\94\130\246\78\79\139\228\112\91\136\245\15\8\215", "\231\144\47\58");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(78 - (39 + 9), 268 - (38 + 228)) or (v21.WhirlingDragonPunch:IsAvailable() and (v21.WhirlingDragonPunch:CooldownRemains() < (5 - 2)) and (v21.FistsofFury:CooldownRemains() > (476 - (106 + 367))) and v7:BuffDown(v21.KicksofFlowingMomentumBuff)))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\191\209\212", "\89\210\184\186\21\120\93\175"), v82, v72, not v8:IsInMeleeRange(1 + 4)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\163\90\111\220\119\61\142\64\105\219\70\49\184\80\119\149\125\63\183\82\105\217\109\5\176\92\121\149\43\104", "\90\209\51\28\181\25");
		end
	end
	if (v21.ExpelHarm:IsReady() and (((v7:Chi() == (1863 - (354 + 1508))) and (v21.RisingSunKick:CooldownUp() or v21.StrikeoftheWindlord:CooldownUp())) or ((v7:Chi() == (6 - 4)) and v21.FistsofFury:CooldownUp()))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(6 + 2)) then
			v55 = 188813 + 133288;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\213\99\71\235\179\239\115\86\252\178\144\127\82\232\190\197\119\67\209\190\223\126\23\188\235", "\223\176\27\55\142");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and (v21.FistsofFury:CooldownRemains() < (1249 - (334 + 910))) and (v7:BuffStack(v21.ChiEnergyBuff) > (905 - (92 + 803)))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(5 + 3)) then
			v55 = 102727 - (1035 + 146);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\55\171\199\187\42\178\192\178\27\184\220\180\42\190\241\190\45\184\197\245\32\190\200\180\49\183\218\138\37\180\203\245\118\237", "\213\68\219\174");
		end
	end
	if (v21.ChiBurst:IsCastable() and (v7:Chi() < (621 - (230 + 386))) and (v7:BloodlustUp() or (v7:Energy() < (30 + 20)))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(1550 - (353 + 1157))) then
			v55 = 125100 - (53 + 1061);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\8\232\42\216\40\208\45\108\31\160\39\226\44\196\42\115\31\223\34\232\47\133\109\39", "\31\107\128\67\135\74\165\95");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1636.5 - (1568 + 67)))) and v70(v21.SpinningCraneKick) and ((v21.FistsofFury:CooldownRemains() > (2 + 1)) or (v7:Chi() > (1 + 1))) and v74() and v7:BuffDown(v21.BlackoutReinforcementBuff) and (v7:BloodlustUp() or v7:BuffUp(v21.InvokersDelightBuff))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(20 - 12)) then
			v55 = 298780 - 197234;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\203\248\245\67\79\184\214\239\195\78\83\176\214\237\195\70\72\178\211\168\248\72\71\176\205\228\232\114\64\190\221\168\175\29", "\209\184\136\156\45\33");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick) and v7:HasTier(75 - 45, 2 + 0) and v7:BuffDown(v21.BonedustBrewBuff) and (((v26 < (1227 - (615 + 597))) and not v21.CraneVortex:IsAvailable()) or (v26 < (8 + 0)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\10\193\123", "\216\103\168\21\104"), v82, v77, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\122\161\66\167\115\162\86\176\71\166\74\167\115\237\71\161\126\172\86\168\108\146\66\171\125\237\16\246", "\196\24\205\35");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and ((v21.FistsofFury:CooldownRemains() > (1 + 2)) or (v7:Chi() > (3 + 1))) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1907 - (1056 + 843))) then
			v55 = 221429 - 119883;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\61\155\234\8\32\130\237\1\17\136\241\7\32\142\220\13\39\136\232\70\42\142\229\7\59\135\247\57\47\132\230\70\125\223", "\102\78\235\131");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (4 - 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\247\39\58", "\84\154\78\84\36\39\89\215"), v82, v77, not v8:IsInMeleeRange(14 - 9)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\255\237\87\91\14\242\244\66\103\14\244\226\93\24\1\248\231\87\77\9\233\222\87\87\0\189\178\14", "\101\157\129\54\56");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\16\168\146", "\25\125\201\234\203\67"), v85, nil, not v8:IsInMeleeRange(6 + 3)) then
			v55 = 394959 - (286 + 1690);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\106\224\10\10\31\34\44\118\242\39\23\28\34\44\110\253\22\7\24\40\1\125\180\28\6\18\38\6\117\224\39\2\27\34\83\45\164", "\115\25\148\120\99\116\71");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick) and not v74()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\1\52\183", "\33\108\93\217\68"), v82, v77, not v8:IsInMeleeRange(916 - (98 + 813))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\217\71\160\174\208\68\180\185\228\64\168\174\208\11\165\168\221\74\180\161\207\116\160\162\222\11\245\255", "\205\187\43\193");
		end
	end
	if (v21.ChiBurst:IsReady() and (((v7:ChiDeficit() >= (1 + 0)) and (v26 == (2 - 1))) or (v7:ChiDeficit() >= (2 + 0)))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(547 - (263 + 244))) then
			v55 = 98130 + 25856;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\253\122\12\224\252\103\23\204\234\50\1\218\248\115\16\211\234\77\4\208\251\50\81\139", "\191\158\18\101");
		end
	end
end
local function v107()
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v7:Chi() < (1689 - (1502 + 185))) and ((v21.FistsofFury:CooldownRemains() < (1 + 0)) or (v21.StrikeoftheWindlord:CooldownRemains() < (4 - 3))) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (7 - 4))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\200\202\137", "\207\165\163\231\215"), v80, nil, not v8:IsInMeleeRange(1532 - (629 + 898))) then
			v55 = 274455 - 173675;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\210\240\254\83\54\79\214\248\245\91\100\116\195\255\248\67\40\100\249\173\237\22\118", "\16\166\153\153\54\68");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v74() and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(373 - (12 + 353))) then
			v55 = 103457 - (1680 + 231);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\193\163\201\72\58\40\247\213\140\195\84\53\47\252\237\184\201\69\63\97\253\215\181\193\83\56\53\198\134\167\128\18", "\153\178\211\160\38\84\65");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\143\10\66", "\75\226\107\58"), v85, nil, not v8:IsInMeleeRange(1 + 8)) then
			v55 = 240652 + 152331;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\75\202\3\115\26\199\242\87\216\46\110\25\199\242\79\215\31\126\29\205\223\92\158\21\127\23\195\216\84\202\46\46\5\130\155", "\173\56\190\113\26\113\162");
		end
	end
	if v21.FistsofFury:IsReady() then
		if v65.CastTargetIf(v21.FistsofFury, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\198\223\53", "\151\171\190\77\101"), v85, nil, not v8:IsInMeleeRange(1157 - (212 + 937))) then
			v55 = 75719 + 37937;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\195\38\235\189\235\66\4\195\16\254\188\234\100\75\193\42\254\168\237\113\31\250\123\236\233\160", "\107\165\79\152\201\152\29");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.BonedustBrewBuff) and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(1092 - (111 + 951), 1 + 1)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\90\71\230", "\31\55\46\136\171\52"), v82, v72, not v8:IsInMeleeRange(32 - (18 + 9))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\195\33\207\253\223\47\227\231\196\38\227\255\216\43\215\180\213\45\218\245\196\36\200\203\133\60\156\165\129", "\148\177\72\188");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\171\191\89", "\179\198\214\55"), v82, v77, not v8:IsInMeleeRange(2 + 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\242\0\115\117\78\220\229\24\77\125\76\208\251\76\118\115\67\210\229\0\102\73\17\199\176\93\32", "\179\144\108\18\22\37");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (535.5 - (31 + 503)))) and v7:BuffUp(v21.BonedustBrewBuff) and v70(v21.SpinningCraneKick) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1640 - (595 + 1037))) then
			v55 = 102990 - (189 + 1255);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\213\179\18\135\193\207\173\28\182\204\212\162\21\140\240\205\170\24\130\143\194\166\29\136\218\202\183\36\221\219\134\242\79", "\175\166\195\123\233");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(2 + 3)) then
			v55 = 235540 - 83365;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\248\202\84\91\252\230\204\90\118\244\253\195\90\70\254\208\210\72\71\243\231\130\89\76\246\238\215\81\93\207\187\214\29\24\166", "\144\143\162\61\41");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffDown(v21.BonedustBrewBuff) and v7:BuffUp(v21.PressurePointBuff) and (v21.FistsofFury:CooldownRemains() > (1284 - (1170 + 109)))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\237\218\19", "\83\128\179\125\48\18\231"), v82, v72, not v8:IsInMeleeRange(1822 - (348 + 1469))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\79\190\224\212\73\25\98\164\230\211\120\21\84\180\248\157\67\27\91\182\230\209\83\33\9\163\179\140\31", "\126\61\215\147\189\39");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(1297 - (1115 + 174))) then
			v55 = 284976 - 168129;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\106\234\14\77\113\241\26\122\114\254\25\64\71\232\20\75\124\191\25\64\126\254\8\73\108\192\73\81\56\173\77", "\37\24\159\125");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1017 - (85 + 929))) and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\215\175\123", "\34\186\198\21"), v82, v77, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\250\4\196\94\201\247\29\209\98\201\241\11\206\29\198\253\14\196\72\206\236\55\145\73\130\170\90", "\162\152\104\165\61");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(1897 - (1151 + 716), 1 + 1))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\192\38\188", "\133\173\79\210\29\16"), v82, v72, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\159\117\254\34\131\123\210\56\152\114\210\32\132\127\230\107\137\121\235\42\152\112\249\20\217\104\173\121\217", "\75\237\28\141");
		end
	end
	if (v21.ExpelHarm:IsReady() and (((v7:Chi() == (1705 - (95 + 1609))) and (v21.RisingSunKick:CooldownUp() or v21.StrikeoftheWindlord:CooldownUp())) or ((v7:Chi() == (6 - 4)) and v21.FistsofFury:CooldownUp()))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(766 - (364 + 394))) then
			v55 = 291879 + 30222;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\217\71\220\180\35\36\239\224\206\82\140\181\42\29\230\244\208\75\243\229\59\91\181\183", "\129\188\63\172\209\79\123\135");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and (v21.FistsofFury:CooldownRemains() > (1 + 2)) and (v7:BuffStack(v21.ChiEnergyBuff) > (9 + 1))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(5 + 3)) then
			v55 = 51770 + 49776;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\83\244\239\195\78\237\232\202\127\231\244\204\78\225\217\198\73\231\237\141\68\225\224\204\85\232\242\242\20\240\166\159\24", "\173\32\132\134");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v7:HasTier(12 + 18, 2 + 0)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\67\18\6", "\173\46\123\104\143\206\81"), v82, v77, not v8:IsInMeleeRange(2 + 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\182\17\35\137\78\140\20\160\34\41\131\70\136\65\176\24\36\139\80\143\21\139\73\54\202\22\211", "\97\212\125\66\234\37\227");
		end
	end
	if (v21.ChiBurst:IsCastable() and (v7:Chi() < (961 - (719 + 237))) and (v7:BloodlustUp() or (v7:Energy() < (139 - 89)))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(34 + 6)) then
			v55 = 307330 - 183344;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\137\235\191\10\28\159\241\165\33\94\142\230\176\52\11\134\247\137\97\10\202\176\228", "\126\234\131\214\85");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (2.5 - 1))) and v70(v21.SpinningCraneKick) and ((v21.FistsofFury:CooldownRemains() > (7 - 4)) or (v7:Chi() > (1995 - (761 + 1230)))) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(201 - (80 + 113))) then
			v55 = 55212 + 46334;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\151\197\64\84\65\141\219\78\101\76\150\212\71\95\112\143\220\74\81\15\128\208\79\91\90\136\193\118\14\91\196\134\29", "\47\228\181\41\58");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (3 + 0))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\171\245\215", "\127\198\156\185\91\99\80"), v82, v77, not v8:IsInMeleeRange(1 + 4)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\247\22\205\243\172\4\44\202\202\17\197\243\172\75\61\219\243\27\217\252\179\52\109\202\181\73\154", "\190\149\122\172\144\199\107\89");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\63\4\233", "\158\82\101\145\158"), v85, nil, not v8:IsInMeleeRange(35 - 26)) then
			v55 = 90899 + 302084;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\99\234\16\31\79\117\193\13\16\123\100\246\7\41\83\121\240\6\26\75\98\250\66\18\65\118\255\23\26\80\79\170\22\86\16\32", "\36\16\158\98\118");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and ((v21.FistsofFury:CooldownRemains() > (1246 - (965 + 278))) or (v7:Chi() > (1733 - (1391 + 338))))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(20 - 12)) then
			v55 = 98837 + 2709;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\211\6\202\245\86\225\41\226\255\21\209\250\86\237\24\238\201\21\200\187\92\237\33\228\213\26\215\196\12\252\103\177\146", "\133\160\118\163\155\56\136\71");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\251\171\127", "\213\150\194\17\146\214\127"), v82, v77, not v8:IsInMeleeRange(10 - 5)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\25\165\165\215\77\171\183\34\36\162\173\215\77\228\166\51\29\168\177\216\82\155\246\34\91\253\240", "\86\123\201\196\180\38\196\194");
		end
	end
end
local function v108()
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v7:Chi() < (1 + 1)) and ((v21.RisingSunKick:CooldownRemains() < (1409 - (496 + 912))) or (v21.FistsofFury:CooldownRemains() < (3 - 2)) or (v21.StrikeoftheWindlord:CooldownRemains() < (1 + 0))) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (5 - 2))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\250\225\215", "\207\151\136\185"), v80, nil, not v8:IsInMeleeRange(1335 - (1190 + 140))) then
			v55 = 48462 + 52318;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\188\138\47\135\102\71\97\169\143\37\194\112\125\119\169\150\36\150\75\43\101\232\209", "\17\200\227\72\226\20\24");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (719.5 - (317 + 401)))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(957 - (303 + 646))) then
			v55 = 360202 - 258656;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\163\81\18\217\199\248\225\248\143\66\9\214\199\244\208\244\185\66\16\151\205\244\233\254\165\77\15\232\154\229\175\171", "\159\208\33\123\183\169\145\143");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:HasTier(1763 - (1675 + 57), 3 + 1)) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\255\91\32", "\86\146\58\88"), v85, nil, not v8:IsInMeleeRange(23 - 14)) then
			v55 = 48954 + 344029;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\75\203\248\201\165\236\9\245\94\224\254\200\171\214\33\243\86\219\230\207\188\237\118\254\93\217\235\213\162\253\9\169\76\159\188", "\154\56\191\138\160\206\137\86");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (997 - (338 + 639))) or (v28 < (384 - (320 + 59))))) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\139\88\237", "\172\230\57\149\231\28\90\225"), v85, nil, not v8:IsInMeleeRange(5 + 4)) then
			v55 = 393715 - (628 + 104);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\17\190\148\219\35\222\61\165\128\237\60\211\7\149\145\219\38\223\14\165\148\214\104\223\7\172\135\199\36\207\61\249\146\146\112", "\187\98\202\230\178\72");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (3 - 0)) and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\44\232\170", "\42\65\129\196\80"), v82, v77, not v8:IsInMeleeRange(1896 - (439 + 1452))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\0\70\92\217\28\8\23\250\61\65\84\217\28\71\6\235\4\75\72\214\3\56\81\250\66\27\13", "\142\98\42\61\186\119\103\98");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\53\182\12", "\104\88\223\98"), v82, v77, not v8:IsInMeleeRange(1952 - (105 + 1842))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\70\251\227\205\9\226\81\227\221\197\11\238\79\183\230\203\4\236\81\251\246\241\81\249\4\166\176", "\141\36\151\130\174\98");
		end
	end
	if v21.FistsofFury:IsReady() then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\137\123\218", "\109\228\26\162"), v85, nil, not v8:IsInMeleeRange(36 - 28)) then
			v55 = 277207 - 163551;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\88\236\238\108\243\217\81\227\194\126\245\244\71\165\249\125\230\231\75\233\233\71\179\242\30\180\169", "\134\62\133\157\24\128");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffUp(v21.BonedustBrewBuff) and v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(144 - 114, 1 + 1)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\10\172\20", "\182\103\197\122\185\79\209"), v82, v72, not v8:IsInMeleeRange(8 - 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\225\142\242\126\14\79\204\148\244\121\63\67\250\132\234\55\4\77\245\134\244\123\20\119\160\147\161\38\86", "\40\147\231\129\23\96");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v7:BuffUp(v21.BonedustBrewBuff) and v70(v21.SpinningCraneKick)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1172 - (274 + 890))) then
			v55 = 88318 + 13228;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\102\232\133\75\181\165\210\114\199\143\87\186\162\217\74\243\133\70\176\236\216\112\254\141\80\183\184\227\38\236\204\20\227", "\188\21\152\236\37\219\204");
		end
	end
	if (v21.RisingSunKick:IsReady() and v7:BuffDown(v21.BonedustBrewBuff) and v7:BuffUp(v21.PressurePointBuff)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\77\224\57", "\108\32\137\87"), v82, v72, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\184\225\19\175\33\254\116\74\191\230\63\173\38\250\64\25\174\237\6\167\58\245\95\102\249\252\64\244\127", "\57\202\136\96\198\79\153\43");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(9 + 21, 2 + 0))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\166\42\164", "\152\203\67\202\199\237\199"), v82, v72, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\232\74\179\6\17\114\70\245\239\77\159\4\22\118\114\166\254\70\166\14\10\121\109\217\169\87\224\93\77", "\134\154\35\192\111\127\21\25");
		end
	end
	if (v21.ExpelHarm:IsReady() and (((v7:Chi() == (1 - 0)) and (v21.RisingSunKick:CooldownUp() or v21.StrikeoftheWindlord:CooldownUp())) or ((v7:Chi() == (821 - (731 + 88))) and v21.FistsofFury:CooldownUp()))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(7 + 1)) then
			v55 = 197545 + 124556;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\189\62\25\15\44\237\176\39\27\7\96\214\189\32\8\31\44\198\135\117\29\74\114\134", "\178\216\70\105\106\64");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1 + 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\50\34\116", "\224\95\75\26\150\169\181\180"), v82, v77, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\9\214\217\43\79\163\99\31\229\211\33\71\167\54\15\223\222\41\81\160\98\52\137\204\104\22\250", "\22\107\186\184\72\36\204");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\234\188\60", "\110\135\221\68\46"), v85, nil, not v8:IsInMeleeRange(27 - 18)) then
			v55 = 1142161 - 749178;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\240\34\30\226\197\182\4\236\48\51\255\198\182\4\244\63\2\239\194\188\41\231\118\8\238\200\178\46\239\34\51\184\218\243\105\187", "\91\131\86\108\139\174\211");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.TeachingsoftheMonasteryBuff) and (v21.ShadowboxingTreads:IsAvailable() or (v21.RisingSunKick:CooldownRemains() > (1 - 0)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\246\34\182", "\61\155\75\216\119"), v82, v77, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\6\167\179\63\83\6\200\16\148\185\53\91\2\157\0\174\180\61\77\5\201\59\248\166\124\11\89", "\189\100\203\210\92\56\105");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(1 + 4)) then
			v55 = 27335 + 124840;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\89\244\58\35\88\243\47\16\85\239\41\40\94\243\23\63\68\243\43\39\17\249\45\41\80\232\36\59\110\174\60\111\2\175", "\72\79\49\157");
		end
	end
	if (v21.ChiBurst:IsCastable() and (v7:Chi() < (4 + 1)) and (v7:BloodlustUp() or (v7:Energy() < (208 - (139 + 19))))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(8 + 32)) then
			v55 = 125979 - (1687 + 306);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\139\184\56\131\138\165\35\175\156\240\53\185\142\177\36\176\156\143\98\168\200\227\101", "\220\232\208\81");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (10 - 7))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\248\183\235", "\193\149\222\133\80\76\58"), v82, v77, not v8:IsInMeleeRange(1159 - (1018 + 136))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\196\81\78\209\205\82\90\198\249\86\70\209\205\29\75\215\192\92\90\222\210\98\28\198\134\14\25", "\178\166\61\47");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and (v21.FistsofFury:CooldownRemains() < (13 - 10)) and (v7:BuffStack(v21.ChiEnergyBuff) > (830 - (117 + 698)))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(489 - (305 + 176))) then
			v55 = 13544 + 88002;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\232\90\225\116\196\55\245\77\215\121\216\63\245\79\215\113\195\61\240\10\236\127\204\63\238\70\252\69\153\42\187\25\176", "\94\155\42\136\26\170");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v21.FistsofFury:CooldownRemains() > (3 + 1)) and (v7:Chi() > (5 - 2))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\137\54\40", "\213\228\95\70"), v82, v72, not v8:IsInMeleeRange(5 + 0)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\178\209\141\121\45\132\209\145\121\21\176\203\135\124\106\191\199\130\118\63\183\214\187\36\62\251\150\212", "\23\74\219\162\228");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and v21.RisingSunKick:CooldownDown() and v21.FistsofFury:CooldownDown() and (v7:Chi() > (8 - 4)) and ((v21.StormEarthAndFire:IsAvailable() and not v21.BonedustBrew:IsAvailable()) or v21.Serenity:IsAvailable())) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(13 - 5)) then
			v55 = 101806 - (159 + 101);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\42\246\79\161\53\48\232\65\144\56\43\231\72\170\4\50\239\69\164\123\61\227\64\174\46\53\242\121\252\47\121\178\20", "\91\89\134\38\207");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v21.FistsofFury:CooldownDown()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\73\231\198", "\71\36\142\168\86\115\176"), v82, v77, not v8:IsInMeleeRange(24 - 19)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\221\173\115\188\8\177\67\93\224\170\123\188\8\254\82\76\217\160\103\179\23\129\5\93\159\245\38", "\41\191\193\18\223\99\222\54");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(27 - 19)) then
			v55 = 57817 + 59030;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\185\51\212\34\163\165\33\248\32\171\175\35\248\61\163\165\34\135\46\175\173\39\210\38\190\148\117\211\106\254\253", "\202\203\70\167\74");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v21.ShadowboxingTreads:IsAvailable() and not v74()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\33\8\210", "\17\76\97\188\83"), v82, v77, not v8:IsInMeleeRange(15 - 10)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\135\43\216\52\59\140\94\183\186\44\208\52\59\195\79\166\131\38\204\59\36\188\24\183\197\115\129", "\195\229\71\185\87\80\227\43");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 - 0))) and v70(v21.SpinningCraneKick) and (((v7:Chi() > (1 + 4)) and v21.StormEarthAndFire:IsAvailable()) or ((v7:Chi() > (270 - (112 + 154))) and v21.Serenity:IsAvailable()))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(18 - 10)) then
			v55 = 101577 - (21 + 10);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\243\236\9\94\225\233\242\7\111\236\242\253\14\85\208\235\245\3\91\175\228\249\6\81\250\236\232\63\3\251\160\169\80", "\143\128\156\96\48");
		end
	end
end
local function v109()
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v7:Chi() < (1721 - (531 + 1188))) and ((v21.RisingSunKick:CooldownRemains() < (1 + 0)) or (v21.FistsofFury:CooldownRemains() < (664 - (96 + 567))) or (v21.StrikeoftheWindlord:CooldownRemains() < (1 - 0))) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (2 + 1))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\181\216\254", "\119\216\177\144\114"), v80, nil, not v8:IsInMeleeRange(17 - 12)) then
			v55 = 102475 - (867 + 828);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\221\32\254\71\219\22\233\67\197\36\185\70\204\47\248\87\197\61\198\16\221\105\171", "\34\169\73\153");
		end
	end
	if (v21.ExpelHarm:IsReady() and (((v7:Chi() == (2 - 1)) and (v21.RisingSunKick:CooldownUp() or v21.StrikeoftheWindlord:CooldownUp())) or ((v7:Chi() == (7 - 5)) and v21.FistsofFury:CooldownUp()))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(17 - 9)) then
			v55 = 496314 - 174213;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\175\244\27\142\166\211\3\138\184\225\75\143\175\234\10\158\166\248\52\217\190\172\95", "\235\202\140\107");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (2 + 1)) and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\1\125\58", "\165\108\20\84\200\137\71\151"), v82, v77, not v8:IsInMeleeRange(8 - 3)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\120\184\42\139\113\187\62\156\69\191\34\139\113\244\47\141\124\181\62\132\110\139\121\156\58\226", "\232\26\212\75");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and v7:HasTier(802 - (134 + 637), 1 + 3)) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\58\72\106", "\151\87\41\18\136"), v85, nil, not v8:IsInMeleeRange(1166 - (775 + 382))) then
			v55 = 562663 - 169680;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\72\187\216\217\245\94\144\197\214\193\79\167\207\239\233\82\161\206\220\241\73\171\138\212\251\93\174\223\220\234\100\253\222\144\166", "\158\59\207\170\176");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and v21.Thunderfist:IsAvailable() and ((v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (627 - (45 + 562))) or (v28 < (867 - (545 + 317))))) then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\66\95\43", "\236\47\62\83\41"), v85, nil, not v8:IsInMeleeRange(12 - 3)) then
			v55 = 394009 - (763 + 263);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\233\189\50\50\161\135\197\166\38\4\190\138\255\150\55\50\164\134\246\166\50\63\234\134\255\175\33\46\166\150\197\251\52\123\251\210", "\226\154\201\64\91\202");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff) and v7:HasTier(1781 - (512 + 1238), 1596 - (272 + 1322))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(14 - 6)) then
			v55 = 102792 - (533 + 713);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\210\89\20\22\68\181\207\78\34\27\88\189\207\76\34\19\67\191\202\9\25\29\76\189\212\69\9\39\24\168\129\24\79", "\220\161\41\125\120\42");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and v70(v21.BlackoutKick) and v7:BuffUp(v21.BlackoutReinforcementBuff)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\177\120\174", "\110\220\17\192"), v82, v77, not v8:IsInMeleeRange(33 - (14 + 14))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\118\117\53\25\224\56\228\179\75\114\61\25\224\119\245\162\114\120\33\22\255\8\163\179\52\40\103", "\199\20\25\84\122\139\87\145");
		end
	end
	if (v21.FistsofFury:IsReady() and not v7:HasTier(855 - (499 + 326), 3 - 1)) then
		if v65.CastTargetIf(v21.FistsofFury, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\74\8\197", "\138\39\105\189\206\123"), v85, nil, not v8:IsInMeleeRange(432 - (104 + 320))) then
			v55 = 115653 - (1929 + 68);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\25\14\154\57\224\198\192\249\32\1\156\63\234\185\203\250\25\6\156\33\231\198\157\235\95\86\221", "\159\127\103\233\77\147\153\175");
		end
	end
	if v21.FistsofFury:IsReady() then
		if v65.CastTargetIf(v21.FistsofFury, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\10\241\252", "\171\103\144\132\202\32"), v85, nil, not v8:IsInMeleeRange(1331 - (1206 + 117))) then
			v55 = 76221 + 37435;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\22\38\250\24\3\16\230\10\47\41\252\30\9\111\237\9\22\46\252\0\4\16\187\24\80\126\191", "\108\112\79\137");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v21.FistsofFury:CooldownUp())) then
		if v16(v21.RisingSunKick, nil, nil, not v8:IsInMeleeRange(1597 - (683 + 909))) then
			v55 = 329510 - 222082;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\45\203\103\33\163\6\214\38\42\204\75\35\164\2\226\117\59\199\114\41\184\13\253\10\109\214\52\121\245", "\85\95\162\20\72\205\97\137");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:HasTier(55 - 25, 779 - (772 + 5)))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\250\244\36", "\173\151\157\74\188\109\152"), v82, v72, not v8:IsInMeleeRange(1432 - (19 + 1408))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\54\1\43\212\210\83\234\224\49\6\7\214\213\87\222\179\32\13\62\220\201\88\193\204\118\28\120\143\140", "\147\68\104\88\189\188\52\181");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:BuffUp(v21.KicksofFlowingMomentumBuff) or v7:BuffUp(v21.PressurePointBuff))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\23\129\133", "\176\122\232\235"), v82, v88, not v8:IsInMeleeRange(293 - (134 + 154))) then
			v55 = 177078 - 69650;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\146\124\41\70\224\135\74\41\90\224\191\126\51\76\229\192\113\63\73\239\149\121\46\112\188\148\53\104\29", "\142\224\21\90\47");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (3.5 - 2))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(3 + 5)) then
			v55 = 86198 + 15348;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\103\196\46\88\170\130\139\115\235\36\68\165\133\128\75\223\46\85\175\203\129\113\210\38\67\168\159\186\38\192\103\4\240", "\229\20\180\71\54\196\235");
		end
	end
	if (v21.ChiBurst:IsCastable() and v7:BloodlustUp() and (v7:Chi() < (207 - (10 + 192)))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(87 - (13 + 34))) then
			v55 = 125275 - (342 + 947);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\42\118\200\220\247\191\146\58\106\129\231\240\172\129\60\114\213\220\167\190\192\123\40", "\224\73\30\161\131\149\202");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (8 - 6))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\252\236\255", "\48\145\133\145"), v82, v77, not v8:IsInMeleeRange(1713 - (119 + 1589))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\88\64\180\237\218\35\79\88\138\229\216\47\81\12\177\235\215\45\79\64\161\209\131\56\26\30\237", "\76\58\44\213\142\177");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and (v7:Chi() > (4 - 2)) and v7:PrevGCD(1 - 0, v21.RisingSunKick)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\198\45\28", "\24\171\68\114\77"), v82, v77, not v8:IsInMeleeRange(557 - (545 + 7))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\237\17\81\81\140\209\17\185\208\22\89\81\140\158\0\168\233\28\69\94\147\225\86\185\175\78\0", "\205\143\125\48\50\231\190\100");
		end
	end
	if (v21.ChiBurst:IsCastable() and (v7:Chi() < (14 - 9)) and (v7:Energy() < (21 + 29))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(1743 - (494 + 1209))) then
			v55 = 331484 - 207498;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\194\175\29\58\227\246\205\177\213\231\16\0\231\226\202\174\213\152\70\17\161\176\141", "\194\161\199\116\101\129\131\191");
		end
	end
	if v21.StrikeoftheWindlord:IsReady() then
		if v65.CastTargetIf(v21.StrikeoftheWindlord, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\225\37\208", "\194\140\68\168\200\151"), v85, nil, not v8:IsInMeleeRange(1007 - (197 + 801))) then
			v55 = 792473 - 399490;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\81\239\199\44\254\71\196\218\35\202\86\243\208\26\226\75\245\209\41\250\80\255\149\33\240\68\250\192\41\225\125\169\193\101\166\22", "\149\34\155\181\69");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.TeachingsoftheMonasteryBuff) and (v21.ShadowboxingTreads:IsAvailable() or (v21.RisingSunKick:CooldownRemains() > (4 - 3)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\14\244\219", "\154\99\157\181"), v82, v77, not v8:IsInMeleeRange(959 - (919 + 35))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\143\3\237\163\231\130\26\248\159\231\132\12\231\224\232\136\9\237\181\224\153\48\190\180\172\222\89", "\140\237\111\140\192");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 614051 - 461876;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\17\17\116\10\10\16\115\31\57\29\111\25\1\22\115\39\22\12\115\27\14\89\121\29\0\24\104\20\18\38\47\12\70\74\37", "\120\102\121\29");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (470 - (369 + 98)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\161\234\183", "\91\204\131\217"), v82, v77, not v8:IsInMeleeRange(1120 - (400 + 715))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\204\243\84\215\184\210\235\218\192\94\221\176\214\190\202\250\83\213\166\209\234\241\173\65\148\231\141", "\158\174\159\53\180\211\189");
		end
	end
	if (v21.RisingSunKick:IsReady() and not v21.ShadowboxingTreads:IsAvailable() and (v21.FistsofFury:CooldownRemains() > (2 + 2)) and v21.XuensBattlegear:IsAvailable()) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\95\244\227", "\213\50\157\141\189\23"), v82, v72, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\236\47\151\169\124\163\193\53\145\174\77\175\247\37\143\224\118\161\248\39\145\172\102\155\172\50\196\244\32", "\196\158\70\228\192\18");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and v21.RisingSunKick:CooldownDown() and v21.FistsofFury:CooldownDown() and (v7:BuffDown(v21.BonedustBrewBuff) or (v73() < (1326.5 - (744 + 581))))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\71\86\31", "\185\42\63\113\46"), v82, v77, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\214\209\32\58\16\219\200\53\6\16\221\222\42\121\31\209\219\32\44\23\192\226\115\45\91\128\137", "\123\180\189\65\89");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(1630 - (653 + 969))) then
			v55 = 228344 - 111497;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\208\153\227\236\128\204\139\207\238\136\198\137\207\243\128\204\136\176\224\140\196\141\229\232\157\253\222\228\164\221\148", "\233\162\236\144\132");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1632.5 - (12 + 1619)))) and v7:BuffUp(v21.BonedustBrewBuff) and v70(v21.SpinningCraneKick) and (v73() >= (165.7 - (103 + 60)))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(39 - 31)) then
			v55 = 443651 - 342105;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\161\212\247\20\183\255\81\181\251\253\8\184\248\90\141\207\247\25\178\182\91\183\194\255\15\181\226\96\224\208\190\78\225", "\63\210\164\158\122\217\150");
		end
	end
	if v21.RisingSunKick:IsReady() then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\62\194\248", "\152\83\171\150\140\41"), v79, nil, not v8:IsInMeleeRange(23 - 18)) then
			v55 = 109090 - (710 + 952);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\144\236\144\58\218\28\55\145\240\141\12\223\18\11\137\165\135\54\210\26\29\142\241\188\97\192\91\93\210", "\104\226\133\227\83\180\123");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\14\2\45", "\48\99\107\67"), v82, v77, not v8:IsInMeleeRange(1873 - (555 + 1313))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\220\170\124\211\38\116\203\178\66\219\36\120\213\230\121\213\43\122\203\170\105\239\127\111\158\243\47", "\27\190\198\29\176\77");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v70(v21.JadefireStomp))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(28 + 2)) then
			v55 = 347404 + 40789;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\229\74\249\49\175\71\253\78\194\39\189\65\226\91\189\48\172\72\238\94\241\32\150\28\251\11\168\96", "\46\143\43\157\84\201");
		end
	end
end
local function v110()
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v7:Chi() < (2 + 0)) and ((v21.RisingSunKick:CooldownRemains() < (1469 - (1261 + 207))) or (v21.FistsofFury:CooldownRemains() < (253 - (245 + 7))) or (v21.StrikeoftheWindlord:CooldownRemains() < (748 - (212 + 535)))) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (14 - 11))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\90\113\88", "\168\55\24\54\162\63\115"), v80, nil, not v8:IsInMeleeRange(1481 - (905 + 571))) then
			v55 = 472650 - 371870;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\3\243\39\133\192\241\7\251\44\141\146\202\18\252\33\149\222\218\40\233\52\192\128", "\174\119\154\64\224\178");
		end
	end
	if (v21.ExpelHarm:IsReady() and (((v7:Chi() == (1 - 0)) and (v21.RisingSunKick:CooldownUp() or v21.StrikeoftheWindlord:CooldownUp())) or ((v7:Chi() == (7 - 5)) and v21.FistsofFury:CooldownUp() and v21.RisingSunKick:CooldownDown()))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(1 + 19)) then
			v55 = 323564 - (522 + 941);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\47\102\213\126\9\152\18\229\56\115\133\127\0\161\27\241\38\106\250\104\17\231\78", "\132\74\30\165\27\101\199\122");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and ((v7:BuffUp(v21.DomineeringArroganceBuff) and v21.Thunderfist:IsAvailable() and v21.Serenity:IsAvailable() and (v21.InvokeXuenTheWhiteTiger:CooldownRemains() > (1531 - (292 + 1219)))) or (v28 < (1117 - (787 + 325))) or (v21.Thunderfist:IsAvailable() and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (30 - 20)) and v7:BuffDown(v21.DomineeringArroganceBuff)) or (v21.Thunderfist:IsAvailable() and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (32 + 3)) and not v21.Serenity:IsAvailable()))) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(20 - 11)) then
			v55 = 393517 - (424 + 110);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\60\243\237\174\172\176\139\32\225\192\179\175\176\139\56\238\241\163\171\186\166\43\167\251\162\161\180\161\35\243\192\180\179\245\226", "\212\79\135\159\199\199\213");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and v7:HasTier(19 + 12, 1 + 1) and v7:BuffDown(v21.BlackoutReinforcementBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(320 - (33 + 279))) then
			v55 = 16300 + 85246;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\106\176\188\73\82\222\22\126\159\182\85\93\217\29\70\171\188\68\87\151\28\124\166\180\82\80\195\39\106\180\245\22\12", "\120\25\192\213\39\60\183");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v21.FistsofFury:CooldownUp())) then
		if v16(v21.RisingSunKick, nil, nil, not v8:IsInMeleeRange(1358 - (1338 + 15))) then
			v55 = 108851 - (528 + 895);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\10\73\44\65\22\71\0\91\13\78\0\67\17\67\52\8\28\69\57\73\13\76\43\119\11\84\127\25\74", "\40\120\32\95");
		end
	end
	if (v21.FistsofFury:IsReady() and v7:BuffDown(v21.PressurePointBuff) and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (27 + 28)) and ((v8:DebuffRemains(v21.JadefireBrandDebuff) > (1926 - (1606 + 318))) or v21.JadefireStomp:CooldownDown())) then
		if v16(v21.FistsofFury, nil, nil, not v8:IsInMeleeRange(1827 - (298 + 1521))) then
			v55 = 488587 - 374931;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\60\162\42\110\188\32\53\173\6\124\186\13\35\235\61\127\169\30\47\167\45\69\188\11\122\250\109", "\127\90\203\89\26\207");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (311 - (154 + 156))) and (v8:DebuffRemains(v21.JadefireBrandDebuff) < (11 - 8))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(62 - 32)) then
			v55 = 389308 - (712 + 403);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\215\52\171\206\15\244\207\48\144\216\29\242\208\37\239\207\12\251\220\32\163\223\54\238\201\117\254\157", "\157\189\85\207\171\105");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v7:BuffUp(v21.PressurePointBuff) or (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (505 - (168 + 282))))) then
		if v16(v21.RisingSunKick, nil, nil, not v8:IsInMeleeRange(9 - 4)) then
			v55 = 105957 + 1471;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\212\168\203\188\13\193\158\203\160\13\249\170\209\182\8\134\165\221\179\2\211\173\204\138\16\210\225\137\237", "\99\166\193\184\213");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.PressurePointBuff) and (v7:Chi() > (1 + 1)) and v7:PrevGCD(2 - 1, v21.RisingSunKick)) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(1456 - (1242 + 209))) then
			v55 = 101463 - (20 + 659);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\212\187\129\184\7\133\195\163\191\176\5\137\221\247\132\190\10\139\195\187\148\132\31\158\150\229\208", "\234\182\215\224\219\108");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (2 + 1))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(4 + 1)) then
			v55 = 146910 - 46126;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\194\141\186\54\203\142\174\33\255\138\178\54\203\193\191\48\198\128\174\57\212\190\168\33\128\211\233", "\85\160\225\219");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.BlackoutReinforcementBuff) and v21.RisingSunKick:CooldownDown() and v70(v21.BlackoutKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(10 - 5)) then
			v55 = 101403 - (427 + 192);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\94\9\130\202\61\211\94\72\58\136\192\53\215\11\88\0\133\200\35\208\95\99\22\151\137\100\136", "\43\60\101\227\169\86\188");
		end
	end
	if v21.RisingSunKick:IsReady() then
		if v16(v21.RisingSunKick, nil, nil, not v8:IsInMeleeRange(11 - 6)) then
			v55 = 39725 + 67703;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\98\193\194\182\84\203\134\36\101\198\238\180\83\207\178\119\116\205\215\190\79\192\173\8\99\220\145\237\12", "\87\16\168\177\223\58\172\217");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.BlackoutReinforcementBuff) and v70(v21.BlackoutKick)) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(1952 - (1427 + 520))) then
			v55 = 51469 + 49315;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\54\193\88\222\48\59\216\77\226\48\61\206\82\157\63\49\203\88\200\55\32\242\74\201\123\102\149", "\91\84\173\57\189");
		end
	end
	if v21.FistsofFury:IsReady() then
		if v16(v21.FistsofFury, nil, nil, not v8:IsInMeleeRange(30 - 22)) then
			v55 = 101143 + 12513;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\22\176\31\232\179\233\31\191\51\250\181\196\9\249\8\249\166\215\5\181\24\195\179\194\80\234\92", "\182\112\217\108\156\192");
		end
	end
	if (v21.WhirlingDragonPunch:IsReady() and (v7:BuffDown(v21.PressurePointBuff))) then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(1237 - (712 + 520))) then
			v55 = 380284 - 228109;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\189\0\65\253\135\163\6\79\208\143\184\9\79\224\133\149\24\93\225\136\162\72\76\234\141\171\29\68\251\180\185\28\8\188\217", "\235\202\104\40\143");
		end
	end
	if (v21.ChiBurst:IsCastable() and v7:BloodlustUp() and (v7:Chi() < (1351 - (565 + 781)))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(605 - (35 + 530))) then
			v55 = 61223 + 62763;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\14\131\18\134\15\158\9\170\25\203\31\188\11\138\14\181\25\180\8\173\77\216\79", "\217\109\235\123");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (6 - 4)) and (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (1379 - (1330 + 48)))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(4 + 1)) then
			v55 = 17569 + 83215;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\37\133\127\85\123\223\216\169\24\130\119\85\123\144\201\184\33\136\107\90\100\239\222\169\103\218\40", "\221\71\233\30\54\16\176\173");
		end
	end
	if (v21.ChiBurst:IsCastable() and (v7:Chi() < (8 - 3)) and (v7:Energy() < (219 - 169))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(1209 - (854 + 315))) then
			v55 = 397091 - 273105;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\55\244\87\128\54\233\76\172\32\188\90\186\50\253\75\179\32\195\77\171\116\175\6", "\223\84\156\62");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and ((v8:DebuffRemains(v21.SkyreachExhaustionDebuff) > (10 + 20)) or (v28 < (49 - (31 + 13))))) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(12 - 3)) then
			v55 = 910639 - 517656;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\197\232\240\212\188\62\233\243\228\226\163\51\211\195\245\212\185\63\218\243\240\217\247\63\211\250\227\200\187\47\233\239\246\157\227\107", "\91\182\156\130\189\215");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1.5 + 0))) and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and not v7:HasTier(594 - (281 + 282), 5 - 3)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(5 + 3)) then
			v55 = 102495 - (216 + 733);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\109\99\165\91\112\122\162\82\65\112\190\84\112\118\147\94\119\112\167\21\122\118\170\84\107\127\184\106\109\103\236\1\44", "\53\30\19\204");
		end
	end
	if (v21.BlackoutKick:IsReady() and v7:BuffUp(v21.TeachingsoftheMonasteryBuff) and (v21.RisingSunKick:CooldownRemains() > (1848 - (137 + 1710)))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(13 - 8)) then
			v55 = 101322 - (100 + 438);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\251\236\113\135\172\246\245\100\187\172\240\227\123\196\163\252\230\113\145\171\237\223\99\144\231\173\180", "\199\153\128\16\228");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (v28 > (v7:SpellHaste() * (1366.5 - (205 + 1160)))) and v7:BuffUp(v21.BonedustBrewBuff) and v70(v21.SpinningCraneKick) and (v73() >= (2.7 + 0))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(5 + 3)) then
			v55 = 102851 - (535 + 770);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\194\58\236\23\169\216\36\226\38\164\195\43\235\28\152\218\35\230\18\231\213\47\227\24\178\221\62\218\10\179\145\126\179", "\199\177\74\133\121");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(1 + 4)) then
			v55 = 83482 + 68693;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\175\193\181\236\59\207\36\191\246\184\236\54\193\37\182\246\172\235\57\197\34\248\205\185\248\54\211\38\172\246\175\234\119\146\114", "\74\216\169\220\158\87\166");
		end
	end
	if (v21.RushingJadeWind:IsReady() and (v7:BuffDown(v21.RushingJadeWindBuff))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(2002 - (211 + 1783))) then
			v55 = 18596 + 98251;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\250\54\0\36\83\230\36\44\38\91\236\38\44\59\83\230\39\83\40\95\238\34\6\32\78\215\48\7\108\15\184", "\58\136\67\115\76");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(1434 - (1236 + 193))) then
			v55 = 101694 - (793 + 117);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\243\166\217\90\142\47\190\73\206\161\209\90\142\96\175\88\247\171\205\85\145\31\184\73\177\255\138", "\61\145\202\184\57\229\64\203");
		end
	end
end
local function v111()
	if (v21.CracklingJadeLightning:IsReady() and (((v7:BuffStack(v21.TheEmperorsCapacitorBuff) > (1911 - (1607 + 285))) and (v68() > (v21.CracklingJadeLightning:ExecuteTime() - (861 - (747 + 113)))) and (v21.RisingSunKick:CooldownRemains() > v21.CracklingJadeLightning:ExecuteTime())) or ((v7:BuffStack(v21.TheEmperorsCapacitorBuff) > (1990 - (80 + 1896))) and (((v21.Serenity:CooldownRemains() < (24 - 19)) and v21.Serenity:IsAvailable()) or (v28 < (8 - 3)))))) then
		if v16(v21.CracklingJadeLightning, nil, nil, not v8:IsSpellInRange(v21.CracklingJadeLightning)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\95\64\136\68\87\94\128\73\91\109\131\70\88\87\182\75\85\85\129\83\82\91\135\64\28\84\136\75\80\70\129\85\73\18\219", "\39\60\50\233");
		end
	end
	if (v21.JadefireStomp:IsCastable() and (v70(v21.JadefireStomp))) then
		if v16(v21.JadefireStomp, nil, nil, not v8:IsInRange(29 + 1)) then
			v55 = 914442 - 526249;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\16\50\167\41\132\33\160\166\37\32\183\35\143\56\242\165\27\63\175\56\138\58\167\227\78", "\195\122\83\195\76\226\72\210");
		end
	end
	if (v21.TigerPalm:IsReady() and v70(v21.TigerPalm) and (v7:ChiDeficit() >= (2 + 0 + v18(v7:BuffUp(v21.PowerStrikesBuff))))) then
		if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\233\221\53", "\65\132\180\91\158"), v80, nil, not v8:IsInMeleeRange(14 - 9)) then
			v55 = 58819 + 41961;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\17\117\214\43\23\67\193\47\9\113\145\40\4\112\221\58\13\110\196\110\83", "\78\101\28\177");
		end
	end
	if (v21.ExpelHarm:IsReady() and (v7:ChiDeficit() >= (1 + 0)) and (v26 > (4 - 2))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(462 - (246 + 208))) then
			v55 = 323993 - (614 + 1278);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\32\172\240\84\41\139\232\80\55\185\160\87\36\184\236\69\45\166\245\17\125", "\49\69\212\128");
		end
	end
	if (v21.ChiBurst:IsCastable() and (((v7:ChiDeficit() >= (1 + 0)) and (v26 == (315 - (249 + 65)))) or ((v7:ChiDeficit() >= (4 - 2)) and (v26 >= (1277 - (726 + 549)))))) then
		if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(27 + 13)) then
			v55 = 125410 - (916 + 508);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\20\4\217\205\227\2\30\195\230\161\17\13\220\254\245\31\30\197\178\176\71", "\129\119\108\176\146");
		end
	end
	if v21.ChiWave:IsCastable() then
		if v16(v21.ChiWave, nil, nil, not v8:IsInRange(134 - 94)) then
			v55 = 74018 + 41080;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\199\14\242\50\15\10\57\143\1\204\41\2\8\52\221\18\141\116\92", "\124\92\175\103\173\69\110");
		end
	end
	if (v21.ExpelHarm:IsReady() and (v7:ChiDeficit() >= (324 - (140 + 183)))) then
		if v16(v21.ExpelHarm, nil, nil, not v8:IsInMeleeRange(6 + 2)) then
			v55 = 322665 - (297 + 267);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\196\32\19\50\205\7\11\54\211\53\67\49\192\52\15\35\201\42\22\119\144\108", "\87\161\88\99");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v26 >= (4 + 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\31\240\225", "\67\114\153\143\172\215\176"), v82, v77, not v8:IsInMeleeRange(347 - (37 + 305))) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\188\174\239\13\181\173\251\26\129\169\231\13\181\226\232\15\178\174\250\6\172\183\174\95\232", "\110\222\194\142");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and (((v28 > (v7:SpellHaste() * (1267.5 - (323 + 943)))) and v70(v21.SpinningCraneKick) and (v7:BuffStack(v21.ChiEnergyBuff) > ((12 + 18) - ((6 - 1) * v26))) and v7:BuffDown(v21.StormEarthAndFireBuff) and (((v21.RisingSunKick:CooldownRemains() > (1537 - (394 + 1141))) and (v21.FistsofFury:CooldownRemains() > (2 + 0))) or ((v21.RisingSunKick:CooldownRemains() < (1 + 2)) and (v21.FistsofFury:CooldownRemains() > (1 + 2)) and (v7:Chi() > (3 - 0))) or ((v21.RisingSunKick:CooldownRemains() > (3 - 0)) and (v21.FistsofFury:CooldownRemains() < (3 + 0)) and (v7:Chi() > (4 + 0))) or ((v7:ChiDeficit() <= (530 - (87 + 442))) and (v68() < (807 - (13 + 792)))))) or ((v7:BuffStack(v21.ChiEnergyBuff) > (10 + 0)) and (v28 < (3 + 4))))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(8 + 0)) then
			v55 = 103411 - (1231 + 634);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\4\201\18\167\92\168\25\222\36\170\64\160\25\220\36\162\91\162\28\153\29\168\94\173\3\209\9\188\18\240\79", "\193\119\185\123\201\50");
		end
	end
	if (v21.ArcaneTorrent:IsCastable() and (v7:ChiDeficit() >= (1767 - (1362 + 404)))) then
		if v16(v21.ArcaneTorrent, nil) then
			v55 = 142532 - 91919;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\118\26\250\39\1\124\32\99\7\235\52\10\119\11\55\14\248\42\3\109\23\101\29\185\116\95", "\127\23\104\153\70\111\25");
		end
	end
	if (v21.FlyingSerpentKick:IsCastable() and not v67.Windwalker.IgnoreFSK) then
		if v16(v21.FlyingSerpentKick, nil, nil, not v8:IsInRange(22 + 8)) then
			v55 = 285002 - 183457;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\15\11\191\166\37\43\136\160\12\21\182\170\37\56\136\184\0\4\173\239\45\45\187\191\29\15\180\186\107\126\229", "\211\105\103\198\207\75\76\215");
		end
	end
	if v21.TigerPalm:IsReady() then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(1021 - (660 + 356))) then
			v55 = 144684 - 43904;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\218\174\183\234\108\51\170\183\194\170\240\233\127\0\182\162\198\181\165\175\44\88", "\214\174\199\208\143\30\108\218");
		end
	end
end
local function v112()
	if (v21.FistsofFury:IsReady() and (v7:BuffRemains(v21.SerenityBuff) < (1 + 0))) then
		if v16(v21.FistsofFury, nil, nil, not v8:IsInMeleeRange(1958 - (1111 + 839))) then
			v55 = 114607 - (496 + 455);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\23\141\24\190\182\105\215\79\46\130\30\184\188\22\203\76\3\129\5\163\177\79\152\27", "\41\113\228\107\202\197\54\184");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and not v74() and (v26 > (702 - (66 + 632))) and v21.ShadowboxingTreads:IsAvailable()) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\119\132\54", "\60\26\237\88"), v79, nil, not v8:IsInMeleeRange(7 - 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\218\38\117\229\165\215\63\96\217\165\209\41\127\166\189\221\56\113\232\167\204\51\52\178", "\206\184\74\20\134");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (1139 - (441 + 695))) and (v7:BuffRemains(v21.TeachingsoftheMonasteryBuff) < (2 - 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\53\237\224", "\172\88\132\142\209\147\42\88"), v79, nil, not v8:IsInMeleeRange(9 - 4)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\133\134\205\14\61\250\171\147\181\199\4\53\254\254\148\143\222\8\56\252\170\158\202\154", "\222\231\234\172\109\86\149");
		end
	end
	if (v21.RisingSunKick:IsReady() and (((v26 == (19 - 15)) and v7:BuffUp(v21.PressurePointBuff) and not v21.BonedustBrew:IsAvailable()) or (v26 == (1 + 0)) or ((v26 <= (1841 - (286 + 1552))) and v7:BuffUp(v21.PressurePointBuff)) or (v7:BuffUp(v21.PressurePointBuff) and v7:HasTier(1307 - (1016 + 261), 1322 - (708 + 612))))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\224\230\206", "\120\141\143\160"), v79, nil, not v8:IsInMeleeRange(13 - 8)) then
			v55 = 45870 + 61558;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\82\165\165\91\78\171\137\65\85\162\137\89\73\175\189\18\83\169\164\87\78\165\162\75\0\244", "\50\32\204\214");
		end
	end
	if (v21.FistsofFury:IsReady() and ((v7:BuffUp(v21.InvokersDelightBuff) and (((v26 < (382 - (113 + 266))) and v21.JadeIgnition:IsAvailable()) or (v26 > (1174 - (979 + 191))))) or v7:BloodlustUp() or (v26 == (2 - 0)))) then
		if v16(v21.FistsofFury, nil, nil, not v8:IsInMeleeRange(1743 - (339 + 1396))) then
			v55 = 33413 + 80243;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\128\78\38\109\160\46\137\65\10\127\166\3\159\7\38\124\161\20\136\78\33\96\243\64\214", "\113\230\39\85\25\211");
		end
	end
	if v21.FistsofFury:IsReady() then
		local v171 = v76();
		if v171 then
			if (v171:GUID() == v8:GUID()) then
				if v13.CastQueue(v21.FistsofFury, v21.StopFoF) then
					v55 = 87203 + 26453;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\216\178\21\252\52\244\164\77\225\189\19\250\62\139\164\69\219\132\1\235\35\139\184\78\204\190\8\225\51\210\235\26\138", "\43\190\219\102\136\71\171\203");
				end
			elseif v13.CastLeftNameplate(v171, v21.FistsofFury) then
				v55 = 218202 - 104546;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\36\119\35\77\49\65\63\95\29\120\37\75\59\62\63\87\39\65\55\90\38\62\63\95\36\51\36\88\48\121\53\77\98\109\53\75\39\112\57\77\59\62\97\13", "\57\66\30\80");
			end
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v21.Thunderfist:IsAvailable())) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(9 + 0)) then
			v55 = 90163 + 302820;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\58\204\178\28\143\60\203\139\47\231\180\29\129\6\227\141\39\220\172\26\150\61\180\151\44\202\165\27\141\45\237\196\123", "\228\73\184\192\117\228\89\148");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff) and (v26 >= (349 - (187 + 160)))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(18 - 10)) then
			v55 = 350436 - 248890;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\220\153\124\26\193\128\123\19\240\138\103\21\193\140\74\31\198\138\126\84\220\140\103\17\193\128\97\13\143\216\33", "\116\175\233\21");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v26 == (1 + 3)) and v7:BuffUp(v21.PressurePointBuff)) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\243\241\176", "\95\158\152\222\38\187\81"), v79, nil, not v8:IsInMeleeRange(15 - 10)) then
			v55 = 12977 + 94451;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\234\180\38\187\173\207\199\174\32\188\156\195\241\190\62\242\176\205\234\184\59\187\183\209\184\236\99", "\168\152\221\85\210\195");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v26 == (1 + 2)) and v70(v21.BlackoutKick) and v7:HasTier(55 - 25, 330 - (56 + 272))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\166\215\251", "\231\203\190\149"), v79, nil, not v8:IsInMeleeRange(3 + 2)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\207\49\226\242\183\250\14\217\2\232\248\191\254\91\222\56\241\244\178\252\15\212\125", "\123\173\93\131\145\220\149");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and (v26 >= (3 + 0)) and v74()) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(18 - 10)) then
			v55 = 66336 + 35210;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\5\212\228\47\122\240\24\195\210\34\102\248\24\193\210\42\125\250\29\132\254\36\102\252\24\205\249\56\52\171\70", "\153\118\164\141\65\20");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v26 > (641 - (455 + 185))) and (v26 < (792 - (757 + 31))) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (2001 - (762 + 1237)))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\227\59\136", "\96\142\82\230\130\151"), v79, nil, not v8:IsInMeleeRange(10 - 5)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\77\188\78\65\239\225\90\164\112\73\237\237\68\240\92\71\246\235\65\185\91\91\164\191\23", "\142\47\208\47\34\132");
		end
	end
	if (v21.RushingJadeWind:IsReady() and v7:BuffDown(v21.RushingJadeWindBuff) and (v26 >= (274 - (265 + 4)))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(20 - 12)) then
			v55 = 72824 + 44023;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\228\171\23\10\82\82\241\129\14\3\95\89\201\169\13\12\95\28\229\187\22\7\85\85\226\167\68\80\9", "\60\150\222\100\98\59");
		end
	end
	if (v21.BlackoutKick:IsReady() and v21.ShadowboxingTreads:IsAvailable() and (v26 >= (5 - 2)) and v70(v21.BlackoutKick)) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\72\53\89", "\81\37\92\55\54\187\218"), v79, nil, not v8:IsInMeleeRange(14 - 9)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\2\72\172\52\138\15\81\185\8\138\9\71\166\119\146\5\86\168\57\136\20\93\237\101\213", "\225\96\36\205\87");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and ((v26 > (1 + 2)) or ((v26 > (5 - 3)) and (v73() >= (3.3 - 1))))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(15 - 7)) then
			v55 = 103280 - (1691 + 43);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\250\182\75\119\114\70\7\238\153\65\107\125\65\12\214\173\75\122\119\15\26\236\180\71\119\117\91\16\169\244\20", "\105\137\198\34\25\28\47");
		end
	end
	if (v21.StrikeoftheWindlord:IsReady() and (v26 >= (3 + 0))) then
		if v16(v21.StrikeoftheWindlord, nil, nil, not v8:IsInMeleeRange(27 - 18)) then
			v55 = 95325 + 297658;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\2\189\83\127\203\20\150\78\112\255\5\161\68\73\215\24\167\69\122\207\3\173\1\101\197\3\172\79\127\212\8\233\19\46", "\160\113\201\33\22");
		end
	end
	if (v21.RisingSunKick:IsReady() and (v26 == (7 - 5)) and (v21.FistsofFury:CooldownRemains() > (181 - (127 + 49)))) then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\217\81\162", "\205\180\56\204\199\201"), v79, nil, not v8:IsInMeleeRange(1685 - (281 + 1399))) then
			v55 = 109087 - (184 + 1475);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\145\215\47\17\141\217\3\11\150\208\3\19\138\221\55\88\144\219\46\29\141\215\40\1\195\141\108", "\120\227\190\92");
		end
	end
	if (v21.BlackoutKick:IsReady() and v70(v21.BlackoutKick) and (v26 == (2 - 0)) and (v21.FistsofFury:CooldownRemains() > (11 - 6)) and v21.ShadowboxingTreads:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) == (2 - 1))) then
		if v65.CastTargetIf(v21.BlackoutKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\48\85\17", "\130\93\60\127\27\67\60\185"), v79, nil, not v8:IsInMeleeRange(4 + 1)) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\74\62\57\77\235\76\104\92\13\51\71\227\72\61\91\55\42\75\238\74\105\81\114\107\28", "\29\40\82\88\46\128\35");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and (v26 > (1 + 0))) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(1299 - (260 + 1031))) then
			v55 = 102723 - (313 + 864);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\40\85\221\19\15\177\53\66\235\30\19\185\53\64\235\22\8\187\48\5\199\24\19\189\53\76\192\4\65\235\111", "\216\91\37\180\125\97");
		end
	end
	if (v21.WhirlingDragonPunch:IsReady() and (v26 > (693 - (655 + 37)))) then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(5 + 0)) then
			v55 = 257149 - 104974;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\50\126\21\209\91\44\120\27\252\83\55\119\27\204\89\26\102\9\205\84\45\54\15\198\69\32\120\21\215\78\101\37\74", "\55\69\22\124\163");
		end
	end
	if (v21.RushingJadeWind:IsReady() and v7:BuffDown(v21.RushingJadeWindBuff) and (v26 >= (6 - 3))) then
		if v16(v21.RushingJadeWind, nil, nil, not v8:IsInMeleeRange(4 + 4)) then
			v55 = 90381 + 26466;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\106\198\79\224\214\127\87\203\114\210\88\237\224\102\89\250\124\147\79\237\205\116\94\253\108\202\28\187\135", "\148\24\179\60\136\191\17\48");
		end
	end
	if v21.RisingSunKick:IsReady() then
		if v65.CastTargetIf(v21.RisingSunKick, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\191\35\247", "\150\210\74\153\192"), v79, nil, not v8:IsInMeleeRange(9 - 4)) then
			v55 = 108198 - (383 + 387);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\241\193\43\131\123\125\139\240\221\54\181\126\115\183\232\136\43\143\103\127\186\234\220\33\202\33\42", "\212\131\168\88\234\21\26");
		end
	end
	if (v21.SpinningCraneKick:IsReady() and v70(v21.SpinningCraneKick) and v7:BuffUp(v21.DanceofChijiBuff)) then
		if v16(v21.SpinningCraneKick, nil, nil, not v8:IsInMeleeRange(3 + 5)) then
			v55 = 6932 + 94614;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\86\100\128\130\54\46\75\115\182\143\42\38\75\113\182\135\49\36\78\52\154\137\42\34\75\125\157\149\120\115\23", "\71\37\20\233\236\88");
		end
	end
	if (v21.BlackoutKick:IsReady() and (v70(v21.BlackoutKick))) then
		if v16(v21.BlackoutKick, nil, nil, not v8:IsInMeleeRange(15 - 10)) then
			v55 = 29381 + 71403;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\207\74\177\21\75\227\89\72\242\77\185\21\75\172\95\89\223\67\190\31\84\245\12\8\153", "\60\173\38\208\118\32\140\44");
		end
	end
	if v21.WhirlingDragonPunch:IsReady() then
		if v16(v21.WhirlingDragonPunch, nil, nil, not v8:IsInMeleeRange(2 + 3)) then
			v55 = 152685 - (304 + 206);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\86\58\232\193\44\198\79\53\222\215\50\206\70\61\239\236\48\218\79\49\233\147\51\202\83\55\239\218\52\214\1\102\183", "\175\33\82\129\179\64");
		end
	end
	if (v21.TigerPalm:IsReady() and v21.TeachingsoftheMonastery:IsAvailable() and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (228 - (182 + 43)))) then
		if v16(v21.TigerPalm, nil, nil, not v8:IsInMeleeRange(780 - (264 + 511))) then
			v55 = 14966 + 85814;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\250\230\55\202\46\141\254\238\60\194\124\161\235\253\53\193\53\166\247\175\100\151", "\210\142\143\80\175\92");
		end
	end
end
local function v113()
	v42 = HeroRotationCharDB.Toggles[11 - 6];
	v41 = HeroRotationCharDB.Toggles[985 - (128 + 853)];
	v53 = HeroRotationCharDB.Toggles[1714 - (1635 + 67)];
	v43 = not HeroRotationCharDB.Toggles[2 + 13];
	v44 = HeroRotationCharDB.Toggles[12 + 19];
	v45 = HeroRotationCharDB.Toggles[229 - (131 + 66)];
	v46 = HeroRotationCharDB.Toggles[115 - 82];
	v47 = HeroRotationCharDB.Toggles[166 - 132];
	v48 = HeroRotationCharDB.Toggles[13 + 22];
	v49 = HeroRotationCharDB.Toggles[22 + 14];
	v50 = HeroRotationCharDB.Toggles[56 - 19];
	v51 = HeroRotationCharDB.Toggles[63 - 25];
	v52 = HeroRotationCharDB.Toggles[1644 - (306 + 1299)];
	v56 = false;
	xuenready = false;
	SEFReady = false;
	if ((v67.Windwalker.IncludedCooldowns.Xuen and v15()) or (v67.Windwalker.IncludedSmallCooldowns.Xuen and (v15() or v41)) or (not v67.Windwalker.IncludedSmallCooldowns.Xuen and not v67.Windwalker.IncludedCooldowns.Xuen and not v67.Windwalker.IncludedSmallCooldowns.SEFEcho and not v67.Windwalker.IncludedCooldowns.SEFEco)) then
		xuenready = true;
	end
	if ((v67.Windwalker.IncludedCooldowns.SEFFull and v15()) or (v67.Windwalker.IncludedSmallCooldowns.SEFFull and (v15() or v41)) or (not v67.Windwalker.IncludedSmallCooldowns.SEFFull and not v67.Windwalker.IncludedCooldowns.SEFFull) or (v67.Windwalker.IncludedCooldowns.SEFEco and v15() and (v21.StormEarthAndFire:ChargesFractional() > v67.Windwalker.SEFEcoCharge)) or (v67.Windwalker.IncludedSmallCooldowns.SEFEco and (v15() or v41) and (v21.StormEarthAndFire:ChargesFractional() > v67.Windwalker.SEFEcoCharge)) or (not v67.Windwalker.IncludedSmallCooldowns.SEFEco and not v67.Windwalker.IncludedCooldowns.SEFEco and (v21.StormEarthAndFire:ChargesFractional() > v67.Windwalker.SEFEcoCharge))) then
		SEFReady = true;
	end
	QuakingR = 0 + 0;
	for v167 = 2 - 1, 809 - (671 + 118) do
		if (select(39 - 29, UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\169\229\242\223\188\251", "\166\217\137\147"), v167)) == (240523 - (73 + 3))) then
			if (select(16 - 10, UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\243\175\115\191\244\84", "\38\131\195\18\198\145"), v167)) ~= nil) then
				QuakingR = select(28 - 22, UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\67\218\59\242\61\70", "\52\51\182\90\139\88"), v167)) - (GetTime());
			end
		end
	end
	v58 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\230\181\209\254\70\228", "\35\150\217\176\135"), 30 - 17);
	v59 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\233\92\10\21\114\81", "\22\153\48\107\108\23\35"), 1769 - (1668 + 87));
	if (not v67.Commons.Enabled.TopTrinket and not v67.Commons.Enabled.BotTrinket) then
		v23 = {v58,v59};
	elseif (not v67.Commons.Enabled.TopTrinket and v67.Commons.Enabled.BotTrinket) then
		v23 = {v58};
	elseif (not v67.Commons.Enabled.BotTrinket and v67.Commons.Enabled.TopTrinket) then
		v23 = {v59};
	end
end
local function v114()
	local v159 = 1007 - (700 + 307);
	local v160 = {(324767 - (1477 + 322)),(736284 - 416681),(1036267 - 716656),(1326578 - 1000702),(159314 + 175179),(535807 - 201311),(334391 - (20 + 1766)),(329303 - (88 + 721)),(23001 + 303835),(113981 + 222296),(623900 - 304231),(325044 - (960 + 253)),(981995 - 651270),(334715 - (74 + 1342))};
	if UnitExists(LUAOBFUSACTOR_DECRYPT_STR_0("\3\138\174\9\122\122\87\236\28", "\137\110\229\219\122\31\21\33")) then
		if ((UnitIsDead(LUAOBFUSACTOR_DECRYPT_STR_0("\23\178\45\104\51\68\50\123\8", "\30\122\221\88\27\86\43\68")) == true) and (UnitCanAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\40\36\234\159\61\58", "\230\88\72\139"), LUAOBFUSACTOR_DECRYPT_STR_0("\127\187\3\8\6\7\78\119\166", "\56\18\212\118\123\99\104")) ~= true)) then
			v159 = 2542 + 7457;
		else
			for v186 = 474 - (33 + 441), 114 - 74 do
				local v187, v187, v188, v189, v187, v187, v187, v187, v187, v190 = UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\19\230\237\192\218\209\8\236\234", "\190\126\137\152\179\191"), v186);
				for v191, v192 in v20(v160) do
					if (v192 == v190) then
						if (v189 == LUAOBFUSACTOR_DECRYPT_STR_0("\5\3\117\194\169", "\32\72\98\18\171\202")) then
							v159 = 1420 - (64 + 1355);
						elseif (v189 == LUAOBFUSACTOR_DECRYPT_STR_0("\52\135\59\103\248\10", "\151\100\232\82\20")) then
							v159 = 2 - 0;
						elseif (v189 == LUAOBFUSACTOR_DECRYPT_STR_0("\91\208\229\13\126\202\243", "\104\31\185\150")) then
							v159 = 14 - (5 + 6);
						elseif (v189 == LUAOBFUSACTOR_DECRYPT_STR_0("\255\172\225\228\226", "\160\188\217\147\151\135\172\128")) then
							v159 = 1 + 3;
						end
					end
				end
			end
		end
	end
	if ((v159 == (1 + 1)) or ((DebuffCheckC == (449 - (369 + 77))) and v21.Detox:IsReady() and v6(LUAOBFUSACTOR_DECRYPT_STR_0("\2\210\5\227\63\198\25\216\2", "\169\111\189\112\144\90")):IsInRange(10 + 30))) then
		if v13.Cast(v21.Detox, nil, nil, not v8:IsInRange(778 - (438 + 300))) then
			v55 = 218458 - (50 + 244);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\233\134\49\162\167\192\36\173", "\226\173\227\69\205\223\224\105");
		end
	end
end
local function v115()
	v24 = v7:GetEnemiesInMeleeRange(1206 - (95 + 1106));
	v25 = v7:GetEnemiesInMeleeRange(14 - 6);
	if v14() then
		v26 = #v25;
	else
		v26 = 4 - 3;
	end
	if not BotOn then
		v54 = 1896 - (1741 + 155);
		v55 = 0 - 0;
		v57 = 0 - 0;
	end
	if (v54 > (0 - 0)) then
		v54 = 0 + 0;
	end
	if (v55 > (0 + 0)) then
		v55 = 0 + 0;
	end
	if (v57 > (0 - 0)) then
		v57 = 0 - 0;
	end
	ShouldReturn = v113();
	if (not v8:IsInMeleeRange(1787 - (1263 + 514)) and (v26 > (497 - (73 + 424))) and (v67.Windwalker.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\121\43\54\84\252\12\89\46", "\123\56\94\66\59\175")) and not v53) then
		v54 = 2629 - 1630;
	end
	ShouldReturn = v114();
	if (v65.TargetIsValid() or v7:AffectingCombat()) then
		v27 = v3.BossFightRemains();
		v28 = v27;
		if (v28 == (11419 - (93 + 215))) then
			v28 = v3.FightRemains(v25, false);
		end
	end
	if (v65.TargetIsValid() or v7:AffectingCombat()) then
		v29 = v21.InvokeXuenTheWhiteTiger:TimeSinceLastCast() <= (83 - 59);
	end
	if v65.TargetIsValid() then
		if not v7:AffectingCombat() then
			local v175 = v91();
			if v175 then
				return v175;
			end
		end
		if (v65.TargetIsValid() and not v7:IsDeadOrGhost() and v7:AffectingCombat()) then
			if (not v67.Windwalker.IgnoreFSK and v7:PrevGCD(1936 - (1756 + 179), v21.FlyingSerpentKick)) then
				if v16(v21.FlyingSerpentKickLand) then
					v55 = 103224 - (550 + 1129);
					return LUAOBFUSACTOR_DECRYPT_STR_0("\252\79\106\232\20\249\190\233\70\97\241\31\240\149\197\72\122\226\17\190\141\251\77\119", "\225\154\35\19\129\122\158");
				end
			end
		end
		v31 = not v21.InvokeXuenTheWhiteTiger:IsAvailable() or ((227 - (57 + 50)) > v28);
		v32 = not (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (630 - (30 + 599))) and (v21.RisingSunKick:CooldownRemains() < (1 + 0)) and (v7:HasTier(40 - 10, 920 - (794 + 124)) or (v26 < (1 + 4)));
		v33 = not (v8:DebuffRemains(v21.SkyreachExhaustionDebuff) < (1 + 0)) and (v21.BonedustBrew:CooldownRemains() < (1 - 0)) and (v26 == (1928 - (1299 + 628)));
		if v67.Commons.Enabled.Potions then
			local v176 = v65.PotionSelected();
			if (v176 and v176:IsReady() and v7:BloodlustUp() and v13.GUISettings.General.HoldPotforBL) then
				if v21.InvokeXuenTheWhiteTiger:IsAvailable() then
					if (v7:BuffUp(v21.SerenityBuff) or (v7:BuffUp(v21.StormEarthAndFireBuff) and v29) or (v28 <= (66 - 36))) then
						if v16(v176, nil, nil) then
							v55 = 88 - 56;
							return LUAOBFUSACTOR_DECRYPT_STR_0("\74\15\255\94\250\233\144\35\83\20\227\23\237\242\213\58\26\13\234\94\251\167\132", "\84\58\96\139\55\149\135\176");
						end
					end
				elseif (v7:BuffUp(v21.SerenityBuff) or v7:BuffUp(v21.StormEarthAndFireBuff) or (v28 <= (28 + 2))) then
					if v16(v176, nil, nil) then
						v55 = 92 - 60;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\3\48\183\9\65\193\126\4\54\183\8\65\218\42\83\39\182\5\64\143\51\18\54\173\64\24", "\94\115\95\195\96\46\175");
					end
				end
			end
		end
		if (v7:IsChanneling(v21.FistsofFury) and v51) then
			if v13.Cast(v21.PoolEnergy, nil, nil, nil) then
				v55 = 2445 - (335 + 1110);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\96\74\44\41\39\35\128\160\101\68\25", "\128\35\43\95\93\78\77\231");
			end
		end
		if (v7:IsChanneling(v21.FistsofFury) and (not interruptFoF1 or (v21.RisingSunKick:CooldownRemains() <= (0 + 0))) and v7:AffectingCombat()) then
			if v13.Cast(v21.PoolEnergy, nil, nil, nil) then
				v55 = 329297 - 229298;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\135\28\37\32\30\112\174\228\59\57\18", "\201\196\125\86\84\119\30");
			end
		elseif ((interruptFoF1 == true) and not v7:IsChanneling(v21.FistsofFury)) then
			interruptFoF1 = false;
		end
		if v7:IsChanneling(v21.FistsofFury) then
			if (v7:AffectingCombat() and v67.Windwalker.CastCancelFC and interruptFoF1) then
				v55 = 3566 - 1567;
			end
		end
		if v13.QueuedCast() then
			v55 = v13.QueuedCast();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\224\251\23\171\204\227\68\142\214\235\17\186\131", "\223\163\142\100") .. v10(v55):ID();
		end
		if (v47 and v21.LegSweep:IsUsableP() and (v21.LegSweep:CooldownRemains(BypassRecovery) <= (332 - (268 + 64)))) then
			if v13.Cast(v21.LegSweep, nil, nil, nil) then
				v55 = 78934 + 40447;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\147\3\198\164\189\194\58\198\182\248\177\1\198\180\168", "\216\226\118\163\209");
			end
		elseif ((not v21.LegSweep:IsUsableP() or (v21.LegSweep:CooldownRemains(BypassRecovery) > (1278 - (243 + 1035)))) and v47) then
			HeroRotationCharDB.Toggles[81 - 47] = not HeroRotationCharDB.Toggles[157 - 123];
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\146\245\28\65\100\103\58\187\224\91\48\66\117\42\187\176\18\18\23\126\48\169\176", "\95\222\144\123\97\55\16") .. ((HeroRotationCharDB.Toggles[144 - 110] and LUAOBFUSACTOR_DECRYPT_STR_0("\5\135\188\69\179\73\130\188\19\179\22\138\166\81\173", "\131\121\228\218\35")) or LUAOBFUSACTOR_DECRYPT_STR_0("\197\211\36\7\127\29\137\128\114\81\118\29\223\204\48\79", "\123\185\176\66\97\25")));
		end
		if (v48 and v21.Paralysis:IsUsableP() and (v21.Paralysis:CooldownRemains(BypassRecovery) <= (0 + 0))) then
			if v13.Cast(v21.Paralysis, nil, nil, nil) then
				if ((v6(LUAOBFUSACTOR_DECRYPT_STR_0("\197\0\12\66\16\32\78\52\218", "\81\168\111\121\49\117\79\56")):GUID() ~= nil) and v6(LUAOBFUSACTOR_DECRYPT_STR_0("\202\5\240\165\194\5\243\179\213", "\214\167\106\133")):IsSpellInRange(v21.Paralysis)) then
					v54 = 982364 + 132714;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\56\45\73\90\49\63\233\40\42\77\67\45\108\208\58\120\97\96", "\185\73\88\44\47\84\31");
				else
					v55 = 142037 - 26959;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\153\194\31\181\214\191\184\214\8\161\223\230\155\222\9", "\159\232\183\122\192\179");
				end
			end
		elseif ((not v21.Paralysis:IsUsableP() or (v21.Paralysis:CooldownRemains(BypassRecovery) > (100 - (90 + 10)))) and v48) then
			HeroRotationCharDB.Toggles[839 - (209 + 595)] = not HeroRotationCharDB.Toggles[840 - (603 + 202)];
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\20\51\186\32\40\43\187\40\55\114\153\52\33\39\173\97\45\33\232\47\43\37\232", "\65\68\82\200") .. ((HeroRotationCharDB.Toggles[22 + 13] and LUAOBFUSACTOR_DECRYPT_STR_0("\57\83\116\38\159\159\120\35\0\34\47\193\211\108\107", "\30\69\48\18\64\175\175")) or LUAOBFUSACTOR_DECRYPT_STR_0("\236\47\25\234\61\246\124\79\188\107\255\42\25\240\41\190", "\91\144\76\127\140")));
		end
		if (v49 and v21.RingOfPeace:IsAvailable() and v21.RingOfPeace:IsUsableP() and (v21.RingOfPeace:CooldownRemains(BypassRecovery) <= (0 - 0))) then
			if v13.Cast(v21.RingOfPeace, nil, nil, nil) then
				v55 = 57038 + 59806;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\241\29\67\52\214\250\231\217\238\15\105\39\227\191\212\211\229", "\176\128\104\38\65\179\218\181");
			end
		elseif ((not v21.RingOfPeace:IsUsableP() or (v21.RingOfPeace:CooldownRemains(BypassRecovery) > (0 - 0)) or not v21.RingOfPeace:IsAvailable()) and v49) then
			HeroRotationCharDB.Toggles[2 + 34] = not HeroRotationCharDB.Toggles[99 - 63];
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\226\205\204\18\255\194\242\16\209\199\199\85\225\209\199\0\213\132\203\6\144\202\205\2\144", "\117\176\164\162") .. ((HeroRotationCharDB.Toggles[150 - 114] and LUAOBFUSACTOR_DECRYPT_STR_0("\152\193\3\246\138\41\130\196\85\160\213\119\152\208\75", "\25\228\162\101\144\186")) or LUAOBFUSACTOR_DECRYPT_STR_0("\84\53\191\8\244\226\24\102\233\94\253\226\78\42\171\64", "\132\40\86\217\110\146")));
		end
		if (v50 and v21.BonedustBrew:IsUsableP() and (v21.BonedustBrew:CooldownRemains(BypassRecovery) <= (279 - (174 + 105)))) then
			if v13.Cast(v21.BonedustBrew, nil, nil, nil) then
				v55 = 1092708 - 767492;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\111\222\34\169\162\51\222\81\112\206\35\169\180\103\222\76\123\220", "\62\30\171\71\220\199\19\156");
			end
		elseif ((not v21.BonedustBrew:IsUsableP() or (v21.BonedustBrew:CooldownRemains(BypassRecovery) > (913 - (532 + 381)))) and v50) then
			HeroRotationCharDB.Toggles[32 + 5] = not HeroRotationCharDB.Toggles[876 - (137 + 702)];
			v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\98\74\162\51\89\220\60\89\98\87\169\33\29\248\58\72\85\64\236\63\78\137\33\66\87\5", "\45\32\37\204\86\61\169\79") .. ((HeroRotationCharDB.Toggles[99 - 62] and LUAOBFUSACTOR_DECRYPT_STR_0("\73\86\3\186\229\44\83\83\85\236\186\114\73\71\75", "\28\53\53\101\220\213")) or LUAOBFUSACTOR_DECRYPT_STR_0("\17\95\14\71\92\167\0\143\93\12\7\71\92\189\66\145", "\191\109\60\104\33\58\193\48")));
		end
		if (v7:AffectingCombat()) then
			if (v21.FortifyingBrew:IsReady() and (v7:HealthPercentage() < v67.Commons.FortifyingBrew)) then
				if v13.Cast(v21.FortifyingBrew, nil, nil, nil) then
					v55 = 18708 + 224727;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\161\216\10\243\142\209\1\238\137\208\88\197\149\210\15\167\214\135\72", "\135\231\183\120");
				end
			end
			if (v21.TouchOfKarma:IsReady() and (v7:HealthPercentage() < v67.Commons.TouchofKarma)) then
				if v13.Cast(v21.TouchOfKarma, nil, nil, nil) then
					v55 = 439960 - 317490;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\210\5\103\164\100\74\249", "\201\134\106\44\132\85\122");
				end
			end
			if ((v7:HealthPercentage() < v67.Commons.HealthstoneHP) and v22.Healthstone:IsReady() and (v22.Healthstone:CooldownRemains() <= (1886 - (1819 + 67)))) then
				if v13.Cast(v22.Healthstone, nil) then
					v55 = 24 + 16;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\30\9\118\51\21\4\219\55\57\2\114\127\41\60", "\67\86\108\23\95\97\108\168");
				end
			end
			if ((v7:HealthPercentage() < v67.Commons.HealPotHP) and ((v22.RefreshingHealingPotion1:IsReady() and (v22.RefreshingHealingPotion1:CooldownRemains() <= (0 + 0))) or (v22.RefreshingHealingPotion2:IsReady() and (v22.RefreshingHealingPotion2:CooldownRemains() <= (1357 - (259 + 1098)))) or (v22.RefreshingHealingPotion3:IsReady() and (v22.RefreshingHealingPotion3:CooldownRemains() <= (0 + 0))))) then
				if v13.Cast(v22.RefreshingHealingPotion1, nil) then
					v55 = 8 + 37;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\150\61\74\24\161\55\221\89\170\63\100\15\165\40\220\94\163\8\67\30\173\43\219\16\140\8", "\48\196\88\44\106\196\68\181");
				end
			end
		end
		if ((v3.CombatTime() < (1 + 3)) and (v7:Chi() < (16 - 11)) and not v21.Serenity:IsAvailable() and (not v29 or not v21.InvokeXuenTheWhiteTiger:IsAvailable())) then
			local v177 = v95();
			if v177 then
				return v177;
			end
		end
		if (v67.Commons.Enabled.TopTrinket or v67.Commons.Enabled.BotTrinket) then
			local v178 = v94();
			if v178 then
				return v178;
			end
		end
		if (v21.JadefireStomp:IsCastable() and v70(v21.JadefireStomp) and v21.JadefireHarmony:IsAvailable()) then
			if v65.CastTargetIf(v21.JadefireStomp, v25, LUAOBFUSACTOR_DECRYPT_STR_0("\143\214\210", "\76\226\191\188\67\224\196\194"), v83, v86, not v8:IsInRange(12 + 18)) then
				v55 = 378332 + 9861;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\211\41\3\245\251\208\58\2\207\238\205\39\10\224\189\212\41\14\254\189\129", "\157\185\72\103\144");
			end
		end
		if (v21.BonedustBrew:IsCastable() and (v26 == (4 - 3)) and v8:DebuffDown(v21.SkyreachExhaustionDebuff) and (v29 or v21.InvokeXuenTheWhiteTiger:CooldownDown())) then
			if v16(v21.BonedustBrew, nil, nil, not v8:IsInRange(1746 - (667 + 1039))) then
				v55 = 387295 - (274 + 745);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\91\188\132\127\172\164\74\167\181\120\186\180\78\243\135\123\161\191\25\234", "\209\57\211\234\26\200");
			end
		end
		if (v21.TigerPalm:IsReady() and v7:BuffDown(v21.SerenityBuff) and (v7:Energy() > (38 + 12)) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (2 + 1)) and v70(v21.TigerPalm) and (v7:ChiDeficit() >= ((432 - (288 + 142)) + v18(v7:BuffUp(v21.PowerStrikesBuff)))) and ((not v21.InvokeXuenTheWhiteTiger:IsAvailable() and not v21.Serenity:IsAvailable()) or (not v21.Skyreach:IsAvailable() and not v21.Skytouch:IsAvailable()) or (v3.CombatTime() > (1311 - (301 + 1005))) or v29) and not v32 and ((v26 > (1 + 0)) or not v21.BonedustBrew:IsAvailable() or (v21.BonedustBrew:IsAvailable() and (v26 == (2 - 1)) and v21.BonedustBrew:CooldownDown()))) then
			if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\12\199\168", "\178\97\174\198\225\48"), v80, nil, not v8:IsInMeleeRange(1878 - (674 + 1199))) then
				v55 = 88576 + 12204;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\219\95\3\244\106\217\31\206\90\9\177\117\231\6\193\22\85\161", "\111\175\54\100\145\24\134");
			end
		end
		if (v21.TigerPalm:IsReady() and v7:BuffDown(v21.SerenityBuff) and (v7:BuffStack(v21.TeachingsoftheMonasteryBuff) < (2 + 1)) and v70(v21.TigerPalm) and (v7:ChiDeficit() >= ((5 - 3) + v18(v7:BuffUp(v21.PowerStrikesBuff)))) and ((not v21.InvokeXuenTheWhiteTiger:IsAvailable() and not v21.Serenity:IsAvailable()) or (not v21.Skyreach:IsAvailable() and not v21.Skytouch:IsAvailable()) or (v3.CombatTime() > (21 - 16)) or v29) and not v32 and ((v26 > (1 + 0)) or not v21.BonedustBrew:IsAvailable() or (v21.BonedustBrew:IsAvailable() and (v26 == (446 - (92 + 353))) and v21.BonedustBrew:CooldownDown()))) then
			if v65.CastTargetIf(v21.TigerPalm, v24, LUAOBFUSACTOR_DECRYPT_STR_0("\78\16\46", "\117\35\121\64"), v80, nil, not v8:IsInMeleeRange(5 + 0)) then
				v55 = 249943 - 149163;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\201\180\233\211\49\112\205\188\226\219\99\66\220\180\224\150\114\29", "\47\189\221\142\182\67");
			end
		end
		if (v21.ChiBurst:IsCastable() and v21.JadefireStomp:IsAvailable() and v21.JadefireStomp:CooldownDown() and (((v7:ChiDeficit() >= (1 - 0)) and (v26 == (2 - 1))) or ((v7:ChiDeficit() >= (2 + 0)) and (v26 >= (3 - 1)))) and not v21.JadefireHarmony:IsAvailable()) then
			if v16(v21.ChiBurst, nil, nil, not v8:IsInRange(89 - 49)) then
				v55 = 538343 - 414357;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\35\183\46\244\74\188\50\58\52\255\42\202\65\167\96\120\116", "\73\64\223\71\171\40\201\64");
			end
		end
		if (v15() and not v21.Serenity:IsAvailable()) then
			local v179 = v97();
			if v179 then
				return v179;
			end
		end
		if (v15() and v21.Serenity:IsAvailable()) then
			local v180 = v98();
			if v180 then
				return v180;
			end
		end
		if v7:BuffUp(v21.SerenityBuff) then
			if (v7:BuffUp(v21.SerenityBuff) and ((v7:BloodlustUp() and (v7:BuffUp(v21.InvokersDelightBuff) or v7:PowerInfusionUp())) or (v7:BuffUp(v21.InvokersDelightBuff) and v7:PowerInfusionUp())) and (v26 >= (4 + 0))) then
				local v197 = v99();
				if v197 then
					return v197;
				end
			end
			if (v7:BuffUp(v21.SerenityBuff) and ((v7:BloodlustUp() and (v7:BuffUp(v21.InvokersDelightBuff) or v7:PowerInfusionUp())) or (v7:BuffUp(v21.InvokersDelightBuff) and v7:PowerInfusionUp())) and (v26 < (7 - 3))) then
				local v198 = v100();
				if v198 then
					return v198;
				end
			end
			if (v26 > (269 - (34 + 231))) then
				local v199 = v101();
				if v199 then
					return v199;
				end
			end
			if (v26 == (1321 - (930 + 387))) then
				local v200 = v102();
				if v200 then
					return v200;
				end
			end
			if (v26 == (3 + 0)) then
				local v201 = v103();
				if v201 then
					return v201;
				end
			end
			if (v26 == (2 + 0)) then
				local v202 = v104();
				if v202 then
					return v202;
				end
			end
			if (v26 == (2 - 1)) then
				local v203 = v105();
				if v203 then
					return v203;
				end
			end
		end
		if (v26 > (701 - (389 + 308))) then
			local v181 = v106();
			if v181 then
				return v181;
			end
		end
		if (v26 == (9 - 5)) then
			local v182 = v107();
			if v182 then
				return v182;
			end
		end
		if (v26 == (6 - 3)) then
			local v183 = v108();
			if v183 then
				return v183;
			end
		end
		if (v26 == (5 - 3)) then
			local v184 = v109();
			if v184 then
				return v184;
			end
		end
		if (v26 == (1 + 0)) then
			local v185 = v110();
			if v185 then
				return v185;
			end
		end
		if v21.SummonWhiteTigerStatue:IsCastable() then
			if v16(v21.SummonWhiteTigerStatue, nil, nil, not v8:IsInRange(362 - (125 + 197))) then
				v55 = 389683 - (339 + 658);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\25\152\201\84\175\115\53\154\204\80\180\120\53\153\205\94\165\111\53\158\208\88\180\104\15\205\201\88\169\115\74\220\146", "\29\106\237\164\57\192");
			end
		end
		local v172 = v111();
		if v172 then
			return v172;
		end
		if v16(v21.PoolEnergy) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\129\171\232\182\149\247\174\247\163\163\254", "\146\209\196\135\218\181\178\192");
		end
	end
end
local function v116()
	v13.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\26\57\141\21\71\166\33\59\134\3\16\138\34\62\136\81\66\168\57\49\151\24\95\169\109\56\130\2\16\165\40\53\141\81\69\183\41\49\151\20\84\231\43\63\145\81\64\166\57\51\139\81\1\247\99\98\205\68\30", "\199\77\80\227\113\48"));
end
v13.SetAPL(654 - 385, v115, v116);
function ReturnSpell()
	if (v55 == (0 - 0)) then
		return 1348 - (743 + 605);
	else
		return v55;
	end
end
function ReturnSpellMO()
	if (v54 == (0 + 0)) then
		return 0 + 0;
	else
		return v54;
	end
end
function ReturnSpellFocus()
	if (v57 == (0 - 0)) then
		return 0 - 0;
	else
		return v57;
	end
end
