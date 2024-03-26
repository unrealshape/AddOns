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
local v8 = v5.Boss;
local v9 = v5.Pet;
local v10 = v3.Spell;
local v11 = v3.Item;
local v12 = HeroRotation;
local v13 = v12.Cast;
local v14 = v12.CDsON;
local v15 = v12.AoEON;
local v16 = HeroRotationCharDB.Toggles[1581 - (280 + 1297)];
local v17 = HeroRotationCharDB.Toggles[770 - (574 + 191)];
local v18 = HeroRotationCharDB.Toggles[9 + 1];
local v19 = HeroRotationCharDB.Toggles[27 - 16];
local v20 = HeroRotationCharDB.Toggles[7 + 5];
local v21 = HeroRotationCharDB.Toggles[862 - (254 + 595)];
local v22 = HeroRotationCharDB.Toggles[140 - (55 + 71)];
local v23 = not HeroRotationCharDB.Toggles[19 - 4];
local v24 = HeroRotationCharDB.Toggles[1806 - (573 + 1217)];
local v25 = HeroRotationCharDB.Toggles[46 - 29];
local v26 = HeroRotationCharDB.Toggles[2 + 16];
local v27 = 0 - 0;
local v28 = 939 - (714 + 225);
local function v29(v109)
	if v109 then
		return 2 - 1;
	else
		return 0 - 0;
	end
end
local function v30(v110)
	return v110 ~= (0 + 0);
end
local v31 = table.insert;
local v32 = GetTime;
local v33 = math.max;
local v34 = HeroRotationCharDB.Toggles[3 - 0];
local v35 = v10.DeathKnight.Unholy;
local v36 = v11.DeathKnight.Unholy;
local v37 = {};
local v38 = v6:GetEquipment();
local v39 = (v38[819 - (118 + 688)] and v11(v38[61 - (25 + 23)])) or v11(0 + 0);
local v40 = (v38[1900 - (927 + 959)] and v11(v38[47 - 33])) or v11(732 - (16 + 716));
local v41;
local v42;
local v43 = v12.Commons.Everyone;
local v44 = {[LUAOBFUSACTOR_DECRYPT_STR_0("\246\198\213\32\244\186\203", "\126\177\163\187\69\134\219\167")]=v12.GUISettings.General,[LUAOBFUSACTOR_DECRYPT_STR_0("\0\194\39\200\243\45\222", "\156\67\173\74\165")]=v12.GUISettings.APL.DeathKnight.Commons,[LUAOBFUSACTOR_DECRYPT_STR_0("\23\184\68\27\179\40\85\102", "\38\84\215\41\118\220\70")]=v12.GUISettings.APL.DeathKnight.Commons2,[LUAOBFUSACTOR_DECRYPT_STR_0("\101\24\42\29\242\73", "\158\48\118\66\114")]=v12.GUISettings.APL.DeathKnight.Unholy};
local v18 = v44.Unholy.DisableAotD;
local v45;
local v46;
local v47;
local v48;
local v49;
local v50;
local v51;
local v52, v53;
local v54, v55;
local v56, v57;
local v58 = ((v35.ClawingShadows:IsAvailable()) and v35.ClawingShadows) or v35.ScourgeStrike;
local v59 = ((v35.Defile:IsAvailable()) and v35.Defile) or v35.DeathAndDecay;
local v60;
local v61 = 21448 - 10337;
local v62 = 11208 - (11 + 86);
local v63 = v3.GhoulTable;
local v64 = false;
local v65 = false;
local v66 = false;
local v67 = false;
local v68 = false;
local v69 = false;
local v70, v71, v72;
local v73, v74;
local v75;
local v76 = {{v35.Asphyxiate,LUAOBFUSACTOR_DECRYPT_STR_0("\136\37\3\34\51\132\232\187\44\9\46\122\164\239\174\100\88\31\125\177\254\185\54\5\38\103\236", "\155\203\68\112\86\19\197"),function()
	return true;
end}};
v3:RegisterForEvent(function()
	v38 = v6:GetEquipment();
	v39 = (v38[1809 - (503 + 1293)] and v11(v38[36 - 23])) or v11(0 + 0);
	v40 = (v38[1075 - (810 + 251)] and v11(v38[10 + 4])) or v11(0 + 0);
end, LUAOBFUSACTOR_DECRYPT_STR_0("\118\241\23\197\101\74\218\221\119\232\31\204\109\93\203\204\121\254\30\221\110\95\192\220", "\152\38\189\86\156\32\24\133"));
v3:RegisterForEvent(function()
	v61 = 10017 + 1094;
	v62 = 11644 - (43 + 490);
end, LUAOBFUSACTOR_DECRYPT_STR_0("\204\123\134\127\217\101\152\116\217\112\130\104\195\114\137\103\222\123\130\98", "\38\156\55\199"));
v3:RegisterForEvent(function()
	v58 = ((v35.ClawingShadows:IsAvailable()) and v35.ClawingShadows) or v35.ScourgeStrike;
	v59 = ((v35.Defile:IsAvailable()) and v35.Defile) or v35.DeathAndDecay;
end, LUAOBFUSACTOR_DECRYPT_STR_0("\155\77\89\4\63\71\197\96\128\92\82\15\54\80", "\35\200\29\28\72\115\20\154"), LUAOBFUSACTOR_DECRYPT_STR_0("\53\154\240\237\163\9\16\38\140\225\250\161\0\11\48\145\238\235\172\14", "\84\121\223\177\191\237\76"));
local function v77()
	if v35.ClawingShadows:IsAvailable() then
		v27 = 208044 - (711 + 22);
	else
		v27 = 213099 - 158009;
	end
end
local function v78()
	return (v6:HealthPercentage() < v44.Commons.UseDeathStrikeHP) or ((v6:HealthPercentage() < v44.Commons.UseDarkSuccorHP) and v6:BuffUp(v35.DeathStrikeBuff));
end
local function v79(v111)
	local v112 = 859 - (240 + 619);
	for v139, v140 in pairs(v111) do
		if v140:DebuffDown(v35.VirulentPlagueDebuff) then
			v112 = v112 + 1 + 0;
		end
	end
	return v112;
end
local function v80(v113)
	local v114 = {};
	for v141 in pairs(v113) do
		if not v5:IsInBossList(v113[v141]['UnitNPCID']) then
			v31(v114, v113[v141]);
		end
	end
	return v3.FightRemains(v114);
end
local function v81(v115)
	return (v115:DebuffStack(v35.FesteringWoundDebuff));
end
local function v82(v116)
	return (v116:DebuffRemains(v35.SoulReaper));
end
local function v83(v117)
	return v35.BurstingSores:IsAvailable() and v117:DebuffUp(v35.FesteringWoundDebuff) and ((v6:BuffDown(v35.DeathAndDecayBuff) and v35.DeathAndDecay:CooldownDown() and (v6:Rune() < (4 - 1))) or (v6:BuffUp(v35.DeathAndDecayBuff) and (v6:Rune() == (0 + 0))));
end
local function v84(v118)
	return (not v35.BurstingSores:IsAvailable() and (v118:DebuffStack(v35.FesteringWoundDebuff) >= (1748 - (1344 + 400)))) or (v6:HasTier(436 - (255 + 150), 2 + 0) and (v118:DebuffStack(v35.FesteringWoundDebuff) >= (1 + 0)));
end
local function v85(v119)
	return v119:DebuffStack(v35.FesteringWoundDebuff) >= (16 - 12);
end
local function v86(v120)
	return v120:DebuffStack(v35.FesteringWoundDebuff) < (12 - 8);
