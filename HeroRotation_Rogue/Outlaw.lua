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
local v8 = v3.Spell;
local v9 = v3.MultiSpell;
local v10 = v3.Item;
local v11 = HeroRotation;
local v12 = v11.AoEON;
local v13 = v11.CDsON;
local v14 = HeroRotationCharDB.Toggles[1 + 3];
local v15 = HeroRotationCharDB.Toggles[2 + 3];
local v16 = HeroRotationCharDB.Toggles[5 + 7];
local v17 = not HeroRotationCharDB.Toggles[13 + 2];
local v18 = HeroRotationCharDB.Toggles[16 + 5];
local v19 = HeroRotationCharDB.Toggles[25 + 27];
local v20 = HeroRotationCharDB.Toggles[1455 - (797 + 636)];
local v21 = HeroRotationCharDB.Toggles[111 - 88];
local v22 = HeroRotationCharDB.Toggles[1643 - (1427 + 192)];
local v23 = HeroRotationCharDB.Toggles[9 + 16];
local v24 = HeroRotationCharDB.Toggles[62 - 35];
local v25 = HeroRotationCharDB.Toggles[45 + 5];
local v26 = HeroRotationCharDB.Toggles[24 + 27];
local v27 = HeroRotationCharDB.Toggles[379 - (192 + 134)];
local v28 = HeroRotationCharDB.Toggles[1306 - (316 + 960)];
local v29 = HeroRotationCharDB.Toggles[31 + 23];
local v30 = HeroRotationCharDB.Toggles[147 + 43];
local v31 = v5.MouseOver;
local v32 = 0 + 0;
local v33 = v6:GetEquipment();
local v34 = v10(0 - 0);
local v35 = v10(551 - (83 + 468));
local v36 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\193\207\218\60\227\169", "\126\177\163\187\69\134\219\167"), 1819 - (1202 + 604));
local v37 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\51\193\43\220\249\49", "\156\67\173\74\165"), 65 - 51);
if v33[20 - 7] then
	v34 = v10(v33[35 - 22]);
end
if v33[339 - (45 + 280)] then
	v35 = v10(v33[14 + 0]);
end
local v38 = {(118575 + 206161),(40159 + 188159),(180569 - (340 + 1571)),(334999 - (1733 + 39)),(335834 - (125 + 909)),(150258 + 184709),(314973 + 9764),(326686 - (46 + 190)),(94335 + 240135),(321429 - (228 + 498)),(176794 + 143218),(844336 - 520251),(333765 - (303 + 221)),(276251 + 55259),(1420740 - 1076001),(919518 - 551041),(1291359 - 922963),(572339 - 217282),(357381 - (111 + 1137)),(1018291 - 676152),(354229 - (423 + 100)),(985109 - 629327),(327926 - (326 + 445)),(352746 - 194409)};
local v39 = math.min;
local v40 = math.max;
local v41 = math.abs;
local v42 = nil;
local v43 = nil;
local v44;
local v45;
local v46;
local v47;
local v48 = v11.Commons.Everyone;
local v49 = v11.Commons.Rogue;
local v50 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\19\178\71\19\174\39\74", "\38\84\215\41\118\220\70")]=v11.GUISettings.General,[LUAOBFUSACTOR_DECRYPT_STR_0("\115\25\47\31\241\94\5", "\158\48\118\66\114")]=v11.GUISettings.APL.Rogue.Commons,[LUAOBFUSACTOR_DECRYPT_STR_0("\136\43\29\59\124\171\232\249", "\155\203\68\112\86\19\197")]=v11.GUISettings.APL.Rogue.Commons2,[LUAOBFUSACTOR_DECRYPT_STR_0("\105\200\34\240\65\111", "\152\38\189\86\156\32\24\133")]=v11.GUISettings.APL.Rogue.Outlaw};
local v51 = v8.Rogue.Outlaw;
local v52 = v10.Rogue.Outlaw;
local v53 = {v52.ManicGrieftorch:ID(),v52.DragonfireBombDispenser:ID(),v52.BeaconToTheBeyond:ID()};
local v54, v55, v56;
local v57;
local v58 = 38 - (19 + 13);
local v59;
local v60, v61, v62;
local v63, v64, v65, v66, v67;
local v68 = {{v51.Blind,LUAOBFUSACTOR_DECRYPT_STR_0("\223\86\180\82\188\117\171\79\242\83\231\14\213\89\179\67\238\69\178\86\232\30", "\38\156\55\199"),function()
	return true;
end}};
local v69 = v49.ReturnSpell();
local v70 = v49.ReturnSpellMO();
local function v71(v93)
	if v93 then
		return 1 - 0;
	else
		return 0 - 0;
	end
end
local function v72()
	return v6:BuffUp(v51.SliceandDice) or v6:BuffUp(v51.AdrenalineRush);
end
local v73, v74 = 1812 - (1293 + 519), 0 - 0;
local function v75(v94)
	local v95 = v6:EnergyTimeToMaxPredicted(nil, v94);
	if ((v95 < v73) or ((v95 - v73) > (0.5 - 0))) then
		v73 = v95;
	end
	return v73;
end
local function v76()
	local v96 = v6:EnergyPredicted();
	if ((v96 > v74) or ((v96 - v74) > (16 - 7))) then
		v74 = v96;
	end
	return v74;
end
local v77 = {v51.Broadside,v51.BuriedTreasure,v51.GrandMelee,v51.RuthlessPrecision,v51.SkullandCrossbones,v51.TrueBearing};
local function v78()
	if not v4.APLVar.RtB_Buffs then
		v4.APLVar.RtB_Buffs = {};
		v4.APLVar.RtB_Buffs.Total = 0 + 0;
		v4.APLVar.RtB_Buffs.Normal = 0 + 0;
		v4.APLVar.RtB_Buffs.Shorter = 1096 - (709 + 387);
		v4.APLVar.RtB_Buffs.Longer = 1858 - (673 + 1185);
		local v122 = v49.RtBRemains();
		for v131 = 2 - 1, #v77 do
			local v132 = v6:BuffRemains(v77[v131]);
			if (v132 > (0 - 0)) then
				v4.APLVar.RtB_Buffs.Total = v4.APLVar.RtB_Buffs.Total + (1 - 0);
				if (v132 == v122) then
					v4.APLVar.RtB_Buffs.Normal = v4.APLVar.RtB_Buffs.Normal + 1 + 0;
				elseif (v132 > v122) then
					v4.APLVar.RtB_Buffs.Longer = v4.APLVar.RtB_Buffs.Longer + 1 + 0;
				else
					v4.APLVar.RtB_Buffs.Shorter = v4.APLVar.RtB_Buffs.Shorter + (1 - 0);
				end
			end
		end
	end
	return v4.APLVar.RtB_Buffs.Total;
