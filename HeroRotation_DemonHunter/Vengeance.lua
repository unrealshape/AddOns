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
local v15 = v11.CastSuggested;
local v16 = v11.CastAnnotated;
local v17 = v11.Commons.Everyone.num;
local v18 = v11.Commons.Everyone.bool;
local v19 = v11.Commons.DemonHunter;
local v20 = GetTime;
local v21 = math.max;
local v22 = math.min;
local v23 = table.insert;
local v24 = v9.DemonHunter.Vengeance;
local v25 = v10.DemonHunter.Vengeance;
local v26 = {};
local v27 = v11.Commons.Everyone;
local v28 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\246\198\213\32\244\186\203", "\126\177\163\187\69\134\219\167")]=v11.GUISettings.General,[LUAOBFUSACTOR_DECRYPT_STR_0("\0\194\39\200\243\45\222", "\156\67\173\74\165")]=v11.GUISettings.APL.DemonHunter.Commons,[LUAOBFUSACTOR_DECRYPT_STR_0("\2\178\71\17\185\39\72\55\178", "\38\84\215\41\118\220\70")]=v11.GUISettings.APL.DemonHunter.Vengeance};
local v29, v30, v31;
local v32 = ((v24.SoulSigils:IsAvailable()) and (8 - 4)) or (5 - 2);
local v33, v34;
local v35;
local v36;
local v37;
local v38;
local v39, v40, v41, v42, v43, v44;
local v45 = 9788 + 1323;
local v46 = 11022 + 89;
local v47;
local v48 = 0 + 0;
local v49 = 0 + 0;
local v50;
local v51 = HeroRotationCharDB.Toggles[96 + 71];
local v52 = HeroRotationCharDB.Toggles[363 - 195];
local v53 = HeroRotationCharDB.Toggles[470 - 301];
local v54 = HeroRotationCharDB.Toggles[160 - 88];
local v55 = not HeroRotationCharDB.Toggles[5 + 10];
local v56 = HeroRotationCharDB.Toggles[24 - 19];
local v57 = HeroRotationCharDB.Toggles[756 - (239 + 514)];
local v58 = HeroRotationCharDB.Toggles[17 + 29];
local v59 = HeroRotationCharDB.Toggles[1513 - (797 + 532)];
local v60 = HeroRotationCharDB.Toggles[135 + 50];
local v61 = HeroRotationCharDB.Toggles[63 + 123];
local v62 = HeroRotationCharDB.Toggles[439 - 252];
local v63 = HeroRotationCharDB.Toggles[1390 - (373 + 829)];
local v64 = HeroRotationCharDB.Toggles[920 - (476 + 255)];
local v65 = HeroRotationCharDB.Toggles[1319 - (369 + 761)];
local v66 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\64\26\35\11\251\66", "\158\48\118\66\114"), 8 + 5);
local v67 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\187\40\17\47\118\183", "\155\203\68\112\86\19\197"), 24 - 10);
v3:RegisterForEvent(function()
	v45 = 21055 - 9944;
	v46 = 11349 - (64 + 174);
end, LUAOBFUSACTOR_DECRYPT_STR_0("\118\241\23\197\101\74\218\202\99\250\19\210\127\93\203\217\100\241\19\216", "\152\38\189\86\156\32\24\133"));
v3:RegisterForEvent(function()
	v32 = ((v24.SoulSigils:IsAvailable()) and (1 + 3)) or (3 - 0);
end, LUAOBFUSACTOR_DECRYPT_STR_0("\207\103\130\106\208\100\152\101\212\118\137\97\217\115", "\38\156\55\199"), LUAOBFUSACTOR_DECRYPT_STR_0("\132\88\93\26\61\81\222\124\155\77\89\4\63\75\211\109\151\73\93\10", "\35\200\29\28\72\115\20\154"));
local function v68()
	if ((v24.Felblade:TimeSinceLastCast() < v6:GCD()) or (v24.InfernalStrike:TimeSinceLastCast() < v6:GCD())) then
		v33 = true;
		v34 = true;
		return;
	end
	v33 = v7:IsInMeleeRange(341 - (144 + 192));
	v34 = v33 or (v38 > (216 - (42 + 174)));
end
local function v69(v86)
	return (v86:DebuffRemains(v24.FieryBrandDebuff));
end
local function v70(v87)
	return (v87:DebuffUp(v24.FieryBrandDebuff));
end
local function v71(v88)
	local v89 = 0 + 0;
	if (v88 ~= nil) then
		for v110, v111 in pairs(v88) do
			if (not v6:IsTanking(v111) and (v111:GUID() ~= v7:GUID()) and v111:AffectingCombat()) then
				v89 = v89 + 1 + 0;
			end
		end
	end
	return v89;
end
local function v72(v90)
	if (not v6:IsTanking(v90) and v54 and (v90:AffectingCombat()) and (v90:GUID() == v5(LUAOBFUSACTOR_DECRYPT_STR_0("\20\176\196\204\136\35\34\28\173", "\84\121\223\177\191\237\76")):GUID()) and (v90:NPCID() ~= (50151 + 67893))) then
		v48 = 1186749 - (363 + 1141);
		return true;
	elseif (not v6:IsTanking(v90) and v54 and (v90:AffectingCombat()) and (v90:GUID() == v7:GUID()) and (v90:NPCID() ~= (119624 - (1183 + 397)))) then
		v49 = 563949 - 378704;
		return true;
	elseif (not v6:IsTanking(v90) and v54 and (v90:AffectingCombat()) and (v90:NPCID() ~= (86532 + 31512))) then
		return true;
	end
end
local function v73()
	v48 = 747 + 252;