end
local function v87(v121)
	if ((v121:DebuffStack(v35.FesteringWoundDebuff) < (1743 - (404 + 1335))) and (v121:GUID() == v5(LUAOBFUSACTOR_DECRYPT_STR_0("\182\89\220\179\63\95\38\196\169", "\161\219\54\169\192\90\48\80")):GUID()) and (v44.Unholy.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\100\77\21\54\76\77\22\32\91", "\69\41\34\96"))) then
		v28 = 186354 - (183 + 223);
		return true;
	elseif ((v121:DebuffStack(v35.FesteringWoundDebuff) < (4 - 0)) and (v44.Unholy.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\157\214\195\5\49\60\189\211", "\75\220\163\183\106\98")) and (v121:GUID() ~= v7:GUID()) and not v20) then
		v28 = 662 + 337;
		return true;
	elseif ((v121:DebuffStack(v35.FesteringWoundDebuff) < (2 + 2)) and (v121:GUID() == v7:GUID())) then
		v27 = 86285 - (10 + 327);
		return true;
	elseif (v121:DebuffStack(v35.FesteringWoundDebuff) < (3 + 1)) then
		return true;
	end
end
local function v88(v122)
	return v122:DebuffStack(v35.FesteringWoundDebuff) >= (342 - (118 + 220));
end
local function v89(v123)
	return ((v123:TimeToX(12 + 23) < (454 - (108 + 341))) or (v123:HealthPercentage() <= (16 + 19))) and (v123:TimeToDie() > (v123:DebuffRemains(v35.SoulReaper) + (21 - 16)));
end
local function v90(v124)
	if (((v124:DebuffStack(v35.FesteringWoundDebuff) <= (1495 - (711 + 782))) or v9:BuffUp(v35.DarkTransformation)) and (v124:GUID() == v5(LUAOBFUSACTOR_DECRYPT_STR_0("\15\181\158\36\220\13\172\142\37", "\185\98\218\235\87")):GUID()) and (v44.Unholy.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\230\51\50\245\219\165\221\57\53", "\202\171\92\71\134\190"))) then
		v28 = 2314413 - 1107124;
		return true;
	elseif (((v124:DebuffStack(v35.FesteringWoundDebuff) <= (471 - (270 + 199))) or v9:BuffUp(v35.DarkTransformation)) and (v44.Unholy.TargetSwap == LUAOBFUSACTOR_DECRYPT_STR_0("\8\212\56\135\26\214\45\152", "\232\73\161\76")) and (v124:GUID() ~= v7:GUID()) and not v20) then
		v28 = 324 + 675;
		return true;
	elseif (((v124:DebuffStack(v35.FesteringWoundDebuff) <= (1821 - (580 + 1239))) or v9:BuffUp(v35.DarkTransformation)) and (v124:GUID() == v7:GUID())) then
		v27 = 616225 - 408936;
		return true;
	elseif ((v124:DebuffStack(v35.FesteringWoundDebuff) <= (2 + 0)) or v9:BuffUp(v35.DarkTransformation)) then
		return true;
	end
end
local function v91(v125)
	return (v125:DebuffStack(v35.FesteringWoundDebuff) >= (1 + 3)) and (v59:CooldownRemains() < (2 + 1));
end
local function v92(v126)
	return v126:DebuffStack(v35.FesteringWoundDebuff) >= (2 - 1);
end
local function v93(v127)
	return (v127:TimeToDie() > v127:DebuffRemains(v35.VirulentPlagueDebuff)) and (v127:DebuffRefreshable(v35.VirulentPlagueDebuff) or (v35.Superstrain:IsAvailable() and (v127:DebuffRefreshable(v35.FrostFeverDebuff) or v127:DebuffRefreshable(v35.BloodPlagueDebuff)))) and (not v35.UnholyBlight:IsAvailable() or (v35.UnholyBlight:IsAvailable() and (v35.UnholyBlight:CooldownRemains() > ((10 + 5) / ((v29(v35.Superstrain:IsAvailable()) * (1170 - (645 + 522))) + (v29(v35.Plaguebringer:IsAvailable()) * (1792 - (1010 + 780))) + (v29(v35.EbonFever:IsAvailable()) * (2 + 0)))))));
end
local function v94()
	if v35.RaiseDead:IsCastable() then
		if v13(v35.RaiseDead, nil, nil) then
			v27 = 221921 - 175337;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\169\216\75\78\27\132\221\71\92\26\251\201\80\88\29\180\212\64\92\10\251\139\2\89\23\168\201\78\92\7\168\205\91\81\27", "\126\219\185\34\61");
		end
	end
	if (v35.ArmyoftheDead:IsReady() and not v36.Fyralath:IsEquipped() and not v18 and v64) then
		if v13(v35.ArmyoftheDead, nil, nil) then
			v27 = 124984 - 82334;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\13\220\83\107\65\120\245\216\24\198\91\77\122\114\242\227\76\222\76\119\125\120\254\229\13\218\30\38", "\135\108\174\62\18\30\23\147");
		end
	end
	if v35.Outbreak:IsReady() then
		if v13(v35.Outbreak, nil, nil, not v7:IsSpellInRange(v35.Outbreak)) then
			v27 = 79411 - (1045 + 791);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\185\252\62\201\10\171\50\204\246\249\56\206\27\161\62\197\183\253\106\157", "\167\214\137\74\171\120\206\83");
		end
	end
	if v35.FesteringStrike:IsReady() then
		if v13(v35.FesteringStrike, nil, nil, not v7:IsInMeleeRange(12 - 7)) then
			v27 = 131238 - 45290;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\141\245\33\73\253\181\130\254\53\98\235\179\153\249\57\88\184\183\153\245\49\82\245\165\138\228\114\5", "\199\235\144\82\61\152");
		end
	end
end
local function v95()
	if (v35.Epidemic:IsReady() and (not v49 or (v62 < (515 - (351 + 154))))) then
		if v13(v35.Epidemic, nil, nil, not v7:IsInRange(1604 - (1281 + 293))) then
			v27 = 207583 - (28 + 238);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\2\6\176\47\2\27\176\40\71\23\182\46\71\68", "\75\103\118\217");
		end
	end
	if (v58:IsReady() and v48) then
		if v43.CastTargetIf(v58, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\202\85\104", "\126\167\52\16\116\217"), v81, nil, not v7:IsSpellInRange(v58)) then
			v77();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\223\33\53\142\176\38\239\216\43\46\132\177\11\188\201\33\37\192\224", "\156\168\78\64\224\212\121");
		end
	end
	if (v35.FesteringStrike:IsReady() and not v48) then
		if v43.CastTargetIf(v35.FesteringStrike, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\10\239\189", "\174\103\142\197"), v81, nil, not v7:IsInMeleeRange(10 - 5)) then
			v27 = 87507 - (1381 + 178);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\80\45\76\44\32\76\241\88\47\96\43\49\76\241\93\45\31\57\42\91\184\0", "\152\54\72\63\88\69\62");
		end
	end
	if (v35.DeathCoil:IsReady() and not v49 and not v35.Epidemic:IsAvailable()) then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 44591 + 2950;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\208\193\239\72\220\251\237\83\221\200\174\93\219\193\174\4", "\60\180\164\142");
		end
	end
end
local function v96()
	if (v35.Epidemic:IsReady() and ((v6:Rune() < (1 + 0)) or (v35.BurstingSores:IsAvailable() and (v35.FesteringWoundDebuff:AuraActiveCount() == (0 + 0))) or not v35.BurstingSores:IsAvailable()) and not v49 and ((v72 >= (20 - 14)) or (v6:RunicPowerDeficit() < (16 + 14)) or (v6:BuffStack(v35.FestermightBuff) == (490 - (381 + 89))))) then
		if v13(v35.Epidemic, nil, nil, not v7:IsInRange(27 + 3)) then
			v27 = 140207 + 67110;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\78\12\45\34\224\27\91\30\4\38\34\210\16\77\76\22\61\103\191", "\114\56\62\101\73\71\141");
		end
	end
	if v58:IsReady() then
		if v43.CastTargetIf(v58, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\181\232\195", "\164\216\137\187"), v81, v92, not v7:IsSpellInRange(v58)) then
			v77();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\197\233\36\188\162\193\24\194\227\63\182\163\236\75\211\233\52\141\164\235\25\193\242\113\230", "\107\178\134\81\210\198\158");
		end
	end
	if (v35.Epidemic:IsReady() and (not v49 or (v62 < (17 - 7)))) then
		if v13(v35.Epidemic, nil, nil, not v7:IsInRange(1186 - (1074 + 82))) then
			v27 = 454329 - 247012;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\61\30\139\194\175\53\7\129\134\171\55\11\189\196\191\42\29\150\134\252", "\202\88\110\226\166");
		end
	end
	if (v35.DeathCoil:IsReady() and not v49 and not v35.Epidemic:IsAvailable()) then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 49325 - (214 + 1570);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\199\10\131\227\194\252\12\141\254\198\131\14\141\242\245\193\26\144\228\222\131\87", "\170\163\111\226\151");
		end
	end
	if v58:IsReady() then
		if v13(v58, nil, nil, not v7:IsSpellInRange(v58)) then
			v77();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\6\63\167\54\74\8\58\1\53\188\60\75\37\105\16\63\183\7\76\34\59\2\36\242\105\30", "\73\113\80\210\88\46\87");
		end
	end
end
local function v97()
	if (v35.VileContagion:IsReady() and (v59:CooldownRemains() < (1458 - (990 + 465)))) then
		if v43.CastTargetIf(v35.VileContagion, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\140\45\213", "\135\225\76\173\114"), v81, v91, not v7:IsSpellInRange(v35.VileContagion)) then
			v27 = 160890 + 229389;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\12\228\180\181\147\190\168\20\249\185\183\165\178\169\90\236\183\181\147\190\168\21\225\188\191\187\179\180\90\191", "\199\122\141\216\208\204\221");
		end
	end
	if (v66 and v35.SummonGargoyle:IsReady()) then
		if v13(v35.SummonGargoyle, nil) then
			v27 = 21411 + 27795;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\190\200\29\253\119\248\146\218\17\226\127\249\180\209\21\176\121\249\168\226\19\255\119\250\169\210\7\254\107\182\249", "\150\205\189\112\144\24");
		end
	end
	if (v35.AbominationLimb:IsCastable() and ((v6:Rune() < (2 + 0)) or (v60 > (39 - 29)) or not v35.Festermight:IsAvailable() or (v6:BuffUp(v35.FestermightBuff) and (v6:BuffRemains(v35.FestermightBuff) < (1738 - (1668 + 58)))))) then
		if v13(v35.AbominationLimb, nil, nil, not v7:IsInRange(646 - (512 + 114))) then
			v27 = 822405 - 506962;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\36\134\176\65\13\134\16\4\44\139\177\115\8\129\28\18\101\133\176\73\59\139\30\31\41\128\176\91\10\155\81\70", "\112\69\228\223\44\100\232\113");
		end
	end
	if v35.Apocalypse:IsReady() then
		if v43.CastTargetIf(v35.Apocalypse, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\217\22\9", "\230\180\127\103\179\214\28"), v81, v83, not v7:IsInMeleeRange(10 - 5)) then
			v27 = 959337 - 683638;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\141\21\80\69\229\77\249\156\22\90\6\229\78\229\179\6\80\73\232\69\239\155\11\76\6\188", "\128\236\101\63\38\132\33");
		end
	end
	if v35.Apocalypse:IsReady() then
		if v43.CastTargetIf(v35.Apocalypse, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\161\168\9", "\175\204\201\113\36\214\139"), v81, v84, not v7:IsInMeleeRange(3 + 2)) then
			v27 = 51609 + 224090;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\70\220\58\223\5\75\213\37\207\1\7\205\58\217\59\68\195\58\208\0\72\219\59\207\68\30\140", "\100\39\172\85\188") .. v27;
		end
	end
	if v35.UnholyAssault:IsCastable() then
		if v43.CastTargetIf(v35.UnholyAssault, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\160\113\183", "\83\205\24\217\224"), v81, v90, not v7:IsInMeleeRange(5 + 0), nil) then
			v27 = 699178 - 491889;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\243\203\197\50\234\220\242\60\245\214\204\40\234\209\141\60\233\192\242\62\233\202\193\57\233\210\195\46\166\148\157", "\93\134\165\173");
		end
	end
	if v35.RaiseDead:IsCastable() then
		if v13(v35.RaiseDead, nil, nil) then
			v27 = 48578 - (109 + 1885);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\172\243\200\209\63\241\182\123\191\246\129\195\53\203\141\125\177\253\205\198\53\217\188\109\254\163\147\130\62\199\161\110\178\243\216\209\46\215\190\123", "\30\222\146\161\162\90\174\210");
		end
	end
	if (v68 and v35.DarkTransformation:IsReady() and (((v59:CooldownRemains() < (1479 - (1269 + 200))) and v35.InfectedClaws:IsAvailable() and ((v35.FesteringWoundDebuff:AuraActiveCount() < v72) or not v35.VileContagion:IsAvailable())) or not v35.InfectedClaws:IsAvailable())) then
		if v13(v35.DarkTransformation, nil) then
			v27 = 121825 - 58265;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\225\79\98\1\218\90\98\11\235\93\118\5\247\67\113\30\236\65\126\74\228\65\117\53\230\65\127\6\225\65\103\4\246\14\33\94", "\106\133\46\16");
		end
	end
	if (v65 and v35.EmpowerRuneWeapon:IsCastable() and (v9:BuffUp(v35.DarkTransformation))) then
		if v13(v35.EmpowerRuneWeapon, nil) then
			v27 = 48383 - (98 + 717);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\45\99\243\77\69\74\31\97\233\84\69\103\55\118\253\74\79\86\96\114\243\95\127\91\47\124\240\94\79\79\46\96\188\11\22", "\32\56\64\19\156\58");
		end
	end
	if (v35.SacrificialPact:IsReady() and ((v9:BuffDown(v35.DarkTransformation) and (v35.DarkTransformation:CooldownRemains() > (832 - (802 + 24)))) or (v62 < v6:GCD()))) then
		if v13(v35.SacrificialPact, nil) then
			v27 = 409703 - 172129;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\73\201\230\68\83\244\137\89\193\228\90\101\226\129\89\220\165\87\85\247\191\89\199\234\90\94\253\151\84\219\165\7\2", "\224\58\168\133\54\58\146");
		end
	end
end
local function v98()
	if (v59:IsReady() and not v6:IsMoving() and (not v35.BurstingSores:IsAvailable() or (v35.FesteringWoundDebuff:AuraActiveCount() == v72) or (v35.FesteringWoundDebuff:AuraActiveCount() >= (9 - 1)))) then
		if v13(v59, nil) then
			v27 = 6390 + 36875;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\88\88\82\194\113\136\131\75\88\89\78\194\102\131\147\30\73\22\25", "\107\57\54\43\157\21\230\231");
		end
	end
	if (v35.FesteringStrike:IsReady() and (v35.FesteringWoundDebuff:AuraActiveCount() < v72) and v35.BurstingSores:IsAvailable()) then
		if v43.CastTargetIf(v35.FesteringStrike, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\214\130\31", "\175\187\235\113\149\217\188"), v81, nil, not v7:IsInMeleeRange(4 + 1)) then
			v27 = 14118 + 71830;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\58\170\146\88\230\107\113\50\168\190\95\247\107\113\55\170\193\77\236\124\71\47\170\149\89\243\57\44", "\24\92\207\225\44\131\25");
		end
	end
	if (v35.Epidemic:IsReady() and (not v49 or (v62 < (3 + 7)))) then
		if v13(v35.Epidemic, nil, nil, not v7:IsInRange(83 - 53)) then
			v27 = 691352 - 484035;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\78\195\177\72\30\112\66\208\248\77\20\120\116\192\189\88\14\109\11\133", "\29\43\179\216\44\123");
		end
	end
	if (v35.FesteringStrike:IsReady() and (v35.FesteringWoundDebuff:AuraActiveCount() < v72)) then
		if v43.CastTargetIf(v35.FesteringStrike, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\176\208\46", "\44\221\185\64"), v81, nil, not v7:IsInMeleeRange(2 + 3)) then
			v27 = 34987 + 50961;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\7\226\91\75\118\19\238\70\88\76\18\243\90\86\120\4\167\73\80\118\62\244\77\75\102\17\167\16", "\19\97\135\40\63");
		end
	end
	if (v35.FesteringStrike:IsReady() and (v35.Apocalypse:CooldownRemains() < v46)) then
		if v43.CastTargetIf(v35.FesteringStrike, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\163\93\43", "\81\206\60\83\91\79"), v81, v86, not v7:IsInMeleeRange(5 + 0)) then
			v27 = 62496 + 23452;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\72\174\195\102\42\209\68\170\73\148\195\102\61\202\70\161\14\170\223\119\16\208\72\176\91\187\144\35\127", "\196\46\203\176\18\79\163\45");
		end
	end
	if (v35.DeathCoil:IsReady() and not v49 and not v35.Epidemic:IsAvailable()) then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 22197 + 25344;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\188\39\127\10\44\196\236\183\43\114\94\37\244\234\135\49\123\10\49\235\175\233\112", "\143\216\66\30\126\68\155");
		end
	end
end
local function v99()
	if (v66 and v35.SummonGargoyle:IsCastable() and (v6:BuffUp(v35.CommanderoftheDeadBuff) or not v35.CommanderoftheDead:IsAvailable())) then
		if v13(v35.SummonGargoyle, nil) then
			v27 = 50639 - (797 + 636);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\185\221\0\198\202\173\232\230\171\218\10\196\220\175\210\161\169\199\2\199\193\172\192\239\185\136\95", "\129\202\168\109\171\165\195\183");
		end
	end
	if v35.RaiseDead:IsCastable() then
		if v13(v35.RaiseDead, nil, nil) then
			v27 = 226182 - 179598;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\48\89\62\203\219\43\226\39\89\51\152\221\27\233\46\92\56\207\208\7\166\118\24\51\209\205\4\234\35\65\36\204\199\24\227", "\134\66\56\87\184\190\116");
		end
	end
	if (v68 and v35.DarkTransformation:IsReady() and (v35.Apocalypse:CooldownRemains() < (1624 - (1427 + 192)))) then
		if v13(v35.DarkTransformation, nil) then
			v27 = 22023 + 41537;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\56\48\27\176\38\255\51\52\50\34\15\180\11\230\32\33\53\62\7\251\26\228\46\57\56\62\30\181\10\171\119", "\85\92\81\105\219\121\139\65");
		end
	end
	if (v35.Apocalypse:IsReady() and v50) then
		if v43.CastTargetIf(v35.Apocalypse, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\240\178\72", "\191\157\211\48\37\28"), v81, v85, not v7:IsInMeleeRange(11 - 6), nil) then
			v27 = 247817 + 27882;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\222\15\251\31\59\211\6\228\15\63\159\28\251\19\54\219\16\227\18\41\159\71", "\90\191\127\148\124");
		end
	end
	if (v65 and v35.EmpowerRuneWeapon:IsCastable() and ((v50 and ((v56 and (v57 <= (11 + 12))) or (not v35.SummonGargoyle:IsAvailable() and v35.ArmyoftheDamned:IsAvailable() and v54 and v52) or (not v35.SummonGargoyle:IsAvailable() and not v35.ArmyoftheDamned:IsAvailable() and v9:BuffUp(v35.DarkTransformation)) or (not v35.SummonGargoyle:IsAvailable() and v9:BuffUp(v35.DarkTransformation)))) or (v62 <= (347 - (192 + 134))))) then
		if v13(v35.EmpowerRuneWeapon, nil) then
			v27 = 48844 - (316 + 960);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\125\138\62\24\111\130\60\40\106\146\32\18\71\144\43\22\104\136\32\87\123\136\33\27\124\136\57\25\107\199\127\71", "\119\24\231\78");
		end
	end
	if (v35.AbominationLimb:IsCastable() and (v6:Rune() < (2 + 1)) and v50) then
		if v13(v35.AbominationLimb, nil) then
			v27 = 243433 + 72010;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\131\47\170\71\213\78\16\150\36\170\68\227\76\24\143\47\229\73\211\79\29\134\34\178\68\207\0\64\208", "\113\226\77\197\42\188\32");
		end
	end
	if (v35.UnholyAssault:IsReady() and v50) then
		if v43.CastTargetIf(v35.UnholyAssault, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\55\31\250", "\213\90\118\148"), v81, nil, not v7:IsInMeleeRange(5 + 0), nil) then
			v27 = 792466 - 585177;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\78\32\188\89\65\66\17\181\69\94\90\59\184\66\13\88\33\187\90\73\84\57\186\69\13\10\122", "\45\59\78\212\54");
		end
	end
	if (v35.SoulReaper:IsReady() and (v72 == (552 - (83 + 468))) and ((v7:TimeToX(1841 - (1202 + 604)) < (23 - 18)) or (v7:HealthPercentage() <= (57 - 22))) and (v7:TimeToDie() > (13 - 8))) then
		if v13(v35.SoulReaper, nil, nil, not v7:IsSpellInRange(v35.SoulReaper)) then
			v27 = 343619 - (45 + 280);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\3\89\150\135\185\60\168\241\0\83\145\203\133\33\162\252\20\89\148\133\149\110\252\166", "\144\112\54\227\235\230\78\205");
		end
	end
	if (v35.SoulReaper:IsReady() and (v72 >= (2 + 0))) then
		if v43.CastTargetIf(v35.SoulReaper, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\190\33\1", "\59\211\72\111\156\176"), v82, v89, not v7:IsSpellInRange(v35.SoulReaper)) then
			v27 = 299925 + 43369;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\136\246\33\113\149\230\44\94\130\241\109\77\136\236\33\74\136\244\35\93\199\178\117", "\77\46\231\131");
		end
	end
end
local function v100()
	if (v69 and v35.Apocalypse:IsReady() and (v60 >= (2 + 2)) and ((v6:BuffUp(v35.CommanderoftheDeadBuff) and (v57 < (13 + 10))) or not v35.CommanderoftheDead:IsAvailable())) then
		if v13(v35.Apocalypse, nil, nil, not v7:IsInMeleeRange(1 + 4)) then
			v27 = 510531 - 234832;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\187\68\185\67\187\88\175\80\169\81\246\71\187\70\177\127\169\81\162\85\170\20\228", "\32\218\52\214");
		end
	end
	if (v35.SoulReaper:IsReady() and (v72 == (1912 - (340 + 1571))) and ((v7:TimeToX(14 + 21) < (1777 - (1733 + 39))) or (v7:HealthPercentage() <= (96 - 61))) and (v7:TimeToDie() > (1039 - (125 + 909)))) then
		if v13(v35.SoulReaper, nil, nil, not v7:IsInMeleeRange(1953 - (1096 + 852))) then
			v27 = 153993 + 189301;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\93\24\36\164\206\162\64\91\94\18\35\232\246\177\87\93\113\4\52\188\228\160\5\12", "\58\46\119\81\200\145\208\37");
		end
	end
	if (v59:IsReady() and not v6:IsMoving() and v6:BuffDown(v35.DeathAndDecayBuff) and (v60 > (1 - 0))) then
		if v13(v59, nil) then
			v27 = 41965 + 1300;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\42\130\41\147\173\179\50\107\139\49\190\174\130\37\46\152\37\188\233\235", "\86\75\236\80\204\201\221");
		end
	end
	if (v66 and v35.SummonGargoyle:IsCastable() and v14() and (v6:BuffUp(v35.CommanderoftheDeadBuff) or (not v35.CommanderoftheDead:IsAvailable() and (v6:RunicPower() >= (552 - (409 + 103)))))) then
		if v13(v35.SummonGargoyle, nil) then
			v27 = 49442 - (46 + 190);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\97\84\122\136\241\133\77\70\118\151\249\132\107\77\114\197\249\138\96\70\72\150\251\159\103\81\55\221", "\235\18\33\23\229\158");
		end
	end
	if (v14() and v56 and (v57 <= (118 - (51 + 44)))) then
		if (v65 and v35.EmpowerRuneWeapon:IsCastable()) then
			if v13(v35.EmpowerRuneWeapon, nil) then
				v27 = 13417 + 34151;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\85\183\209\180\71\191\211\132\66\175\207\190\111\173\196\186\64\181\207\251\87\187\211\188\111\169\196\175\69\170\129\234\0", "\219\48\218\161");
			end
		end
		if (v67 and v35.UnholyAssault:IsCastable()) then
			if v13(v35.UnholyAssault, nil, nil, not v7:IsInMeleeRange(1322 - (1114 + 203))) then
				v27 = 208015 - (228 + 498);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\241\127\116\70\215\86\223\229\98\111\72\206\67\244\164\118\125\91\220\112\243\225\101\105\89\155\30\178", "\128\132\17\28\41\187\47");
			end
		end
	end
	if v44.Commons.Enabled.Potions then
		local v142 = v43.PotionSelected();
		if v142 then
			if (v142:IsReady() and ((((7 + 23) >= v57) and v56) or ((not v35.SummonGargoyle:IsAvailable() or (v35.SummonGargoyle:CooldownRemains() > (34 + 26)) or v35.SummonGargoyle:CooldownUp()) and ((v9:BuffUp(v35.DarkTransformation) and ((693 - (174 + 489)) >= v9:BuffRemains(v35.DarkTransformation))) or (v54 and (v55 <= (78 - 48))) or (v52 and (v53 <= (1935 - (830 + 1075)))))))) then
				if v13(v142, nil, v44.Commons.DisplayStyle.Potions) then
					v27 = 574 - (303 + 221);
					return LUAOBFUSACTOR_DECRYPT_STR_0("\17\61\18\51\82\15\114\1\59\79\6\13\21\63\73\20\34\70\107\9", "\61\97\82\102\90");
				end
			end
		end
	end
	if (v68 and v35.DarkTransformation:IsReady() and ((v35.CommanderoftheDead:IsAvailable() and (v6:RunicPower() > (1309 - (231 + 1038)))) or not v35.CommanderoftheDead:IsAvailable())) then
		if v13(v35.DarkTransformation, nil) then
			v27 = 52966 + 10594;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\168\47\185\64\248\67\12\8\162\61\173\68\213\90\31\29\165\33\165\11\192\86\12\14\147\61\174\95\210\71\94\88\250", "\105\204\78\203\43\167\55\126");
		end
	end
	if (v35.FesteringStrike:IsReady() and ((v60 == (1162 - (171 + 991))) or not v35.Apocalypse:IsAvailable() or ((v6:RunicPower() < (164 - 124)) and not v56))) then
		if v13(v35.FesteringStrike, nil, nil, not v7:IsInMeleeRange(13 - 8)) then
			v27 = 214479 - 128531;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\163\175\48\10\22\22\206\95\162\149\48\10\1\13\204\84\229\173\34\12\20\59\212\84\177\191\51\94\65\84", "\49\197\202\67\126\115\100\167");
		end
	end
	if (v35.DeathCoil:IsReady() and (v6:Rune() <= (1 + 0))) then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 166648 - 119107;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\51\94\222\61\136\105\93\56\82\211\105\135\87\76\48\100\204\44\148\67\78\119\9\141", "\62\87\59\191\73\224\54");
		end
	end
end
local function v101()
	if v44.Commons.Enabled.Potions then
		local v143 = v43.PotionSelected();
		if v143 then
			if (v143:IsReady() and ((((86 - 56) >= v57) and v56) or ((not v35.SummonGargoyle:IsAvailable() or (v35.SummonGargoyle:CooldownRemains() > (96 - 36)) or v35.SummonGargoyle:CooldownUp()) and ((v9:BuffUp(v35.DarkTransformation) and ((92 - 62) >= v9:BuffRemains(v35.DarkTransformation))) or (v54 and (v55 <= (1278 - (111 + 1137)))) or (v52 and (v53 <= (188 - (91 + 67)))))) or (v62 <= (89 - 59)))) then
				if v13(v143, nil, v44.Commons.DisplayStyle.Potions) then
					v27 = 13 + 37;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\247\13\238\192\232\12\186\193\238\5\242\246\247\16\243\198\216\3\249\221\238\13\244\218\167\80", "\169\135\98\154");
				end
			end
		end
	end
	if (v64 and v35.ArmyoftheDead:IsReady() and not v36.Fyralath:IsEquipped() and ((v35.SummonGargoyle:IsAvailable() and (v35.SummonGargoyle:CooldownRemains() < (525 - (423 + 100)))) or not v35.SummonGargoyle:IsAvailable() or (v62 < (1 + 34)))) then
		if v13(v35.ArmyoftheDead, nil, nil) then
			v27 = 118091 - 75441;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\202\101\41\77\194\60\206\244\99\44\81\194\55\205\202\115\100\92\244\52\192\244\103\54\93\242\12\201\200\99\45\91\243\32\136\159", "\168\171\23\68\52\157\83");
		end
	end
	if (v35.DeathCoil:IsReady() and ((v72 <= (2 + 1)) or not v35.Epidemic:IsAvailable()) and ((v56 and v35.CommanderoftheDead:IsAvailable() and v6:BuffUp(v35.CommanderoftheDeadBuff) and (v35.Apocalypse:CooldownRemains() < (776 - (326 + 445))) and (v6:BuffRemains(v35.CommanderoftheDeadBuff) > (117 - 90))) or (v7:DebuffUp(v35.DeathRotDebuff) and (v7:DebuffRemains(v35.DeathRotDebuff) < v6:GCD())))) then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 105912 - 58371;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\240\116\244\185\45\18\132\251\120\249\237\45\36\128\252\78\229\191\44\34\184\245\114\225\164\42\35\148\180\39", "\231\148\17\149\205\69\77");
		end
	end
	if (v35.Epidemic:IsReady() and (v72 >= (9 - 5)) and ((v35.CommanderoftheDead:IsAvailable() and v6:BuffUp(v35.CommanderoftheDeadBuff) and (v35.Apocalypse:CooldownRemains() < (716 - (530 + 181)))) or (v7:DebuffUp(v35.DeathRotDebuff) and (v7:DebuffRemains(v35.DeathRotDebuff) < v6:GCD())))) then
		if v13(v35.Epidemic, nil, nil, not v7:IsInRange(911 - (614 + 267))) then
			v27 = 207349 - (19 + 13);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\133\183\206\255\82\242\137\164\135\243\94\248\136\152\215\233\94\240\191\166\196\239\94\240\142\180\135\163", "\159\224\199\167\155\55");
		end
	end
	if (v58:IsReady() and ((v35.Apocalypse:CooldownRemains() > (v46 + (4 - 1))) or v35.UnholyAssault:CooldownUp() or (v72 >= (6 - 3))) and v35.Plaguebringer:IsAvailable() and (v35.Superstrain:IsAvailable() or v35.UnholyBlight:IsAvailable()) and (v6:BuffRemains(v35.PlaguebringerBuff) < v6:GCD())) then
		if v13(v58, nil, nil, not v7:IsSpellInRange(v58)) then
			v77();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\224\252\41\220\243\204\47\194\242\253\56\215\229\179\52\219\240\251\3\194\229\250\51\237\246\240\40\219\248\253\47\146\166\163", "\178\151\147\92");
		end
	end
	if (v67 and v35.UnholyBlight:IsReady() and ((v50 and (((not v35.Apocalypse:IsAvailable() or v35.Apocalypse:CooldownDown() or not v35.SummonGargoyle:IsAvailable()) and v35.Morbidity:IsAvailable()) or not v35.Morbidity:IsAvailable())) or v51 or (v62 < (59 - 38)))) then
		if v13(v35.UnholyBlight, nil, nil, not v7:IsInRange(3 + 5)) then
			v27 = 203986 - 87997;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\153\243\68\61\30\85\69\142\241\69\53\26\88\58\132\244\75\58\45\92\104\133\242\115\51\17\88\115\131\243\95\114\67\30", "\26\236\157\44\82\114\44");
		end
	end
	if v35.Outbreak:IsReady() then
		if v43.CastCycle(v35.Outbreak, v70, v93, not v7:IsSpellInRange(v35.Outbreak)) then
			v27 = 160878 - 83303;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\37\59\193\89\56\43\212\80\106\38\220\92\34\17\197\73\35\33\234\90\41\58\220\84\36\61\149\10\126", "\59\74\78\181");
		end
	end
	if (v64 and v35.ArmyoftheDead:IsReady() and v36.Fyralath:IsEquipped() and ((v35.SummonGargoyle:IsAvailable() and (v35.SummonGargoyle:CooldownRemains() < (1814 - (1293 + 519)))) or not v35.SummonGargoyle:IsAvailable() or (v62 < (71 - 36)))) then
		if v13(v35.ArmyoftheDead, nil, nil) then
			v27 = 111357 - 68707;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\36\195\87\67\140\42\215\101\78\187\32\238\94\95\178\33\145\82\83\180\45\238\74\72\186\42\238\91\89\167\44\222\84\73\243\116\135", "\211\69\177\58\58");
		end
	end
end
local function v102()
	if (v35.ArcaneTorrent:IsCastable() and (v6:RunicPowerDeficit() > (38 - 18)) and ((v35.SummonGargoyle:CooldownRemains() < v6:GCD()) or not v35.SummonGargoyle:IsAvailable() or (v56 and (v6:Rune() < (8 - 6)) and (v60 < (2 - 1))))) then
		if v13(v35.ArcaneTorrent, nil, nil, not v7:IsInRange(5 + 3)) then
			v27 = 5862 + 22868;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\182\247\122\244\231\206\136\241\118\231\251\206\185\241\57\231\232\200\190\228\117\230\169\153", "\171\215\133\25\149\137");
		end
	end
	if (v35.BloodFury:IsCastable() and ((((v35.BloodFury:BaseDuration() + (6 - 3)) >= v57) and v56) or ((not v35.SummonGargoyle:IsAvailable() or (v35.SummonGargoyle:CooldownRemains() > (14 + 46))) and ((v54 and (v55 <= (v35.BloodFury:BaseDuration() + 1 + 2))) or (v52 and (v53 <= (v35.BloodFury:BaseDuration() + 2 + 1))) or ((v72 >= (1098 - (709 + 387))) and v6:BuffUp(v35.DeathAndDecayBuff)))) or (v62 <= (v35.BloodFury:BaseDuration() + (1861 - (673 + 1185)))))) then
		if v13(v35.BloodFury, nil) then
			v27 = 59661 - 39089;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\227\196\61\245\235\15\250\87\243\209\114\232\238\51\245\67\237\219\114\174", "\34\129\168\82\154\143\80\156");
		end
	end
	if (v35.Berserking:IsCastable() and ((((v35.Berserking:BaseDuration() + (9 - 6)) >= v57) and v56) or ((not v35.SummonGargoyle:IsAvailable() or (v35.SummonGargoyle:CooldownRemains() > (98 - 38))) and ((v54 and (v55 <= (v35.Berserking:BaseDuration() + 3 + 0))) or (v52 and (v53 <= (v35.Berserking:BaseDuration() + 3 + 0))) or ((v72 >= (2 - 0)) and v6:BuffUp(v35.DeathAndDecayBuff)))) or (v62 <= (v35.Berserking:BaseDuration() + 1 + 2)))) then
		if v13(v35.Berserking, nil) then
			v27 = 52433 - 26136;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\135\183\33\24\77\92\130\140\188\52\75\90\79\138\140\179\63\24\8\24", "\233\229\210\83\107\40\46");
		end
	end
	if (v35.LightsJudgment:IsCastable() and v6:BuffUp(v35.UnholyStrengthBuff) and (not v35.Festermight:IsAvailable() or (v6:BuffRemains(v35.FestermightBuff) < v7:TimeToDie()) or (v6:BuffRemains(v35.UnholyStrengthBuff) < v7:TimeToDie()))) then
		if v13(v35.LightsJudgment, nil, nil, not v7:IsSpellInRange(v35.LightsJudgment)) then
			v27 = 501842 - 246195;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\205\75\53\222\17\210\125\56\195\1\198\79\55\216\17\129\80\51\213\12\192\78\33\150\93", "\101\161\34\82\182");
		end
	end
	if (v35.AncestralCall:IsCastable() and ((((1898 - (446 + 1434)) >= v57) and v56) or ((not v35.SummonGargoyle:IsAvailable() or (v35.SummonGargoyle:CooldownRemains() > (1343 - (1040 + 243)))) and ((v54 and (v55 <= (53 - 35))) or (v52 and (v53 <= (1865 - (559 + 1288)))) or ((v72 >= (1933 - (609 + 1322))) and v6:BuffUp(v35.DeathAndDecayBuff)))) or (v62 <= (472 - (13 + 441))))) then
		if v13(v35.AncestralCall, nil) then
			v27 = 1026650 - 751912;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\233\3\90\251\200\246\144\47\228\50\90\255\215\238\194\60\233\14\80\255\215\241\194\127\184", "\78\136\109\57\158\187\130\226");
		end
	end
	if (v35.ArcanePulse:IsCastable() and ((v72 >= (5 - 3)) or ((v6:Rune() <= (4 - 3)) and (v6:RunicPowerDeficit() >= (3 + 57))))) then
		if v13(v35.ArcanePulse, nil, nil, not v7:IsInRange(29 - 21)) then
			v27 = 92475 + 167889;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\63\45\250\240\48\58\198\225\43\51\234\244\126\45\248\242\55\62\245\226\126\110\171", "\145\94\95\153");
		end
	end
	if (v35.Fireblood:IsCastable() and ((((v35.Fireblood:BaseDuration() + 2 + 1) >= v57) and v56) or ((not v35.SummonGargoyle:IsAvailable() or (v35.SummonGargoyle:CooldownRemains() > (178 - 118))) and ((v54 and (v55 <= (v35.Fireblood:BaseDuration() + 2 + 1))) or (v52 and (v53 <= (v35.Fireblood:BaseDuration() + (4 - 1)))) or ((v72 >= (2 + 0)) and v6:BuffUp(v35.DeathAndDecayBuff)))) or (v62 <= (v35.Fireblood:BaseDuration() + 2 + 1)))) then
		if v13(v35.Fireblood, nil) then
			v27 = 190564 + 74657;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\251\196\6\208\76\187\242\194\16\149\92\182\254\196\21\217\93\247\172\153", "\215\157\173\116\181\46");
		end
	end
	if (v35.BagofTricks:IsCastable() and (v72 == (1 + 0)) and (v6:BuffUp(v35.UnholyStrengthBuff) or v3.FilteredFightRemains(v70, "<", 5 + 0))) then
		if v13(v35.BagofTricks, nil, nil, not v7:IsSpellInRange(v35.BagofTricks)) then
			v27 = 312844 - (153 + 280);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\55\181\140\205\213\51\139\159\224\211\54\191\152\178\200\52\183\130\243\214\38\244\218\164", "\186\85\212\235\146");
		end
	end
end
local function v103()
	if (v35.DeathCoil:IsReady() and not VarEpidemicPriority and ((not v49 and VarSpendRP) or (v62 < (28 - 18)))) then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 42683 + 4858;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\198\132\23\234\49\209\91\205\136\26\190\42\250\24\144", "\56\162\225\118\158\89\142");
		end
	end
	if (v35.Epidemic:IsReady() and VarEpidemicPriority and ((not v49 and VarSpendRP) or (v62 < (4 + 6)))) then
		if v13(v35.Epidemic, nil, nil, not v7:IsInRange(16 + 14)) then
			v27 = 188137 + 19180;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\89\21\201\171\39\213\85\6\128\188\54\152\8", "\184\60\101\160\207\66");
		end
	end
	if (v59:IsReady() and not v6:IsMoving() and v6:BuffDown(v35.DeathAndDecayBuff) and ((v72 >= (2 + 0)) or (v35.UnholyGround:IsAvailable() and ((v52 and (v53 >= (19 - 6))) or (v56 and (v57 > (5 + 3))) or (v54 and (v55 > (675 - (89 + 578)))) or (not v48 and (v60 >= (3 + 1))))) or (v35.Defile:IsAvailable() and (v56 or v52 or v54 or v9:BuffUp(v35.DarkTransformation)))) and ((v35.FesteringWoundDebuff:AuraActiveCount() == v72) or (v72 == (1 - 0)))) then
		if v13(v59, nil) then
			v27 = 44314 - (572 + 477);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\48\140\101\131\53\140\120\252\34\150\60\234", "\220\81\226\28");
		end
	end
	if (v58:IsReady() and (v48 or ((v72 >= (1 + 1)) and v6:BuffUp(v35.DeathAndDecayBuff)))) then
		if v13(v58, nil, nil, not v7:IsSpellInRange(v58)) then
			v77();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\4\218\151\245\238\248\0\197\135\245\238\194\1\149\145\239\170\159", "\167\115\181\226\155\138");
		end
	end
	if (v35.FesteringStrike:IsReady() and not v48) then
		if v43.CastTargetIf(v35.FesteringStrike, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\239\43\233", "\166\130\66\135\60\27\17"), v81, v87, not v7:IsInMeleeRange(4 + 1)) then
			v27 = 10260 + 75688;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\66\79\221\97\53\86\67\192\114\15\87\94\220\124\59\65\10\221\97\112\21\26", "\80\36\42\174\21");
		end
	end
	if v35.DeathCoil:IsReady() then
		if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
			v27 = 47627 - (84 + 2);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\74\21\54\110\70\47\52\117\71\28\119\105\90\80\102\40", "\26\46\112\87");
		end
	end
	if (v58:IsReady() and not v48) then
		if v43.CastTargetIf(v58, v70, LUAOBFUSACTOR_DECRYPT_STR_0("\180\34\179", "\212\217\67\203\20\223\223\37"), v81, v87, not v7:IsSpellInRange(v58)) then
			v77();
			return LUAOBFUSACTOR_DECRYPT_STR_0("\173\130\189\220\190\178\187\194\191\131\172\215\168\205\187\198\250\220\252", "\178\218\237\200");
		end
	end
end
local function v104()
	local v128 = v6:GetUseableTrinkets(v37);
	if (v128 and v14() and (v35.Apocalypse:CooldownDown() or v9:BuffUp(v35.DarkTransformation))) then
		if v128 then
			if v12.Cast(v128, nil, nil) then
				if ((v128:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\166\185\231\201\179\167", "\176\214\213\134"), 21 - 8)) and v44.Commons.Enabled.TopTrinket) then
					v27 = 22 + 8;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\211\168\184\209\186\95\90\180\184\165\209\151\95\77\241\160\165\148\174\89\75\180", "\57\148\205\214\180\200\54") .. v128:Name();
				elseif ((v128:ID() == GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\2\241\52\45\115\0", "\22\114\157\85\84"), 856 - (497 + 345))) and v44.Commons.Enabled.BottomTrinket) then
					v27 = 1 + 30;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\227\206\29\193\79\255\171\132\222\0\193\98\255\188\193\198\0\132\91\249\186\132", "\200\164\171\115\164\61\150") .. v128:Name();
				end
			end
		end
	end
end
local function v105()
	VarEpidemicPriority = (v35.ImprovedDeathCoil:IsAvailable() and not v35.CoilofDevastation:IsAvailable() and (v72 >= (1 + 2))) or (v35.CoilofDevastation:IsAvailable() and (v72 >= (1337 - (605 + 728)))) or (not v35.ImprovedDeathCoil:IsAvailable() and (v72 >= (2 + 0)));
	v45 = (v72 >= (6 - 3)) or ((v35.SummonGargoyle:CooldownRemains() > (1 + 0)) and ((v35.Apocalypse:CooldownRemains() > (3 - 2)) or not v35.Apocalypse:IsAvailable())) or not v35.SummonGargoyle:IsAvailable() or (v3.CombatTime() > (19 + 1));
	v46 = ((v35.Apocalypse:CooldownRemains() < (27 - 17)) and (v60 <= (4 + 0)) and (v35.UnholyAssault:CooldownRemains() > (499 - (457 + 32))) and (3 + 4)) or (1404 - (832 + 570));
	if (not v56 and v35.Festermight:IsAvailable() and v6:BuffUp(v35.FestermightBuff) and ((v6:BuffRemains(v35.FestermightBuff) / ((5 + 0) * v6:GCD())) >= (1 + 0))) then
		v47 = v60 >= (3 - 2);
	else
		v47 = v60 >= ((2 + 1) - v29(v35.InfectedClaws:IsAvailable()));
	end
	v48 = (((v35.Apocalypse:CooldownRemains() > v46) or not v35.Apocalypse:IsAvailable()) and (v47 or ((v60 >= (797 - (588 + 208))) and (v35.UnholyAssault:CooldownRemains() < (53 - 33)) and v35.UnholyAssault:IsAvailable() and v50) or (v7:DebuffUp(v35.RottenTouchDebuff) and (v60 >= (1801 - (884 + 916)))) or (v60 > (8 - 4)) or (v6:HasTier(18 + 13, 657 - (232 + 421)) and (v63:ApocMagusActive() or v63:ArmyMagusActive()) and (v60 >= (1890 - (1569 + 320)))))) or ((v62 < (2 + 3)) and (v60 >= (1 + 0)));
	v49 = v35.VileContagion:IsAvailable() and (v35.VileContagion:CooldownRemains() < (9 - 6)) and (v6:RunicPower() < (665 - (316 + 289))) and not v50;
	v50 = (v72 == (2 - 1)) or not v15();
	v51 = (v72 >= (1 + 1)) and v15();
	VarSpendRP = (not v35.RottenTouch:IsAvailable() or (v35.RottenTouch:IsAvailable() and v7:DebuffDown(v35.RottenTouchDebuff)) or (v6:RunicPowerDeficit() < (1473 - (666 + 787)))) and (not v6:HasTier(456 - (360 + 65), 4 + 0) or (v6:HasTier(285 - (79 + 175), 5 - 1) and not (v63:ApocMagusActive() or v63:ArmyMagusActive())) or (v6:RunicPowerDeficit() < (16 + 4)) or (v6:Rune() < (8 - 5))) and ((v35.ImprovedDeathCoil:IsAvailable() and ((v72 == (3 - 1)) or v35.CoilofDevastation:IsAvailable())) or (v6:Rune() < (902 - (503 + 396))) or v56 or v6:BuffUp(v35.SuddenDoomBuff) or ((v35.Apocalypse:CooldownRemains() < (191 - (92 + 89))) and (v60 > (5 - 2))) or (not v48 and (v60 >= (3 + 1))));
end
local function v106()
	v42 = v78();
	v70 = v6:GetEnemiesInMeleeRange(5 + 3);
	v73 = v6:GetEnemiesInMeleeRange(39 - 29);
	TopTrinketID, _ = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\174\248\2\92\134\172", "\227\222\148\99\37"), 2 + 11);
	BotTrinketID, _ = GetInventoryItemID(LUAOBFUSACTOR_DECRYPT_STR_0("\35\94\83\239\252\33", "\153\83\50\50\150"), 31 - 17);
	if v15() then
		v71 = #v70;
		v74 = #v70;
	else
		v71 = 1 + 0;
		v74 = 1 + 0;
	end
	v75 = v79(v73);
	v52 = v35.Apocalypse:TimeSinceLastCast() <= (45 - 30);
	v53 = (v52 and ((2 + 13) - v35.Apocalypse:TimeSinceLastCast())) or (0 - 0);
	v54 = v35.ArmyoftheDead:TimeSinceLastCast() <= (1274 - (485 + 759));
	v55 = (v55 and ((69 - 39) - v35.ArmyoftheDead:TimeSinceLastCast())) or (1189 - (442 + 747));
	if (v43.TargetIsValid() or v6:AffectingCombat()) then
		if (IsInRaid() and UnitExists(LUAOBFUSACTOR_DECRYPT_STR_0("\95\121\96\15\34", "\45\61\22\19\124\19\203"))) then
			v61 = v3.BossFightRemains(nil, true);
			v62 = v61;
			if (v62 == (12246 - (832 + 303))) then
				v62 = v3.FightRemains(Enemies10yd, false);
			end
		end
	end
	v17 = HeroRotationCharDB.Toggles[951 - (88 + 858)];
	v16 = HeroRotationCharDB.Toggles[2 + 2];
	v18 = HeroRotationCharDB.Toggles[9 + 1];
	v19 = HeroRotationCharDB.Toggles[1 + 10];
	v20 = HeroRotationCharDB.Toggles[801 - (766 + 23)];
	v21 = HeroRotationCharDB.Toggles[64 - 51];
	v22 = HeroRotationCharDB.Toggles[18 - 4];
	v23 = not HeroRotationCharDB.Toggles[39 - 24];
	v24 = HeroRotationCharDB.Toggles[54 - 38];
	v25 = HeroRotationCharDB.Toggles[1090 - (1036 + 37)];
	v26 = HeroRotationCharDB.Toggles[13 + 5];
	v64 = false;
	v65 = false;
	v66 = false;
	v67 = false;
	v68 = false;
	v69 = false;
	if (((v44.Unholy.AOACD == LUAOBFUSACTOR_DECRYPT_STR_0("\226\54\30", "\217\161\114\109\149\98\16")) and v14()) or ((v44.Unholy.AOACD == LUAOBFUSACTOR_DECRYPT_STR_0("\33\45\57\112\176\52\49\4\43", "\20\114\64\88\28\220")) and v16) or (v44.Unholy.AOACD == LUAOBFUSACTOR_DECRYPT_STR_0("\16\13\197\181\225\195", "\221\81\97\178\212\152\176"))) then
		v64 = true;
	end
	if (((v44.Unholy.RWCD == LUAOBFUSACTOR_DECRYPT_STR_0("\238\195\14", "\122\173\135\125\155")) and v14()) or ((v44.Unholy.RWCD == LUAOBFUSACTOR_DECRYPT_STR_0("\183\204\1\181\51\113\235\160\210", "\168\228\161\96\217\95\81")) and v16) or (v44.Unholy.RWCD == LUAOBFUSACTOR_DECRYPT_STR_0("\250\221\57\93\54\68", "\55\187\177\78\60\79"))) then
		v65 = true;
	end
	if (((v44.Unholy.SGCD == LUAOBFUSACTOR_DECRYPT_STR_0("\14\234\76", "\224\77\174\63\139\38\175")) and v14()) or ((v44.Unholy.SGCD == LUAOBFUSACTOR_DECRYPT_STR_0("\183\76\89\34\136\1\123\10\151", "\78\228\33\56")) and v16) or (v44.Unholy.SGCD == LUAOBFUSACTOR_DECRYPT_STR_0("\239\114\165\2\156\221", "\229\174\30\210\99"))) then
		v66 = true;
	end
	if (((v44.Unholy.UACD == LUAOBFUSACTOR_DECRYPT_STR_0("\56\201\149", "\89\123\141\230\49\141\93")) and v14()) or ((v44.Unholy.UACD == LUAOBFUSACTOR_DECRYPT_STR_0("\192\124\247\0\28\10\208\85\229", "\42\147\17\150\108\112")) and v16) or (v44.Unholy.UACD == LUAOBFUSACTOR_DECRYPT_STR_0("\46\170\58\126\254\251", "\136\111\198\77\31\135"))) then
		v67 = true;
	end
	if (((v44.Unholy.DTCD == LUAOBFUSACTOR_DECRYPT_STR_0("\33\45\180", "\201\98\105\199\54\221\132\119")) and v14()) or ((v44.Unholy.DTCD == LUAOBFUSACTOR_DECRYPT_STR_0("\138\1\130\45\14\117\143\157\31", "\204\217\108\227\65\98\85")) and v16) or (v44.Unholy.DTCD == LUAOBFUSACTOR_DECRYPT_STR_0("\127\207\226\228\53\211", "\160\62\163\149\133\76"))) then
		v68 = true;
	end
	if (((v44.Unholy.APCD == LUAOBFUSACTOR_DECRYPT_STR_0("\245\132\30", "\163\182\192\109\79")) and v14()) or ((v44.Unholy.APCD == LUAOBFUSACTOR_DECRYPT_STR_0("\7\43\1\204\249\116\5\36\211", "\149\84\70\96\160")) and v16) or (v44.Unholy.APCD == LUAOBFUSACTOR_DECRYPT_STR_0("\25\10\26\236\33\21", "\141\88\102\109"))) then
		v69 = true;
	end
	if not v34 then
		v28 = 0 - 0;
		v27 = 0 + 0;
	end
	if (v28 > (1480 - (641 + 839))) then
		v28 = 913 - (910 + 3);
	end
	if (v27 > (0 - 0)) then
		v27 = 1684 - (1466 + 218);
	end
end
local function v107()
	v70 = v6:GetEnemiesInMeleeRange(3 + 2);
	if not v34 then
		v28 = 1148 - (556 + 592);
		v27 = 0 + 0;
	end
	if (v28 > (808 - (329 + 479))) then
		v28 = 854 - (174 + 680);
	end
	if (v27 > (0 - 0)) then
		v27 = 0 - 0;
	end
	if (not UnitIsEnemy(LUAOBFUSACTOR_DECRYPT_STR_0("\163\95\203\105\31\47", "\161\211\51\170\16\122\93\53"), LUAOBFUSACTOR_DECRYPT_STR_0("\246\161\167\59\254\161\164\45\233", "\72\155\206\210")) and UnitIsPlayer(LUAOBFUSACTOR_DECRYPT_STR_0("\75\117\65\29\54\73\108\81\28", "\83\38\26\52\110")) and UnitIsDead(LUAOBFUSACTOR_DECRYPT_STR_0("\85\24\50\85\93\24\49\67\74", "\38\56\119\71"))) then
		if (v35.RaiseAlly:IsCastable() and (v6:RunicPower() >= (22 + 8))) then
			if v13(v35.RaiseAlly, nil) then
				v28 = 162738 - (396 + 343);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\193\238\81\197\32\119\255\227\65\150\8\121", "\54\147\143\56\182\69");
			end
		elseif ((v35.RaiseAlly:CooldownRemains(BypassRecovery) <= (0 + 0)) and (v6:RunicPower() < (1507 - (29 + 1448)))) then
			PoolforRes = true;
		end
	end
	v41 = v106();
	if v12.QueuedCast() then
		v27 = v12.QueuedCast();
		return LUAOBFUSACTOR_DECRYPT_STR_0("\245\148\236\93\208\219\193\206\92\218\195\132\191", "\191\182\225\159\41") .. v10(v27):ID();
	end
	if ((v12.GUISettings.General.OpenerReset > (1389 - (135 + 1254))) and not HeroRotationCharDB.Toggles[18 - 13]) then
		starttime = v32();
		endtime = starttime + v12.GUISettings.General.OpenerReset;
	elseif ((v12.GUISettings.General.OpenerReset > (0 - 0)) and (endtime ~= nil) and (v32() > endtime) and HeroRotationCharDB.Toggles[4 + 1]) then
		HeroRotationCharDB.Toggles[1532 - (389 + 1138)] = not HeroRotationCharDB.Toggles[579 - (102 + 472)];
		v12.ToggleIconFrame:UpdateButtonText(5 + 0);
		v12.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\4\2\45\91\142\149\130\34\1\104\91\132\144\130", "\162\75\114\72\53\235\231") .. ((HeroRotationCharDB.Toggles[3 + 2] and LUAOBFUSACTOR_DECRYPT_STR_0("\144\63\66\228\3\82\138\58\20\178\86\12\141\62\72\231\87\30\158\114", "\98\236\92\36\130\51")) or LUAOBFUSACTOR_DECRYPT_STR_0("\184\26\10\188\67\174\229\96\244\73\8\179\86\169\183\60\161\29\16\168\11", "\80\196\121\108\218\37\200\213")));
	end
	if (v21 and v35.AntiMagicZone:IsUsableP() and v6:AffectingCombat() and (v35.AntiMagicZone:CooldownRemains(BypassRecovery) <= (0 + 0))) then
		if v13(v35.AntiMagicZone, nil, nil, nil) then
			v27 = 147174 - (320 + 1225);
			return LUAOBFUSACTOR_DECRYPT_STR_0("\17\102\7\106\78\78\171\45\73", "\234\96\19\98\31\43\110");
		end
	elseif ((not v35.AntiMagicZone:IsUsableP() or (v35.AntiMagicZone:CooldownRemains() > (0 - 0)) or not v6:AffectingCombat()) and v21) then
		HeroRotationCharDB.Toggles[8 + 5] = not HeroRotationCharDB.Toggles[1477 - (157 + 1307)];
		v12.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\39\17\70\206\225\95\138\1\22\81\135\150\125\133\3\95\99\210\169\103\142\70\22\65\135\162\125\156\70", "\235\102\127\50\167\204\18") .. ((HeroRotationCharDB.Toggles[1872 - (821 + 1038)] and LUAOBFUSACTOR_DECRYPT_STR_0("\76\162\243\37\20\126\86\167\165\115\75\32\76\179\187", "\78\48\193\149\67\36")) or LUAOBFUSACTOR_DECRYPT_STR_0("\44\29\134\30\71\54\78\208\72\17\63\24\134\4\83\126", "\33\80\126\224\120")));
	end
	if (v22 and v35.DeathGrip:IsUsableP() and (v35.DeathGrip:CooldownRemains(BypassRecovery) <= (0 - 0)) and v43.TargetIsValid() and (v5(LUAOBFUSACTOR_DECRYPT_STR_0("\225\167\22\215\89\227\190\6\214", "\60\140\200\99\164")):GUID() ~= nil)) then
		if v13(v35.DeathGrip, nil, nil, nil) then
			v28 = 16358 + 133218;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\150\225\1\51\167\199\208\1\39\182\143\211\22\47\178\199\217\43", "\194\231\148\100\70");
		end
	elseif (v22 and v35.DeathGrip:IsUsableP() and (v35.DeathGrip:CooldownRemains(BypassRecovery) <= (0 - 0)) and v43.TargetIsValid()) then
		if v13(v35.DeathGrip, nil, nil, nil) then
			v27 = 18446 + 31130;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\87\89\196\182\243\136\98\73\192\183\254\239\84\69\209", "\168\38\44\161\195\150");
		end
	elseif ((not v35.DeathGrip:IsUsableP() or (v35.DeathGrip:CooldownRemains() > (0 - 0)) or not v43.TargetIsValid()) and v22) then
		HeroRotationCharDB.Toggles[1040 - (834 + 192)] = not HeroRotationCharDB.Toggles[1 + 13];
		v12.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\164\249\131\98\56\168\145\4\137\236\194\71\37\237\163\19\192\245\145\54\62\231\161\86", "\118\224\156\226\22\80\136\214") .. ((HeroRotationCharDB.Toggles[4 + 10] and LUAOBFUSACTOR_DECRYPT_STR_0("\94\237\95\134\18\190\95\134\18\190\86\142\94\252\23", "\224\34\142\57")) or LUAOBFUSACTOR_DECRYPT_STR_0("\194\164\195\219\117\247\13\94\142\247\202\219\117\237\79\64", "\110\190\199\165\189\19\145\61")));
	end
	if (v24 and v35.Asphyxiate:IsUsableP() and (v35.Asphyxiate:CooldownRemains(BypassRecovery) <= (0 + 0)) and (v5(LUAOBFUSACTOR_DECRYPT_STR_0("\215\228\98\251\142\200\204\238\101", "\167\186\139\23\136\235")):GUID() ~= nil)) then
		if v13(v35.Asphyxiate, nil, nil, nil) then
			v28 = 1892447 - 670885;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\11\160\141\24\31\245\169\30\10\189\145\21\19\180\156\8\90\152\167", "\109\122\213\232");
		end
	elseif (v24 and v35.Asphyxiate:IsUsableP() and (v35.Asphyxiate:CooldownRemains(BypassRecovery) <= (304 - (300 + 4))) and v43.TargetIsValid()) then
		if v13(v35.Asphyxiate, nil, nil, nil) then
			v27 = 59172 + 162390;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\255\226\167\37\235\183\131\35\254\255\187\40\231\246\182\53", "\80\142\151\194");
		end
	elseif ((not v35.Asphyxiate:IsUsableP() or (v35.Asphyxiate:CooldownRemains() > (0 - 0))) and v24) then
		HeroRotationCharDB.Toggles[378 - (112 + 250)] = not HeroRotationCharDB.Toggles[7 + 9];
		v12.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\34\213\103\68\26\222\126\77\23\195\55\125\22\195\98\73\67\207\100\12\13\201\96\12", "\44\99\166\23") .. ((HeroRotationCharDB.Toggles[39 - 23] and LUAOBFUSACTOR_DECRYPT_STR_0("\96\244\47\48\99\244\122\241\121\102\60\170\96\229\103", "\196\28\151\73\86\83")) or LUAOBFUSACTOR_DECRYPT_STR_0("\239\0\47\22\132\94\72\38\163\83\38\22\132\68\10\56", "\22\147\99\73\112\226\56\120")));
	end
	if v6:IsChanneling(v10(185975 + 138656)) then
		if v13(v35.PoolResources, nil, nil, nil) then
			v28 = 83780 + 78219;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\138\116\235\230\136\248\84\238\249\148\248\88\205", "\237\216\21\130\149");
		end
	end
	if v35.RaiseDead:IsCastable() then
		if v13(v35.RaiseDead, nil, nil) then
			v27 = 34840 + 11744;
			return LUAOBFUSACTOR_DECRYPT_STR_0("\144\79\86\76\181\246\90\135\79\91\31\160\219\91\129\65\82\93\177\221\30\208\14\91\86\163\217\82\131\87\76\75\169\197\91", "\62\226\46\63\63\208\169");
		end
	end
	v70 = v6:GetEnemiesInMeleeRange(4 + 4);
	v73 = v7:GetEnemiesInSplashRange(8 + 2);
	if v15() then
		v71 = #v70;
		v74 = v7:GetEnemiesInSplashRangeCount(1424 - (1001 + 413));
	else
		v71 = 2 - 1;
		v74 = 883 - (244 + 638);
	end
	v72 = v33(v71, v74);
	if (v43.TargetIsValid() or v6:AffectingCombat()) then
		v61 = v3.BossFightRemains();
		v62 = v61;
		if (v62 == (11804 - (627 + 66))) then
			v62 = v3.FightRemains(v70, false);
		end
		v75 = v79(v73);
		v52 = v35.Apocalypse:TimeSinceLastCast() <= (44 - 29);
		v53 = (v52 and ((617 - (512 + 90)) - v35.Apocalypse:TimeSinceLastCast())) or (1906 - (1665 + 241));
		v54 = v35.ArmyoftheDead:TimeSinceLastCast() <= (747 - (373 + 344));
		v55 = (v54 and ((14 + 16) - v35.ArmyoftheDead:TimeSinceLastCast())) or (0 + 0);
		v56 = v63:gargactive();
		v57 = v63:gargremains();
		v60 = v7:DebuffStack(v35.FesteringWoundDebuff);
	end
	if (v43.TargetIsValid() and v6:AffectingCombat()) then
		if not v6:AffectingCombat() then
			local v147 = v94();
			if v147 then
				return v147;
			end
		end
		if (v35.DeathStrike:IsReady() and (v6:HealthPercentage() < v44.Commons.UseDeathStrikeHP)) then
			if v13(v35.DeathStrike) then
				v27 = 131880 - 81882;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\225\28\84\151\23\50\60\74\247\16\94\134\95\1\32\73\165\17\69\195\16\31\111\78\247\22\86", "\62\133\121\53\227\127\109\79");
			end
		end
		if ((v6:HealthPercentage() < v44.Commons.HealthstoneHP) and v44.Commons.UseDefensives and v36.Healthstone:IsReady() and (v36.Healthstone:CooldownRemains() <= (0 - 0)) and v6:BuffDown(v35.ShroudofPurgatory)) then
			if v12.Cast(v36.Healthstone, nil) then
				v27 = 1139 - (35 + 1064);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\56\17\51\249\194\166\177\4\27\60\240\150\134\146", "\194\112\116\82\149\182\206");
			end
		end
		if ((v6:HealthPercentage() < v44.Commons.HealPotHP) and v44.Commons.UseDefensives and v36.CosmicHealPot:IsReady() and (v36.CosmicHealPot:CooldownRemains() <= (0 + 0)) and v6:BuffDown(v35.ShroudofPurgatory)) then
			if v12.Cast(v36.CosmicHealPot, nil) then
				v27 = 87 - 46;
				return LUAOBFUSACTOR_DECRYPT_STR_0("\26\167\95\21\201\225\38\60\169\64\40\207\246\78\17\152", "\110\89\200\44\120\160\130");
			end
		end
		if ((v6:HealthPercentage() < v44.Commons.HealPotHP) and v44.Commons.UseDefensives and v36.HealPot:IsReady() and (v36.HealPot:CooldownRemains() <= (0 + 0)) and v6:BuffDown(v35.ShroudofPurgatory)) then
			if v12.Cast(v36.HealPot, nil) then
				v27 = 1277 - (298 + 938);
				return LUAOBFUSACTOR_DECRYPT_STR_0("\131\198\74\74\115\69\47\13\131\243", "\45\203\163\43\38\35\42\91");
			end
		end
		if (v71 == (1259 - (233 + 1026))) then
			if (v35.Outbreak:IsReady() and (v75 > (1666 - (636 + 1030)))) then
				if v13(v35.Outbreak, nil, nil, not v7:IsSpellInRange(v35.Outbreak)) then
					v27 = 39662 + 37913;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\221\144\200\33\149\172\85\217\197\211\54\147\150\91\212\186\206\34\137\174\81", "\52\178\229\188\67\231\201");
				end
			end
			if (v35.Epidemic:IsReady() and v15() and (v35.VirulentPlagueDebuff:AuraActiveCount() > (1 + 0)) and not v49) then
				if v13(v35.Epidemic, nil, nil, not v7:IsInRange(9 + 21)) then
					v27 = 14008 + 193309;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\36\81\89\0\242\81\42\34\1\95\17\227\99\44\39\126\66\5\249\91\38", "\67\65\33\48\100\151\60");
				end
			end
			if (v35.DeathCoil:IsReady() and (v35.VirulentPlagueDebuff:AuraActiveCount() < (223 - (55 + 166))) and not v49) then
				if v13(v35.DeathCoil, nil, nil, not v7:IsSpellInRange(v35.DeathCoil)) then
					v27 = 9214 + 38327;
					return LUAOBFUSACTOR_DECRYPT_STR_0("\219\226\175\204\251\224\228\161\209\255\159\232\187\204\204\208\225\145\202\242\209\224\171", "\147\191\135\206\184");
				end
			end
		end
		v105();
		local v144 = v101();
		if v144 then
			return v144;
		end
		if (v44.Commons.Enabled.Trinkets or v44.Commons.Enabled.Items) then
			local v148 = v104();
			if v148 then
				return v148;
			end
		end
		if (v14()) then
			local v149 = v102();
			if v149 then
				return v149;
			end
		end
		if (v14() and not v45) then
			local v150 = v100();
			if v150 then
				return v150;
			end
			if v12.CastAnnotated(v35.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\179\9\143\245", "\210\228\72\198\161\184\51")) then
				return LUAOBFUSACTOR_DECRYPT_STR_0("\6\70\252\28\51\200\57\91\179\55\114\220\49\122\246\4\102\222\126\0", "\174\86\41\147\112\19");
			end
		end
		if (v14() and v50) then
			local v151 = v99();
			if v151 then
				return v151;
			end
		end
		if (v15() and v14() and v51) then
			local v152 = v97();
			if v152 then
				return v152;
			end
		end
		if (v15()) then
			if (v51 and (v59:CooldownRemains() < (2 + 8)) and v6:BuffDown(v35.DeathAndDecayBuff)) then
				local v156 = v98();
				if v156 then
					return v156;
				end
			end
			if ((v72 >= (15 - 11)) and v6:BuffUp(v35.DeathAndDecayBuff)) then
				local v157 = v96();
				if v157 then
					return v157;
				end
			end
			if ((v72 >= (301 - (36 + 261))) and (((v59:CooldownRemains() > (17 - 7)) and v6:BuffDown(v35.DeathAndDecayBuff)) or not v51)) then
				local v158 = v95();
				if v158 then
					return v158;
				end
			end
		end
		if (v72 <= (1371 - (34 + 1334))) then
			local v153 = v103();
			if v153 then
				return v153;
			end
		end
		if v12.CastAnnotated(v35.Pool, false, LUAOBFUSACTOR_DECRYPT_STR_0("\108\33\164\63", "\203\59\96\237\107\69\111\113")) then
			return LUAOBFUSACTOR_DECRYPT_STR_0("\52\25\163\237\14\226\210\55\25\185\243\50\245\196", "\183\68\118\204\129\81\144");
		end
	end
end
function ReturnSpell()
	if (v27 == (0 + 0)) then
		return 0 + 0;
	else
		return v27;
	end
end
function ReturnSpellMO()
	if (v28 == (1283 - (1035 + 248))) then
		return 21 - (20 + 1);
	else
		return v28;
	end
end
local function v108()
	v35.VirulentPlagueDebuff:RegisterAuraTracking();
	v35.FesteringWoundDebuff:RegisterAuraTracking();
	v35.MarkofFyralathDebuff:RegisterAuraTracking();
	v12.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\59\163\120\235\7\155\78\137\91\164\25\141\26\172\100\237\4\140\78\165\113\247\75\128\11\168\126\164\30\146\10\172\100\225\15\194\8\162\98\164\27\131\26\174\120\164\90\210\64\255\62\177\69", "\226\110\205\16\132\107"));
	v12.Print(LUAOBFUSACTOR_DECRYPT_STR_0("\222\205\232\214\77\242\131\196\242\1\249\204\244\216\85\226\204\238\153\72\248\131\227\204\83\249\198\238\205\77\242\131\225\153\86\228\209\235\153\72\229\131\240\203\78\236\209\229\202\82\167\131\226\204\85\171\203\225\202\1\233\198\229\215\1\254\211\228\216\85\238\199\160\223\78\249\131\240\216\85\232\203\160\136\17\165\146\174\140\15", "\33\139\163\128\185"), v18);
end
v12.SetAPL(132 + 120, v107, v108);
