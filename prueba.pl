   :-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )
rej:- see(normal,right,'+'),doAction(get(right)).
rej:- see(normal,up,'+'),doAction(get(up)).
rej:- havingObject,doAction(drop(up)).
rej:- see(normal,right,'.'),doAction(move(right)).
rej:- ( ( see(normal,down,' ') ; see(normal,down,'.') ) -> doAction(move(down)) ; see(normal,up,' '), doAction(move(up)) ).