end
local function v74()
	if v24.SigilofFlame:IsCastable() then
		if v14(v24.SigilofFlame, nil, nil, not v7:IsInRange(2005 - (1913 + 62))) then
			v49 = 245494 + 144316;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\95\206\169\54\111\63\199\132\80\197\161\55\85\112\209\169\83\202\175\55\82\49\213\251\4", "\161\219\54\169\192\90\48\80");
		end
	end
	if (v24.Felblade:IsCastable() and not v33) then
		if v14(v24.Felblade, nil, nil, not v7:IsInRange(39 - 24)) then
			v49 = 234826 - (565 + 1368);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\79\71\12\39\69\67\4\32\9\82\18\32\74\77\13\39\72\86\64\112", "\69\41\34\96");
		end
	end
	if v24.ImmolationAura:IsCastable() then
		if v14(v24.ImmolationAura) then
			v49 = 973729 - 714809;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\181\206\218\5\14\42\168\202\216\4\61\42\169\209\214\74\18\57\185\192\216\7\0\42\168\131\131", "\75\220\163\183\106\98");
		end
	end
	if (v24.Fracture:IsCastable() and v33) then
		if v14(v24.Fracture) then
			v49 = 265303 - (1477 + 184);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\4\168\138\52\205\23\168\142\119\201\16\191\136\56\212\0\187\159\119\129", "\185\98\218\235\87");
		end
	end
	if (v24.Shear:IsCastable() and v33) then
		if v14(v24.Shear) then
			v49 = 277669 - 73887;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\216\52\34\231\204\234\219\46\34\229\209\167\201\61\51\166\143\250", "\202\171\92\71\134\190");
		end
	end
end
local function v75()
	if (v24.DemonSpikes:IsCastable() and v6:BuffDown(v24.DemonSpikesBuff) and v6:BuffDown(v24.MetamorphosisBuff) and (((v38 == (1 + 0)) and v6:BuffDown(v24.FieryBrandDebuff)) or (v38 > (857 - (564 + 292))))) then
		if (v24.DemonSpikes:ChargesFractional() > (1.9 - 0)) then
			if v14(v24.DemonSpikes, nil, nil) then
				v49 = 614046 - 410326;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\45\196\33\135\39\254\63\152\32\202\41\155\105\197\41\142\44\207\63\129\63\196\63\200\97\226\45\152\57\196\40\193", "\232\73\161\76");
			end
		elseif (v35 or (v6:HealthPercentage() <= v28.Vengeance.DemonSpikesHealthThreshold)) then
			if v14(v24.DemonSpikes, nil, nil) then
				v49 = 204024 - (244 + 60);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\191\220\79\82\16\132\202\82\84\21\190\202\2\89\27\189\220\76\78\23\173\220\81\29\86\159\216\76\90\27\169\144", "\126\219\185\34\61");
			end
		end
	end
	if (v24.Metamorphosis:IsCastable() and (v6:HealthPercentage() <= v28.Vengeance.MetamorphosisHealthThreshold) and (v6:BuffDown(v24.MetamorphosisBuff) or (v7:TimeToDie() < (12 + 3)))) then
		if v14(v24.Metamorphosis, nil, nil) then
			v49 = 188303 - (41 + 435);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\203\74\115\115\120\225\247\4\193\77\123\109\55\247\226\10\203\80\97\119\97\246\244", "\135\108\174\62\18\30\23\147");
		end
	end
	if (v24.FieryBrand:IsCastable() and (v35 or (v6:HealthPercentage() <= v28.Vengeance.FieryBrandHealthThreshold))) then
		if v14(v24.FieryBrand, nil, nil, not v7:IsSpellInRange(v24.FieryBrand)) then
			v49 = 205022 - (938 + 63);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\176\224\47\217\1\145\49\213\183\231\46\139\28\171\53\194\184\250\35\221\29\189", "\167\214\137\74\171\120\206\83");
		end
	end
