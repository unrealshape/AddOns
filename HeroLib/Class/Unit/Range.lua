local a,b=...local c=HeroDBC.DBC;local d,e=HeroCache,b.Utils;local f=b.Unit;local g,h,i=f.Player,f.Pet,f.Target;local j,k=f.Focus,f.MouseOver;local l,m,n=f.Arena,f.Boss,f.Nameplate;local o,p=f.Party,f.Raid;local q=b.Spell;local r=b.Item;local s=math.random;local pairs=pairs;local t=table.sort;local type=type;local unpack=unpack;local IsActionInRange=IsActionInRange;local IsSpellInRange=IsSpellInRange;local u={Melee={Hostile={RangeIndex={},ItemRange={}},Friendly={RangeIndex={},ItemRange={}}},Ranged={Hostile={RangeIndex={},ItemRange={}},Friendly={RangeIndex={},ItemRange={}}}}local v={}v={WARRIOR={Hostile={RangeIndex={5,8,20,25,30,40},SpellRange={[5]={6572,7384,12294,23881,23922,34428,85288,184367,202168},[8]={5246},[20]={107570},[25]={100,376079},[30]={355,2764,57755,384090},[40]={6544}}},Friendly={}},PALADIN={Hostile={RangeIndex={5,8,10,20,30,40},SpellRange={[5]={35395,53600},[8]={53395,96231},[10]={853},[20]={10326,184575},[30]={20271,24275,31935,62124,183218,275779,375576},[40]={20473}}},Friendly={}},HUNTER={Hostile={RangeIndex={5,8,15,20,30,40,50},SpellRange={[5]={186270,259387},[8]={212436},[15]={269751},[20]={213691},[30]={109248,190925},[40]={75},[50]={34026,321530,360966}}},Friendly={}},ROGUE={Hostile={RangeIndex={5,10,15,20,25,30},SpellRange={[5]={8676,196819},[10]={921},[15]={2094},[20]={271877},[25]={36554},[30]={114014,185565,185763}}},Friendly={}},PRIEST={Hostile={RangeIndex={40},SpellRange={[40]={589,8092}}},Friendly={}},DEATHKNIGHT={Hostile={RangeIndex={5,8,15,30,40},SpellRange={[5]={49020,85948,195182},[8]={207230},[15]={47528},[30]={49576},[40]={305392}}},Friendly={}},SHAMAN={Hostile={RangeIndex={5,20,30,40},SpellRange={[5]={17364},[20]={305483},[30]={57994},[40]={188196}}},Friendly={}},MAGE={Hostile={RangeIndex={35,40},SpellRange={[35]={31589},[40]={2139}}},Friendly={}},WARLOCK={Hostile={RangeIndex={20,30,40},SpellRange={[20]={6789},[30]={710},[40]={686,980,29722}}},Friendly={}},MONK={Hostile={RangeIndex={5,8,9,15,20,30,40},SpellRange={[5]={100780},[8]={113656},[9]={392983},[15]={121253},[20]={115078,122470},[30]={324312},[40]={117952}}},Friendly={}},DRUID={Hostile={RangeIndex={5,13,20,25,40},SpellRange={[5]={5221,6807},[13]={106839},[20]={33786},[25]={16979,49376,102383,102401},[40]={2908,8921,197628}}},Friendly={}},DEMONHUNTER={Hostile={RangeIndex={5,15,50},SpellRange={[5]={162794,228477},[15]={232893},[50]={370965}}},Friendly={}},EVOKER={Hostile={RangeIndex={25},SpellRange={[25]={361469,369819}}},Friendly={RangeIndex={25},SpellRange={[25]={361469}}}}}function f:IsInRange(w)assert(type(w)=="number","Distance must be a number.")assert(w>=5 and w<=100,"Distance must be between 5 and 100.")local x=self:GUID()if not x then return false end;local y=d.UnitInfo[x]if not y then y={}d.UnitInfo[x]=y end;local z=y.IsInRange;if not z then z={}y.IsInRange=z end;local A=w;local B=z[A]if B==nil then local C=d.Persistent.Player.Class[2]local D=g:CanAttack(self)and v[C].Hostile or v[C].Friendly;if not D.RangeIndex then return false end;local E=D.SpellRange;local F=nil;local G=D.RangeIndex;for H=#G,1,-1 do local I=G[H]if I<=w then for J,K in pairs(E[I])do if q(K):IsLearned()then F=q(K)break end end;w=I-1 end;if F then break end end;if not F then return false end;B=self:IsSpellInRange(F)z[A]=B end;return B end;function f:IsInMeleeRange(w)assert(type(w)=="number","Distance must be a number.")assert(w>=5 and w<=100,"Distance must be between 5 and 100.")if w~=5 then return self:IsInRange(w-1.5)end;local x=self:GUID()if not x then return false end;local C=d.Persistent.Player.Class[2]local D=g:CanAttack(self)and v[C].Hostile or v[C].Friendly;if not D.RangeIndex then return false end;local E=D.SpellRange[w]local F=nil;for J,K in pairs(E)do if q(K):IsLearned()then F=q(K)return self:IsSpellInRange(F)end end;return false end;function f:IsSpellInRange(L)local x=self:GUID()if not x then return false end;if L:BookIndex()==nil then return false end;return IsSpellInRange(L:BookIndex(),L:BookType(),self:ID())==1 end;function f:IsActionInRange(M)return IsActionInRange(M,self:ID())end;local function N(O,P)local Q=u.Ranged;local D=g:CanAttack(O)and Q.Hostile or Q.Friendly;local G=D.RangeIndex;for H=#G-(P and 1 or 0),1,-1 do if not O:IsInRange(G[H])then return P and G[H+1]or G[H]end end end;function f:MinDistance()return N(self)end;function f:MaxDistance()return N(self,true)end