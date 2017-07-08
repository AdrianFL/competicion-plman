:-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )



rej:- see(normal,left,'L'), doAction(get(left)).
rej:- see(normal,down,'E'), doAction(use(down)).
rej:- see(normal,right,'E'), doAction(use(right)).
rej:- see(normal,left,'E'), doAction(use(left)).

rej:- see(normal,right,'+'),doAction(get(right)).
rej:- see(normal,up,'+'),doAction(get(up)).
rej:- havingObject,doAction(drop(up)).
rej:- see(normal,right,'.'), doAction(move(right)), contarApariencias(right, ['.', '#'], CANTIDAD), CANTIDAD > 3 .
rej:- ( ( see(normal,down,' ') ; see(normal,down,'.') ) -> doAction(move(down)) ; see(normal,up,' '), doAction(move(up)) ).