end
local function v76()
	if (v24.SpiritBomb:IsReady() and (v6:HealthPercentage() < v28.Vengeance.Spiritbomb)) then
		if v14(v24.SpiritBomb, nil, nil, not v7:IsInMeleeRange(7 + 1)) then
			v49 = 248579 - (936 + 189);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\152\224\59\79\241\179\180\242\61\80\250\231\155\226\59\82\184\143\174\209\30", "\199\235\144\82\61\152");
		end
	end
	if (not v62 and v24.FieryBrand:IsCastable() and (((v24.FieryBrandDebuff:AuraActiveCount() == (0 + 0)) and ((v24.SigilofFlame:CooldownRemains() <= (v24.FieryBrand:ExecuteTime() + v6:GCDRemains())) or (v24.SoulCarver:CooldownRemains() < (v24.FieryBrand:ExecuteTime() + v6:GCDRemains())) or (v24.FelDevastation:CooldownRemains() < (v24.FieryBrand:ExecuteTime() + v6:GCDRemains())))) or (v24.DowninFlames:IsAvailable() and (v24.FieryBrand:FullRechargeTime() < (v24.FieryBrand:ExecuteTime() + v6:GCDRemains()))))) then
		if v14(v24.FieryBrand, nil, nil, not v7:IsSpellInRange(v24.FieryBrand)) then
			v49 = 205634 - (1565 + 48);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\31\188\57\30\41\187\57\6\24\189\107\10\23\176\37\19\19\183\42\9\21\188\107\85", "\75\103\118\217");
		end
	end
	if (v24.SigilofFlame:IsCastable() and (v24.AscendingFlame:IsAvailable() or (v24.SigilofFlameDebuff:AuraActiveCount() == (0 + 0)))) then
		if v14(v24.SigilofFlame, nil, nil, not v7:IsInRange(1168 - (782 + 356))) then
			v49 = 390077 - (176 + 91);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\212\93\119\29\181\33\200\82\79\18\181\31\202\81\48\25\184\23\201\64\117\26\184\16\196\81\48\64", "\126\167\52\16\116\217");
		end
	end
	if v24.ImmolationAura:IsCastable() then
		if v14(v24.ImmolationAura) then
			v49 = 674572 - 415652;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\193\35\45\143\184\24\232\193\33\46\191\181\12\238\201\110\45\129\189\23\232\205\32\33\142\183\28\188\158", "\156\168\78\64\224\212\121");
		end
	end
	if (v24.BulkExtraction:IsCastable() and (((7 - 2) - v29) <= v38) and (v29 <= (1094 - (975 + 117)))) then
		if v14(v24.BulkExtraction, nil, nil, not v7:IsInMeleeRange(1883 - (157 + 1718))) then
			v49 = 259975 + 60366;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\5\251\169\197\56\235\189\218\21\239\166\218\14\225\171\142\10\239\172\192\19\235\171\207\9\237\160\142\95", "\174\103\142\197");
		end
	end
	if (VarNoMaintCleave and not v44) then
		if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\97\9\118\12", "\152\54\72\63\88\69\62")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\227\197\231\72\148\194\225\78\148\247\254\85\198\205\250\28\246\203\227\94", "\60\180\164\142");
		end
	end
	if (v24.SpiritBomb:IsReady() and v44) then
		if v14(v24.SpiritBomb, nil, nil, not v7:IsInMeleeRange(28 - 20)) then
			v49 = 845998 - 598544;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\75\78\12\59\46\249\45\90\81\8\43\103\224\19\81\80\17\44\41\236\28\91\91\69\120\119", "\114\56\62\101\73\71\141");
		end
	end
	if (v24.Felblade:IsReady() and (((not v24.SpiritBomb:IsAvailable() or (v38 == (1019 - (697 + 321)))) and (v6:FuryDeficit() >= (108 - 68))) or ((v24.FelDevastation:CooldownRemains() <= (v24.Felblade:ExecuteTime() + v6:GCDRemains())) and (v6:Fury() < (105 - 55))))) then
		if v14(v24.Felblade, nil, nil, not v7:IsSpellInRange(v24.Felblade)) then
			v49 = 536906 - 304013;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\190\236\215\198\180\232\223\193\248\228\218\205\182\253\222\202\185\231\216\193\248\184\137", "\164\216\137\187");
		end
	end
	if (v24.Fracture:IsCastable() and (v24.FelDevastation:CooldownRemains() <= (v24.Fracture:ExecuteTime() + v6:GCDRemains())) and (v6:Fury() < (20 + 30))) then
		if v14(v24.Fracture, nil, nil, not v33) then
			v49 = 493974 - 230332;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\212\244\48\177\178\235\25\215\166\60\179\175\240\31\215\232\48\188\165\251\75\131\178", "\107\178\134\81\210\198\158");
		end
	end
	if (v24.Shear:IsCastable() and (v24.FelDevastation:CooldownRemains() <= (v24.Fracture:ExecuteTime() + v6:GCDRemains())) and (v6:Fury() < (134 - 84))) then
		if v14(v24.Shear, nil, nil, not v33) then
			v49 = 205009 - (322 + 905);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\43\6\135\199\184\120\3\131\207\164\44\11\140\199\164\59\11\194\151\252", "\202\88\110\226\166");
		end
	end
	if ((v6:FuryDeficit() <= (641 - (602 + 9))) and (v38 > (1190 - (449 + 740))) and (v30 >= (876 - (826 + 46))) and (v29 < (951 - (245 + 702)))) then
		if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\244\46\171\195", "\170\163\111\226\151")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\38\49\187\44\14\49\38\3\112\129\40\71\37\32\5\112\144\55\67\53", "\73\113\80\210\88\46\87");
		end
	end
	if (v24.SpiritBomb:IsReady() and (v6:FuryDeficit() <= (94 - 64)) and (v38 > (1 + 0)) and (v29 >= (1902 - (260 + 1638)))) then
		if v14(v24.SpiritBomb, nil, nil, not v7:IsInMeleeRange(448 - (382 + 58))) then
			v49 = 793849 - 546395;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\146\60\196\0\238\149\19\207\29\234\131\108\192\19\238\143\56\200\28\230\143\47\200\82\182\217", "\135\225\76\173\114");
		end
	end
	if (v24.SoulCleave:IsReady() and not VarNoMaintCleave and (v6:FuryDeficit() <= (34 + 6))) then
		if v14(v24.SoulCleave, nil, nil, not v33) then
			v49 = 472193 - 243716;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\9\226\173\188\147\190\171\31\236\174\181\236\176\166\19\227\172\181\162\188\169\25\232\248\226\252", "\199\122\141\216\208\204\221");
		end
	end
end
local function v77()
	if v24.ImmolationAura:IsCastable() then
		if v14(v24.ImmolationAura) then
			v49 = 769667 - 510747;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\164\208\29\255\116\247\185\212\31\254\71\247\184\207\17\176\126\255\168\207\9\207\124\243\160\212\3\245\56\164", "\150\205\189\112\144\24");
		end
	end
	if (v24.SigilofFlame:IsCastable() and (v24.AscendingFlame:IsAvailable() or (v24.SigilofFlameDebuff:AuraActiveCount() == (1205 - (902 + 303))))) then
		if v14(v24.SigilofFlame, nil, nil, not v7:IsInRange(65 - 35)) then
			v49 = 938859 - 549049;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\54\141\184\69\8\183\30\22\26\130\179\77\9\141\81\22\44\129\173\85\59\140\20\29\44\151\186\12\80", "\112\69\228\223\44\100\232\113");
		end
	end
	if (v24.Felblade:IsReady() and (not v24.SpiritBomb:IsAvailable() or (v24.FelDevastation:CooldownRemains() <= (v24.Felblade:ExecuteTime() + v6:GCDRemains()))) and (v6:Fury() < (5 + 45))) then
		if v14(v24.Felblade, nil, nil, not v7:IsSpellInRange(v24.Felblade)) then
			v49 = 234583 - (1121 + 569);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\210\26\11\209\186\125\130\209\95\1\218\179\110\159\235\27\2\222\191\111\131\148\73", "\230\180\127\103\179\214\28");
		end
	end
	if (v24.FelDevastation:IsReady() and not v64) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(234 - (22 + 192))) then
			v49 = 212767 - (483 + 200);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\138\0\83\121\224\68\246\141\22\75\71\240\72\239\130\69\89\79\225\83\249\179\1\90\75\237\82\229\204\93", "\128\236\101\63\38\132\33");
		end
	end
	if (v24.SoulCarver:IsCastable() and (v30 < (1466 - (1404 + 59)))) then
		if v14(v24.SoulCarver, nil, nil, not v33) then
			v49 = 587695 - 372952;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\191\166\4\72\137\232\206\190\191\20\86\246\237\198\169\187\8\123\178\238\194\165\186\20\4\231\187", "\175\204\201\113\36\214\139");
		end
	end
	if (v24.TheHunt:IsCastable() and v13() and not v65) then
		if v14(v24.TheHunt, nil, nil, not v7:IsInRange(67 - 17)) then
			v49 = 324404 - (468 + 297);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\83\196\48\227\12\82\194\33\156\2\78\201\39\197\59\67\201\56\213\23\66\140\100\142", "\100\39\172\85\188");
		end
	end
	if (v24.ElysianDecree:IsCastable() and (v24.ElysianDecree:TimeSinceLastCast() >= (563.85 - (334 + 228))) and (v6:Fury() >= (134 - 94))) then
		if v14(v24.ElysianDecree, nil, nil, not v7:IsInRange(69 - 39)) then
			v49 = 706985 - 317170;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\116\160\147\58\172\118\134\132\54\174\106\188\133\115\171\113\188\146\42\146\124\188\141\58\190\125\249\209\103", "\83\205\24\217\224");
		end
	end
	if (VarNoMaintCleave and not v44) then
		if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\209\228\228\9", "\93\134\165\173")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\137\243\200\214\122\200\189\108\254\193\209\203\40\199\166\62\156\253\204\192", "\30\222\146\161\162\90\174\210");
		end
	end
	if (v24.SpiritBomb:IsReady() and v44) then
		if v14(v24.SpiritBomb, nil, nil, not v7:IsInMeleeRange(3 + 5)) then
			v49 = 247690 - (141 + 95);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\246\94\121\24\236\90\79\8\234\67\114\74\227\71\117\24\252\113\116\15\232\71\99\15\165\31\38", "\106\133\46\16");
		end
	end
