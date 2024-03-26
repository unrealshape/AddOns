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
local v2 = HeroRotation;
local v3 = HeroLib;
local v4 = v3.GUI;
local v5 = v4.CreateChildPanel;
local v6 = v4.CreatePanelOption;
local v7 = v2.GUI.CreateARPanelOption;
local v8 = v2.GUI.CreateARPanelOptions;
v2.GUISettings.APL.DeathKnight = {[LUAOBFUSACTOR_DECRYPT_STR_0("\242\204\214\40\233\181\212", "\126\177\163\187\69\134\219\167")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\22\222\47\225\249\37\200\36\214\245\53\200\57", "\156\67\173\74\165")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\28\178\72\26\168\46\85\32\184\71\19\148\22", "\38\84\215\41\118\220\70")]=(76 - 26),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\19\35\30\206\95\2\10\34", "\158\48\118\66\114")]=(1622 - (585 + 1037)),[LUAOBFUSACTOR_DECRYPT_STR_0("\155\44\25\55\127\141\203", "\155\203\68\112\86\19\197")]=(1061 - (346 + 715)),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\206\51\216\69\121\241\240\117\201\36\245\75\125\205\200", "\152\38\189\86\156\32\24\133")]=(102 - 42),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\68\162\98\253\69\172\117\233\84\164\73\238\127\151", "\38\156\55\199")]=(1236 - (1074 + 82)),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\126\121\42\28\97\244\71\142\114\110\60\26\96\239\71\173\85\76", "\35\200\29\28\72\115\20\154")]=(65 - 35),[LUAOBFUSACTOR_DECRYPT_STR_0("\53\182\210\215\143\35\38\23\186\249\239", "\84\121\223\177\191\237\76")]=(1814 - (214 + 1570)),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\88\221\169\23\81\55\200\184\101\193\165\54\92\24\241", "\161\219\54\169\192\90\48\80")]=(1495 - (990 + 465)),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\71\1\49\65\114\1\38\93\106\48", "\69\41\34\96")]=(17 + 23),[LUAOBFUSACTOR_DECRYPT_STR_0("\153\205\214\8\14\46\184", "\75\220\163\183\106\98")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\50\181\159\62\214\12\169", "\185\98\218\235\87")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\255\51\55\210\204\163\197\55\34\242", "\202\171\92\71\134\190")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\11\206\56\156\38\204\24\154\32\207\39\141\61", "\232\73\161\76")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\137\216\65\84\31\183\202", "\126\219\185\34\61")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\37\218\91\127\109", "\135\108\174\62\18\30\23\147")]=true},[LUAOBFUSACTOR_DECRYPT_STR_0("\146\224\57\219\20\175\42\244\162\240\38\206", "\167\214\137\74\171\120\206\83")]={}},[LUAOBFUSACTOR_DECRYPT_STR_0("\169\252\61\82\252", "\199\235\144\82\61\152")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\53\3\183\46\51\23\169\31\15\4\188\56\15\25\181\47", "\75\103\118\217")]=(29 + 36),[LUAOBFUSACTOR_DECRYPT_STR_0("\238\87\117\22\182\11\201\80\86\27\171\10\206\64\101\16\188\42\207\70\117\7\177\17\203\80", "\126\167\52\16\116\217")]=(30 + 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\254\47\45\144\189\11\245\203\12\44\143\187\29\200\192\60\37\147\188\22\240\204", "\156\168\78\64\224\212\121")]=(196 - 146),[LUAOBFUSACTOR_DECRYPT_STR_0("\37\225\171\203\20\250\170\220\10\222\170\217\2\252", "\174\103\142\197")]=(1776 - (1668 + 58)),[LUAOBFUSACTOR_DECRYPT_STR_0("\98\39\79\12\55\87\246\93\45\75\16\21", "\152\54\72\63\88\69\62")]=(626 - (512 + 114)),[LUAOBFUSACTOR_DECRYPT_STR_0("\246\203\250\104\198\205\224\87\209\208\198\108", "\60\180\164\142")]=(0 - 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\87\11\32\42\248\31\106\110", "\114\56\62\101\73\71\141")]=(0 - 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\250\222\229\186\230\214\232\177\228\217\224\189\239\222\202\171\224\205\193", "\164\216\137\187")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\246\227\55\183\168\237\2\196\227\29\187\181\234", "\107\178\134\81\210\198\158")]="This is not currently functional!!!//n123 , 456",[LUAOBFUSACTOR_DECRYPT_STR_0("\8\1\150\207\165\54\58\155\214\175", "\202\88\110\226\166")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\240\10\142\242\201\215\10\134", "\170\163\111\226\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\63\165\61\92", "\73\113\80\210\88\46\87")},[LUAOBFUSACTOR_DECRYPT_STR_0("\165\37\222\2\235\128\53\254\6\254\141\41", "\135\225\76\173\114")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\61\206\156\177\191\146\161\28\202\155\148", "\199\122\141\216\208\204\221")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\130\219\22\215\91\210\172\206\63\246\126\209\142\249", "\150\205\189\112\144\24")]={}},[LUAOBFUSACTOR_DECRYPT_STR_0("\3\150\176\95\16", "\112\69\228\223\44\100\232\113")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\224\30\21\212\179\104\181\195\30\23", "\230\180\127\103\179\214\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("\173\16\75\73\215\86\225\156", "\128\236\101\63\38\132\33"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\132\34\101\180\248\192\190\171\33\65\164\232\202\162\189", "\175\204\201\113\36\214\139")]=(0 - 0),[LUAOBFUSACTOR_DECRYPT_STR_0("\119\195\33\213\11\73\248\44\204\1", "\100\39\172\85\188")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\158\125\181\133\48\185\125\189", "\83\205\24\217\224")]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\202\218\56\244", "\93\134\165\173")},[LUAOBFUSACTOR_DECRYPT_STR_0("\147\251\207\203\55\219\191\92\177\193", "\30\222\146\161\162\90\174\210")]=(28 + 32),[LUAOBFUSACTOR_DECRYPT_STR_0("\193\71\99\26\233\79\105\57\241\87\124\15", "\106\133\46\16")]={},[LUAOBFUSACTOR_DECRYPT_STR_0("\127\3\87\253\73\111\94\38\84\223\126", "\32\56\64\19\156\58")]={}},[LUAOBFUSACTOR_DECRYPT_STR_0("\111\198\237\89\86\235", "\224\58\168\133\54\58\146")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\125\95\88\252\119\138\130\42\86\66\111", "\107\57\54\43\157\21\230\231")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\235\132\5\252\182\210\251\194\155\20", "\175\187\235\113\149\217\188")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\15\170\141\73\224\109\125\56", "\24\92\207\225\44\131\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\123\220\175\73\9", "\29\43\179\216\44\123")},[LUAOBFUSACTOR_DECRYPT_STR_0("\142\216\35\124\188\218\8\124", "\44\221\185\64")]=(6 + 24),[LUAOBFUSACTOR_DECRYPT_STR_0("\53\230\90\88\118\21\212\95\94\99", "\19\97\135\40\63")]=LUAOBFUSACTOR_DECRYPT_STR_0("\143\73\39\52\28\38\175\76", "\81\206\60\83\91\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\111\132\241\81\11", "\196\46\203\176\18\79\163\45")]=LUAOBFUSACTOR_DECRYPT_STR_0("\155\6\109", "\143\216\66\30\126\68\155"),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\255\46\239", "\129\202\168\109\171\165\195\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\124\36", "\134\66\56\87\184\190\116"),[LUAOBFUSACTOR_DECRYPT_STR_0("\15\22\42\159", "\85\92\81\105\219\121\139\65")]=LUAOBFUSACTOR_DECRYPT_STR_0("\222\151\67", "\191\157\211\48\37\28"),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\62\215\56", "\90\191\127\148\124")]=LUAOBFUSACTOR_DECRYPT_STR_0("\91\163\61", "\119\24\231\78"),[LUAOBFUSACTOR_DECRYPT_STR_0("\166\25\134\110", "\113\226\77\197\42\188\32")]=LUAOBFUSACTOR_DECRYPT_STR_0("\25\50\231", "\213\90\118\148"),[LUAOBFUSACTOR_DECRYPT_STR_0("\122\30\151\114", "\45\59\78\212\54")]=LUAOBFUSACTOR_DECRYPT_STR_0("\51\114\144", "\144\112\54\227\235\230\78\205"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\11\43\253\195\116\181\46\40\223\244", "\59\211\72\111\156\176")]={}}};
v2.GUI.LoadSettingsRecursively(v2.GUISettings);
local v10 = v2.GUI.Panel;
local v11 = v5(v10, LUAOBFUSACTOR_DECRYPT_STR_0("\106\130\226\57\70\172\237\36\73\143\247", "\77\46\231\131"));
local v12 = v5(v11, LUAOBFUSACTOR_DECRYPT_STR_0("\152\88\185\79\190", "\32\218\52\214"));
local v13 = v5(v11, LUAOBFUSACTOR_DECRYPT_STR_0("\104\5\62\187\229", "\58\46\119\81\200\145\208\37"));
local v14 = v5(v11, LUAOBFUSACTOR_DECRYPT_STR_0("\30\130\56\163\165\164", "\86\75\236\80\204\201\221"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\81\73\114\134\245\169\103\85\99\138\240", "\235\18\33\23\229\158"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\113\138\237\245\116\191\192\175\88\145\207\178\87\178\213\245\115\181\204\182\95\180\210\245\101\169\196\159\85\188\196\181\67\179\215\190\67", "\219\48\218\161"), LUAOBFUSACTOR_DECRYPT_STR_0("\209\98\121\9\255\74\230\225\127\111\64\205\74\243", "\128\132\17\28\41\187\47"), LUAOBFUSACTOR_DECRYPT_STR_0("\53\61\1\61\81\4\114\9\52\29\21\61\70\41\85\14\37\70\30\88\7\55\8\41\84\23\55\70\27\95\8\62\15\46\84\4\33", "\61\97\82\102\90"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\159\34\162\79\194\69", "\105\204\78\203\43\167\55\126"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\132\154\15\80\55\1\198\69\173\129\45\23\20\12\211\31\134\165\46\19\28\10\212\31\141\175\34\18\7\12\212\69\170\164\38\54\35", "\49\197\202\67\126\115\100\167"), {(0 - 0),(1569 - (1269 + 200)),(816 - (98 + 717))}, LUAOBFUSACTOR_DECRYPT_STR_0("\31\94\222\37\148\94\77\35\84\209\44\192\126\110\119\30", "\62\87\59\191\73\224\54"), LUAOBFUSACTOR_DECRYPT_STR_0("\212\7\238\137\243\10\255\137\207\50\186\221\239\16\255\218\239\13\246\205\167\22\245\137\242\17\255\137\207\7\251\197\243\10\233\221\232\12\255", "\169\135\98\154"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\248\123\45\80\248\33", "\168\171\23\68\52\157\83"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\213\65\217\227\1\40\134\224\121\222\163\44\42\143\224\63\214\162\40\32\136\250\98\187\133\32\44\139\196\126\225\133\21", "\231\148\17\149\205\69\77"), {(0 - 0),(15 + 85),(0 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\168\162\198\247\94\241\135\231\247\244\67\246\143\169\135\211\103\191\197", "\159\224\199\167\155\55"), LUAOBFUSACTOR_DECRYPT_STR_0("\196\246\40\146\227\251\57\146\223\195\124\198\255\225\57\193\255\252\48\214\183\231\51\146\226\224\57\146\223\246\61\222\254\253\59\146\199\252\40\219\248\253", "\178\151\147\92"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\191\241\69\54\23\94", "\26\236\157\44\82\114\44"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\11\30\249\21\14\43\212\79\34\5\219\82\45\38\193\21\9\33\216\86\37\32\198\21\26\38\220\90\38\6\229", "\59\74\78\181"), {(0 - 0),(36 + 64),(0 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\21\217\83\91\191\101\222\92\26\128\32\195\95\84\186\49\200\26\114\131\101\148", "\211\69\177\58\58"), LUAOBFUSACTOR_DECRYPT_STR_0("\132\224\109\181\253\195\178\165\81\197\169\223\191\247\124\230\225\196\187\225\57\225\230\139\162\246\124\181\217\195\190\228\117\181\230\205\247\214\124\231\236\197\190\241\96", "\171\215\133\25\149\137"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\210\196\59\254\234\34", "\34\129\168\82\154\143\80\156"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\164\130\31\69\108\75\136\145\186\24\5\65\73\129\145\252\16\4\69\67\134\139\161\125\62\91\75\173\128\179\39\3\123\90\155\140\185\54\35\120", "\233\229\210\83\107\40\46"), {(0 + 0),(485 - 385),(1 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\229\71\51\194\13\129\113\38\196\12\202\71\114\254\53\129\7", "\101\161\34\82\182"), LUAOBFUSACTOR_DECRYPT_STR_0("\219\8\77\190\207\234\135\110\192\61\25\234\211\240\135\61\224\2\85\250\155\246\141\110\253\30\92\190\255\231\131\58\224\77\106\234\201\235\137\43", "\78\136\109\57\158\187\130\226"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\13\51\240\245\59\45", "\145\94\95\153"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\220\253\56\155\106\178\252\217\28\254\64\190\250\197\0\155\109\184\240\192\27\219\93\249\200\222\17\241\79\165\246\254\1\214\77\184\239\229\36", "\215\157\173\116\181\46"), {(0 + 0),(426 - (192 + 134)),(1 + 0)}, "Death Strike w/ Dark Succor HP %", LUAOBFUSACTOR_DECRYPT_STR_0("\6\177\159\178\206\61\177\203\218\234\117\160\131\224\223\38\188\132\254\222\117\160\132\178\207\38\177\203\214\223\52\160\131\178\233\33\166\130\249\223\117\160\132\178\249\58\186\152\231\215\48\244\175\243\200\62\244\184\231\217\54\187\153", "\186\85\212\235\146"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\241\141\31\250\60\252", "\56\162\225\118\158\89\142"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\125\53\236\225\6\221\93\17\200\132\44\209\91\13\212\225\1\215\81\8\207\161\49\150\117\6\197\173\45\205\82\1\230\160\48\204\85\17\213\171\39\240\108", "\184\60\101\160\207\66"), {(0 + 0),(651 - (83 + 468)),(4 - 3)}, LUAOBFUSACTOR_DECRYPT_STR_0("\24\129\121\190\62\151\114\184\113\164\115\174\37\139\104\169\53\135\60\148\1\194\57", "\220\81\226\28"), LUAOBFUSACTOR_DECRYPT_STR_0("\32\208\150\187\254\207\22\149\170\203\170\211\27\199\135\232\226\200\31\209\194\239\229\135\6\198\135\187\195\196\22\215\141\238\228\195\83\243\141\233\254\206\7\192\134\254", "\167\115\181\226\155\138"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\209\46\238\88\126\99", "\166\130\66\135\60\27\17"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\101\122\226\59\20\65\75\218\125\27\74\67\201\125\36\10\105\193\120\61\75\68\221\59\28\77\73\198\119\63\86\68\203\93\0", "\80\36\42\174\21"), {(0 - 0),(97 + 3),(1 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\98\25\52\114\76\31\37\116\75\80\31\74\14\85", "\26\46\112\87"), LUAOBFUSACTOR_DECRYPT_STR_0("\138\38\191\52\171\183\64\244\145\19\235\96\183\173\64\167\177\44\167\112\255\171\74\244\172\48\174\52\147\182\70\188\187\44\185\122\186", "\212\217\67\203\20\223\223\37"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\137\129\161\214\191\159", "\178\218\237\200"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\151\133\202\158\146\176\231\196\190\158\232\217\177\189\242\158\149\186\235\221\185\187\245\158\151\187\242\217\155\180\225\217\181\134\238\213\186\185\206\224", "\176\214\213\134"), {(0 + 0),(2011 - (340 + 1571)),(1773 - (1733 + 39))}, LUAOBFUSACTOR_DECRYPT_STR_0("\213\163\162\221\229\123\88\243\164\181\148\155\94\92\248\161\246\252\152\22\28", "\57\148\205\214\180\200\54"), LUAOBFUSACTOR_DECRYPT_STR_0("\33\248\33\116\98\26\248\117\28\70\82\233\61\38\115\1\245\58\56\114\82\233\58\116\99\1\248\117\21\120\6\244\120\25\119\21\244\54\116\69\26\248\57\56", "\22\114\157\85\84"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\247\199\26\192\88\228", "\200\164\171\115\164\61\150"), v11, LUAOBFUSACTOR_DECRYPT_STR_0("\159\196\47\11\167\187\245\23\77\168\176\253\4\77\151\240\215\12\72\142\177\250\16\11\167\187\245\23\77\179\191\247\23\109\179", "\227\222\148\99\37"), {(1034 - (125 + 909)),(45 + 55),(1 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\23\87\83\226\241\115\98\83\245\237\115\122\98\182\188", "\153\83\50\50\150"), LUAOBFUSACTOR_DECRYPT_STR_0("\110\115\103\92\103\163\72\29\94\67\92\103\163\95\88\101\123\19\127\175\13\73\121\51\9\96\174\13\121\115\114\8\123\235\125\92\117\103", "\45\61\22\19\124\19\203"));
v8(v11, LUAOBFUSACTOR_DECRYPT_STR_0("\224\34\33\187\38\117\184\213\26\38\251\11\119\177\213\92\46\250\15\125\182\207\1", "\217\161\114\109\149\98\16"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\48\53\44\104\179\122", "\20\114\64\88\28\220"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\21\4\212\177\246\195\180\39\4\254\189\235\196", "\221\81\97\178\212\152\176"), LUAOBFUSACTOR_DECRYPT_STR_0("\239\232\14\232\90\233\226\27\254\20\222\238\11\254\90\225\238\14\239", "\122\173\135\125\155"), LUAOBFUSACTOR_DECRYPT_STR_0("\171\209\5\183\44\113\220\140\196\64\181\54\34\220\196\206\6\249\59\52\206\129\207\19\176\41\52\136\151\209\5\181\51\34\136\130\206\18\249\58\53\193\144\200\14\190", "\168\228\161\96\217\95\81"), function()
	KethoEditBox_Show(v2.GUISettings.APL.DeathKnight.Blood.DefensiveList);
end);
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\232\221\39\88\42\69", "\55\187\177\78\60\79"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\12\254\115\165\98\202\129\57\198\116\229\79\200\136\57\128\125\231\73\192\132\99\252\74\229\67\251\129\61\250\87\249\67\220\136\34\194\91", "\224\77\174\63\139\38\175"), {(241 - (46 + 190)),(29 + 71),(731 - (228 + 498))}, LUAOBFUSACTOR_DECRYPT_STR_0("\182\84\86\43\196\117\89\62\196\105\93\47\136\85\80\110\176\73\74\43\151\73\87\34\128", "\78\228\33\56"), LUAOBFUSACTOR_DECRYPT_STR_0("\253\107\181\4\128\221\106\242\49\144\192\123\242\55\132\222\62\165\11\128\192\62\176\6\137\193\105\242\23\141\199\109\242\11\128\207\114\166\11\197\222\123\160\0\128\192\106\179\4\128\128", "\229\174\30\210\99"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\40\225\143\85\232\47", "\89\123\141\230\49\141\93"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\210\65\218\66\52\79\242\101\254\39\30\67\244\121\226\66\50\70\252\126\242\66\57\73\246\115\249\25\30\78\213\126\228\24\25\94\230\117\243\56\24\88\246\98\254\3\28\78", "\42\147\17\150\108\112"), {(3 + 2),(260 - 160),(529 - (303 + 221))}, LUAOBFUSACTOR_DECRYPT_STR_0("\38\165\40\125\232\253\1\162\109\89\232\250\27\175\57\106\227\237\79\142\40\126\235\252\7\230\25\119\245\237\28\174\34\115\227", "\136\111\198\77\31\135"), LUAOBFUSACTOR_DECRYPT_STR_0("\49\28\160\81\184\247\3\233\43\10\162\84\178\241\25\173\66\47\168\68\169\237\3\188\6\12\231\65\181\225\25\233\0\12\171\89\170\164\3\161\11\26\231\94\184\229\27\189\10\73\183\83\175\231\18\167\22\8\160\83\243", "\201\98\105\199\54\221\132\119"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\138\0\138\37\7\39", "\204\217\108\227\65\98\85"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\127\243\217\171\8\197\95\215\253\206\34\201\89\203\225\171\14\204\81\204\241\171\26\193\83\211\252\247\37\195\124\207\250\234\40\244\86\209\240\246\36\207\82\199", "\160\62\163\149\133\76"), {(5 + 0),(412 - 312),(12 - 7)}, LUAOBFUSACTOR_DECRYPT_STR_0("\224\161\0\63\202\196\169\14\111\225\218\175\2\43\131\254\165\12\35\215\222\224\57\39\209\211\179\5\32\207\210", "\163\182\192\109\79"), LUAOBFUSACTOR_DECRYPT_STR_0("\7\51\7\199\240\39\50\64\246\244\57\54\9\210\252\55\102\34\204\250\59\34\64\215\253\49\40\64\194\240\56\41\23\128\225\60\47\19\128\253\49\39\12\212\253\116\54\5\210\246\49\40\20\193\242\49\104", "\149\84\70\96\160"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\11\10\4\233\61\20", "\141\88\102\109"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\146\99\230\62\62\56\84\213\187\120\196\121\29\53\65\143\145\95\197\127\30\115\119\206\189\86\217\100\21\47\88\241\188\68\207\98", "\161\211\51\170\16\122\93\53"), {(17 - 12),(161 - 61),(1249 - (111 + 1137))}, LUAOBFUSACTOR_DECRYPT_STR_0("\217\161\188\45\232\186\189\58\246\238\128\24\187\154\186\58\254\189\186\39\247\170", "\72\155\206\210"), LUAOBFUSACTOR_DECRYPT_STR_0("\107\115\90\27\62\83\119\20\60\3\6\110\91\78\32\82\117\70\11\115\68\127\82\1\33\67\58\65\29\58\72\125\20\44\60\72\127\71\26\60\84\119", "\83\38\26\52\110"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\107\27\46\66\93\5", "\38\56\119\71"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\210\223\116\152\1\83\242\251\80\253\43\95\244\231\76\152\7\90\252\224\92\152\17\89\227\219\74\223\43\93\246\251\112\230", "\54\147\143\56\182\69"), {(0 - 0),(623 - (423 + 100)),(2 - 1)}, LUAOBFUSACTOR_DECRYPT_STR_0("\226\142\239\9\235\196\136\241\66\218\194\193\219\76\217\211\143\236\64\201\211\193\203\65\205\211\146\247\70\211\210", "\191\182\225\159\41"), LUAOBFUSACTOR_DECRYPT_STR_0("\24\23\60\21\159\143\199\107\58\24\21\155\130\208\40\23\38\65\138\128\199\107\6\32\71\142\148\202\36\30\44\21\132\129\130\60\26\45\91\203\147\205\107\7\59\80\203\179\205\59\82\28\71\130\137\201\46\6\102\21\184\130\214\107\6\39\21\219\199\203\45\82\38\90\159\199\198\46\20\45\91\152\142\212\46", "\162\75\114\72\53\235\231"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\191\48\77\230\86\16", "\98\236\92\36\130\51"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\133\41\32\244\97\173\180\36\172\50\2\179\66\160\161\126\134\21\3\181\65\230\151\63\176\45\30\179\75\163\176\36\140\41", "\80\196\121\108\218\37\200\213"), {(771 - (326 + 445)),(222 - 122),(712 - (530 + 181))}, LUAOBFUSACTOR_DECRYPT_STR_0("\34\124\22\107\68\3\202\52\97\11\113\64\11\158\64\87\7\121\78\0\153\9\101\7\63\127\6\152\5\96\10\112\71\10", "\234\96\19\98\31\43\110"), LUAOBFUSACTOR_DECRYPT_STR_0("\53\26\70\135\184\122\142\70\55\98\135\188\119\153\5\26\92\211\173\117\142\70\11\90\213\169\97\131\9\19\86\135\163\116\203\17\23\87\201\236\102\132\70\10\65\194\236\80\132\18\11\93\202\236\70\153\15\17\89\194\184\60\203\53\26\70\135\184\125\203\86\95\91\193\236\124\132\18\95\86\194\170\119\133\21\22\68\194", "\235\102\127\50\167\204\18"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\99\173\252\39\65\60", "\78\48\193\149\67\36"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\17\46\172\86\101\53\31\148\16\106\62\23\135\16\85\126\60\140\23\78\52\80\173\17\79\57\19\149\21\115\0", "\33\80\126\224\120"), {(32 - (19 + 13)),(233 - 133),(1 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\193\161\13\205\81\249\165\67\246\108\172\188\12\132\84\227\164\7", "\60\140\200\99\164"), LUAOBFUSACTOR_DECRYPT_STR_0("\180\241\16\102\182\143\241\68\11\171\137\225\9\51\175\199\198\52\102\182\136\180\23\39\180\130\180\2\41\176\199\208\1\32\167\137\231\13\48\167\148", "\194\231\148\100\70"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\101\68\196\160\253\234\83\88\213\172\248", "\168\38\44\161\195\150"), v12, LUAOBFUSACTOR_DECRYPT_STR_0("\161\204\174\56\20\237\183\2\136\215\140\127\55\224\162\88\162\240\141\121\52\166\131\5\133\221\128\121\61\196\191\27\130\216\135\112\53\230\165\31\150\249", "\118\224\156\226\22\80\136\214"), LUAOBFUSACTOR_DECRYPT_STR_0("\119\253\92\192\99\236\86\141\75\224\88\148\75\225\87\192\110\231\84\130\2\232\86\146\2\202\92\134\71\224\74\133", "\224\34\142\57"), LUAOBFUSACTOR_DECRYPT_STR_0("\233\174\201\209\51\228\78\11\158\134\199\210\126\248\83\15\202\174\202\211\51\221\84\3\220\231\209\210\51\227\88\9\219\169\133\255\124\255\88\29\214\174\192\209\119\177\84\0\205\179\192\220\119\177\82\8\158\178\214\212\125\246\29\8\209\181\133\249\67\194", "\110\190\199\165\189\19\145\61"));
v8(v12, LUAOBFUSACTOR_DECRYPT_STR_0("\251\219\91\166\175\194\219\255\127\195\133\206\221\227\99\166\169\203\213\228\115", "\167\186\139\23\136\235"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\62\167\135\29\30\186\159\3", "\109\122\213\232"), v13, LUAOBFUSACTOR_DECRYPT_STR_0("\207\199\142\126\202\242\163\36\230\220\172\57\233\255\182\126\200\229\173\35\250\185\150\49\252\240\167\36\221\224\163\32", "\80\142\151\194"), {LUAOBFUSACTOR_DECRYPT_STR_0("\46\201\98\95\6\201\97\73\17", "\44\99\166\23"),LUAOBFUSACTOR_DECRYPT_STR_0("\93\226\61\57\0\179\125\231", "\196\28\151\73\86\83")}, LUAOBFUSACTOR_DECRYPT_STR_0("\215\12\29\80\177\72\10\115\242\7\105\61\135\76\16\121\247", "\22\147\99\73\112\226\56\120"), LUAOBFUSACTOR_DECRYPT_STR_0("\155\125\237\250\158\189\53\213\253\132\187\125\162\216\136\172\125\237\241\205\172\122\162\224\158\189\53\246\250\205\171\101\240\240\140\188\53\198\250\185\171", "\237\216\21\130\149"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\177\66\86\91\181\219", "\62\226\46\63\63\208\169"), v13, LUAOBFUSACTOR_DECRYPT_STR_0("\196\41\121\205\59\8\46\74\237\50\91\138\24\5\59\16\195\11\90\144\11\67\2\87\235\16\88\150\18\47\32\109", "\62\133\121\53\227\127\109\79"), {(0 - 0),(191 - 91),(2 - 1)}, LUAOBFUSACTOR_DECRYPT_STR_0("\61\29\60\252\219\187\175\80\38\2\181\208\161\176\80\54\61\230", "\194\112\116\82\149\182\206"), LUAOBFUSACTOR_DECRYPT_STR_0("\10\173\88\88\212\234\11\121\133\69\22\213\239\27\52\232\126\40\128\240\11\40\189\69\10\197\230\78\59\173\74\23\210\231\78\44\187\69\22\199\162\44\54\155", "\110\89\200\44\120\160\130"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\152\207\66\66\70\88", "\45\203\163\43\38\35\42\91"), v13, LUAOBFUSACTOR_DECRYPT_STR_0("\243\181\240\109\163\172\85\198\141\247\45\142\174\92\198\203\250\49\136\186\64\156\164\241\16\166\171\71\221\151\222\19\130\187\87\215\139\200", "\52\178\229\188\67\231\201"), {(0 + 0),(24 + 76),(1 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\0\108\99\68\214\94\48\46\83\82\68\199\89\49\34\68\94\16\246\91\38", "\67\65\33\48\100\151\60"), "Set this to the average percentage of AMS's absorb shield that is actively used on any given cast of AMS. Leave at 0 if unsure.");
v8(v13, LUAOBFUSACTOR_DECRYPT_STR_0("\254\215\130\150\215\218\230\186\208\216\209\238\169\208\231\145\193\188\215\224\203", "\147\191\135\206\184"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\167\32\163\194\211\113\167\144\60\169\207", "\210\228\72\198\161\184\51"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\23\121\223\94\87\203\55\93\251\59\125\199\49\65\231\94\70\192\62\70\255\9\61\234\63\90\242\18\127\203\23\70\231\52", "\174\86\41\147\112\19"), LUAOBFUSACTOR_DECRYPT_STR_0("\127\9\158\10\39\3\20\235\122\15\153\47", "\203\59\96\237\107\69\111\113"), LUAOBFUSACTOR_DECRYPT_STR_0("\0\31\191\224\51\252\210\100\55\190\236\40\176\216\34\86\184\233\52\176\243\33\23\168\161\34\229\208\35\19\191\245\56\255\217\55\88", "\183\68\118\204\129\81\144"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\61\161\121\224\14\144", "\226\110\205\16\132\107"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\202\243\204\151\101\238\194\244\209\106\229\202\231\209\85\165\246\238\209\78\231\218\174\234\64\232\243\225\218\105\219", "\33\139\163\128\185"), {(1858 - (673 + 1185)),(321 - 221),(1 + 0)}, LUAOBFUSACTOR_DECRYPT_STR_0("\100\89\7\158\103\89\7\158\127\104\68\155", "\190\55\56\100"), LUAOBFUSACTOR_DECRYPT_STR_0("\101\170\40\94\7\235\246\22\135\12\94\7\235\225\83\188\52\17\31\231\179\66\160\124\11\0\230\179\101\174\63\12\26\229\250\85\174\48\94\35\226\240\66", "\147\54\207\92\126\115\131"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\41\35\58\109\9\113\26\63", "\30\109\81\85\29\109"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\222\65\120\248\18\219\253\235\121\127\184\63\217\244\235\63\97\184\62\209\240\230\63\117\153\23\253\216", "\156\159\17\52\214\86\190"), {LUAOBFUSACTOR_DECRYPT_STR_0("\131\224\168\175\171\224\171\185\188", "\220\206\143\221"),LUAOBFUSACTOR_DECRYPT_STR_0("\167\104\57\24\235\219\211\150", "\178\230\29\77\119\184\172")}, LUAOBFUSACTOR_DECRYPT_STR_0("\209\177\62\91\68\232\231\187\11\31\55\213\240\170\2\20\115", "\152\149\222\106\123\23"), LUAOBFUSACTOR_DECRYPT_STR_0("\254\46\249\76\166\216\102\193\75\188\222\46\182\110\176\201\46\249\71\245\201\41\182\86\166\216\102\226\76\245\206\54\228\70\180\217\102\210\76\129\206", "\213\189\70\150\35"));
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\107\71\123\24\75\90\99\6", "\104\47\53\20"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\130\124\173\82\152\10\162\88\137\55\178\6\164\68\149\82\137\1\171\67\141\5\242\61\148\111\165", "\111\195\44\225\124\220"), {LUAOBFUSACTOR_DECRYPT_STR_0("\251\98\19", "\203\184\38\96\19\203"),LUAOBFUSACTOR_DECRYPT_STR_0("\10\126\120\77\194\121\80\93\82", "\174\89\19\25\33"),LUAOBFUSACTOR_DECRYPT_STR_0("\14\30\69\79\238\148", "\107\79\114\50\46\151\231")}, LUAOBFUSACTOR_DECRYPT_STR_0("\26\130\166\115\202\24\165\205\32\230\186\47\202\45\191\197\121\130\176\40\142", "\160\89\198\213\73\234\89\215"), "");
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\108\99\187\238\193\71\102\186", "\165\40\17\212\158"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\196\233\36\125\2\224\216\28\59\13\235\208\15\59\50\171\236\6\59\41\233\192\70\0\1\198\253", "\70\133\185\104\83"), {LUAOBFUSACTOR_DECRYPT_STR_0("\39\97\87", "\169\100\37\36\74"),LUAOBFUSACTOR_DECRYPT_STR_0("\51\138\163\92\12\199\129\116\19", "\48\96\231\194"),LUAOBFUSACTOR_DECRYPT_STR_0("\233\86\25\44\0\203", "\227\168\58\110\77\121\184\207")}, LUAOBFUSACTOR_DECRYPT_STR_0("\88\24\172\26\241\254\124\181\116\46\186\68\241\233\100\171\126\124\136\69\176\203\126\171", "\197\27\92\223\32\209\187\17"), "");
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\39\77\204\235\7\80\212\245", "\155\99\63\163"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\163\225\141\195\157\129\131\197\169\166\183\141\133\217\181\195\140\138\138\222\173\148\247\177\163\242\133", "\228\226\177\193\237\217"), {LUAOBFUSACTOR_DECRYPT_STR_0("\23\148\48", "\134\84\208\67"),LUAOBFUSACTOR_DECRYPT_STR_0("\32\161\135\80\31\236\165\120\0", "\60\115\204\230"),LUAOBFUSACTOR_DECRYPT_STR_0("\198\54\252\113\254\41", "\16\135\90\139")}, LUAOBFUSACTOR_DECRYPT_STR_0("\119\80\21\105\14\103\109\89\121\9\61\14\115\121\83\123\31\63\75", "\24\52\20\102\83\46\52"), "");
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\224\61\46\52\11\203\56\47", "\111\164\79\65\68"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\231\233\175\144\10\239\199\205\139\245\32\227\193\209\151\144\27\228\206\214\143\199\96\206\242\250\167", "\138\166\185\227\190\78"), {LUAOBFUSACTOR_DECRYPT_STR_0("\232\80\214", "\121\171\20\165\87\50\67"),LUAOBFUSACTOR_DECRYPT_STR_0("\245\53\184\58\181\66\229\28\170", "\98\166\88\217\86\217"),LUAOBFUSACTOR_DECRYPT_STR_0("\215\250\110\0\159\207", "\188\150\150\25\97\230")}, LUAOBFUSACTOR_DECRYPT_STR_0("\249\173\76\88\76\201\219\155\84\66\56\255\219\135\76\4\3\255\215\136\75\11\3\227", "\141\186\233\63\98\108"), "");
v6(LUAOBFUSACTOR_DECRYPT_STR_0("\213\248\35\166\33\254\253\34", "\69\145\138\76\214"), v14, LUAOBFUSACTOR_DECRYPT_STR_0("\81\255\165\199\155\19\113\219\129\162\177\31\119\199\157\199\138\24\120\192\133\144\241\55\64\236\173", "\118\16\175\233\233\223"), {LUAOBFUSACTOR_DECRYPT_STR_0("\168\160\38", "\29\235\228\85\219\142\235"),LUAOBFUSACTOR_DECRYPT_STR_0("\14\217\187\209\123\14\4\118\46", "\50\93\180\218\189\23\46\71"),LUAOBFUSACTOR_DECRYPT_STR_0("\255\168\76\77\93\207", "\40\190\196\59\44\36\188")}, LUAOBFUSACTOR_DECRYPT_STR_0("\31\97\207\238\186\92\29\51\70\221\184\227\109\30\57", "\109\92\37\188\212\154\29"), "");
v8(v14, LUAOBFUSACTOR_DECRYPT_STR_0("\37\223\136\141\21\95\5\251\172\232\63\83\3\231\176\141\4\84\12\224\168\218", "\58\100\143\196\163\81"));
