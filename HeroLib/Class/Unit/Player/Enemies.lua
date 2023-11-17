local a,b=...local c,d=HeroCache,b.Utils;local e=b.Unit;local f,g,h=e.Player,e.Pet,e.Target;local i,j=e.Focus,e.MouseOver;local k,l,m=e.Arena,e.Boss,e.Nameplate;local n,o=e.Party,e.Raid;local p=b.Spell;local q=b.Item;local pairs=pairs;local r=table.insert;local s=table.sort;local t=table.wipe;local u=c.Enemies.ItemAction;local v=c.Enemies.Melee;local w=c.Enemies.Ranged;local x=c.Enemies.SpellAction;local y=c.Enemies.Spell;local z={"Arena","Boss","Nameplate"}local function A(B,C)local D={}for E,F in pairs(z)do local G=e[F]for E,H in pairs(G)do local I=H:GUID()if not D[I]and H:Exists()and not H:IsBlacklisted()and not H:IsUserBlacklisted()and not H:IsDeadOrGhost()and f:CanAttack(H)and C(H)then r(B,H)D[I]=true end end end end;do local J={}function f:GetEnemiesInRange(K,p)local L=w;if L[K]then return L[K]end;local B={}L[K]=B;if#L>=1 then local M={}for N,E in pairs(L)do if N>=K then r(M,N)end end;if#M>=1 then if#M>=2 then s(M,d.SortASC)end;for E,H in pairs(L[M[1]])do if H:IsInRange(K)or p and H:IsSpellInRange(p)then r(B,e)end end;return B end end;local C=J[K]if not C then C=function(H)return H:IsInRange(K)end;J[K]=C end;A(B,C)return B end end;do local J={}function f:GetEnemiesInMeleeRange(K,p)local L=v;if L[K]then return L[K]end;local B={}L[K]=B;local C=J[K]if not C then C=function(H)return H:IsInMeleeRange(K)or p and H:IsSpellInRange(p)end;J[K]=C end;A(B,C)return B end end;do local O={}function f:GetEnemiesInSpellRange(P)local Q=P.SpellID;local L=y;if L[Q]then return L[Q]end;local B={}L[Q]=B;local C=O[Q]if not C then C=function(H)return H:IsInSpellRange(P)end;O[Q]=C end;A(B,C)return B end end;do local O={}function f:GetEnemiesInItemActionRange(R)local Q=R.ItemID;local L=u;if L[Q]then return L[Q]end;local B={}L[Q]=B;local C=O[Q]if not C then C=function(H)return H:IsItemInActionRange(R)end;O[Q]=C end;A(B,C)return B end end;do local O={}function f:GetEnemiesInSpellActionRange(P)local Q=P.SpellID;local L=x;if L[Q]then return L[Q]end;local B={}L[Q]=B;local C=O[Q]if not C then C=function(H)return H:IsSpellInActionRange(P)end;O[Q]=C end;A(B,C)return B end end