end
local function v78()
	if (not v63 and v24.SigilofChains:IsCastable() and (v24.CycleofBinding:IsAvailable())) then
		if v14(v24.SigilofChains, nil, nil, not v7:IsInRange(30 + 0)) then
			v49 = 520304 - 318166;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\75\41\116\245\86\127\87\38\76\255\82\65\81\46\96\188\92\73\84\44\118\238\26\18", "\32\56\64\19\156\58");
		end
	end
	if v24.Felblade:IsReady() then
		if v14(v24.Felblade, nil, nil, not v7:IsSpellInRange(v24.Felblade)) then
			v49 = 559854 - 326961;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\92\205\233\84\86\243\132\95\136\227\95\86\254\133\72\136\189", "\224\58\168\133\54\58\146");
		end
	end
	if v24.Shear:IsCastable() then
		if v14(v24.Shear, nil, nil, not v33) then
			v49 = 47734 + 156048;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\74\94\78\252\103\198\129\2\85\90\78\239\53\215\215", "\107\57\54\43\157\21\230\231");
		end
	end
	if v24.ThrowGlaive:IsCastable() then
		if v14(v24.ThrowGlaive, nil, nil, not v7:IsSpellInRange(v24.ThrowGlaive)) then
			v49 = 559365 - 355208;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\207\131\3\250\174\227\200\215\138\24\227\188\156\201\210\135\29\240\171\156\158\139", "\175\187\235\113\149\217\188");
		end
	end
end
local function v79()
	if (v24.TheHunt:IsCastable() and v13() and not v65) then
		if v14(v24.TheHunt, nil, nil, not v7:IsInRange(36 + 14)) then
			v49 = 168527 + 155112;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\40\167\132\115\235\108\118\40\239\146\69\237\126\116\57\144\149\77\241\126\125\40\239\211", "\24\92\207\225\44\131\25");
		end
	end
	if v24.SoulCarver:IsCastable() then
		if v14(v24.SoulCarver, nil, nil, not v33) then
			v49 = 302410 - 87667;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\88\220\173\64\36\126\74\193\174\73\9\61\88\218\182\75\23\120\116\199\185\94\28\120\95\147\236", "\29\43\179\216\44\123");
		end
	end
	if (not v64 and v24.FelDevastation:IsReady() and (v24.CollectiveAnguish:IsAvailable() or (v24.StoketheFlames:IsAvailable() and v24.BurningBlood:IsAvailable()))) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(12 + 8)) then
			v49 = 212247 - (92 + 71);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\187\220\44\115\185\220\54\77\174\205\33\88\180\214\46\12\174\208\46\75\177\220\31\88\188\203\39\73\169\153\118", "\44\221\185\64");
		end
	end
	if v24.ElysianDecree:IsCastable() then
		if v14(v24.ElysianDecree, nil, nil, not v7:IsInRange(15 + 15)) then
			v49 = 655395 - 265580;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\4\235\81\76\122\0\233\119\91\118\2\245\77\90\51\18\238\70\88\127\4\216\92\94\97\6\226\92\31\43", "\19\97\135\40\63");
		end
	end
	if (not v64 and v24.FelDevastation:IsReady()) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(785 - (574 + 191))) then
			v49 = 174941 + 37143;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\89\63\4\43\52\184\93\32\47\46\37\167\83\61\123\60\56\160\91\63\62\16\37\175\78\52\62\59\113\255\12", "\81\206\60\83\91\79");
		end
	end
	if (v24.SoulCleave:IsReady() and not v39) then
		if v14(v24.SoulCleave, nil, nil, not v33) then
			v49 = 572404 - 343927;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\164\197\126\16\192\65\161\79\189\213\50\60\202\67\163\66\174\239\102\46\209\74\161\90\235\129\32", "\196\46\203\176\18\79\163\45");
		end
	end
	if v24.Fracture:IsCastable() then
		if v14(v24.Fracture, nil, nil, not v33) then
			v49 = 134666 + 128976;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\190\48\127\29\48\238\253\189\98\109\23\42\252\227\189\29\106\31\54\252\234\172\98\47\74", "\143\216\66\30\126\68\155");
		end
	end
	if v24.Shear:IsCastable() then
		if v14(v24.Shear, nil, nil, not v33) then
			v49 = 204631 - (254 + 595);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\185\192\8\202\215\227\196\232\164\207\1\206\250\183\214\243\173\205\25\139\148\245", "\129\202\168\109\171\165\195\183");
		end
	end
	local v91 = v78();
	if v91 then
		return v91;
	end
