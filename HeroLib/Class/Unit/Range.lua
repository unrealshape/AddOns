local a,b=...local c=HeroDBC.DBC;local d,e=HeroCache,b.Utils;local f=b.Unit;local g,h,i=f.Player,f.Pet,f.Target;local j,k=f.Focus,f.MouseOver;local l,m,n=f.Arena,f.Boss,f.Nameplate;local o,p=f.Party,f.Raid;local q=b.Spell;local r=b.Item;local s=math.random;local pairs=pairs;local t=table.sort;local type=type;local unpack=unpack;local InCombatLockdown=InCombatLockdown;local IsActionInRange=IsActionInRange;local IsItemInRange=IsItemInRange;local IsSpellInRange=IsSpellInRange;local u={Melee={Hostile={RangeIndex={},ItemRange={}},Friendly={RangeIndex={},ItemRange={}}},Ranged={Hostile={RangeIndex={},ItemRange={}},Friendly={RangeIndex={},ItemRange={}}}}do local v={"Melee","Ranged"}for w,x in pairs(v)do local y=c.ItemRange[x]local z,A=u[x].Hostile,u[x].Friendly;z.RangeIndex={unpack(y.Hostile.RangeIndex)}t(z.RangeIndex,e.SortMixedASC)A.RangeIndex={unpack(y.Friendly.RangeIndex)}t(A.RangeIndex,e.SortMixedASC)for B,C in pairs(y.Hostile.ItemRange)do z.ItemRange[B]=C[s(1,#C)]end;for B,C in pairs(y.Friendly.ItemRange)do A.ItemRange[B]=C[s(1,#C)]end end end;function f:IsInRange(D)assert(type(D)=="number","Distance must be a number.")assert(D>=5 and D<=100,"Distance must be between 5 and 100.")local E=self:GUID()if not E then return false end;local F=d.UnitInfo[E]if not F then F={}d.UnitInfo[E]=F end;local G=F.IsInRange;if not G then G={}F.IsInRange=G end;local H=D;local I=G[H]if I==nil then if InCombatLockdown()and not g:CanAttack(self)then return false end;local J=u.Ranged;local K=g:CanAttack(self)and J.Hostile or J.Friendly;local y=K.ItemRange;if not y[D]then local L=K.RangeIndex;for M=#L,1,-1 do local N=L[M]if N==D then break end;if N<D then D=N;break end end end;I=IsItemInRange(y[D],self:ID())G[H]=I end;return I end;function f:IsInMeleeRange(D)assert(type(D)=="number","Distance must be a number.")assert(D>=5 and D<=100,"Distance must be between 5 and 100.")if D~=5 then return self:IsInRange(D-1.5)end;local E=self:GUID()if not E then return false end;if InCombatLockdown()and not g:CanAttack(self)then return false end;local J=u.Melee;local K=g:CanAttack(self)and J.Hostile or J.Friendly;local y=K.ItemRange;return IsItemInRange(y[D],self:ID())end;function f:IsSpellInRange(O)local E=self:GUID()if not E then return false end;if O:BookIndex()==nil then return false end;return IsSpellInRange(O:BookIndex(),O:BookType(),self:ID())==1 end;function f:IsActionInRange(P)return IsActionInRange(P,self:ID())end;local function Q(R,S)if InCombatLockdown()and not g:CanAttack(R)then return 0 end;local J=u.Ranged;local K=g:CanAttack(R)and J.Hostile or J.Friendly;local L=K.RangeIndex;for M=#L-(S and 1 or 0),1,-1 do if not R:IsInRange(L[M])then return S and L[M+1]or L[M]end end end;function f:MinDistance()return Q(self)end;function f:MaxDistance()return Q(self,true)end