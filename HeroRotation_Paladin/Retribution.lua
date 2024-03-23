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
local v5 = v3.Unit;
local v6 = v5.Player;
local v7 = v5.Target;
local v8 = v5.Pet;
local v9 = v3.Spell;
local v10 = v3.Item;
local v11 = HeroRotation;
local v12 = v11.AoEON;
local v13 = v11.CDsON;
local v14 = v11.Cast;
local v15 = v11.Commons.Everyone.num;
local v16 = v11.Commons.Everyone.bool;
local v17 = v5.MouseOver;
local v18 = math.min;
local v19 = v11.Commons.Everyone;
local v20 = v11.Commons.Paladin;
local v21 = v6:GetEquipment();
local v22 = (v21[1550 - (485 + 1052)] and v10(v21[53 - 40])) or v10(1322 - (1249 + 73));
local v23 = (v21[5 + 9] and v10(v21[1159 - (466 + 679)])) or v10(0 - 0);
local v24 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\193\207\218\60\227\169", "\126\177\163\187\69\134\219\167"), 37 - 24);
local v25 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\51\193\43\220\249\49", "\156\67\173\74\165"), 1914 - (106 + 1794));
local v26 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\19\178\71\19\174\39\74", "\38\84\215\41\118\220\70")]=v11.GUISettings.General,[LUAOBFUSACTOR_DECRYPT_STR_0("\115\25\47\31\241\94\5", "\158\48\118\66\114")]=v11.GUISettings.APL.Paladin.Commons,[LUAOBFUSACTOR_DECRYPT_STR_0("\153\33\4\36\122\167\238\191\45\31\56", "\155\203\68\112\86\19\197")]=v11.GUISettings.APL.Paladin.Retribution};
local v27 = v9.Paladin.Retribution;
local v28 = v10.Paladin.Retribution;
local v29 = {v28.AlgetharPuzzleBox:ID(),v28.ShadowedRazingAnnihilator:ID()};
local v30 = HeroRotationCharDB.Toggles[516 - 341];
local v31 = HeroRotationCharDB.Toggles[476 - 300];
local v32 = HeroRotationCharDB.Toggles[291 - (4 + 110)];
local v33 = HeroRotationCharDB.Toggles[762 - (57 + 527)];
local v34 = HeroRotationCharDB.Toggles[1606 - (41 + 1386)];
local v35 = HeroRotationCharDB.Toggles[283 - (17 + 86)];
local v36 = HeroRotationCharDB.Toggles[123 + 58];
local v37 = HeroRotationCharDB.Toggles[405 - 223];
local v38 = HeroRotationCharDB.Toggles[14 - 9];
local v39 = 166 - (122 + 44);
local v40 = 0 - 0;
local v41;
local v42;
local v43;
local v44 = 36860 - 25749;
local v45 = 9039 + 2072;
local v46;
local v47 = 0 + 0;
local v48 = 0 - 0;
local v49;
local v50 = ((v27.FinalVerdict:IsLearned()) and v27.FinalVerdict) or v27.TemplarsVerdict;
local v51 = v6:GetEquipment();
local v52 = (v51[78 - (30 + 35)] and v10(v51[9 + 4])) or v10(1257 - (1043 + 214));
local v53 = (v51[52 - 38] and v10(v51[1226 - (323 + 889)])) or v10(0 - 0);
v3:RegisterForEvent(function()
	v51 = v6:GetEquipment();
	v52 = (v51[593 - (361 + 219)] and v10(v51[333 - (53 + 267)])) or v10(0 + 0);
	v53 = (v51[427 - (15 + 398)] and v10(v51[996 - (18 + 964)])) or v10(0 - 0);
end, LUAOBFUSACTOR_DECRYPT_STR_0("\118\241\23\197\101\74\218\221\119\232\31\204\109\93\203\204\121\254\30\221\110\95\192\220", "\152\38\189\86\156\32\24\133"));
v3:RegisterForEvent(function()
	v44 = 6433 + 4678;
	v45 = 7001 + 4110;
end, LUAOBFUSACTOR_DECRYPT_STR_0("\204\123\134\127\217\101\152\116\217\112\130\104\195\114\137\103\222\123\130\98", "\38\156\55\199"));
v3:RegisterForEvent(function()
	v50 = ((v27.FinalVerdict:IsLearned()) and v27.FinalVerdict) or v27.TemplarsVerdict;
end, LUAOBFUSACTOR_DECRYPT_STR_0("\155\77\89\4\63\71\197\96\128\92\82\15\54\80", "\35\200\29\28\72\115\20\154"), LUAOBFUSACTOR_DECRYPT_STR_0("\53\154\240\237\163\9\16\38\140\225\250\161\0\11\48\145\238\235\172\14", "\84\121\223\177\191\237\76"));
local function v54()
	local v63 = v6:GCDRemains();
	local v64 = v18(v27.CrusaderStrike:CooldownRemains(), v27.BladeofJustice:CooldownRemains(), v27.Judgment:CooldownRemains(), (v27.HammerofWrath:IsUsable() and v27.HammerofWrath:CooldownRemains()) or (860 - (20 + 830)), v27.WakeofAshes:CooldownRemains());
	if (v63 > v64) then
		return v63;
	end
	return v64;
end
local function v55()
	return v6:BuffDown(v27.RetributionAura) and v6:BuffDown(v27.DevotionAura) and v6:BuffDown(v27.ConcentrationAura) and v6:BuffDown(v27.CrusaderAura);
