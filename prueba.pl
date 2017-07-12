:-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )


rej:- see(list,down,D), nth0(1,D,'Ͱ'),doAction(move(none)).
rej:- see(normal,left,'L'), doAction(get(left)).
rej:- see(normal,down,'E'), doAction(use(down)).
rej:- see(normal,right,'E'), doAction(use(right)).

rej:- see(normal,left,'E'), doAction(use(left)).

rej:- see(normal,right,'+'),doAction(get(right)).
rej:- see(normal,up,'+'),doAction(get(up)).
rej:- havingObject,doAction(drop(up)).
rej:- see(normal,right,'.'), doAction(move(right)), contarApariencias(right, ['.', '#'], CANTIDAD), CANTIDAD > 3 .
rej:- ( ( see(normal,down,' ') ; see(normal,down,'.') ) -> doAction(move(down)) ; see(normal,up,' '), doAction(move(up)) ).

/*
Utils:

'pl-man':entityLocation(OID, _, _, Ap), % Devuelve X, Y y apariencia del objeto OID
'pl-man':changeEntityAppearance(OID, 'T', Ap). % NewAp, OldAp
'pl-man':changeEntityAppearance(OID, appearance(NewAP, NewAtr, NewTC, NewBC))).
*/
