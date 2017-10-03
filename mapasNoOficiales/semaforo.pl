:-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )

rej:- (see(normal,right,'|');see(normal,here,'|')), doAction(move(right)).
rej:- see(normal,left,'|'), doAction(move(left)).
rej:- doAction(move(none)).
