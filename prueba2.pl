:-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )

rej:- see(normal,right,'.'), doAction(move(right)), contarApariencias(right, ['.', '#'], CANTIDAD), CANTIDAD > 3 .
rej:- ( ( see(normal,down,' ') ; see(normal,down,'.') ) -> doAction(move(down)) ; see(normal,up,' '), doAction(move(up)) ).
