local a,b=...local c=HeroDBC.DBC;local d,e=HeroCache,b.Utils;local f=b.Unit;local g,h,i=f.Player,f.Pet,f.Target;local j,k=f.Focus,f.MouseOver;local l,m,n=f.Arena,f.Boss,f.Nameplate;local o,p=f.Party,f.Raid;local q=b.Spell;local r=b.Item;local s=math.random;local pairs=pairs;local t=table.sort;local type=type;local unpack=unpack;local IsActionInRange=IsActionInRange;local IsSpellInRange=IsSpellInRange;local u=LibStub("LibRangeCheck-3.0")local v={Melee={Hostile={RangeIndex={},ItemRange={}},Friendly={RangeIndex={},ItemRange={}}},Ranged={Hostile={RangeIndex={},ItemRange={}},Friendly={RangeIndex={},ItemRange={}}}}do local w={"Melee","Ranged"}for x,y in pairs(w)do local z=c.ItemRange[y]local A,B=v[y].Hostile,v[y].Friendly;A.RangeIndex={unpack(z.Hostile.RangeIndex)}t(A.RangeIndex,e.SortMixedASC)B.RangeIndex={unpack(z.Friendly.RangeIndex)}t(B.RangeIndex,e.SortMixedASC)for C,D in pairs(z.Hostile.ItemRange)do A.ItemRange[C]=D[s(1,#D)]end;for C,D in pairs(z.Friendly.ItemRange)do B.ItemRange[C]=D[s(1,#D)]end end end;function f:IsInRange(E)assert(type(E)=="number","Distance must be a number.")assert(E>=5 and E<=100,"Distance must be between 5 and 100.")local F=self:GUID()if not F then return false end;local G=d.UnitInfo[F]if not G then G={}d.UnitInfo[F]=G end;local H=G.IsInRange;if not H then H={}G.IsInRange=H end;local I=E;local J=H[I]if J==nil then local K=v.Ranged;local L=g:CanAttack(self)and K.Hostile or K.Friendly;local z=L.ItemRange;if not z[E]then local M=L.RangeIndex;for N=#M,1,-1 do local O=M[N]if O==E then break end;if O<E then E=O;break end end end;local P,Q=u:GetRange(self:ID())J=Q and(Q<=E or Q<=10)H[I]=J end;return J end;function f:IsInMeleeRange(E)assert(type(E)=="number","Distance must be a number.")assert(E>=5 and E<=100,"Distance must be between 5 and 100.")if E~=5 then return self:IsInRange(E-1.5)end;local F=self:GUID()if not F then return false end;local K=v.Melee;local L=g:CanAttack(self)and K.Hostile or K.Friendly;local z=L.ItemRange;local P,Q=u:GetRange(self:ID())return Q and(Q<=E or Q<=10)end;function f:IsSpellInRange(R)local F=self:GUID()if not F then return false end;if R:BookIndex()==nil then return false end;return IsSpellInRange(R:BookIndex(),R:BookType(),self:ID())==1 end;function f:IsActionInRange(S)return IsActionInRange(S,self:ID())end;local function T(U,V)local K=v.Ranged;local L=g:CanAttack(U)and K.Hostile or K.Friendly;local M=L.RangeIndex;for N=#M-(V and 1 or 0),1,-1 do if not U:IsInRange(M[N])then return V and M[N+1]or M[N]end end end;function f:MinDistance()return T(self)end;function f:MaxDistance()return T(self,true)end