end
local function v56()
	if v27.ShieldofVengeance:IsCastable() then
		if v14(v27.ShieldofVengeance, nil) then
			v39 = 144146 + 40516;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\94\192\165\54\84\15\206\189\105\223\165\52\87\53\192\181\85\204\224\42\66\53\194\180\91\203\161\46\16\102", "\161\219\54\169\192\90\48\80");
		end
	end
	if (v50:IsReady() and (v47 >= (130 - (116 + 10))) and v7:IsSpellInRange(v50)) then
		if v14(v50, nil, nil, not v7:IsSpellInRange(v50)) then
			v39 = 28316 + 355012;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\76\75\20\45\76\80\64\51\76\80\4\44\74\86\64\53\91\71\3\42\68\64\1\49\9\16", "\69\41\34\96");
		end
	end
	if v27.BladeofJustice:IsCastable() then
		if v14(v27.BladeofJustice, nil, nil, not v7:IsSpellInRange(v27.BladeofJustice)) then
			v39 = 185313 - (542 + 196);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\190\207\214\14\7\20\179\197\232\0\23\56\168\202\212\15\66\59\174\198\212\5\15\41\189\215\151\94", "\75\220\163\183\106\98");
		end
	end
	if v27.Judgment:IsCastable() then
		if v14(v27.Judgment, nil, nil, not v7:IsSpellInRange(v27.Judgment)) then
			v39 = 591177 - 315404;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\8\175\143\48\212\7\180\159\119\201\16\191\136\56\212\0\187\159\119\143", "\185\98\218\235\87");
		end
	end
	if v27.HammerofWrath:IsReady() then
		if v14(v27.HammerofWrath, nil, nil, not v7:IsSpellInRange(v27.HammerofWrath)) then
			v39 = 7089 + 17186;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\195\61\42\235\219\184\244\51\33\217\201\184\202\40\47\166\206\184\206\63\40\235\220\171\223\124\127", "\202\171\92\71\134\190");
		end
	end
	if v27.CrusaderStrike:IsCastable() then
		if v14(v27.CrusaderStrike, nil, nil, not v7:IsSpellInRange(v27.CrusaderStrike)) then
			v39 = 17984 + 17411;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\42\211\57\155\40\197\41\154\22\210\56\154\32\202\41\200\120\145", "\232\73\161\76");
		end
	end
