%% @doc @todo Add description to lib_misc.


-module(lib_misc).

%% ====================================================================
%% API functions
%% ====================================================================
-export([for/3,qsort/1,pythag/1,perms/1,max/2]).

%% ====================================================================
%% Internal functions
%% ====================================================================

for(Max,Max,F)	->
	[F(Max)];
for(I,Max,F) ->
	[F(I)|for((I+1),Max,F)].

qsort([]) ->
	[];
qsort([Pivot|T]) ->
	qsort([X || X <- T , X < Pivot]) ++ [Pivot] ++ qsort([X || X <- T , X >= Pivot]). 

%% 比达哥斯拉三元组

pythag(N) ->
	[{A,B,C} || 
	 	A <- lists:seq(1, N),
		B <- lists:seq(1, N),
		C <- lists:seq(1, N),
		A + B + C =< N,
		A * A + B * B =:= C * C
	 ]	.
	
%% 变位词

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

%% 两个数的大小
max(X,Y) when X > Y ->
	X;
max(_,Y) ->
	Y.