end
local function v80()
	if (v24.TheHunt:IsCastable() and v13() and not v65) then
		if v14(v24.TheHunt, nil, nil, not v7:IsInRange(176 - (55 + 71))) then
			v49 = 426359 - 102720;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\54\80\50\231\214\1\232\54\24\36\213\223\24\234\29\89\56\221\158\70", "\134\66\56\87\184\190\116");
		end
	end
	if (not v64 and v24.FelDevastation:IsReady() and (v24.CollectiveAnguish:IsAvailable() or (v24.StoketheFlames:IsAvailable() and v24.BurningBlood:IsAvailable()))) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(1810 - (573 + 1217))) then
			v49 = 587349 - 375265;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\58\52\5\132\29\238\55\52\47\37\8\175\16\228\47\117\47\60\8\183\21\212\32\58\57\113\93", "\85\92\81\105\219\121\139\65");
		end
	end
	if (v24.ElysianDecree:IsCastable() and (v24.ElysianDecree:TimeSinceLastCast() >= (1.85 + 0)) and (v6:Fury() >= (64 - 24)) and ((v30 <= (940 - (714 + 225))) or (v30 >= (11 - 7)))) then
		if v14(v24.ElysianDecree, nil, nil, not v7:IsInRange(41 - 11)) then
			v49 = 42203 + 347612;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\248\191\73\86\117\222\243\140\84\64\127\205\248\182\16\86\113\222\241\191\111\68\115\218\189\229", "\191\157\211\48\37\28");
		end
	end
	if (not v64 and v24.FelDevastation:IsReady()) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(28 - 8)) then
			v49 = 212890 - (118 + 688);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\217\26\248\35\62\218\9\245\15\46\222\11\253\19\52\159\12\249\29\54\211\32\245\19\63\159\71", "\90\191\127\148\124");
		end
	end
	if (v24.SoulCarver:IsCastable() and (v30 < (51 - (25 + 23)))) then
		if v14(v24.SoulCarver, nil, nil, not v33) then
			v49 = 41593 + 173150;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\107\136\59\27\71\132\47\5\110\130\60\87\107\138\47\27\116\184\47\24\125\199\127\71", "\119\24\231\78");
		end
	end
	if (v24.SoulCleave:IsReady() and ((v29 <= (1887 - (927 + 959))) or not v24.SpiritBomb:IsAvailable()) and not v39) then
		if v14(v24.SoulCleave, nil, nil, not v33) then
			v49 = 770172 - 541695;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\145\34\176\70\227\67\29\135\44\179\79\156\83\28\131\33\169\117\221\79\20\194\124\241", "\113\226\77\197\42\188\32");
		end
	end
	if v24.Fracture:IsCastable() then
		if v14(v24.Fracture, nil, nil, not v33) then
			v49 = 264374 - (16 + 716);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\60\4\245\182\46\3\230\176\122\5\249\180\54\26\203\180\53\19\180\228\108", "\213\90\118\148");
		end
	end
	local v92 = v78();
	if v92 then
		return v92;
	end
end
local function v81()
	if (not v64 and v24.FelDevastation:IsReady() and (v24.CollectiveAnguish:IsAvailable() or v24.StoketheFlames:IsAvailable())) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(38 - 18)) then
			v49 = 212181 - (11 + 86);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\43\184\105\73\94\56\181\69\89\90\58\189\89\67\27\44\189\81\114\90\33\177\22\31", "\45\59\78\212\54");
		end
	end
	if (v24.TheHunt:IsCastable() and v13() and not v65) then
		if v14(v24.TheHunt, nil, nil, not v7:IsInRange(121 - 71)) then
			v49 = 323924 - (175 + 110);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\4\94\134\180\142\59\163\228\80\84\138\140\185\47\162\245\80\2", "\144\112\54\227\235\230\78\205");
		end
	end
	if (v24.ElysianDecree:IsCastable() and (v24.ElysianDecree:TimeSinceLastCast() >= (2.85 - 1)) and (v6:Fury() >= (197 - 157)) and ((v30 <= (1797 - (503 + 1293))) or (v30 >= (11 - 7)))) then
		if v14(v24.ElysianDecree, nil, nil, not v7:IsInRange(22 + 8)) then
			v49 = 390876 - (810 + 251);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\182\36\22\239\217\90\189\23\11\249\211\73\182\45\79\254\217\92\140\41\0\249\144\13", "\59\211\72\111\156\176");
		end
	end
	if (not v64 and v24.FelDevastation:IsReady()) then
		if v14(v24.FelDevastation, nil, nil, not v7:IsInMeleeRange(14 + 6)) then
			v49 = 65090 + 146994;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\72\130\239\18\74\130\245\44\93\147\226\57\71\136\237\109\76\142\228\18\79\136\230\109\22", "\77\46\231\131");
		end
	end
	if (v24.SoulCarver:IsCastable() and (v30 < (3 + 0))) then
		if v14(v24.SoulCarver, nil, nil, not v33) then
			v49 = 215276 - (43 + 490);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\91\163\76\133\87\183\82\172\81\164\0\184\93\177\127\187\91\179\0\235\4", "\32\218\52\214");
		end
	end
	if ((v30 >= (737 - (711 + 22))) and (v29 < (15 - 11))) then
		if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\121\54\24\156", "\58\46\119\81\200\145\208\37")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\28\141\57\184\233\187\57\57\204\3\188\160\175\63\63\204\18\163\164\191", "\86\75\236\80\204\201\221");
		end
	end
	if (v24.SpiritBomb:IsReady() and (v29 >= (863 - (240 + 619)))) then
		if v14(v24.SpiritBomb, nil, nil, not v7:IsInMeleeRange(2 + 6)) then
			v49 = 393625 - 146171;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\97\81\126\151\247\159\77\67\120\136\252\203\112\72\112\186\255\132\119\1\38\215", "\235\18\33\23\229\158");
		end
	end
	if (v24.SoulCleave:IsReady() and (not v24.SpiritBomb:IsAvailable() or not v39)) then
		if v14(v24.SoulCleave, nil, nil, not v33) then
			v49 = 15121 + 213356;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\67\181\212\183\111\185\205\190\81\172\196\251\82\179\198\132\81\181\196\251\1\238", "\219\48\218\161");
		end
	end
	if v24.Fracture:IsCastable() then
		if v14(v24.Fracture, nil, nil, not v33) then
			v49 = 265386 - (1344 + 400);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\226\99\125\74\207\90\242\225\49\126\64\220\112\225\235\116\60\24\143", "\128\132\17\28\41\187\47");
		end
	end
	if (v24.SoulCleave:IsReady() and not v39) then
		if v14(v24.SoulCleave, nil, nil, not v33) then
			v49 = 228882 - (255 + 150);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\18\61\19\54\98\2\62\3\59\75\4\114\4\51\90\62\51\9\63\29\80\106", "\61\97\82\102\90");
		end
	end
	local v93 = v78();
	if v93 then
		return v93;
	end