end
local function v57()
	if (v26.Commons.Enabled.Potions and (v6:BuffUp(v27.AvengingWrathBuff) or (v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) == (4 + 6))) or (v45 < (65 - 40)))) then
		local v75 = v19.PotionSelected();
		if (v75 and v75:IsReady()) then
			if v11.Cast(v75, nil, nil) then
				v39 = 25 - 15;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\171\214\86\84\17\181\153\65\82\17\183\221\77\74\16\168\153\16", "\126\219\185\34\61");
			end
		end
	end
	if v27.LightsJudgment:IsCastable() then
		if v14(v27.LightsJudgment, nil, nil, not v7:IsInRange(1591 - (1126 + 425))) then
			v39 = 256052 - (118 + 287);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\0\199\89\122\106\100\204\237\25\202\89\127\123\121\231\167\15\193\81\126\122\120\228\233\31\142\10", "\135\108\174\62\18\30\23\147");
		end
	end
	if (v27.Fireblood:IsCastable() and (v6:BuffUp(v27.AvengingWrathBuff) or (v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) == (39 - 29))))) then
		if v14(v27.Fireblood, nil) then
			v39 = 266342 - (118 + 1003);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\176\224\56\206\26\162\60\200\178\169\41\196\23\162\55\200\161\231\57\139\78", "\167\214\137\74\171\120\206\83");
		end
	end
	local v65 = v6:GetUseableTrinkets(v29);
	if ((v26.Commons.Enabled.TopTrinket or v26.Commons.Enabled.BottomTrinket) and ((v6:BuffUp(v27.AvengingWrathBuff) and (v27.AvengingWrath:CooldownRemains() > (117 - 77))) or (v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) == (387 - (142 + 235)))) or (v45 < (136 - 106)) or (v6:BuffDown(v27.CrusadeBuff) and (v27.Crusade:CooldownRemains() > (5 + 15))) or (v6:BuffDown(v27.AvengingWrathBuff) and (v27.AvengingWrath:CooldownRemains() > (997 - (553 + 424)))))) then
		if v65 then
			if v11.Cast(v65, nil, nil) then
				if ((v65:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\155\252\51\68\253\181", "\199\235\144\82\61\152"), 23 - 10)) and v26.Commons.Enabled.TopTrinket) then
					v39 = 12 + 1;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\32\19\183\46\21\31\186\107\18\5\188\20\14\2\188\38\20\86\191\36\21\86", "\75\103\118\217") .. v65:Name();
				elseif ((v65:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\215\88\113\13\188\12", "\126\167\52\16\116\217"), 14 + 0)) and v26.Commons.Enabled.BottomTrinket) then
					v39 = 9 + 5;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\239\43\46\133\166\16\255\136\59\51\133\139\16\232\205\35\51\192\178\22\238\136", "\156\168\78\64\224\212\121") .. v65:Name();
				end
			end
		end
	end
	if (v28.Fyralath:IsEquippedAndReady() and (v27.MarkofFyralathDebuff:AuraActiveCount() > (0 + 0)) and v6:BuffDown(v27.AvengingWrathBuff) and v6:BuffDown(v27.CrusadeBuff)) then
		if v14(v28.Fyralath, nil, nil, not v7:IsInRange(15 + 10)) then
			v39 = 34 - 18;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\247\183\207\11\239\177\198\56\250\173\203\56\234\183\203\6\227\183\203\9\234\160\220\71\237\170\193\11\234\170\217\9\253\229\159\86", "\174\103\142\197");
		end
	end
	if (v27.ShieldofVengeance:IsCastable() and (v45 > (41 - 26)) and (not v27.ExecutionSentence:IsAvailable() or v7:DebuffDown(v27.ExecutionSentence))) then
		if v14(v27.ShieldofVengeance, nil) then
			v39 = 413465 - 228803;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\69\32\86\61\41\90\199\89\46\96\46\32\80\255\83\41\81\59\32\30\251\89\39\83\60\42\73\246\69\104\14\104", "\152\54\72\63\88\69\62");
		end
	end
	if (v27.ExecutionSentence:IsCastable() and ((v6:BuffDown(v27.CrusadeBuff) and (v27.Crusade:CooldownRemains() > (5 + 10))) or (v6:BuffStack(v27.CrusadeBuff) == (48 - 38)) or (v27.AvengingWrath:CooldownRemains() < (753.75 - (239 + 514))) or (v27.AvengingWrath:CooldownRemains() > (6 + 9))) and (((v47 >= (1333 - (797 + 532))) and (v3.CombatTime() < (4 + 1))) or ((v47 >= (2 + 1)) and (v3.CombatTime() > (11 - 6))) or ((v47 >= (1204 - (373 + 829))) and v27.DivineAuxiliary:IsAvailable())) and (((v7:TimeToDie() > (739 - (476 + 255))) and not v27.ExecutionersWill:IsAvailable()) or (v7:TimeToDie() > (1142 - (369 + 761))))) then
		if v14(v27.ExecutionSentence, nil, nil, not v7:IsSpellInRange(v27.ExecutionSentence)) then
			v39 = 198721 + 144806;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\209\220\235\95\193\208\231\83\218\251\253\89\218\208\235\82\215\193\174\95\219\203\226\88\219\211\224\79\148\149\186", "\60\180\164\142");
		end
	end
	if (v27.AvengingWrath:IsCastable() and (((v47 >= (6 - 2)) and (v3.CombatTime() < (9 - 4))) or ((v47 >= (241 - (64 + 174))) and (v3.CombatTime() > (1 + 4))) or ((v47 >= (2 - 0)) and v27.DivineAuxiliary:IsAvailable() and (v27.ExecutionSentence:CooldownUp() or v27.FinalReckoning:CooldownUp())))) then
		if v14(v27.AvengingWrath, nil) then
			v39 = 32220 - (144 + 192);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\72\0\39\32\228\28\95\97\18\59\38\249\26\24\93\10\38\43\233\29\79\80\22\105\118\191", "\114\56\62\101\73\71\141");
		end
	end
	if (v27.Crusade:IsCastable() and (((v47 >= (220 - (42 + 174))) and (v3.CombatTime() < (4 + 1))) or ((v47 >= (3 + 0)) and (v3.CombatTime() >= (3 + 2))))) then
		if v14(v27.Crusade, nil) then
			v39 = 233399 - (363 + 1141);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\187\251\206\215\185\237\222\132\187\230\212\200\188\230\204\202\171\169\138\144", "\164\216\137\187");
		end
	end
	if (v27.FinalReckoning:IsCastable() and (((v47 >= (1584 - (1183 + 397))) and (v3.CombatTime() < (24 - 16))) or ((v47 >= (3 + 0)) and (v3.CombatTime() >= (6 + 2))) or ((v47 >= (1977 - (1913 + 62))) and v27.DivineAuxiliary:IsAvailable())) and ((v27.AvengingWrath:CooldownRemains() > (7 + 3)) or (v27.Crusade:CooldownDown() and (v6:BuffDown(v27.CrusadeBuff) or (v6:BuffStack(v27.CrusadeBuff) >= (26 - 16))))) and ((v46 > (1933 - (565 + 1368))) or (v47 == (18 - 13)) or ((v47 >= (1663 - (1477 + 184))) and v27.DivineAuxiliary:IsAvailable()))) then
		if v14(v27.FinalReckoning, nil, nil, not v7:IsSpellInRange(v27.FinalReckoning)) then
			v39 = 468348 - 124627;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\212\239\63\179\170\193\25\215\229\58\189\168\247\5\213\166\50\189\169\242\15\221\241\63\161\230\175\83", "\107\178\134\81\210\198\158");
		end
	end
end
local function v58()
	v49 = ((v43 >= (3 + 0)) or ((v43 >= (858 - (564 + 292))) and not v27.DivineArbiter:IsAvailable()) or v6:BuffUp(v27.EmpyreanPowerBuff)) and v6:BuffDown(v27.EmpyreanLegacyBuff) and not (v6:BuffUp(v27.DivineArbiterBuff) and (v6:BuffStack(v27.DivineArbiterBuff) > (41 - 17)));
	if (v27.DivineStorm:IsReady() and v49 and (not v27.Crusade:IsAvailable() or (v27.Crusade:CooldownRemains() > (v48 * (8 - 5))) or (v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) < (314 - (244 + 60)))))) then
		if v14(v27.DivineStorm, nil, nil, not v7:IsInRange(7 + 1)) then
			v39 = 53861 - (41 + 435);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\60\7\148\207\164\61\49\145\210\165\42\3\194\192\163\54\7\145\206\175\42\29\194\148", "\202\88\110\226\166");
		end
	end
	if (v27.JusticarsVengeance:IsReady() and (not v27.Crusade:IsAvailable() or (v27.Crusade:CooldownRemains() > (v48 * (1004 - (938 + 63)))) or (v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) < (8 + 2))))) then
		if v14(v27.JusticarsVengeance, nil, nil, not v7:IsSpellInRange(v27.JusticarsVengeance)) then
			v39 = 216786 - (936 + 189);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\201\26\145\227\195\192\14\144\228\245\213\10\140\240\207\194\1\129\242\138\197\6\140\254\217\203\10\144\228\138\151", "\170\163\111\226\151");
		end
	end
	if (v50:IsReady() and (not v27.Crusade:IsAvailable() or (v27.Crusade:CooldownRemains() > (v48 * (1 + 2))) or (v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) < (1623 - (1565 + 48)))))) then
		if v14(v50, nil, nil, not v7:IsSpellInRange(v50)) then
			v39 = 236789 + 146539;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\20\57\166\48\75\37\105\7\53\160\60\71\52\61\81\54\187\54\71\36\33\20\34\161\120\24", "\73\113\80\210\88\46\87");
		end
	end