end
local function v79()
	if not v4.APLVar.RtB_Reroll then
		if (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\249\54\60\10\6\114\252", "\35\200\29\28\72\115\20\154")) then
			v4.APLVar.RtB_Reroll = ((v78() <= (0 + 0)) and true) or false;
		elseif (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\59\173\222\222\137\63\61\29\186", "\84\121\223\177\191\237\76")) then
			v4.APLVar.RtB_Reroll = (not v6:BuffUp(v51.Broadside) and true) or false;
		elseif (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\153\67\219\169\63\84\112\245\169\83\200\179\47\66\53", "\161\219\54\169\192\90\48\80")) then
			v4.APLVar.RtB_Reroll = (not v6:BuffUp(v51.BuriedTreasure) and true) or false;
		elseif (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\110\80\1\43\77\2\45\32\69\71\5", "\69\41\34\96")) then
			v4.APLVar.RtB_Reroll = (not v6:BuffUp(v51.GrandMelee) and true) or false;
		elseif (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\143\200\194\6\14\107\189\205\211\74\33\57\179\208\196\8\13\37\185\208", "\75\220\163\183\106\98")) then
			v4.APLVar.RtB_Reroll = (not v6:BuffUp(v51.SkullandCrossbones) and true) or false;
		elseif (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\48\175\159\63\213\7\169\152\119\233\16\191\136\62\202\11\181\133", "\185\98\218\235\87")) then
			v4.APLVar.RtB_Reroll = (not v6:BuffUp(v51.RuthlessPrecision) and true) or false;
		elseif (v50.Outlaw.RolltheBonesLogic == LUAOBFUSACTOR_DECRYPT_STR_0("\255\46\50\227\158\136\206\61\53\239\208\173", "\202\171\92\71\134\190")) then
			v4.APLVar.RtB_Reroll = (not v6:BuffUp(v51.TrueBearing) and true) or false;
		else
			v4.APLVar.RtB_Reroll = false;
			v78();
			if ((v78() <= (3 - 1)) and v6:BuffUp(v51.BuriedTreasure) and v6:BuffDown(v51.GrandMelee) and (v56 < (3 - 1))) then
				v4.APLVar.RtB_Reroll = true;
			end
			if (v51.Crackshot:IsAvailable() and v51.HiddenOpportunity:IsAvailable() and not v6:HasTier(1911 - (446 + 1434), 1287 - (1040 + 243)) and ((not v6:BuffUp(v51.TrueBearing) and v51.HiddenOpportunity:IsAvailable()) or (not v6:BuffUp(v51.Broadside) and not v51.HiddenOpportunity:IsAvailable())) and (v78() <= (2 - 1))) then
				v4.APLVar.RtB_Reroll = true;
			end
			if (v51.Crackshot:IsAvailable() and v6:HasTier(1878 - (559 + 1288), 1935 - (609 + 1322)) and (v78() <= ((455 - (13 + 441)) + v71(v6:BuffUp(v51.LoadedDiceBuff))))) then
				v4.APLVar.RtB_Reroll = true;
			end
			if (not v51.Crackshot:IsAvailable() and v51.HiddenOpportunity:IsAvailable() and not v6:BuffUp(v51.SkullandCrossbones) and (v78() < ((7 - 5) + v71(v6:BuffUp(v51.GrandMelee)))) and (v56 < (5 - 3))) then
				v4.APLVar.RtB_Reroll = true;
			end
			if (v4.APLVar.RtB_Reroll and ((v4.APLVar.RtB_Buffs.Longer == (0 - 0)) or (v4.APLVar.RtB_Buffs.Normal == (0 + 0))) and (v4.APLVar.RtB_Buffs.Longer >= (3 - 2)) and (v78() < (2 + 3)) and (v49.RtBRemains() <= (18 + 21)) and not v6:StealthUp(true, true)) then
				v4.APLVar.RtB_Reroll = true;
			end
			if (v7:FilteredTimeToDie("<", 35 - 23) or v3.BossFilteredFightRemains("<", 7 + 5)) then
				v4.APLVar.RtB_Reroll = false;
			end
		end
	end
	return v4.APLVar.RtB_Reroll;
end
local function v80()
	return v60 >= ((v49.CPMaxSpend() - (1 - 0)) - v71((v6:StealthUp(true, true)) and v51.Crackshot:IsAvailable()));
end
local function v81()
	return (v51.HiddenOpportunity:IsAvailable() or (v62 >= (2 + 0 + v71(v51.ImprovedAmbush:IsAvailable()) + v71(v6:BuffUp(v51.Broadside))))) and (v63 >= (28 + 22));
end
local function v82()
	return v50.Commons.VanishOffensive and v13() and not (v48.IsSoloMode() and v6:IsTanking(v7));
end
local function v83()
	return not v51.ShadowDanceTalent:IsAvailable() and ((v51.FanTheHammer:TalentRank() + v71(v51.QuickDraw:IsAvailable()) + v71(v51.Audacity:IsAvailable())) < (v71(v51.CountTheOdds:IsAvailable()) + v71(v51.KeepItRolling:IsAvailable())));
end
local function v84()
	return v6:BuffUp(v51.BetweentheEyes) and (not v51.HiddenOpportunity:IsAvailable() or (v6:BuffDown(v51.AudacityBuff) and ((v51.FanTheHammer:TalentRank() < (2 + 0)) or v6:BuffDown(v51.Opportunity)))) and not v51.Crackshot:IsAvailable();
end
local function v85()
	if (not v18 and v50.Commons.VanishOffensive and v45 and v51.Vanish:IsReady() and v82() and v51.HiddenOpportunity:IsAvailable() and not v51.Crackshot:IsAvailable() and not v6:BuffUp(v51.Audacity) and (v83() or (v6:BuffStack(v51.Opportunity) < (6 + 0))) and v81()) then
		if v11.Cast(v51.Vanish, nil) then
			v69 = 1816 + 40;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\10\192\63\156\105\247\45\134\32\210\36\200\97\233\3\193", "\232\73\161\76");
		end
	end
	if (v51.Vanish:IsReady() and v45 and v82() and (not v51.HiddenOpportunity:IsAvailable() or v51.Crackshot:IsAvailable()) and v80() and not v18 and v45 and v50.Commons.VanishOffensive) then
		if v11.Cast(v51.Vanish, nil) then
			v69 = 2289 - (153 + 280);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\152\216\81\73\94\141\216\76\84\13\179\153\10\123\23\181\208\81\85\87", "\126\219\185\34\61");
		end
	end
	if (v51.ShadowDance:IsReady() and v51.Crackshot:IsAvailable() and v80() and ((v51.Vanish:CooldownRemains() >= (17 - 11)) or not v50.Commons.VanishOffensive) and not v6:StealthUp(true, false) and v47) then
		if v11.Cast(v51.ShadowDance, nil) then
			v69 = 166374 + 18939;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\47\207\77\102\62\68\251\230\8\193\73\50\90\118\253\228\9", "\135\108\174\62\18\30\23\147");
		end
	end
	if (v51.ShadowDance:IsReady() and not v51.KeepItRolling:IsAvailable() and v84() and v6:BuffUp(v51.SliceandDice) and (v80() or v51.HiddenOpportunity:IsAvailable()) and (not v51.HiddenOpportunity:IsAvailable() or not v51.Vanish:IsReady()) and v47) then
		if v11.Cast(v51.ShadowDance, nil) then
			v69 = 73170 + 112143;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\149\232\57\223\88\157\59\198\178\230\61\139\60\175\61\196\179", "\167\214\137\74\171\120\206\83");
		end
	end
	if (v51.ShadowDance:IsReady() and v51.KeepItRolling:IsAvailable() and v84() and ((v51.KeepItRolling:CooldownRemains() <= (16 + 14)) or ((v51.KeepItRolling:CooldownRemains() >= (109 + 11)) and (v80() or v51.HiddenOpportunity:IsAvailable()))) and v47) then
		if v11.Cast(v51.ShadowDance, nil) then
			v69 = 134279 + 51034;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\152\228\114\110\240\166\143\255\37\29\220\166\133\243\55\29\211\174\185\176\37\84\236\175\132\229\38\29\219\181\138\243\57\78\240\168\159", "\199\235\144\82\61\152");
		end
	end
	if (v51.Shadowmeld:IsAvailable() and v51.Shadowmeld:IsReady() and v50.Commons.Racials) then
		if ((v51.Crackshot:IsAvailable() and v80()) or (not v51.Crackshot:IsAvailable() and ((v51.CountTheOdds:IsAvailable() and v80()) or v51.HiddenOpportunity:IsAvailable()))) then
			if v11.Cast(v51.Shadowmeld, nil) then
				v69 = 89815 - 30831;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\36\23\170\63\71\37\177\42\3\25\174\38\2\26\189", "\75\103\118\217");
			end
		end
	end
end
local function v86()
	if (v44 and v51.AdrenalineRush:IsCastable() and ((not v6:BuffUp(v51.AdrenalineRush) and (not v80() or not v51.ImprovedAdrenalineRush:IsAvailable())) or (v6:StealthUp(true, true) and v51.Crackshot:IsAvailable() and v51.ImprovedAdrenalineRush:IsAvailable() and (v61 <= (2 + 0))))) then
		if v11.Cast(v51.AdrenalineRush, nil) then
			v69 = 14417 - (89 + 578);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\228\85\99\0\249\63\195\70\117\26\184\18\206\90\117\84\139\11\212\92", "\126\167\52\16\116\217");
		end
	end
	if v51.BladeFlurry:IsReady() then
		if ((v56 >= ((2 + 0) - v71(v51.UnderhandedUpperhand:IsAvailable() and not v6:StealthUp(true, true) and v6:BuffUp(v51.AdrenalineRush)))) and (v6:BuffRemains(v51.BladeFlurry) < v6:GCD())) then
			if v11.Cast(v51.BladeFlurry) then
				v69 = 28849 - 14972;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\235\47\51\148\244\59\240\201\42\37\192\146\21\233\218\60\57", "\156\168\78\64\224\212\121");
			end
		end
	end
	if v51.BladeFlurry:IsReady() then
		if (v51.DeftManeuvers:IsAvailable() and not v80() and (((v56 >= (1052 - (572 + 477))) and (v62 == (v56 + v71(v6:BuffUp(v51.Broadside))))) or (v56 >= (1 + 4)))) then
			if v11.Cast(v51.BladeFlurry) then
				v69 = 8328 + 5549;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\36\239\182\218\71\204\169\207\3\235\229\232\11\251\183\220\30", "\174\103\142\197");
			end
		end
	end
	if v51.RolltheBones:IsReady() then
		if (v79() or (v78() == (0 + 0)) or ((v49.RtBRemains() <= (89 - (84 + 2))) and v6:HasTier(50 - 19, 3 + 1)) or ((v49.RtBRemains() <= (849 - (497 + 345))) and ((v51.ShadowDance:CooldownRemains() <= (1 + 2)) or (v51.Vanish:CooldownRemains() <= (1 + 2))) and not v6:StealthUp(true, true))) then
			if v11.Cast(v51.RolltheBones) then
				v69 = 316841 - (605 + 728);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\117\41\76\44\101\108\247\90\36\31\44\45\91\184\116\39\81\61\54", "\152\54\72\63\88\69\62");
			end
		end
	end
	if (v51.KeepItRolling:IsReady() and not v79() and (v78() >= (3 + 0 + v71(v6:HasTier(68 - 37, 1 + 3)))) and (v6:BuffDown(v51.ShadowDance) or (v78() >= (22 - 16)))) then
		if v11.Cast(v51.KeepItRolling, nil) then
			v69 = 344362 + 37627;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\247\197\253\72\148\239\235\89\196\132\231\72\148\246\225\80\216\205\224\91", "\60\180\164\142");
		end
	end
	if (v51.GhostlyStrike:IsAvailable() and v51.GhostlyStrike:IsReady() and (v60 < (19 - 12)) and v46) then
		if v11.Cast(v51.GhostlyStrike, nil, nil, not v7:IsSpellInRange(v51.GhostlyStrike)) then
			v69 = 148698 + 48239;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\123\95\22\61\103\202\26\87\77\17\37\62\173\33\76\76\12\34\34", "\114\56\62\101\73\71\141");
		end
	end
	if (v13() and v51.Sepsis:IsAvailable() and v51.Sepsis:IsReady()) then
		if ((v51.Crackshot:IsAvailable() and v51.BetweentheEyes:IsReady() and v80() and not v6:StealthUp(true, true)) or (not v51.Crackshot:IsAvailable() and v7:FilteredTimeToDie(">", 500 - (457 + 32)) and v6:BuffUp(v51.BetweentheEyes)) or v3.BossFilteredFightRemains("<", 5 + 6)) then
			if v11.Cast(v51.Sepsis, nil, nil, not v7:IsSpellInRange(v51.Sepsis)) then
				v69 = 329707 - (832 + 570);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\155\232\200\208\248\218\222\212\171\224\200", "\164\216\137\187");
			end
		end
	end
	if (not v6:StealthUp(true, true) and (not v51.Crackshot:IsAvailable() or v51.BetweentheEyes:IsReady())) then
		v57 = v85();
		if v57 then
			return v57;
		end
	end
	if (v13() and v51.ThistleTea:IsCastable() and not v6:BuffUp(v51.ThistleTea) and ((v65 >= (95 + 5)) or v3.BossFilteredFightRemains("<", v51.ThistleTea:Charges() * (2 + 4)))) then
		if v11.Cast(v51.ThistleTea, nil) then
			v69 = 1350493 - 968870;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\241\231\34\166\230\202\3\219\245\37\190\163\190\63\215\231", "\107\178\134\81\210\198\158");
		end
	end
	if (v51.BladeRush:IsCastable() and (v66 > (2 + 2)) and not v6:StealthUp(true, true)) then
		if v11.Cast(v51.BladeRush, nil, nil, not v7:IsSpellInRange(v51.BladeRush)) then
			v69 = 272673 - (588 + 208);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\27\15\145\210\234\26\2\131\194\175\120\60\151\213\162", "\202\88\110\226\166");
		end
	end
	if v50.Commons.Enabled.Potions then
		local v123 = v48.PotionSelected();
		if v123 then
			if (v123:IsReady() and v13() and v17 and ((v6:BloodlustUp() and v11.GUISettings.General.HoldPotforBL) or ((v6:BloodlustUp() or (v3.BossFightRemains() <= (80 - 50)) or v6:BuffUp(v51.AdrenalineRush)) and not v11.GUISettings.General.HoldPotforBL))) then
				if v11.Cast(v123, nil) then
					v69 = 1850 - (884 + 916);
					return LUAOBFUSACTOR_DECRYPT_STR_0("\211\0\150\254\197\205\79\129\248\197\207\11\141\224\196\208\79\208", "\170\163\111\226\151");
				end
			end
		end
	end
	if v51.BloodFury:IsCastable() then
		if v11.Cast(v51.BloodFury, nil) then
			v69 = 43068 - 22496;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\50\49\161\44\14\21\37\30\63\182\120\104\34\59\8", "\73\113\80\210\88\46\87");
		end
	end
	if v51.Berserking:IsCastable() then
		if v11.Cast(v51.Berserking, nil) then
			v69 = 15248 + 11049;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\162\45\222\6\167\163\41\223\1\226\147\39\196\28\224", "\135\225\76\173\114");
		end
	end
	if v51.Fireblood:IsCastable() then
		if v11.Cast(v51.Fireblood, nil) then
			v69 = 265874 - (232 + 421);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\57\236\171\164\236\155\174\8\232\186\188\163\178\163", "\199\122\141\216\208\204\221");
		end
	end
	if v51.AncestralCall:IsCastable() then
		if v11.Cast(v51.AncestralCall, nil) then
			v69 = 276627 - (1569 + 320);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\142\220\3\228\56\215\163\222\21\227\108\228\172\209\80\211\121\250\161", "\150\205\189\112\144\24");
		end
	end
	if (v50.Commons.Enabled.BottomTrinket or v50.Commons.Enabled.TopTrinket) then
		if v52.ManicGrieftorch:IsEquippedAndReady() then
			if (((v6:GCDRemains() > (v6:GCD() - (0.1 + 0))) and not v6:StealthUp(true, true) and v6:BuffUp(v51.BetweentheEyes)) or v3.BossFilteredFightRemains(LUAOBFUSACTOR_DECRYPT_STR_0("\121\217", "\112\69\228\223\44\100\232\113"), 1 + 4)) then
				if v11.Cast(v52.ManicGrieftorch, nil, nil) then
					if (v52.BalefireBranch:ID() == v36) then
						v69 = 80 - 56;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\249\30\9\218\181\60\161\198\22\2\213\162\115\148\215\23\71\199\185\108", "\230\180\127\103\179\214\28");
					elseif (v52.ManicGrieftorch:ID() == v37) then
						v69 = 635 - (316 + 289);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\161\4\81\79\231\1\199\158\12\90\64\240\78\242\143\13\31\68\235\81", "\128\236\101\63\38\132\33");
					end
				end
			end
		end
		if v52.DragonfireBombDispenser:IsEquippedAndReady() then
			if (((not v34:ID() == v52.DragonfireBombDispenser:ID()) and (v34:CooldownRemains() > (26 - 16))) or (v35:CooldownRemains() > (1 + 9)) or v3.BossFilteredFightRemains("<", 1473 - (666 + 787)) or not v35:HasCooldown() or not v34:HasCooldown()) then
				if v11.Cast(v52.DragonfireBombDispenser, nil, nil) then
					if (v52.DragonfireBombDispenser:ID() == v36) then
						v69 = 449 - (360 + 65);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\136\187\16\67\185\229\201\165\187\20\4\148\228\194\174\233\53\77\165\251\202\162\186\20\86\246\255\192\188", "\175\204\201\113\36\214\139");
					elseif (v52.DragonfireBombDispenser:ID() == v37) then
						v69 = 29 + 1;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\99\222\52\219\11\73\202\60\206\1\7\238\58\209\6\7\232\60\207\20\66\194\38\217\22\7\206\58\204", "\100\39\172\85\188");
					end
				end
			end
		end
		if v52.BeaconToTheBeyond:IsEquippedAndReady() then
			if ((not v6:StealthUp(true, true) and v6:BuffUp(v51.BetweentheEyes)) or v3.BossFilteredFightRemains("<", 259 - (79 + 175))) then
				if v11.Cast(v52.DragonfireBombDispenser, nil, nil) then
					if (v52.DragonfireBombDispenser:ID() == v36) then
						v69 = 37 - 13;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\143\125\184\131\60\163\56\173\143\35", "\83\205\24\217\224");
					elseif (v52.DragonfireBombDispenser:ID() == v37) then
						v69 = 24 + 6;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\196\192\204\62\233\203\141\63\233\213", "\93\134\165\173");
					end
				end
			end
		end
		local v124 = v6:GetUseableTrinkets(v53);
		v124 = v6:GetUseableTrinkets(v53);
		if (v124 and ((v13() and not v6:StealthUp(true, true)) or v3.BossFilteredFightRemains("<", 30 - 20))) then
			if (v124 and (v6:BuffUp(v51.BetweentheEyes) or v3.BossFilteredFightRemains("<", 38 - 18) or v124:HasStatAnyDps())) then
				if v11.Cast(v124, nil, nil) then
					if ((v124:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\174\254\192\219\63\220", "\30\222\146\161\162\90\174\210"), 912 - (503 + 396))) and v50.Commons.Enabled.TopTrinket) then
						v69 = 205 - (92 + 89);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\194\75\126\15\247\71\115\74\240\93\117\53\236\90\117\7\246\14\118\5\247\14", "\106\133\46\16") .. v124:Name();
					elseif ((v124:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\72\44\114\229\95\82", "\32\56\64\19\156\58"), 26 - 12)) and v50.Commons.Enabled.BottomTrinket) then
						v69 = 13 + 12;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\125\205\235\83\72\251\131\26\221\246\83\101\251\148\95\197\246\22\92\253\146\26", "\224\58\168\133\54\58\146") .. v124:Name();
					end
				end
			end
		end
	end
end
local function v87()
	if (v51.BladeFlurry:IsReady() and v51.BladeFlurry:IsCastable() and v12() and v51.Subterfuge:IsAvailable() and v51.HiddenOpportunity:IsAvailable() and (v56 >= (2 + 0)) and (v6:BuffRemains(v51.BladeFlurry) <= v6:GCD()) and (v51.AdrenalineRush:IsReady() or v6:BuffUp(v51.AdrenalineRush))) then
		if v50.Outlaw.GCDasOffGCD.BladeFlurry then
			if v11.Cast(v51.BladeFlurry) then
				v69 = 54344 - 40467;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\122\87\88\233\53\164\139\10\93\83\11\219\121\147\149\25\64", "\107\57\54\43\157\21\230\231");
			end
		elseif v11.Cast(v51.BladeFlurry) then
			v69 = 1898 + 11979;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\248\138\2\225\249\254\195\218\143\20\181\159\208\218\201\153\8", "\175\187\235\113\149\217\188");
		end
	end
	if (v51.ColdBlood:IsCastable() and v6:BuffDown(v51.ColdBlood) and v7:IsSpellInRange(v51.Dispatch) and v80()) then
		if v11.Cast(v51.ColdBlood, nil) then
			v69 = 871568 - 489323;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\31\174\146\88\163\90\119\48\171\193\110\239\118\119\56", "\24\92\207\225\44\131\25");
		end
	end
	if (v51.BetweentheEyes:IsCastable() and v7:IsSpellInRange(v51.BetweentheEyes) and v80() and v51.Crackshot:IsAvailable() and (not v6:BuffUp(v51.Shadowmeld) or v6:StealthUp(true, false))) then
		if v11.CastPooling(v51.BetweentheEyes) then
			v69 = 275133 + 40208;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\104\210\171\88\91\95\78\199\175\73\30\115\11\199\176\73\91\88\82\214\171", "\29\43\179\216\44\123");
		end
	end
	if (v51.Dispatch:IsCastable() and v7:IsSpellInRange(v51.Dispatch) and v80()) then
		if v11.CastPooling(v51.Dispatch) then
			v69 = 1003 + 1095;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\158\216\51\88\253\253\41\95\173\216\52\79\181", "\44\221\185\64");
		end
	end
	if (v51.PistolShot:IsCastable() and v7:IsSpellInRange(v51.PistolShot) and v51.Crackshot:IsAvailable() and (v51.FanTheHammer:TalentRank() >= (5 - 3)) and (v6:BuffStack(v51.Opportunity) >= (1 + 5)) and ((v6:BuffUp(v51.Broadside) and (v61 <= (1 - 0))) or v6:BuffUp(v51.GreenskinsWickersBuff))) then
		if v11.CastPooling(v51.PistolShot) then
			v69 = 187007 - (485 + 759);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\34\230\91\75\51\49\238\91\75\124\13\167\123\87\124\21", "\19\97\135\40\63");
		end
	end
	if (v51.Ambush:IsCastable() and v7:IsSpellInRange(v51.Ambush) and v51.HiddenOpportunity:IsAvailable()) then
		if v11.CastPooling(v51.Ambush) then
			v69 = 20075 - 11399;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\141\93\32\47\111\16\163\94\38\40\39", "\81\206\60\83\91\79");
		end
	end
end
local function v88()
	if (v51.BetweentheEyes:IsCastable() and v7:IsSpellInRange(v51.BetweentheEyes) and not v51.Crackshot:IsAvailable() and ((v6:BuffRemains(v51.BetweentheEyes) < (1193 - (442 + 747))) or v51.ImprovedBetweenTheEyes:IsAvailable() or v51.GreenskinsWickers:IsAvailable() or v6:HasTier(1165 - (832 + 303), 950 - (88 + 858))) and v6:BuffDown(v51.GreenskinsWickers)) then
		if v11.CastPooling(v51.BetweentheEyes) then
			v69 = 96110 + 219231;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\109\170\195\102\111\225\72\176\89\174\213\124\111\215\69\161\14\142\201\119\60", "\196\46\203\176\18\79\163\45");
		end
	end
	if (v51.BetweentheEyes:IsCastable() and v7:IsSpellInRange(v51.BetweentheEyes) and v51.Crackshot:IsAvailable() and (v51.Vanish:CooldownRemains() > (38 + 7)) and (v51.ShadowDance:CooldownRemains() > (1 + 14))) then
		if v11.CastPooling(v51.BetweentheEyes) then
			v69 = 316130 - (766 + 23);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\155\35\109\10\100\217\234\172\53\123\27\42\187\251\176\39\62\59\61\254\252", "\143\216\66\30\126\68\155");
		end
	end
	if (v51.SliceandDice:IsCastable() and (v3.FilteredFightRemains(v55, ">", v6:BuffRemains(v51.SliceandDice), true) or (v6:BuffRemains(v51.SliceandDice) == (0 - 0))) and (v6:BuffRemains(v51.SliceandDice) < (((1 - 0) + v61) * (2.8 - 1)))) then
		if v11.CastPooling(v51.SliceandDice) then
			v69 = 1070804 - 755308;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\137\201\30\223\133\144\219\232\169\205\77\202\203\167\151\197\163\203\8", "\129\202\168\109\171\165\195\183");
		end
	end
	if (v51.KillingSpree:IsCastable() and v7:IsSpellInRange(v51.KillingSpree) and (v7:DebuffUp(v51.GhostlyStrike) or not v51.GhostlyStrike:IsAvailable())) then
		if v11.Cast(v51.KillingSpree) then
			v69 = 52763 - (1036 + 37);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\1\89\36\204\158\63\239\46\84\62\214\217\84\213\50\74\50\221", "\134\66\56\87\184\190\116");
		end
	end
	if (v51.ColdBlood:IsCastable() and v6:BuffDown(v51.ColdBlood) and v7:IsSpellInRange(v51.Dispatch)) then
		if v11.Cast(v51.ColdBlood, nil) then
			v69 = 271003 + 111242;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\31\48\26\175\89\200\46\57\56\113\43\183\22\228\37", "\85\92\81\105\219\121\139\65");
		end
	end
	if (v51.Dispatch:IsCastable() and v7:IsSpellInRange(v51.Dispatch)) then
		if v11.CastPooling(v51.Dispatch) then
			v69 = 4085 - 1987;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\222\178\67\81\60\251\244\160\64\68\104\220\245", "\191\157\211\48\37\28");
		end
	end
end
local function v89()
	if (v13() and v51.EchoingReprimand:IsReady()) then
		if v11.Cast(v51.EchoingReprimand, nil, nil) then
			v69 = 254513 + 69034;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\252\30\231\8\122\250\28\252\19\51\209\24\180\46\63\207\13\253\17\59\209\27", "\90\191\127\148\124");
		end
	end
	if (v51.Ambush:IsCastable() and v51.HiddenOpportunity:IsAvailable() and v6:BuffUp(v51.AudacityBuff)) then
		if v11.CastPooling(v51.SSAudacity, nil, not v7:IsSpellInRange(v51.Ambush)) then
			v69 = 10156 - (641 + 839);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\91\134\61\3\56\166\35\21\109\148\38\87\48\175\39\16\112\202\30\5\113\136\110\53\109\129\40\18\124\206", "\119\24\231\78");
		end
	end
	if (v51.FanTheHammer:IsAvailable() and v51.Audacity:IsAvailable() and v51.HiddenOpportunity:IsAvailable() and v6:BuffUp(v51.Opportunity) and v6:BuffDown(v51.AudacityBuff)) then
		if v11.CastPooling(v51.PistolShot, nil, not v7:IsSpellInRange(v51.PistolShot)) then
			v69 = 186676 - (910 + 3);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\161\44\182\94\156\112\24\145\57\170\70\156\115\25\141\57\229\2\253\85\21\131\46\172\94\197\9", "\113\226\77\197\42\188\32");
		end
	end
	if (v51.FanTheHammer:IsAvailable() and v6:BuffUp(v51.Opportunity) and ((v6:BuffStack(v51.Opportunity) >= (15 - 9)) or (v6:BuffRemains(v51.Opportunity) < (1686 - (1466 + 218))))) then
		if v11.CastPooling(v51.PistolShot, nil, not v7:IsSpellInRange(v51.PistolShot)) then
			v69 = 85375 + 100388;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\25\23\231\161\122\38\253\166\46\25\248\245\9\30\251\161\122\94\210\161\18\86\208\160\55\6\189", "\213\90\118\148");
		end
	end
	if (v51.FanTheHammer:IsAvailable() and v6:BuffUp(v51.Opportunity) and ((v62 >= ((1149 - (556 + 592)) + ((v71(v51.QuickDraw:IsAvailable()) + v71(v6:BuffUp(v51.Broadside))) * (v51.FanTheHammer:TalentRank() + 1 + 0)))) or (v61 <= v71(v51.Ruthlessness:IsAvailable())))) then
		if v11.CastPooling(v51.PistolShot, nil, not v7:IsSpellInRange(v51.PistolShot)) then
			v69 = 186571 - (329 + 479);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\120\47\167\66\13\107\39\167\66\66\87\110\135\94\66\79", "\45\59\78\212\54");
		end
	end
	if (not v51.FanTheHammer:IsAvailable() and v6:BuffUp(v51.Opportunity) and ((v66 > (855.5 - (174 + 680))) or (v62 <= ((3 - 2) + v71(v6:BuffUp(v51.Broadside)))) or v51.QuickDraw:IsAvailable() or (v51.Audacity:IsAvailable() and v6:BuffDown(v51.AudacityBuff)))) then
		if v11.CastPooling(v51.PistolShot, nil, not v7:IsSpellInRange(v51.PistolShot)) then
			v69 = 385036 - 199273;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\51\87\144\159\198\30\164\227\4\89\143\203\181\38\162\228", "\144\112\54\227\235\230\78\205");
		end
	end
	if (v51.SinisterStrike:IsCastable() and v7:IsSpellInRange(v51.SinisterStrike)) then
		if v11.CastPooling(v51.SinisterStrike, nil, not v7:IsSpellInRange(v51.SinisterStrike)) then
			v69 = 138021 + 55294;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\144\41\28\232\144\104\186\38\6\239\196\94\161\104\60\232\194\82\184\45", "\59\211\72\111\156\176");
		end
	end
end
local function v90()
	v15 = HeroRotationCharDB.Toggles[744 - (396 + 343)];
	v14 = HeroRotationCharDB.Toggles[1 + 3];
	v16 = HeroRotationCharDB.Toggles[1489 - (29 + 1448)];
	v17 = not HeroRotationCharDB.Toggles[1404 - (135 + 1254)];
	v18 = HeroRotationCharDB.Toggles[78 - 57];
	v20 = HeroRotationCharDB.Toggles[102 - 80];
	v21 = HeroRotationCharDB.Toggles[16 + 7];
	v22 = HeroRotationCharDB.Toggles[1551 - (389 + 1138)];
	v23 = HeroRotationCharDB.Toggles[599 - (102 + 472)];
	v24 = HeroRotationCharDB.Toggles[26 + 1];
	v25 = HeroRotationCharDB.Toggles[28 + 22];
	v26 = HeroRotationCharDB.Toggles[48 + 3];
	v19 = HeroRotationCharDB.Toggles[1597 - (320 + 1225)];
	v27 = HeroRotationCharDB.Toggles[94 - 41];
	v28 = HeroRotationCharDB.Toggles[19 + 11];
	v29 = HeroRotationCharDB.Toggles[1518 - (157 + 1307)];
	v30 = HeroRotationCharDB.Toggles[2049 - (821 + 1038)];
	v36 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\94\139\226\52\75\149", "\77\46\231\131"), 32 - 19);
	v37 = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\170\88\183\89\191\70", "\32\218\52\214"), 2 + 12);
	if (not v50.Commons.Enabled.TopTrinket and not v50.Commons.Enabled.BottomTrinket) then
		v53 = {v36,v37};
	elseif (not v50.Commons.Enabled.TopTrinket and v50.Commons.Enabled.BottomTrinket) then
		v53 = {v36};
	elseif (not v50.Commons.Enabled.BottomTrinket and v50.Commons.Enabled.TopTrinket) then
		v53 = {v37};
	end
	v44 = false;
	v45 = false;
	v46 = false;
	v47 = false;
	if (((v50.Outlaw.AdrenalineRushCD == LUAOBFUSACTOR_DECRYPT_STR_0("\109\51\34", "\58\46\119\81\200\145\208\37")) and v13()) or ((v50.Outlaw.AdrenalineRushCD == LUAOBFUSACTOR_DECRYPT_STR_0("\24\129\49\160\165\253\21\15\159", "\86\75\236\80\204\201\221")) and v14) or (v50.Outlaw.AdrenalineRushCD == LUAOBFUSACTOR_DECRYPT_STR_0("\83\77\96\132\231\152", "\235\18\33\23\229\158"))) then
		v44 = true;
	end
	if (((v50.Outlaw.VanishCD == LUAOBFUSACTOR_DECRYPT_STR_0("\115\158\210", "\219\48\218\161")) and v13()) or ((v50.Outlaw.VanishCD == LUAOBFUSACTOR_DECRYPT_STR_0("\215\124\125\69\215\15\195\192\98", "\128\132\17\28\41\187\47")) and v14) or (v50.Outlaw.VanishCD == LUAOBFUSACTOR_DECRYPT_STR_0("\32\62\17\59\68\18", "\61\97\82\102\90"))) then
		v45 = true;
	end
	if (((v50.Outlaw.GhostlyStrikeCD == LUAOBFUSACTOR_DECRYPT_STR_0("\143\10\184", "\105\204\78\203\43\167\55\126")) and v13()) or ((v50.Outlaw.GhostlyStrikeCD == LUAOBFUSACTOR_DECRYPT_STR_0("\150\167\34\18\31\68\228\117\182", "\49\197\202\67\126\115\100\167")) and v14) or (v50.Outlaw.GhostlyStrikeCD == LUAOBFUSACTOR_DECRYPT_STR_0("\22\87\200\40\153\69", "\62\87\59\191\73\224\54"))) then
		v46 = true;
	end
	if (((v50.Outlaw.ShadowDanceCD == LUAOBFUSACTOR_DECRYPT_STR_0("\196\38\233", "\169\135\98\154")) and v13()) or ((v50.Outlaw.ShadowDanceCD == LUAOBFUSACTOR_DECRYPT_STR_0("\248\122\37\88\241\115\235\239\100", "\168\171\23\68\52\157\83")) and v14) or (v50.Outlaw.ShadowDanceCD == LUAOBFUSACTOR_DECRYPT_STR_0("\213\125\226\172\60\62", "\231\148\17\149\205\69\77"))) then
		v47 = true;
	end
	v32 = 0 + 0;
	for v116 = 1 + 0, 1 + 19 do
		if (select(15 - 5, UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\144\171\198\226\82\237", "\159\224\199\167\155\55"), v116)) == (240751 - (300 + 4))) then
			if (select(2 + 4, UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\231\255\61\203\242\225", "\178\151\147\92"), v116)) ~= nil) then
				v32 = select(15 - 9, UnitDebuff(LUAOBFUSACTOR_DECRYPT_STR_0("\156\241\77\43\23\94", "\26\236\157\44\82\114\44"), v116)) - (GetTime());
			end
		end
	end
end
v55 = v6:GetEnemiesInRange(v58, v51.SinisterStrike);
local function v91()
	local v113 = {{v51.Blind,function()
		return true;
	end,(1083 + 1011)},{v51.KidneyShot,function()
		return v61 > (1414 - (1001 + 413));
	end,(1290 - (244 + 638))}};
	local v114 = v11.Common.Everyone;
	local v115 = v114.WhiteList();
	v58 = (v51.AcrobaticStrikes:IsAvailable() and (702 - (627 + 66))) or (17 - 11);
	v61 = v6:ComboPoints();
	v60 = v49.EffectiveComboPoints(v61);
	v62 = v6:ComboPointsDeficit();
	v67 = (v6:BuffUp(v51.AdrenalineRush, nil, true) and -(652 - (512 + 90))) or (1906 - (1665 + 241));
	v63 = v76();
	v64 = v6:EnergyRegen();
	v66 = v75(v67);
	v65 = v6:EnergyDeficitPredicted(nil, v67);
	if v12() then
		v54 = v6:GetEnemiesInRange(747 - (373 + 344));
		v55 = v6:GetEnemiesInRange(v58);
		v56 = #v55;
	else
		v56 = 1 + 0;
	end
	v57 = v90();
	if v11.QueuedCast() then
		v69 = v11.QueuedCast();
		return LUAOBFUSACTOR_DECRYPT_STR_0("\9\59\198\79\37\35\149\106\63\43\192\94\106", "\59\74\78\181") .. v8(v69):ID();
	end
	if v57 then
		return v57;
	end
	if (v70 > (0 + 0)) then
		v70 = 0 - 0;
	end
	if (v69 > (0 - 0)) then
		v69 = 1099 - (35 + 1064);
	end
	v69 = v49.ReturnSpell();
	v70 = v49.ReturnSpellMO();
	if ((v11.GUISettings.General.OpenerReset > (0 + 0)) and not HeroRotationCharDB.Toggles[10 - 5]) then
		v42 = GetTime();
		v43 = v42 + v11.GUISettings.General.OpenerReset;
	elseif ((v11.GUISettings.General.OpenerReset > (0 + 0)) and (v43 ~= nil) and (GetTime() > v43) and HeroRotationCharDB.Toggles[1241 - (298 + 938)]) then
		HeroRotationCharDB.Toggles[1264 - (233 + 1026)] = not HeroRotationCharDB.Toggles[1671 - (636 + 1030)];
		v11.ToggleIconFrame:UpdateButtonText(3 + 2);
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\10\193\95\84\182\55\145\83\73\243\43\222\77\26", "\211\69\177\58\58") .. ((HeroRotationCharDB.Toggles[5 + 0] and LUAOBFUSACTOR_DECRYPT_STR_0("\171\230\127\243\185\155\177\227\41\165\236\197\182\231\117\240\237\215\165\171", "\171\215\133\25\149\137")) or LUAOBFUSACTOR_DECRYPT_STR_0("\253\203\52\252\233\54\172\18\177\152\54\243\252\49\254\78\228\204\46\232\161", "\34\129\168\82\154\143\80\156")));
	end
	if (v27 and v51.GrapplingHook:IsUsableP() and (v51.GrapplingHook:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v11.Cast(v51.GrapplingHook, nil, nil, nil) then
			v69 = 13207 + 182250;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\148\167\54\30\77\14\174\151\179\35\27\68\71\135\130\242\27\4\71\69", "\233\229\210\83\107\40\46");
		end
	elseif ((not v51.GrapplingHook:IsUsableP() or (v51.GrapplingHook:CooldownRemains() > (221 - (55 + 166)))) and v27) then
		HeroRotationCharDB.Toggles[11 + 42] = not HeroRotationCharDB.Toggles[6 + 47];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\230\77\39\209\0\129\115\39\211\16\196\2\59\197\69\207\77\37\150", "\101\161\34\82\182") .. ((HeroRotationCharDB.Toggles[202 - 149] and LUAOBFUSACTOR_DECRYPT_STR_0("\244\14\95\248\139\178\132\40\184\93\86\240\199\240\204", "\78\136\109\57\158\187\130\226")) or LUAOBFUSACTOR_DECRYPT_STR_0("\34\60\255\247\56\57\169\161\110\111\246\247\56\35\235\191", "\145\94\95\153")));
	end
	if (v20 and v51.CheapShot:IsUsableP() and (v51.CheapShot:CooldownRemains(BypassRecovery) <= (297 - (36 + 261))) and (v6:StealthUp(true, true) or v6:BuffUp(v51.VanishBuff)) and (v7:IsInRange(13 - 5) or v5(LUAOBFUSACTOR_DECRYPT_STR_0("\240\194\1\198\75\184\235\200\6", "\215\157\173\116\181\46")):IsInRange(1376 - (34 + 1334)))) then
		if v11.Cast(v51.CheapShot, nil, nil, nil) then
			if ((v5(LUAOBFUSACTOR_DECRYPT_STR_0("\56\187\158\225\223\58\162\142\224", "\186\85\212\235\146")):GUID() ~= nil) and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\207\142\3\237\60\225\78\199\147", "\56\162\225\118\158\89\142")):IsSpellInRange(v51.CheapShot)) then
				v70 = 7049 + 11286;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\77\16\197\186\39\152\127\13\197\174\50\152\111\13\207\187\98\245\115", "\184\60\101\160\207\66");
			else
				v69 = 1425 + 408;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\32\151\121\169\52\194\95\180\52\131\108\252\2\138\115\168", "\220\81\226\28");
			end
		end
	elseif ((not v51.CheapShot:IsUsableP() or (v51.CheapShot:CooldownRemains() > (1283 - (1035 + 248)))) and v20) then
		HeroRotationCharDB.Toggles[43 - (20 + 1)] = not HeroRotationCharDB.Toggles[12 + 10];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\48\221\135\250\250\135\32\221\141\239\170\246\6\208\151\254\170\206\0\149\140\244\253\135", "\167\115\181\226\155\138") .. ((HeroRotationCharDB.Toggles[341 - (134 + 185)] and LUAOBFUSACTOR_DECRYPT_STR_0("\254\33\225\90\43\33\192\228\114\183\83\117\109\212\172", "\166\130\66\135\60\27\17")) or LUAOBFUSACTOR_DECRYPT_STR_0("\88\73\200\115\54\66\26\158\37\96\75\76\200\105\34\10", "\80\36\42\174\21")));
	end
	if (v21 and v51.KidneyShot:IsUsableP() and (v51.KidneyShot:CooldownRemains(BypassRecovery) <= (1133 - (549 + 584))) and (v7:IsInRange(693 - (314 + 371)) or v5(LUAOBFUSACTOR_DECRYPT_STR_0("\67\31\34\105\75\31\33\127\92", "\26\46\112\87")):IsInRange(27 - 19))) then
		if v11.Cast(v51.KidneyShot, nil, nil, nil) then
			if ((v5(LUAOBFUSACTOR_DECRYPT_STR_0("\180\44\190\103\186\176\83\177\171", "\212\217\67\203\20\223\223\37")):GUID() ~= nil) and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\183\130\189\193\191\130\190\215\168", "\178\218\237\200")):IsSpellInRange(v51.KidneyShot)) then
				v70 = 5053 - (478 + 490);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\167\160\227\197\179\245\205\217\178\187\227\201\246\134\238\223\162\245\203\255", "\176\214\213\134");
			else
				v69 = 217 + 191;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\229\184\179\193\173\22\114\253\169\184\209\177\22\106\252\162\162", "\57\148\205\214\180\200\54");
			end
		end
	elseif ((not v51.KidneyShot:IsUsableP() or (v51.KidneyShot:CooldownRemains() > (1172 - (786 + 386)))) and v21) then
		HeroRotationCharDB.Toggles[74 - 51] = not HeroRotationCharDB.Toggles[1402 - (1055 + 324)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\57\244\49\58\115\11\189\6\60\121\6\189\4\33\115\7\248\117\61\101\82\243\58\35\54", "\22\114\157\85\84") .. ((HeroRotationCharDB.Toggles[1363 - (1093 + 247)] and LUAOBFUSACTOR_DECRYPT_STR_0("\216\200\21\194\13\166\174\194\155\67\203\83\234\186\138", "\200\164\171\115\164\61\150")) or LUAOBFUSACTOR_DECRYPT_STR_0("\162\247\5\67\133\184\164\83\21\211\177\242\5\89\145\240", "\227\222\148\99\37")));
	end
	if (v22 and v51.Blind:IsUsableP() and (v51.Blind:CooldownRemains(BypassRecovery) <= (0 + 0)) and (v7:IsInRange(2 + 13) or v5(LUAOBFUSACTOR_DECRYPT_STR_0("\62\93\71\229\252\60\68\87\228", "\153\83\50\50\150")):IsInRange(59 - 44))) then
		if v11.Cast(v51.Blind, nil, nil, nil) then
			if ((v5(LUAOBFUSACTOR_DECRYPT_STR_0("\80\121\102\15\118\164\91\88\100", "\45\61\22\19\124\19\203")):GUID() ~= nil) and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\204\29\24\230\7\127\175\196\0", "\217\161\114\109\149\98\16")):IsSpellInRange(v51.Blind)) then
				v70 = 71082 - 50137;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\3\53\61\105\185\52\48\44\49\114\184\52\63\15", "\20\114\64\88\28\220");
			end
		end
	elseif ((not v51.Blind:IsUsableP() or (v51.Blind:CooldownRemains() > (0 - 0))) and v22) then
		HeroRotationCharDB.Toggles[60 - 36] = not HeroRotationCharDB.Toggles[9 + 15];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\19\13\219\186\252\144\140\36\4\199\177\184\217\174\113\15\221\163\184", "\221\81\97\178\212\152\176") .. ((HeroRotationCharDB.Toggles[92 - 68] and LUAOBFUSACTOR_DECRYPT_STR_0("\209\228\27\253\74\157\225\27\171\74\194\233\1\233\84", "\122\173\135\125\155")) or LUAOBFUSACTOR_DECRYPT_STR_0("\152\194\6\191\57\55\152\212\145\80\182\57\55\212\150\143", "\168\228\161\96\217\95\81")));
	end
	if (v23 and v51.Sap:IsUsableP() and (v51.Sap:CooldownRemains(BypassRecovery) <= (0 - 0)) and v6:StealthUp(true, true) and (v7:IsInRange(8 + 2) or v5(LUAOBFUSACTOR_DECRYPT_STR_0("\214\222\59\79\42\88\205\212\60", "\55\187\177\78\60\79")):IsInRange(25 - 15))) then
		if v11.Cast(v51.Sap, nil, nil, nil) then
			if ((v5(LUAOBFUSACTOR_DECRYPT_STR_0("\32\193\74\248\67\192\150\40\220", "\224\77\174\63\139\38\175")):GUID() ~= nil) and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\137\78\77\61\129\78\78\43\150", "\78\228\33\56")):IsSpellInRange(v51.Sap)) then
				v70 = 68393 - (364 + 324);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\223\107\183\22\128\142\77\179\19\197\227\81", "\229\174\30\210\99");
			else
				v69 = 18558 - 11788;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\10\248\131\68\232\125\10\26\253", "\89\123\141\230\49\141\93");
			end
		end
	elseif ((not v51.Sap:IsUsableP() or (v51.Sap:CooldownRemains() > (0 - 0)) or not v6:StealthUp(true, true)) and v23) then
		HeroRotationCharDB.Toggles[9 + 16] = not HeroRotationCharDB.Toggles[104 - 79];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\192\112\230\76\33\95\246\100\243\76\25\89\179\127\249\27\80", "\42\147\17\150\108\112") .. ((HeroRotationCharDB.Toggles[40 - 15] and LUAOBFUSACTOR_DECRYPT_STR_0("\19\165\43\121\183\184\9\160\125\47\232\230\19\180\99", "\136\111\198\77\31\135")) or LUAOBFUSACTOR_DECRYPT_STR_0("\30\10\161\80\187\226\71\249\82\89\168\80\187\248\5\231", "\201\98\105\199\54\221\132\119")));
	end
	if (v24 and v51.Feint:IsUsableP() and (v51.Feint:CooldownRemains(BypassRecovery) <= (0 - 0)) and v6:AffectingCombat() and not v6:PrevGCD(1269 - (1249 + 19), v51.Feint)) then
		if v11.Cast(v51.Feint, nil, nil, nil) then
			v69 = 183 + 19;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\25\134\52\7\117\138\188\5\141\53", "\204\217\108\227\65\98\85");
		end
	elseif ((not v51.Feint:IsUsableP() or (v51.Feint:CooldownRemains() > (0 - 0)) or not v6:AffectingCombat()) and v24) then
		HeroRotationCharDB.Toggles[1113 - (686 + 400)] = not HeroRotationCharDB.Toggles[22 + 5];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\120\198\252\235\56\128\111\214\240\240\41\128\87\208\181\235\35\215\30", "\160\62\163\149\133\76") .. ((HeroRotationCharDB.Toggles[256 - (73 + 156)] and LUAOBFUSACTOR_DECRYPT_STR_0("\202\163\11\41\147\134\166\11\127\147\217\174\17\61\141", "\163\182\192\109\79")) or LUAOBFUSACTOR_DECRYPT_STR_0("\40\37\6\198\243\50\118\80\144\165\59\32\6\220\231\122", "\149\84\70\96\160")));
	end
	if (v26 and v51.BladeRush:IsUsableP() and (v51.BladeRush:CooldownRemains(BypassRecovery) <= (0 + 0)) and v6:AffectingCombat()) then
		if v11.Cast(v51.BladeRush, nil, nil, not v7:IsSpellInRange(v51.BladeRush)) then
			v69 = 272688 - (721 + 90);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\41\19\8\248\61\70\47\225\57\2\8\223\45\21\5", "\141\88\102\109");
		end
	elseif ((not v51.BladeRush:IsUsableP() or (v51.BladeRush:CooldownRemains() > (0 + 0)) or not v6:AffectingCombat()) and v26) then
		HeroRotationCharDB.Toggles[165 - 114] = not HeroRotationCharDB.Toggles[521 - (224 + 246)];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\145\95\203\116\31\15\64\210\187\19\219\101\31\125\92\210\243\93\197\103\90", "\161\211\51\170\16\122\93\53") .. ((HeroRotationCharDB.Toggles[82 - 31] and LUAOBFUSACTOR_DECRYPT_STR_0("\231\173\180\46\171\254\180\46\171\254\189\38\231\188\252", "\72\155\206\210")) or LUAOBFUSACTOR_DECRYPT_STR_0("\90\121\82\8\53\64\42\4\94\99\73\124\82\18\33\8", "\83\38\26\52\110")));
	end
	if (v25 and v51.Gouge:IsUsableP() and (v51.Gouge:CooldownRemains(BypassRecovery) <= (0 - 0))) then
		if v11.Cast(v51.Gouge, nil, nil, nil) then
			if ((v5(LUAOBFUSACTOR_DECRYPT_STR_0("\85\24\50\85\93\24\49\67\74", "\38\56\119\71")):GUID() ~= nil) and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\254\224\77\197\32\89\229\234\74", "\54\147\143\56\182\69")):IsSpellInRange(v51.Gouge)) then
				v70 = 3223 + 14542;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\199\148\250\92\218\150\166\240\92\216\211\193\210\102", "\191\182\225\159\41");
			elseif v5(LUAOBFUSACTOR_DECRYPT_STR_0("\63\19\58\82\142\147", "\162\75\114\72\53\235\231")):IsSpellInRange(v51.Gouge) then
				v69 = 43 + 1733;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\157\41\65\247\86\66\171\51\81\229\86", "\98\236\92\36\130\51");
			end
		end
	elseif ((not v51.Gouge:IsUsableP() or (v51.Gouge:CooldownRemains() > (0 + 0)) or not v6:AffectingCombat()) and v25) then
		HeroRotationCharDB.Toggles[99 - 49] = not HeroRotationCharDB.Toggles[166 - 116];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\131\22\25\189\64\232\132\37\161\12\9\250\76\187\245\62\171\14\76", "\80\196\121\108\218\37\200\213") .. ((HeroRotationCharDB.Toggles[563 - (203 + 310)] and LUAOBFUSACTOR_DECRYPT_STR_0("\28\112\4\121\27\94\140\6\35\82\112\69\18\152\78", "\234\96\19\98\31\43\110")) or LUAOBFUSACTOR_DECRYPT_STR_0("\26\28\84\193\170\116\219\86\79\2\200\170\116\151\20\81", "\235\102\127\50\167\204\18")));
	end
	if (v30 and v51.BladeFlurry:IsUsableP() and (v51.BladeFlurry:CooldownRemains(BypassRecovery) <= (1993 - (1238 + 755))) and v6:AffectingCombat()) then
		if v11.Cast(v51.BladeFlurry, nil, nil, nil) then
			v69 = 970 + 12907;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\65\180\240\54\65\110\114\173\244\39\65\8\92\180\231\49\93", "\78\48\193\149\67\36");
		end
	elseif ((not v51.BladeFlurry:IsUsableP() or (v51.BladeFlurry:CooldownRemains() > (1534 - (709 + 825))) or not v6:AffectingCombat()) and v30) then
		HeroRotationCharDB.Toggles[350 - 160] = not HeroRotationCharDB.Toggles[276 - 86];
		v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\18\18\129\28\68\22\18\149\10\83\41\94\145\13\68\112\23\147\88\79\63\9\192", "\33\80\126\224\120") .. ((HeroRotationCharDB.Toggles[1054 - (196 + 668)] and LUAOBFUSACTOR_DECRYPT_STR_0("\240\171\5\194\12\188\174\5\148\12\227\166\31\214\18", "\60\140\200\99\164")) or LUAOBFUSACTOR_DECRYPT_STR_0("\155\247\2\32\164\129\164\84\118\242\136\242\2\58\176\201", "\194\231\148\100\70")));
	end
	if v28 then
		if (v51.ArcaneTorrent:IsAvailable() and v51.ArcaneTorrent:IsUsableP() and (v51.ArcaneTorrent:CooldownRemains(BypassRecovery) <= (0 - 0)) and v6:AffectingCombat()) then
			if v11.Cast(v51.ArcaneTorrent, nil, nil, nil) then
				v69 = 321371 - 166226;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\87\89\196\182\243\136\103\94\194\162\248\205\114\67\211\177\243\198\82\12\240\182\243\221\67", "\168\38\44\161\195\150");
			end
		elseif (v51.LightsJudgment:IsAvailable() and v51.LightsJudgment:IsUsableP() and (v51.LightsJudgment:CooldownRemains(BypassRecovery) <= (833 - (171 + 662))) and v6:AffectingCombat()) then
			if v11.Cast(v51.LightsJudgment, nil, nil, nil) then
				v69 = 255740 - (4 + 89);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\145\233\135\99\53\168\154\31\135\244\150\101\26\253\178\17\141\249\140\98\112\217\163\19\149\249", "\118\224\156\226\22\80\136\214");
			end
		elseif (v51.BagofTricks:IsAvailable() and v51.BagofTricks:IsUsableP() and (v51.BagofTricks:CooldownRemains(BypassRecovery) <= (0 - 0)) and v6:AffectingCombat()) then
			if v11.Cast(v51.BagofTricks, nil, nil, nil) then
				v69 = 113758 + 198653;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\83\251\92\149\71\174\123\129\69\225\95\180\80\231\90\139\81\174\104\149\71\251\92", "\224\34\142\57");
			end
		elseif (v51.BloodFury:IsAvailable() and v51.BloodFury:IsUsableP() and (v51.BloodFury:CooldownRemains(BypassRecovery) <= (0 - 0)) and v6:AffectingCombat()) then
			if v11.Cast(v51.BloodFury, nil, nil, nil) then
				v69 = 8068 + 12504;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\207\178\192\200\118\177\127\2\209\168\193\251\102\227\68\78\239\178\192\200\118", "\110\190\199\165\189\19\145\61");
			end
		elseif (v51.Berserking:IsAvailable() and v51.Berserking:IsUsableP() and (v51.Berserking:CooldownRemains(BypassRecovery) <= (1486 - (35 + 1451))) and v6:AffectingCombat()) then
			if v11.Cast(v51.Berserking, nil, nil, nil) then
				v69 = 27750 - (28 + 1425);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\203\254\114\253\142\135\248\238\101\251\142\213\209\226\121\239\203\246\207\238\98\237", "\167\186\139\23\136\235");
			end
		elseif (v51.Fireblood:IsAvailable() and v51.Fireblood:IsUsableP() and (v51.Fireblood:CooldownRemains(BypassRecovery) <= (1993 - (941 + 1052))) and v6:AffectingCombat()) then
			if v11.Cast(v51.Fireblood, nil, nil, nil) then
				v69 = 254310 + 10911;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\11\160\141\24\31\245\174\4\8\176\138\1\21\186\140\77\43\160\141\24\31", "\109\122\213\232");
			end
		elseif (v51.AncestralCall:IsAvailable() and v51.AncestralCall:IsUsableP() and (v51.AncestralCall:CooldownRemains(BypassRecovery) <= (1514 - (822 + 692))) and v6:AffectingCombat()) then
			if v11.Cast(v51.AncestralCall, nil, nil, nil) then
				v69 = 392234 - 117496;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\255\226\167\37\235\183\131\62\237\242\177\36\252\246\174\19\239\251\174\112\223\226\167\37\235", "\80\142\151\194");
			end
		elseif (((v51.ArcaneTorrent:IsAvailable() and (not v51.ArcaneTorrent:IsUsableP() or (v51.ArcaneTorrent:CooldownRemains() > (0 + 0)) or not v6:AffectingCombat())) or (v51.LightsJudgment:IsAvailable() and (not v51.LightsJudgment:IsUsableP() or (v51.LightsJudgment:CooldownRemains() > (297 - (45 + 252))) or not v6:AffectingCombat())) or (v51.BagofTricks:IsAvailable() and (not v51.BagofTricks:IsUsableP() or (v51.BagofTricks:CooldownRemains() > (0 + 0)) or not v6:AffectingCombat())) or (v51.BloodFury:IsAvailable() and (not v51.BloodFury:IsUsableP() or (v51.BloodFury:CooldownRemains() > (0 + 0)) or not v6:AffectingCombat())) or (v51.Berserking:IsAvailable() and (not v51.Berserking:IsUsableP() or (v51.Berserking:CooldownRemains() > (0 - 0)) or not v6:AffectingCombat())) or (v51.Fireblood:IsAvailable() and (not v51.Fireblood:IsUsableP() or (v51.Fireblood:CooldownRemains() > (433 - (114 + 319))) or not v6:AffectingCombat())) or (v51.AncestralCall:IsAvailable() and (not v51.AncestralCall:IsUsableP() or (v51.AncestralCall:CooldownRemains() > (0 - 0)) or not v6:AffectingCombat()))) and v28) then
			HeroRotationCharDB.Toggles[38 - 8] = not HeroRotationCharDB.Toggles[20 + 10];
			v11.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\34\212\116\77\13\195\55\120\12\212\101\73\13\210\55\125\22\195\98\73\67\207\100\12\13\201\96\12", "\44\99\166\23") .. ((HeroRotationCharDB.Toggles[44 - 14] and LUAOBFUSACTOR_DECRYPT_STR_0("\96\244\47\48\99\244\122\241\121\102\60\170\96\229\103", "\196\28\151\73\86\83")) or LUAOBFUSACTOR_DECRYPT_STR_0("\239\0\47\22\132\94\72\38\163\83\38\22\132\68\10\56", "\22\147\99\73\112\226\56\120")));
		end
	end
	if v48.HandleIncorporeal(v51.Blind, v31, 31 - 16, false) then
		if v11.Cast(v51.Blind) then
			v70 = 22908 - (556 + 1407);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\186\121\235\251\137\248\88\205", "\237\216\21\130\149");
		end
	end
	local v113 = {{v51.Blind,function()
		return true;
	end,(5155 - 3061)},{v51.KidneyShot,function()
		return v61 > (1230 - (957 + 273));
	end,(164 + 244)}};
	if v6:IsChanneling(v8(1236987 - 912356)) then
		if v11.Cast(v51.PoolEnergy, nil, nil, nil) then
			v69 = 263520 - 163521;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\129\70\94\81\190\204\82\139\64\88\31\150\197\91\131\93\87\92\162\200\88\150", "\62\226\46\63\63\208\169");
		end
	end
	v57 = v49.CrimsonVial();
	if v57 then
		return v57;
	end
	v57 = v49.Feint();
	if v57 then
		return v57;
	end
	v57 = v49.Evasion();
	if v57 then
		return v57;
	end
	if ((v6:HealthPercentage() < v50.Commons.PhialHP) and v52.PhialofSerenity:IsReady() and (v52.PhialofSerenity:CooldownRemains() <= (0 - 0))) then
		if v11.Cast(v52.PhialofSerenity, nil) then
			v69 = 272 - 217;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\213\17\92\130\19\2\41\109\224\11\80\141\22\25\54\30\205\41", "\62\133\121\53\227\127\109\79");
		end
	end
	if ((v6:HealthPercentage() < v50.Commons.HealthstoneHP) and v52.Healthstone:IsReady() and (v52.Healthstone:CooldownRemains() <= (1780 - (389 + 1391)))) then
		if v11.Cast(v52.Healthstone, nil) then
			v69 = 26 + 14;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\17\51\249\194\166\177\4\27\60\240\150\134\146", "\194\112\116\82\149\182\206");
		end
	end
	if ((v6:HealthPercentage() < v50.Commons.HealPotHP) and v52.CosmicHealPot:IsReady() and (v52.CosmicHealPot:CooldownRemains() <= (0 + 0))) then
		if v11.Cast(v52.CosmicHealPot, nil) then
			v69 = 102 - 57;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\26\167\95\21\201\225\38\60\169\64\40\207\246\78\17\152", "\110\89\200\44\120\160\130");
		end
	end
	if ((v6:HealthPercentage() < v50.Commons.HealPotHP) and v52.HealPotL:IsReady() and (v52.HealPotL:CooldownRemains() <= (951 - (783 + 168)))) then
		if v11.Cast(v52.HealPotL, nil) then
			v69 = 137 - 96;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\131\198\74\74\115\69\47\13\135\236\124\6\107\122", "\45\203\163\43\38\35\42\91");
		end
	end
	if ((v6:HealthPercentage() < v50.Commons.HealPotHP) and v52.HealPotM:IsReady() and (v52.HealPotM:CooldownRemains() <= (0 + 0))) then
		if v11.Cast(v52.HealPotM, nil) then
			v69 = 352 - (309 + 2);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\250\128\221\47\183\166\64\146\168\249\7\174\156\121\146\173\236", "\52\178\229\188\67\231\201");
		end
	end
	if ((v6:HealthPercentage() < v50.Commons.HealPotHP) and v52.HealPotH:IsReady() and (v52.HealPotH:CooldownRemains() <= (0 - 0))) then
		if v11.Cast(v52.HealPotH, nil) then
			v69 = 1253 - (1090 + 122);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\9\68\81\8\199\83\55\97\105\121\35\223\28\11\17", "\67\65\33\48\100\151\60");
		end
	end
	if (UnitExists(LUAOBFUSACTOR_DECRYPT_STR_0("\210\232\187\203\246\208\241\171\202", "\147\191\135\206\184")) and string.find(UnitGUID(LUAOBFUSACTOR_DECRYPT_STR_0("\137\39\179\210\221\92\164\129\58", "\210\228\72\198\161\184\51")), 39117 + 81534)) then
		if (v51.PistolShot:IsCastable() and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\59\70\230\3\118\193\32\76\225", "\174\86\41\147\112\19")):IsInMeleeRange(67 - 47)) then
			if v11.Cast(v51.PistolShot, nil) then
				v70 = 811498 + 374265;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\94\24\157\7\42\28\24\189\94\64\160\36\101\63\24\184\79\15\129", "\203\59\96\237\107\69\111\113");
			end
		end
	end
	if (v51.PistolShot:IsCastable() and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\48\23\190\230\52\228", "\183\68\118\204\129\81\144")):IsInMeleeRange(1158 - (628 + 490)) and string.find(UnitGUID(LUAOBFUSACTOR_DECRYPT_STR_0("\26\172\98\227\14\150", "\226\110\205\16\132\107")), 21635 + 99016)) then
		if v11.Cast(v51.PistolShot, nil) then
			v69 = 459934 - 274171;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\238\219\240\213\78\248\202\246\220\1\223\194\242\153\113\226\208\244\214\77", "\33\139\163\128\185");
		end
	end
	if (UnitExists(LUAOBFUSACTOR_DECRYPT_STR_0("\90\87\17\205\82\87\18\219\69", "\190\55\56\100")) and string.find(UnitGUID(LUAOBFUSACTOR_DECRYPT_STR_0("\91\160\41\13\22\236\229\83\189", "\147\54\207\92\126\115\131")), 934840 - 730280)) then
		if (v51.Blind:IsCastable() and v5(LUAOBFUSACTOR_DECRYPT_STR_0("\0\62\32\110\8\113\27\52\39", "\30\109\81\85\29\109")):IsInMeleeRange(794 - (431 + 343))) then
			if v11.Cast(v51.Blind, nil) then
				v70 = 42300 - 21355;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\253\125\93\184\50\158\209\208\49\93\184\53\209\238\239\126\70\179\55\210\188\254\119\82\191\46", "\156\159\17\52\214\86\190");
			end
		end
	end
	if (UnitExists(LUAOBFUSACTOR_DECRYPT_STR_0("\186\238\175\187\171\251", "\220\206\143\221")) and v51.Shiv:IsReady() and not v29) then
		if (UnitCanAttack(LUAOBFUSACTOR_DECRYPT_STR_0("\150\113\44\14\221\222", "\178\230\29\77\119\184\172"), LUAOBFUSACTOR_DECRYPT_STR_0("\225\191\24\28\114\236", "\152\149\222\106\123\23")) and UnitAffectingCombat(LUAOBFUSACTOR_DECRYPT_STR_0("\201\39\228\68\176\201", "\213\189\70\150\35")) and (UnitIsDead(LUAOBFUSACTOR_DECRYPT_STR_0("\91\84\102\15\74\65", "\104\47\53\20")) ~= true)) then
			for v145 = 0 - 0, 8 + 2 do
				local v146, v146, v147, v148, v149, v150, v146, v146, v146, v151 = UnitBuff(LUAOBFUSACTOR_DECRYPT_STR_0("\183\77\147\27\185\27", "\111\195\44\225\124\220"), v145);
				for v153, v154 in pairs(v115) do
					if ((v154 == v151) and (((v150 - v149) + ((64 + 436) / (2695 - (556 + 1139)))) <= GetTime())) then
						if v11.Cast(v51.Shiv, nil) then
							v69 = 5953 - (6 + 9);
							return LUAOBFUSACTOR_DECRYPT_STR_0("\235\78\9\101\235\142\214\84\1\116\174", "\203\184\38\96\19\203");
						end
					end
				end
			end
		end
	end
	if not v6:AffectingCombat() then
		local v125 = (v6:AffectingCombat() and (33 + 147)) or (462 + 438);
		local v126;
		if not v6:AffectingCombat() then
			if (v8(8848 - (28 + 141)):IsAvailable() and (v50.Commons.LethalPoison == LUAOBFUSACTOR_DECRYPT_STR_0("\14\124\108\79\202\121\67\118\72\221\54\125", "\174\89\19\25\33"))) then
				v126 = v6:BuffRemains(v8(3362 + 5317));
				if ((v126 < v125) and not v6:IsCasting(v8(10712 - 2033))) then
					if v11.Cast(v8(6147 + 2532)) then
						v69 = 1520 - (486 + 831);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\24\29\71\64\243\199\59\32\27\65\65\249\199\57\42\20\64\75\228\143", "\107\79\114\50\46\151\231");
					end
				end
			elseif (v8(7345 - 4522):IsAvailable() and (v50.Commons.LethalPoison == LUAOBFUSACTOR_DECRYPT_STR_0("\29\163\180\45\134\32\247\240\54\175\166\38\132", "\160\89\198\213\73\234\89\215"))) then
				v126 = v6:BuffRemains(v8(9938 - 7115));
				if ((v126 < v125) and not v6:IsCasting(v8(534 + 2289))) then
					if v11.Cast(v8(8925 - 6102)) then
						v69 = 1471 - (668 + 595);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\108\116\181\250\201\81\49\132\241\204\91\126\186\190\247\77\119\166\251\214\64", "\165\40\17\212\158");
					end
				end
			elseif (v8(283970 + 31614):IsAvailable() and (v50.Commons.LethalPoison == LUAOBFUSACTOR_DECRYPT_STR_0("\204\215\27\39\39\235\205\72\3\41\236\202\7\61", "\70\133\185\104\83"))) then
				v126 = v6:BuffRemains(v8(63631 + 251953));
				if ((v126 < v125) and not v6:IsCasting(v8(860628 - 545044))) then
					if v11.Cast(v8(315874 - (23 + 267))) then
						v69 = 2149 - (1129 + 815);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\45\75\87\62\200\10\81\4\26\198\13\86\75\36\137\54\64\66\56\204\23\77", "\169\100\37\36\74");
					end
				end
			end
		end
		v126 = v6:BuffRemains(v8(382024 - (371 + 16)));
		if (v8(383387 - (1326 + 424)):IsAvailable() and (v50.Commons.NonLethalPoison == LUAOBFUSACTOR_DECRYPT_STR_0("\33\147\176\95\16\143\171\83\64\183\173\89\19\136\172", "\48\96\231\194"))) then
			if ((v126 < v125) and not v6:IsCasting(v8(722812 - 341175))) then
				if v11.Cast(v8(1394599 - 1012962)) then
					v69 = 381755 - (88 + 30);
					return LUAOBFUSACTOR_DECRYPT_STR_0("\233\84\26\63\22\200\166\128\136\106\1\36\10\215\161\195\250\95\8\63\28\203\167", "\227\168\58\110\77\121\184\207");
				end
			end
		elseif (v8(6532 - (720 + 51)):IsAvailable() and (v50.Commons.NonLethalPoison == LUAOBFUSACTOR_DECRYPT_STR_0("\85\41\178\66\184\213\118\229\75\51\182\83\190\213", "\197\27\92\223\32\209\187\17"))) then
			v126 = v6:BuffRemains(v8(12815 - 7054));
			if ((v126 < v125) and not v6:IsCasting(NumbingPoison)) then
				if v11.Cast(v8(7537 - (421 + 1355))) then
					v69 = 335 - 131;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\45\74\206\249\10\81\196\187\51\80\202\232\12\81\131\201\6\89\209\254\16\87", "\155\99\63\163");
				end
			end
		elseif (v8(1675 + 1733):IsAvailable() and (v50.Commons.NonLethalPoison == LUAOBFUSACTOR_DECRYPT_STR_0("\161\195\168\157\169\136\139\223\166\205\137\139\139\194\174\131", "\228\226\177\193\237\217"))) then
			v126 = v6:BuffRemains(v8(4491 - (286 + 797)));
			if ((v126 < v125) and not v6:IsCasting(NumbingPoison)) then
				if v11.Cast(v8(12458 - 9050)) then
					v69 = 340 - 134;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\23\162\42\246\36\188\42\232\51\240\19\233\61\163\44\232\116\130\38\224\38\181\48\238", "\134\84\208\67");
				end
			end
		end
	end
	if (not v6:BuffUp(v51.VanishBuff) and not v6:AffectingCombat() and not v6:StealthUp(true, true)) then
		v57 = v49.Stealth(v51.Stealth);
		if v57 then
			return v57;
		end
	end
	if (not v6:AffectingCombat() and (v51.Vanish:TimeSinceLastCast() > (440 - (397 + 42)))) then
		if (v51.BladeFlurry:IsReady() and v6:BuffDown(v51.BladeFlurry) and v51.UnderhandedUpperhand:IsAvailable() and not v6:StealthUp(true, true) and (v51.AdrenalineRush:IsReady() or v6:BuffUp(v51.AdrenalineRush))) then
			if v11.Cast(v51.BladeFlurry) then
				v69 = 4335 + 9542;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\49\160\135\88\22\236\160\80\6\190\148\69\83\228\169\76\22\162\131\78\90", "\60\115\204\230");
			end
		end
		if not v6:StealthUp(true, false) then
			v57 = v49.Stealth(v49.StealthSpell());
			if v57 then
				return v57;
			end
		end
		if (v48.TargetIsValid() and not v6:AffectingCombat() and v15) then
			if (v13() and v51.MarkedforDeath:IsCastable() and (v62 >= (v49.CPMaxSpend() - (801 - (24 + 776)))) and (v7:NPCID() ~= (262260 - 92026))) then
				if v50.Commons.STMfDAsDPSCD then
					if v11.Cast(v51.MarkedforDeath, nil) then
						v69 = 138404 - (222 + 563);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\196\59\248\100\167\23\234\98\236\63\239\48\225\53\249\48\195\63\234\100\239\122\163\95\200\25\162", "\16\135\90\139");
					end
				elseif v11.Cast(v51.MarkedforDeath, nil) then
					v69 = 303220 - 165601;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\119\117\21\39\14\121\121\70\127\3\55\14\82\119\70\52\34\54\79\64\112\20\60\41\28\109\29", "\24\52\20\102\83\46\52");
				end
			end
			if (v51.AdrenalineRush:IsReady() and v44 and v51.ImprovedAdrenalineRush:IsAvailable() and (v61 <= (2 + 0)) and not v51.LoadedDiceBuff:IsAvailable() and (v61 <= (192 - (23 + 167)))) then
				if v11.Cast(v51.AdrenalineRush) then
					v69 = 15548 - (690 + 1108);
					return LUAOBFUSACTOR_DECRYPT_STR_0("\231\46\50\48\79\229\43\51\33\1\197\35\40\42\10\132\29\52\55\7\132\103\14\52\10\202\42\51\109", "\111\164\79\65\68");
				end
			end
			if (v51.RolltheBones:IsReady() and not v6:DebuffUp(v51.Dreadblades) and ((v78() == (0 + 0)) or v79())) then
				if v11.Cast(v51.RolltheBones) then
					v69 = 260245 + 55263;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\229\216\144\202\110\216\201\213\143\158\58\226\195\153\161\209\32\239\213\153\203\241\62\239\200\220\145\151", "\138\166\185\227\190\78");
				end
			end
			if (v51.AdrenalineRush:IsReady() and v44 and v51.ImprovedAdrenalineRush:IsAvailable() and (v61 <= (850 - (40 + 808)))) then
				if v11.Cast(v51.AdrenalineRush) then
					v69 = 2264 + 11486;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\232\117\214\35\18\2\29\217\113\203\54\94\42\23\206\52\247\34\65\43\89\131\91\213\50\92\38\11\130", "\121\171\20\165\87\50\67");
				end
			end
			if (v51.SliceandDice:IsReady() and (v6:BuffRemains(v51.SliceandDice) < (((3 - 2) + v61) * (1.8 + 0)))) then
				if v11.CastPooling(v51.SliceandDice) then
					v69 = 166904 + 148592;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\229\57\170\34\249\49\202\49\186\51\249\3\200\60\249\18\176\1\195\120\241\25\169\7\200\61\171\127", "\98\166\88\217\86\217");
				end
			end
			if (v6:StealthUp(true, false) or v6:BuffUp(v51.VanishBuff)) then
				v57 = v87();
				if v57 then
					return LUAOBFUSACTOR_DECRYPT_STR_0("\197\226\124\0\138\200\254\182\49\46\150\217\248\243\107\72\220\156", "\188\150\150\25\97\230") .. v57;
				end
				if (v51.KeepItRolling:IsAvailable() and v51.GhostlyStrike:IsReady() and v51.EchoingReprimand:IsAvailable() and v46) then
					if v11.Cast(v51.GhostlyStrike, nil, nil, not v7:IsSpellInRange(v51.GhostlyStrike)) then
						v69 = 107996 + 88941;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\249\136\76\22\76\202\210\134\76\22\0\244\154\186\75\16\5\230\223\201\116\11\62\173\146\166\79\7\2\232\200\192", "\141\186\233\63\98\108");
					end
				end
				if (v51.Ambush:IsCastable() and v51.HiddenOpportunity:IsAvailable()) then
					if v11.Cast(v51.Ambush, nil, nil, not v7:IsSpellInRange(v51.Ambush)) then
						v69 = 9247 - (47 + 524);
						return LUAOBFUSACTOR_DECRYPT_STR_0("\210\235\63\162\101\208\231\46\163\54\249\170\100\153\53\244\228\41\164\108", "\69\145\138\76\214");
					end
				elseif v51.SinisterStrike:IsCastable() then
					if v11.Cast(v51.SinisterStrike, nil, nil, not v7:IsSpellInRange(v51.SinisterStrike)) then
						v69 = 125453 + 67862;
						return LUAOBFUSACTOR_DECRYPT_STR_0("\83\206\154\157\255\37\121\193\128\154\171\19\98\143\186\157\173\31\123\202\201\193\144\6\117\193\140\155\246", "\118\16\175\233\233\223");
					end
				end
			elseif v80() then
				v57 = v88();
				if v57 then
					return LUAOBFUSACTOR_DECRYPT_STR_0("\173\141\59\178\253\131\61\195\171\37\190\224\142\111\194\222\117", "\29\235\228\85\219\142\235") .. v57;
				end
			end
			if v51.SinisterStrike:IsCastable() then
				if v11.Cast(v51.SinisterStrike) then
					v69 = 528434 - 335119;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\30\213\169\201\55\125\46\92\52\199\174\216\101\14\20\70\47\221\177\216\55\6\8\66\56\218\191\207\62", "\50\93\180\218\189\23\46\71");
				end
			end
		end
		return;
	end
	if (v51.FanTheHammer:IsAvailable() and (v51.PistolShot:TimeSinceLastCast() < v6:GCDRemains())) then
		v61 = v40(v61, v49.FanTheHammerCP());
		v60 = v49.EffectiveComboPoints(v61);
		v62 = v6:ComboPointsDeficit();
	end
	if (v48.TargetIsValid() and (v6:AffectingCombat() or v15 or v6:BuffUp(v51.VanishBuff) or v6:BuffUp(v51.VanishBuff) or v6:BuffUp(v51.VanishBuff2)) and not v7:DebuffUp(v8(10123 - 3353))) then
		local v127, v128, v129 = GetSpellCooldown(132126 - 74192);
		if v50.Commons.AutoToT then
			if ((((v127 + v128) - GetTime()) <= (1726 - (1165 + 561))) and v51.TricksoftheTrade:IsAvailable() and (v51.TricksoftheTrade:CooldownRemains(BypassRecovery) <= (0 + 0)) and UnitExists(LUAOBFUSACTOR_DECRYPT_STR_0("\216\171\88\89\87", "\40\190\196\59\44\36\188")) and not v5(LUAOBFUSACTOR_DECRYPT_STR_0("\58\74\223\161\233", "\109\92\37\188\212\154\29")):IsDeadOrGhost() and (UnitInParty(LUAOBFUSACTOR_DECRYPT_STR_0("\2\224\167\214\34", "\58\100\143\196\163\81")) or UnitInRaid(LUAOBFUSACTOR_DECRYPT_STR_0("\28\77\32\182\44", "\110\122\34\67\195\95\41\133")))) then
				if v11.Cast(v51.TricksoftheTrade) then
					v69 = 640 - 433;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\65\190\111\10\240\122\178\78\89", "\182\21\209\59\42");
				end
			end
		end
		v57 = v86();
		if v57 then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\148\115\214\71\97", "\222\215\55\165\125\65") .. v57;
		end
		if (v6:StealthUp(true, true) or v6:BuffUp(v51.VanishBuff) or v6:BuffUp(v51.Shadowmeld)) then
			v57 = v87();
			if v57 then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\31\197\195\27\254\213\229\16\108", "\42\76\177\166\122\146\161\141") .. v57;
			end
		end
		if v80() then
			v57 = v88();
			if v57 then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\131\131\11\199\106\126\255\202", "\22\197\234\101\174\25") .. v57;
			end
			v11.Cast(v51.PoolEnergy);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\11\61\171\213\101\167\151\182\34\59\169\213\120\168", "\230\77\84\197\188\22\207\183");
		end
		v57 = v89();
		if v57 then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\219\1\207\240\136\251\176", "\85\153\116\166\156\236\193\144") .. v57;
		end
		if (v51.ArcaneTorrent:IsCastable() and v50.Commons.Enabled.Racials and v13() and v7:IsSpellInRange(v51.SinisterStrike) and (v65 > (6 + 9 + v64))) then
			if v11.Cast(v51.ArcaneTorrent, nil) then
				v69 = 155624 - (341 + 138);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\135\225\94\167\164\33\182\227\76\189\225\64\144\239\95\161\225\14\176", "\96\196\128\45\211\132");
			end
		end
		if (v51.ArcanePulse:IsCastable() and v50.Commons.Enabled.Racials and v13() and v7:IsSpellInRange(v51.SinisterStrike)) then
			if v11.Cast(v51.ArcanePulse) then
				v69 = 70284 + 190080;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\22\140\104\75\146\142\166\219\52\131\126\31\226\186\184\203\48", "\184\85\237\27\63\178\207\212");
			end
		end
		if (v51.LightsJudgment:IsCastable() and v50.Commons.Enabled.Racials and v13() and v7:IsInMeleeRange(10 - 5)) then
			if v11.Cast(v51.LightsJudgment, nil) then
				v69 = 255973 - (89 + 237);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\43\88\26\75\72\117\0\88\0\77\26\31\34\76\13\88\5\92\7\75", "\63\104\57\105");
			end
		end
		if (v51.BagofTricks:IsCastable() and v50.Commons.Enabled.Racials and v13() and v7:IsInMeleeRange(16 - 11)) then
			if v11.Cast(v51.BagofTricks, nil) then
				v69 = 657726 - 345315;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\40\134\183\80\75\165\165\67\75\136\162\4\63\149\173\71\0\148", "\36\107\231\196");
			end
		end
		if (v51.PistolShot:IsCastable() and v7:IsSpellInRange(v51.PistolShot) and not v7:IsInRange(v58) and not v6:StealthUp(true, true) and (v65 < (906 - (581 + 300))) and ((v62 >= (1221 - (855 + 365))) or (v66 <= (2.2 - 1)))) then
			if v11.Cast(v51.PistolShot) then
				v69 = 60655 + 125108;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\126\180\177\147\29\133\171\148\73\186\174\199\110\189\173\147\29\253\141\168\111\252", "\231\61\213\194");
			end
		end
		if not v7:IsSpellInRange(v51.Dispatch) then
			if v11.CastAnnotated(v51.PoolEnergy, false, LUAOBFUSACTOR_DECRYPT_STR_0("\38\130\15", "\19\105\205\93")) then
				v69 = 1001234 - (1030 + 205);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\153\7\209\141\127\140\6\219\147\56\176\72\150\174\16\155\65", "\95\201\104\190\225");
			end
		elseif v11.Cast(v51.PoolEnergy) then
			v69 = 938802 + 61197;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\159\196\206\194\239\238\207\203\189\204\216", "\174\207\171\161");
		end
	end
end
local function v92()
	if HeroRotationCharDB.Toggles[5 + 0] then
		HeroRotationCharDB.Toggles[291 - (156 + 130)] = not HeroRotationCharDB.Toggles[11 - 6];
		v11.ToggleIconFrame:UpdateButtonText(8 - 3);
	end
end
function ReturnSpellOut()
	if (v69 == (0 - 0)) then
		return 0 + 0;
	else
		return v69;
	end
end
function ReturnSpellMOOut()
	if (v70 == (0 + 0)) then
		return 69 - (10 + 59);
	else
		return v70;
	end
end
v11.SetAPL(74 + 186, v91, v92);