end
local function v82()
end
local function v83()
	v51 = HeroRotationCharDB.Toggles[132 + 35];
	v52 = HeroRotationCharDB.Toggles[90 + 78];
	v55 = not HeroRotationCharDB.Toggles[64 - 49];
	v56 = HeroRotationCharDB.Toggles[16 - 11];
	v57 = HeroRotationCharDB.Toggles[1742 - (404 + 1335)];
	v58 = HeroRotationCharDB.Toggles[452 - (183 + 223)];
	v53 = HeroRotationCharDB.Toggles[204 - 35];
	v59 = HeroRotationCharDB.Toggles[122 + 62];
	v60 = HeroRotationCharDB.Toggles[67 + 118];
	v61 = HeroRotationCharDB.Toggles[523 - (10 + 327)];
	v62 = HeroRotationCharDB.Toggles[131 + 56];
	v63 = HeroRotationCharDB.Toggles[526 - (118 + 220)];
	v64 = HeroRotationCharDB.Toggles[63 + 126];
	v65 = HeroRotationCharDB.Toggles[638 - (108 + 341)];
	v66 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\188\34\170\82\194\69", "\105\204\78\203\43\167\55\126"), 6 + 7);
	v67 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\181\166\34\7\22\22", "\49\197\202\67\126\115\100\167"), 59 - 45);
	if (not v28.Commons.Enabled.TopTrinket and not v28.Commons.Enabled.BottomTrinket) then
		v26 = {v66,v67};
	elseif (not v28.Commons.Enabled.TopTrinket and v28.Commons.Enabled.BottomTrinket) then
		v26 = {v66};
	elseif (not v28.Commons.Enabled.BottomTrinket and v28.Commons.Enabled.TopTrinket) then
		v26 = {v67};
	end
