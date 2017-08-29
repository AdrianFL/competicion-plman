:-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )

rej:- havingObject,see(normal,down-right,'A'),doAction(drop(right)).
rej:- see(normal,left,'+'),doAction(get(left)).
rej:- see(normal,right,'+'),doAction(move(left)).
rej:- doAction(move(none)).
%rej:- see(normal,right,'.'), doAction(move(right)), contarApariencias(right, ['.', '#'], CANTIDAD), CANTIDAD > 3 .
%rej:- ( ( see(normal,down,' ') ; see(normal,down,'.') ) -> doAction(move(down)) ; see(normal,up,' '), doAction(move(up)) ).
