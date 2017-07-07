   :-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )

%contarApariencias(D, S, C):-
%	C is 0,
%	see(list,D,Lista),

%	forall
%	( nth0(_,Lista,S),
%		(
				
%			C is C+1			

%		)


%	).

rej:- see(normal,right,'+'),doAction(get(right)).
rej:- see(normal,up,'+'),doAction(get(up)).
rej:- havingObject,doAction(drop(up)).
%rej:- see(normal,right,'.'), doAction(move(right)), contarApariencias(right,'.', CONTADOR), CONTADOR > 3 .
rej:- ( ( see(normal,down,' ') ; see(normal,down,'.') ) -> doAction(move(down)) ; see(normal,up,' '), doAction(move(up)) ).