end
local function v84()
	if not v57 then
		v48 = 1819 - (580 + 1239);
		v49 = 0 - 0;
	end
	if (v48 > (0 + 0)) then
		v48 = 0 + 0;
	end
	if (v49 > (0 + 0)) then
		v49 = 0 - 0;
	end
	v50 = v6:GetEnemiesInRange(25 + 15, v24.DarkCommand);
	v37 = v6:GetEnemiesInMeleeRange(1175 - (645 + 522));
	if (v12()) then
		v38 = ((#v37 > (1790 - (1010 + 780))) and #v37) or (1 + 0);
	else
		v38 = 4 - 3;
	end
	if v6:IsChanneling(v24.FelDevestation) then
		if v11.CastAnnotated(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\0\122\246\29", "\62\87\59\191\73\224\54")) then
			v49 = 293042 - 193043;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\215\13\245\197\167\38\239\219\238\12\253\137\233\13\238\137\207\36\255\197\195\7\236\204\244\22\251\221\238\13\244", "\169\135\98\154");
		end
	end
	v83();
	if v11.QueuedCast() then
		v49 = v11.QueuedCast();
		return LUAOBFUSACTOR_DECRYPT_STR_0("\232\98\55\64\242\62\136\250\98\33\65\248\115", "\168\171\23\68\52\157\83") .. v9(v49):ID();
	end
	if (v51 and v24.InfernalStrike:IsUsableP() and (v24.InfernalStrike:CooldownRemains(BypassRecovery) <= (1836 - (1045 + 791))) and not v6:PrevGCD(2 - 1, v24.InfernalStrike)) then
		if v11.Cast(v24.InfernalStrike, nil, nil, nil) then
			v49 = 288761 - 99651;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\229\100\240\184\32\109\174\250\119\240\191\43\44\139\199\101\231\164\46\40\199", "\231\148\17\149\205\69\77");
		end
	elseif ((not v24.InfernalStrike:IsUsableP() or (v24.InfernalStrike:CooldownRemains() > (505 - (351 + 154))) or v6:PrevGCD(1575 - (1281 + 293), v24.InfernalStrike)) and v51) then
		HeroRotationCharDB.Toggles[433 - (28 + 238)] = not HeroRotationCharDB.Toggles[373 - 206];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\169\169\193\254\69\241\129\171\244\239\69\246\139\162\135\202\66\250\149\162\135\242\68\191\142\168\208\187", "\159\224\199\167\155\55") .. ((HeroRotationCharDB.Toggles[1726 - (1381 + 178)] and LUAOBFUSACTOR_DECRYPT_STR_0("\235\240\58\212\167\163\58\212\167\163\51\220\235\225\114", "\178\151\147\92")) or LUAOBFUSACTOR_DECRYPT_STR_0("\144\254\74\52\20\74\42\220\173\28\61\20\74\102\158\179", "\26\236\157\44\82\114\44")));
	end
	if (v52 and v24.SigilofSilence:IsUsableP() and (v24.SigilofSilence:CooldownRemains(BypassRecovery) <= (0 + 0)) and not v6:PrevGCD(1 + 0, v24.SigilofSilence)) then
		if v11.Cast(v24.SigilofSilence, nil, nil, nil) then
			v49 = 86224 + 115913;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\59\59\208\78\47\110\230\82\45\39\217\84\44\29\220\87\47\32\214\94\106", "\59\74\78\181");
		end
	elseif ((not v24.SigilofSilence:IsUsableP() or (v24.SigilofSilence:CooldownRemains() > (0 - 0)) or v6:PrevGCD(1 + 0, v24.SigilofSilence)) and v52) then
		HeroRotationCharDB.Toggles[638 - (381 + 89)] = not HeroRotationCharDB.Toggles[149 + 19];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\22\216\93\83\191\42\215\105\83\191\32\223\89\95\243\20\196\95\79\182\101\216\73\26\189\42\198\26", "\211\69\177\58\58") .. ((HeroRotationCharDB.Toggles[114 + 54] and LUAOBFUSACTOR_DECRYPT_STR_0("\171\230\127\243\185\155\177\227\41\165\230\197\171\247\55", "\171\215\133\25\149\137")) or LUAOBFUSACTOR_DECRYPT_STR_0("\253\203\52\252\233\54\172\18\177\152\61\252\233\44\238\12", "\34\129\168\82\154\143\80\156")));
	end
	if (v58 and v24.ChaosNova:IsUsableP() and (v24.ChaosNova:CooldownRemains(BypassRecovery) <= (0 - 0))) then
		if v11.Cast(v24.ChaosNova, nil, nil, nil) then
			v49 = 180213 - (1074 + 82);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\148\167\54\30\77\14\170\141\179\60\24\102\65\159\132", "\233\229\210\83\107\40\46");
		end
	elseif ((not v24.ChaosNova:IsUsableP() or (v24.ChaosNova:CooldownRemains(BypassRecovery) > (0 - 0))) and v58) then
		HeroRotationCharDB.Toggles[1830 - (214 + 1570)] = not HeroRotationCharDB.Toggles[1501 - (990 + 465)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\226\74\51\217\22\129\108\61\192\4\129\115\39\211\16\196\2\59\197\69\207\77\37\150", "\101\161\34\82\182") .. ((HeroRotationCharDB.Toggles[19 + 27] and LUAOBFUSACTOR_DECRYPT_STR_0("\244\14\95\248\139\178\132\40\184\93\86\240\199\240\204", "\78\136\109\57\158\187\130\226")) or LUAOBFUSACTOR_DECRYPT_STR_0("\34\60\255\247\56\57\169\161\110\111\246\247\56\35\235\191", "\145\94\95\153")));
	end
	if (v53 and v24.Metamorphosis:IsUsableP() and (v24.Metamorphosis:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v11.Cast(v24.Metamorphosis, nil, nil, nil) then
			v49 = 182653 + 5174;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\236\216\17\192\75\247\208\200\0\212\67\184\239\221\28\218\93\190\238", "\215\157\173\116\181\46");
		end
	elseif ((not v24.Metamorphosis:IsUsableP() or (v24.Metamorphosis:CooldownRemains(BypassRecovery) > (0 - 0))) and v53) then
		HeroRotationCharDB.Toggles[1895 - (1668 + 58)] = not HeroRotationCharDB.Toggles[795 - (512 + 114)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\24\177\159\243\215\58\166\155\250\213\38\189\152\178\235\32\177\158\247\154\60\167\203\252\213\34\244", "\186\85\212\235\146") .. ((HeroRotationCharDB.Toggles[440 - 271] and LUAOBFUSACTOR_DECRYPT_STR_0("\222\130\16\248\105\190\94\196\209\70\241\55\242\74\140", "\56\162\225\118\158\89\142")) or LUAOBFUSACTOR_DECRYPT_STR_0("\64\6\198\169\36\222\12\85\144\255\45\222\90\25\210\225", "\184\60\101\160\207\66")));
	end
	if (v59 and v24.FieryBrand:IsUsableP() and (v24.FieryBrand:CooldownRemains(BypassRecovery) <= (0 - 0)) and not v6:PrevGCD(3 - 2, v24.FieryBrand)) then
		if v11.Cast(v24.FieryBrand, nil, nil, nil) then
			v49 = 94913 + 109108;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\32\151\121\169\52\194\90\181\52\144\101\158\35\131\114\184", "\220\81\226\28");
		end
	elseif ((not v24.FieryBrand:IsUsableP() or (v24.FieryBrand:CooldownRemains() > (0 + 0)) or v6:PrevGCD(1 + 0, v24.FieryBrand)) and v59) then
		HeroRotationCharDB.Toggles[620 - 436] = not HeroRotationCharDB.Toggles[2178 - (109 + 1885)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\53\220\135\233\243\229\1\212\140\255\170\246\6\208\151\254\170\206\0\149\140\244\253\135", "\167\115\181\226\155\138") .. ((HeroRotationCharDB.Toggles[1653 - (1269 + 200)] and LUAOBFUSACTOR_DECRYPT_STR_0("\254\33\225\90\43\33\192\228\114\183\83\117\109\212\172", "\166\130\66\135\60\27\17")) or LUAOBFUSACTOR_DECRYPT_STR_0("\88\73\200\115\54\66\26\158\37\96\75\76\200\105\34\10", "\80\36\42\174\21")));
	end
	if (v60 and v24.SigilofChains:IsUsableP() and (v24.SigilofChains:CooldownRemains(BypassRecovery) <= (0 - 0)) and not v6:PrevGCD(816 - (98 + 717), v24.SigilofChains)) then
		if v11.Cast(v24.SigilofChains, nil, nil, nil) then
			v49 = 202964 - (802 + 24);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\95\5\50\111\75\80\4\115\73\25\59\117\72\51\63\123\71\30\36\58", "\26\46\112\87");
		end
	elseif ((not v24.SigilofChains:IsUsableP() or (v24.SigilofChains:CooldownRemains() > (0 - 0)) or v6:PrevGCD(1 - 0, v24.SigilofChains)) and v60) then
		HeroRotationCharDB.Toggles[28 + 157] = not HeroRotationCharDB.Toggles[143 + 42];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\138\42\172\125\179\176\67\151\177\34\162\122\172\255\116\161\188\54\174\52\182\172\5\186\182\52\235", "\212\217\67\203\20\223\223\37") .. ((HeroRotationCharDB.Toggles[31 + 154] and LUAOBFUSACTOR_DECRYPT_STR_0("\166\142\174\212\234\221\174\212\234\221\167\220\166\159\230", "\178\218\237\200")) or LUAOBFUSACTOR_DECRYPT_STR_0("\170\182\224\214\176\179\182\128\230\229\233\214\176\169\244\158", "\176\214\213\134")));
	end
	if (v61 and v24.FelDevastation:IsUsableP() and (v24.FelDevastation:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v11.Cast(v24.FelDevastation, nil, nil, nil) then
			v49 = 590004 - 377920;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\229\184\179\193\173\22\127\241\161\146\209\190\87\74\224\172\162\221\167\88", "\57\148\205\214\180\200\54");
		end
	elseif ((not v24.FelDevastation:IsUsableP() or (v24.FelDevastation:CooldownRemains(BypassRecovery) > (0 - 0))) and v61) then
		HeroRotationCharDB.Toggles[67 + 119] = not HeroRotationCharDB.Toggles[76 + 110];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\52\248\57\16\115\4\252\38\32\119\6\244\58\58\54\35\232\48\33\115\82\244\38\116\120\29\234\117", "\22\114\157\85\84") .. ((HeroRotationCharDB.Toggles[154 + 32] and LUAOBFUSACTOR_DECRYPT_STR_0("\216\200\21\194\13\166\174\194\155\67\203\83\234\186\138", "\200\164\171\115\164\61\150")) or LUAOBFUSACTOR_DECRYPT_STR_0("\162\247\5\67\133\184\164\83\21\211\177\242\5\89\145\240", "\227\222\148\99\37")));
	end
	if (v27.TargetIsValid() or v6:AffectingCombat()) then
		v45 = v3.BossFightRemains();
		v46 = v45;
		if (v46 == (8080 + 3031)) then
			v46 = v3.FightRemains(v37, false);
		end
		v29 = v19.Souls.AuraSouls;
		v31 = v19.Souls.IncomingSouls;
		v30 = v29 + v31;
		v68();
		v35 = v6:ActiveMitigationNeeded();
		v36 = v6:IsTankingAoE(4 + 4) or v6:IsTanking(v7);
	end
	if (v27.TargetIsValid() and (v6:AffectingCombat() or v56)) then
		if not v6:AffectingCombat() then
			local v119 = v74();
			if v119 then
				return v119;
			end
		end
		v40 = v24.FieryBrand:IsAvailable() and v24.FieryDemise:IsAvailable() and (v24.FieryBrandDebuff:AuraActiveCount() > (1433 - (797 + 636)));
		v41 = v38 == (4 - 3);
		v42 = (v38 >= (1621 - (1427 + 192))) and (v38 <= (2 + 3));
		v43 = v38 >= (13 - 7);
		v39 = ((v24.FelDevastation:CooldownRemains() <= (v24.SoulCleave:ExecuteTime() + v6:GCDRemains())) and (v6:Fury() < (72 + 8))) or (((v31 > (1 + 0)) or (v30 >= (331 - (192 + 134)))) and not v41);
		if v40 then
			v44 = (v41 and (v29 >= (1281 - (316 + 960)))) or (v42 and (v29 >= (3 + 1))) or (v43 and (v29 >= (3 + 0)));
		else
			v44 = (v42 and (v29 >= (5 + 0))) or (v43 and (v29 >= (15 - 11)));
		end
		if v40 then
			VarNoMaintCleave = (v41 and (v30 >= (556 - (83 + 468)))) or (v42 and (v30 >= (1810 - (1202 + 604)))) or (v43 and (v30 >= (13 - 10)));
		else
			VarNoMaintCleave = (v42 and (v30 >= (7 - 2))) or (v43 and (v30 >= (10 - 6)));
		end
		if v36 then
			local v120 = v75();
			if v120 then
				return v120;
			end
		end
		v47 = v71(EnemiesMeleeCount);
		if v27.TargetIsValid() then
		end
		if v28.Commons.Enabled.Potions then
			local v121 = v27.PotionSelected();
			if v121 then
				if (v121:IsReady() and v13() and v55 and ((v6:BloodlustUp() and v11.GUISettings.General.HoldPotforBL) or not v11.GUISettings.General.HoldPotforBL)) then
					if v14(v121, nil) then
						v49 = 375 - (45 + 280);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\35\93\70\255\246\61\18\81\249\246\63\86\93\225\247\32\18\4", "\153\83\50\50\150");
					end
				end
			end
		end
		if (v28.Commons.Enabled.BottomTrinket or v28.Commons.Enabled.TopTrinket) then
			local v122 = v6:GetUseableTrinkets(v26, 13 + 0);
			if v122 then
				if v14(v122, nil, nil) then
					v49 = 27 + 3;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\73\100\122\18\120\174\89\12\54\126\29\122\165\13\12\38", "\45\61\22\19\124\19\203");
				end
			end
			local v123 = v6:GetUseableTrinkets(v26, 6 + 8);
			if v123 then
				if v14(v123, nil, nil) then
					v49 = 23 + 17;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\213\0\4\251\9\117\173\147\82\0\244\11\126\249\144\64", "\217\161\114\109\149\98\16");
				end
			end
		end
		if (v24.FieryBrand:IsAvailable() and v24.FieryDemise:IsAvailable() and (v24.FieryBrandDebuff:AuraActiveCount() > (0 + 0))) then
			local v124 = v77();
			if v124 then
				return v124;
			end
		end
		local v109 = v76();
		if v109 then
			return v109;
		end
		if v41 then
			local v125 = v79();
			if v125 then
				return v125;
			end
			if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\37\1\17\72", "\20\114\64\88\28\220")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\6\0\219\160\184\214\178\35\65\225\189\246\215\177\52\53\211\166\255\213\169\121\72", "\221\81\97\178\212\152\176");
			end
		end
		if v42 then
			local v126 = v80();
			if v126 then
				return v126;
			end
			if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\250\198\52\207", "\122\173\135\125\155")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\179\192\9\173\127\55\199\150\129\51\180\62\61\196\165\206\37\241\118", "\168\228\161\96\217\95\81");
			end
		end
		if v43 then
			local v127 = v81();
			if v127 then
				return v127;
			end
			if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\236\240\7\104", "\55\187\177\78\60\79")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\26\207\86\255\6\201\143\63\142\125\226\65\238\143\8\134\22", "\224\77\174\63\139\38\175");
			end
		end
		if v16(v24.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\179\96\113\26", "\78\228\33\56")) then
			return "Wait/Pool Resources";
		end
	end
end
function ReturnSpellVen()
	if (v49 == (0 - 0)) then
		return 1911 - (340 + 1571);
	else
		return v49;
	end
end
function ReturnSpellVenMO()
	if (v48 == (0 + 0)) then
		return 1772 - (1733 + 39);
	else
		return v48;
	end
end
local function v85()
	v24.FieryBrandDebuff:RegisterAuraTracking();
	v24.SigilofFlameDebuff:RegisterAuraTracking();
	v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\248\123\188\4\128\207\112\177\6\197\234\123\191\12\139\142\86\167\13\145\203\108\242\17\138\218\127\166\10\138\192\62\186\2\150\142\124\183\6\139\142\107\162\7\132\218\123\182\67\131\193\108\242\19\132\218\125\186\67\212\158\48\224\77\213\128", "\229\174\30\210\99"));
end
v11.SetAPL(1596 - 1015, v84, v85);