end
local function v59()
	if ((v47 >= (1143 - (782 + 356))) or (v6:BuffUp(v27.EchoesofWrathBuff) and v6:HasTier(298 - (176 + 91), 10 - 6) and v27.CrusadingStrikes:IsAvailable()) or ((v7:DebuffUp(v27.JudgmentDebuff) or (v47 == (5 - 1))) and v6:BuffUp(v27.DivineResonanceBuff) and not v6:HasTier(1123 - (975 + 117), 1877 - (157 + 1718)))) then
		local v76 = v58();
		if v76 then
			return v76;
		end
	end
	if (v27.WakeofAshes:IsCastable() and (v47 <= (2 + 0)) and (v27.AvengingWrath:CooldownDown() or v27.Crusade:CooldownDown()) and (not v27.ExecutionSentence:IsAvailable() or (v27.ExecutionSentence:CooldownRemains() > (14 - 10)) or (v45 < (27 - 19)))) then
		if v14(v27.WakeofAshes, nil, nil, not v7:IsInRange(1032 - (697 + 321))) then
			v39 = 697204 - 441267;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\150\45\198\23\216\142\42\242\19\244\137\41\222\82\224\132\34\200\0\230\149\35\223\1\167\211", "\135\225\76\173\114");
		end
	end
	if (v27.BladeofJustice:IsCastable() and v7:DebuffDown(v27.ExpurgationDebuff) and (v47 <= (5 - 2)) and v6:HasTier(71 - 40, 1 + 1)) then
		if v14(v27.BladeofJustice, nil, nil, not v7:IsSpellInRange(v27.BladeofJustice)) then
			v39 = 345830 - 161255;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\24\225\185\180\169\130\168\28\210\178\165\191\169\174\25\232\248\183\169\179\162\8\236\172\191\190\174\231\78", "\199\122\141\216\208\204\221");
		end
	end
	if (v27.DivineToll:IsCastable() and (v47 <= (5 - 3)) and ((v27.AvengingWrath:CooldownRemains() > (1242 - (322 + 905))) or (v27.Crusade:CooldownRemains() > (626 - (602 + 9))) or (v45 < (1197 - (449 + 740))))) then
		if v14(v27.DivineToll, nil, nil, not v7:IsInRange(902 - (826 + 46))) then
			v39 = 376523 - (245 + 702);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\212\6\249\118\243\146\201\31\252\116\182\170\216\30\245\106\247\185\210\2\227\56\162", "\150\205\189\112\144\24");
		end
	end
	if (v27.Judgment:IsReady() and v7:DebuffUp(v27.ExpurgationDebuff) and v6:BuffDown(v27.EchoesofWrathBuff) and v6:HasTier(97 - 66, 1 + 1)) then
		if v14(v27.Judgment, nil, nil, not v7:IsSpellInRange(v27.Judgment)) then
			v39 = 277671 - (260 + 1638);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\47\145\187\75\9\141\31\4\101\131\186\66\1\154\16\4\42\150\172\12\92", "\112\69\228\223\44\100\232\113");
		end
	end
	if ((v47 >= (443 - (382 + 58))) and v6:BuffUp(v27.CrusadeBuff) and (v6:BuffStack(v27.CrusadeBuff) < (32 - 22))) then
		local v77 = v58();
		if v77 then
			return v77;
		end
	end
	if (v27.TemplarSlash:IsReady() and ((v27.TemplarStrike:TimeSinceLastCast() + v48) < (4 + 0)) and (v43 >= (3 - 1))) then
		if v14(v27.TemplarSlash, nil, nil, not v7:IsSpellInRange(v27.TemplarSlash)) then
			v39 = 1208801 - 802154;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\192\26\10\195\186\125\148\235\12\11\210\165\116\198\211\26\9\214\164\125\146\219\13\20\147\224", "\230\180\127\103\179\214\28");
		end
	end
	if (v27.BladeofJustice:IsCastable() and ((v47 <= (1208 - (902 + 303))) or not v27.HolyBlade:IsAvailable()) and (((v43 >= (3 - 1)) and not v27.CrusadingStrikes:IsAvailable()) or (v43 >= (9 - 5)))) then
		if v14(v27.BladeofJustice, nil, nil, not v7:IsSpellInRange(v27.BladeofJustice)) then
			v39 = 15861 + 168714;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\142\9\94\66\225\126\239\138\58\85\83\247\85\233\143\0\31\65\225\79\229\158\4\75\73\246\82\160\212", "\128\236\101\63\38\132\33");
		end
	end
	if (v27.HammerofWrath:IsReady() and ((v43 < (1692 - (1121 + 569))) or not v27.BlessedChampion:IsAvailable() or v6:HasTier(244 - (22 + 192), 687 - (483 + 200))) and ((v47 <= (1466 - (1404 + 59))) or (v7:HealthPercentage() > (54 - 34)) or not v27.VanguardsMomentum:IsAvailable())) then
		if v14(v27.HammerofWrath, nil, nil, not v7:IsSpellInRange(v27.HammerofWrath)) then
			v39 = 32626 - 8351;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\164\168\28\73\179\249\240\163\175\46\83\164\234\219\164\233\22\65\184\238\221\173\189\30\86\165\171\158\248", "\175\204\201\113\36\214\139");
		end
	end
	if (v27.TemplarSlash:IsReady() and ((v27.TemplarStrike:TimeSinceLastCast() + v48) < (769 - (468 + 297)))) then
		if v14(v27.TemplarSlash, nil, nil, not v7:IsSpellInRange(v27.TemplarSlash)) then
			v39 = 407209 - (334 + 228);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\83\201\56\204\8\70\222\10\207\8\70\223\61\156\3\66\194\48\206\5\83\195\39\207\68\22\154", "\100\39\172\85\188");
		end
	end
	if (v27.Judgment:IsReady() and v7:DebuffDown(v27.JudgmentDebuff) and ((v47 <= (10 - 7)) or not v27.BoundlessJudgment:IsAvailable())) then
		if v14(v27.Judgment, nil, nil, not v7:IsSpellInRange(v27.Judgment)) then
			v39 = 639217 - 363444;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\167\109\189\135\62\168\118\173\192\52\168\118\188\146\50\185\119\171\147\115\252\47", "\83\205\24\217\224");
		end
	end
	if (v27.BladeofJustice:IsCastable() and ((v47 <= (5 - 2)) or not v27.HolyBlade:IsAvailable())) then
		if v14(v27.BladeofJustice, nil, nil, not v7:IsSpellInRange(v27.BladeofJustice)) then
			v39 = 52413 + 132162;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\228\201\204\57\227\250\194\59\217\207\216\46\242\204\206\56\166\194\200\51\227\215\204\41\233\215\222\125\183\157", "\93\134\165\173");
		end
	end
	if ((v7:HealthPercentage() <= (256 - (141 + 95))) or v6:BuffUp(v27.AvengingWrathBuff) or v6:BuffUp(v27.CrusadeBuff) or v6:BuffUp(v27.EmpyreanPowerBuff)) then
		local v78 = v58();
		if v78 then
			return v78;
		end
	end
	if (v27.Consecration:IsCastable() and v7:DebuffDown(v27.ConsecrationDebuff) and (v43 >= (2 + 0))) then
		if v14(v27.Consecration, nil, nil, not v7:IsInRange(20 - 12)) then
			v39 = 764252 - 446332;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\189\253\207\209\63\205\160\127\170\251\206\204\122\201\183\112\187\224\192\214\53\220\161\62\236\160", "\30\222\146\161\162\90\174\210");
		end
	end
	if (v27.DivineHammer:IsCastable() and (v43 >= (1 + 1))) then
		if v14(v27.DivineHammer, nil, nil, not v7:IsInRange(21 - 13)) then
			v39 = 139217 + 58817;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\225\71\102\3\235\75\79\2\228\67\125\15\247\14\119\15\235\75\98\11\241\65\98\25\165\28\36", "\106\133\46\16");
		end
	end
	if (v27.CrusaderStrike:IsCastable() and (v27.CrusaderStrike:ChargesFractional() >= (1.75 + 0)) and ((v47 <= (2 - 0)) or ((v47 <= (2 + 1)) and (v27.BladeofJustice:CooldownRemains() > (v48 * (165 - (92 + 71))))) or ((v47 == (2 + 2)) and (v27.BladeofJustice:CooldownRemains() > (v48 * (2 - 0))) and (v27.Judgment:CooldownRemains() > (v48 * (767 - (574 + 191))))))) then
		if v14(v27.CrusaderStrike, nil, nil, not v7:IsSpellInRange(v27.CrusaderStrike)) then
			v39 = 29197 + 6198;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\91\50\102\239\91\68\93\50\76\239\78\82\81\43\118\188\93\69\86\37\97\253\78\79\74\51\51\174\12", "\32\56\64\19\156\58");
		end
	end
	local v66 = v58();
	if v66 then
		return v66;
	end
	if v27.TemplarSlash:IsReady() then
		if v14(v27.TemplarSlash, nil, nil, not v7:IsSpellInRange(v27.TemplarSlash)) then
			v39 = 1018775 - 612128;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\78\205\232\70\86\243\146\101\219\233\87\73\250\192\93\205\235\83\72\243\148\85\218\246\22\8\170", "\224\58\168\133\54\58\146");
		end
	end
	if v27.TemplarStrike:IsReady() then
		if v14(v27.TemplarStrike, nil, nil, not v7:IsSpellInRange(v27.TemplarStrike)) then
			v39 = 208137 + 199343;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\77\83\70\237\121\135\149\52\74\66\89\244\126\131\199\12\92\88\78\239\116\146\136\25\74\22\24\173", "\107\57\54\43\157\21\230\231");
		end
	end
	if (v27.Judgment:IsReady() and ((v47 <= (852 - (254 + 595))) or not v27.BoundlessJudgment:IsAvailable())) then
		if v14(v27.Judgment, nil, nil, not v7:IsSpellInRange(v27.Judgment)) then
			v39 = 275899 - (55 + 71);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\209\158\21\242\180\217\193\207\203\22\240\183\217\221\218\159\30\231\170\156\156\137", "\175\187\235\113\149\217\188");
		end
	end
	if (v27.HammerofWrath:IsReady() and ((v47 <= (3 - 0)) or (v7:HealthPercentage() > (1810 - (573 + 1217))) or not v27.VanguardsMomentum:IsAvailable())) then
		if v14(v27.HammerofWrath, nil, nil, not v7:IsSpellInRange(v27.HammerofWrath)) then
			v39 = 67227 - 42952;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\52\174\140\65\230\107\71\51\169\190\91\241\120\108\52\239\134\73\237\124\106\61\187\142\94\240\57\43\104", "\24\92\207\225\44\131\25");
		end
	end
	if v27.CrusaderStrike:IsCastable() then
		if v14(v27.CrusaderStrike, nil, nil, not v7:IsSpellInRange(v27.CrusaderStrike)) then
			v39 = 31004 + 376476;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\72\193\173\95\26\121\78\193\135\95\15\111\66\216\189\12\28\120\69\214\170\77\15\114\89\192\248\30\77", "\29\43\179\216\44\123");
		end
	end
	if v27.ArcaneTorrent:IsCastable() then
		if v14(v27.ArcaneTorrent, nil, nil, not v7:IsInRange(12 - 4)) then
			v39 = 51552 - (714 + 225);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\188\203\35\77\179\220\31\88\178\203\50\73\179\205\96\75\184\215\37\94\188\205\47\94\174\153\114\20", "\44\221\185\64");
		end
	end
	if v27.Consecration:IsCastable() then
		if v14(v27.Consecration, nil, nil, not v7:IsInRange(23 - 15)) then
			v39 = 443232 - 125312;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\2\232\70\76\118\2\245\73\75\122\14\233\8\88\118\15\226\90\94\103\14\245\91\31\32\81", "\19\97\135\40\63");
		end
	end
	if v27.DivineHammer:IsCastable() then
		if v14(v27.DivineHammer, nil, nil, not v7:IsInRange(1 + 7)) then
			v39 = 286743 - 88709;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\170\85\37\50\33\52\145\84\50\54\34\52\188\28\52\62\33\52\188\93\39\52\61\34\238\15\97", "\81\206\60\83\91\79");
		end
	end
end
local function v60()
	v30 = HeroRotationCharDB.Toggles[981 - (118 + 688)];
	v31 = HeroRotationCharDB.Toggles[224 - (25 + 23)];
	v32 = HeroRotationCharDB.Toggles[35 + 142];
	v33 = HeroRotationCharDB.Toggles[2064 - (927 + 959)];
	v34 = HeroRotationCharDB.Toggles[603 - 424];
	v35 = HeroRotationCharDB.Toggles[912 - (16 + 716)];
	v36 = HeroRotationCharDB.Toggles[349 - 168];
	v37 = HeroRotationCharDB.Toggles[279 - (11 + 86)];
end
local function v61()
	if ShouldReturn then
		return ShouldReturn;
	end
	if (v40 > (0 - 0)) then
		v40 = 285 - (175 + 110);
	end
	if (v39 > (0 - 0)) then
		v39 = 0 - 0;
	end
	v42 = v6:GetEnemiesInRange(1804 - (503 + 1293));
	if v12() then
		v43 = #v42;
	else
		v43 = 2 - 1;
	end
	v46 = v54();
	ShouldReturn = v60();
	if v11.QueuedCast() then
		v39 = v11.QueuedCast();
		return LUAOBFUSACTOR_DECRYPT_STR_0("\109\190\195\102\32\206\13\149\91\174\197\119\111", "\196\46\203\176\18\79\163\45") .. v9(v39):ID();
	end
	if (v30 and v27.BlessingOfFreedom:IsUsableP() and (v27.BlessingOfFreedom:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v11.Cast(v27.BlessingOfFreedom, nil, nil, nil) then
			v39 = 2105 - (810 + 251);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\55\123\11\33\187\201\170\39\123\26\43\246", "\143\216\66\30\126\68\155");
		end
	elseif ((not v27.BlessingOfFreedom:IsUsableP() or (v27.BlessingOfFreedom:CooldownRemains(BypassRecovery) > (0 + 0))) and v30) then
		HeroRotationCharDB.Toggles[54 + 121] = not HeroRotationCharDB.Toggles[158 + 17];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\140\218\8\206\193\172\218\161\155\221\8\222\192\227\222\242\234\198\2\220\133", "\129\202\168\109\171\165\195\183") .. ((HeroRotationCharDB.Toggles[708 - (43 + 490)] and LUAOBFUSACTOR_DECRYPT_STR_0("\62\91\49\222\142\68\224\36\8\103\215\208\8\244\108", "\134\66\56\87\184\190\116")) or LUAOBFUSACTOR_DECRYPT_STR_0("\32\50\15\189\31\237\113\101\108\97\6\189\31\247\51\123", "\85\92\81\105\219\121\139\65")));
	end
	if (v31 and v27.HammerofJustice:IsUsableP() and (v27.HammerofJustice:CooldownRemains(BypassRecovery) <= (733 - (711 + 22)))) then
		if v11.Cast(v27.HammerofJustice, nil, nil, nil) then
			v39 = 3299 - 2446;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\236\166\85\80\121\159\213\178\93\72\121\205\242\181\122\80\111\203\244\176\85", "\191\157\211\48\37\28");
		end
	elseif ((not v27.HammerofJustice:IsUsableP() or (v27.HammerofJustice:CooldownRemains(BypassRecovery) > (859 - (240 + 619)))) and v31) then
		HeroRotationCharDB.Toggles[43 + 133] = not HeroRotationCharDB.Toggles[279 - 103];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\247\30\249\17\63\205\16\242\54\47\204\11\253\31\63\159\46\225\25\47\218\95\253\15\122\209\16\227\92", "\90\191\127\148\124") .. ((HeroRotationCharDB.Toggles[12 + 164] and LUAOBFUSACTOR_DECRYPT_STR_0("\100\132\40\17\40\215\40\17\40\215\33\25\100\149\96", "\119\24\231\78")) or LUAOBFUSACTOR_DECRYPT_STR_0("\158\46\163\76\218\70\65\210\125\245\69\218\70\13\144\99", "\113\226\77\197\42\188\32")));
	end
	if (v32 and v27.BlindingLight:IsUsableP() and (v27.BlindingLight:CooldownRemains(BypassRecovery) <= (1744 - (1344 + 400)))) then
		if v11.Cast(v27.BlindingLight, nil, nil, nil) then
			v39 = 116155 - (255 + 150);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\43\3\241\160\63\86\214\185\51\24\240\188\52\17\216\188\61\30\224", "\213\90\118\148");
		end
	elseif ((not v27.BlindingLight:IsUsableP() or (v27.BlindingLight:CooldownRemains(BypassRecovery) > (0 + 0))) and v32) then
		HeroRotationCharDB.Toggles[95 + 82] = not HeroRotationCharDB.Toggles[756 - 579];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\121\34\189\88\73\82\32\179\122\68\92\38\160\22\124\78\43\161\83\13\82\61\244\88\66\76\110", "\45\59\78\212\54") .. ((HeroRotationCharDB.Toggles[571 - 394] and LUAOBFUSACTOR_DECRYPT_STR_0("\12\85\133\141\214\126\171\246\64\6\140\133\154\60\227", "\144\112\54\227\235\230\78\205")) or LUAOBFUSACTOR_DECRYPT_STR_0("\175\43\9\250\214\93\227\120\95\172\223\93\181\52\29\178", "\59\211\72\111\156\176")));
	end
	if (v33 and v27.BlessingOfProtection:IsUsableP() and (v27.BlessingOfProtection:CooldownRemains(BypassRecovery) <= (1739 - (404 + 1335)))) then
		if v11.Cast(v27.BlessingOfProtection, nil, nil, nil) then
			v39 = 1428 - (183 + 223);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\95\146\230\56\75\199\193\33\75\148\240\36\64\128\204\43\126\149\236\57\75\132\247\36\65\137", "\77\46\231\131");
		end
	elseif ((not v27.BlessingOfProtection:IsUsableP() or (v27.BlessingOfProtection:CooldownRemains(BypassRecovery) > (0 - 0))) and v33) then
		HeroRotationCharDB.Toggles[118 + 60] = not HeroRotationCharDB.Toggles[65 + 113];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\152\88\179\83\169\93\184\71\149\82\134\82\181\64\179\67\174\93\185\78\250\101\163\69\175\81\246\73\169\20\184\79\173\20", "\32\218\52\214") .. ((HeroRotationCharDB.Toggles[515 - (10 + 327)] and LUAOBFUSACTOR_DECRYPT_STR_0("\82\20\55\174\161\224\67\92\30\71\62\166\237\162\11", "\58\46\119\81\200\145\208\37")) or LUAOBFUSACTOR_DECRYPT_STR_0("\55\143\54\170\175\187\102\123\220\96\163\175\187\42\57\194", "\86\75\236\80\204\201\221")));
	end
	if (v34 and v27.BlessingofSacrifice:IsUsableP() and (v27.BlessingofSacrifice:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v11.Cast(v27.BlessingofSacrifice, nil, nil, nil) then
			v39 = 7278 - (118 + 220);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\99\84\114\144\251\203\80\77\114\150\237\130\124\70\120\131\205\138\113\83\126\131\247\136\119", "\235\18\33\23\229\158");
		end
	elseif ((not v27.BlessingofSacrifice:IsUsableP() or (v27.BlessingofSacrifice:CooldownRemains(BypassRecovery) > (0 + 0))) and v34) then
		HeroRotationCharDB.Toggles[628 - (108 + 341)] = not HeroRotationCharDB.Toggles[81 + 98];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\114\182\196\168\67\179\207\188\95\188\242\186\83\168\200\189\89\185\196\251\97\175\196\174\85\250\200\168\16\180\206\172\16", "\219\48\218\161") .. ((HeroRotationCharDB.Toggles[756 - 577] and LUAOBFUSACTOR_DECRYPT_STR_0("\248\114\122\79\139\31\230\226\33\44\70\213\83\242\170", "\128\132\17\28\41\187\47")) or LUAOBFUSACTOR_DECRYPT_STR_0("\29\49\0\60\91\7\98\86\106\13\14\52\0\38\79\79", "\61\97\82\102\90")));
	end
	if (v35 and v27.Repentance:IsUsableP() and (v27.Repentance:CooldownRemains(BypassRecovery) <= (1493 - (711 + 782)))) then
		if v11.Cast(v27.Repentance, nil, nil, nil) then
			v39 = 38466 - 18400;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\189\59\174\94\194\23\44\12\188\43\165\95\198\89\29\12", "\105\204\78\203\43\167\55\126");
		end
	elseif ((not v27.Repentance:IsUsableP() or (v27.Repentance:CooldownRemains(BypassRecovery) > (469 - (270 + 199)))) and v35) then
		HeroRotationCharDB.Toggles[59 + 121] = not HeroRotationCharDB.Toggles[1999 - (580 + 1239)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\151\175\51\27\29\16\198\95\166\175\99\47\6\1\210\84\229\163\48\94\29\11\208\17", "\49\197\202\67\126\115\100\167") .. ((HeroRotationCharDB.Toggles[535 - 355] and LUAOBFUSACTOR_DECRYPT_STR_0("\43\88\217\47\208\6\88\49\11\143\38\142\74\76\121", "\62\87\59\191\73\224\54")) or LUAOBFUSACTOR_DECRYPT_STR_0("\251\1\252\207\225\4\170\153\183\82\245\207\225\30\232\135", "\169\135\98\154")));
	end
	if (v36 and v27.TurnEvil:IsUsableP() and (v27.TurnEvil:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v11.Cast(v27.TurnEvil, nil, nil, nil) then
			v39 = 371 + 9955;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\218\98\33\65\248\115\252\222\101\42\113\235\58\196", "\168\171\23\68\52\157\83");
		end
	elseif ((not v27.TurnEvil:IsUsableP() or (v27.TurnEvil:CooldownRemains(BypassRecovery) > (0 + 0))) and v36) then
		HeroRotationCharDB.Toggles[472 - 291] = not HeroRotationCharDB.Toggles[113 + 68];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\192\100\231\163\0\59\142\248\49\196\184\32\56\130\180\120\230\237\43\34\144\180", "\231\148\17\149\205\69\77") .. ((HeroRotationCharDB.Toggles[1348 - (645 + 522)] and LUAOBFUSACTOR_DECRYPT_STR_0("\156\164\193\253\7\175\134\161\151\171\88\241\156\181\137", "\159\224\199\167\155\55")) or LUAOBFUSACTOR_DECRYPT_STR_0("\235\240\58\212\241\245\108\130\167\163\51\212\241\239\46\156", "\178\151\147\92")));
	end
	if (v37 and v27.Intercession:IsUsableP() and (v27.Intercession:CooldownRemains(BypassRecovery) <= (1790 - (1010 + 780)))) then
		if v11.Cast(v27.Intercession, nil, nil, nil) then
			v39 = 390861 + 193;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\157\232\73\39\23\12\83\130\233\73\32\17\73\105\159\244\67\60", "\26\236\157\44\82\114\44");
		end
	elseif ((not v27.Intercession:IsUsableP() or (v27.Intercession:CooldownRemains(BypassRecovery) > (0 - 0))) and v37) then
		HeroRotationCharDB.Toggles[533 - 351] = not HeroRotationCharDB.Toggles[2018 - (1045 + 791)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\3\32\193\94\56\45\208\72\57\39\218\85\106\31\192\94\63\43\149\82\57\110\219\84\61\110", "\59\74\78\181") .. ((HeroRotationCharDB.Toggles[460 - 278] and LUAOBFUSACTOR_DECRYPT_STR_0("\57\210\92\92\227\117\215\92\10\227\42\223\70\72\253", "\211\69\177\58\58")) or LUAOBFUSACTOR_DECRYPT_STR_0("\171\230\127\243\239\205\231\181\41\165\230\205\177\249\107\187", "\171\215\133\25\149\137")));
	end
	if (v27.TurnEvil:IsReady() and v19.HandleIncorporeal(v27.TurnEvil, v17, 30 - 10, true)) then
		if v14(v27.TurnEvil) then
			v40 = 110831 - (351 + 154);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\194\201\33\238\175\4\233\80\239\136\23\236\230\60\188\86\238\136\27\244\236\63\238\82\238\218\55\251\227", "\34\129\168\82\154\143\80\156");
		end
	end
	if (v27.Repentance:IsReady() and v19.HandleIncorporeal(v27.Repentance, v17, 1604 - (1281 + 293), true)) then
		if v14(v27.Repentance) then
			v40 = 120332 - (28 + 238);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\166\179\32\31\8\124\140\149\183\61\31\73\64\138\128\242\39\4\8\103\135\134\189\33\27\71\92\140\132\190", "\233\229\210\83\107\40\46");
		end
	end
	if v19.HandleAfflicted(v27.CleanseToxins, v17, 44 - 24, false) then
		if v14(v27.CleanseToxins) then
			v40 = 1215203 - (1381 + 178);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\226\67\33\194\69\226\78\55\215\11\210\71\6\217\29\200\76\33\150\17\206\2\19\208\3\205\75\49\194\0\197", "\101\161\34\82\182");
		end
	end
	if (v19.TargetIsValid() or v6:AffectingCombat()) then
		v44 = v3.BossFightRemains();
		v45 = v44;
		if (v45 == (10422 + 689)) then
			v45 = v3.FightRemains(v42, false);
		end
		v48 = v6:GCD();
		v47 = v6:HolyPower();
	end
	if (v6:IsMounted() == true) then
		if (v27.CrusaderAura:IsCastable() and not v6:BuffUp(v27.CrusaderAura)) then
			if v14(v27.CrusaderAura) then
				v39 = 25983 + 6240;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\203\31\76\237\218\230\135\60\201\24\75\255\155\228\141\60\168\32\86\235\213\246\145\62\237\8\93", "\78\136\109\57\158\187\130\226");
			end
		end
	elseif (v27.RetributionAura:IsCastable() and not v6:BuffUp(v27.RetributionAura)) then
		if v14(v27.RetributionAura) then
			v39 = 78246 + 105189;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\12\58\237\227\55\61\236\229\55\48\247\177\31\42\235\240\126\57\246\227\126\25\240\246\54\43\240\255\57", "\145\94\95\153");
		end
	end
	if (v19.TargetIsValid() and (not v6:AffectingCombat() or v38)) then
		if not v6:AffectingCombat() then
			local v88 = v56();
			if v88 then
				return v88;
			end
		end
		if (v13()) then
			local v89 = v57();
			if v89 then
				return v89;
			end
		end
		local v79 = v59();
		if v79 then
			return v79;
		end
		if v14(v27.Pool) then
			return "Wait/Pool Resources";
		end
	end
end
function ReturnSpell()
	if (v39 == (0 - 0)) then
		return 0 + 0;
	else
		return v39;
	end
end
function ReturnSpellMO()
	if (v40 == (470 - (381 + 89))) then
		return 0 + 0;
	else
		return v40;
	end
end
local function v62()
	v27.MarkofFyralathDebuff:RegisterAuraTracking();
	v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\207\200\0\199\71\181\232\217\29\218\64\247\205\204\24\212\74\190\243\141\6\218\90\182\233\196\27\219\14\191\252\222\84\215\75\178\243\141\1\197\74\182\233\200\16\149\72\184\239\141\4\212\90\180\245\141\69\133\0\229\179\157\90", "\215\157\173\116\181\46"));
end
v11.SetAPL(48 + 22, v61, v62);
