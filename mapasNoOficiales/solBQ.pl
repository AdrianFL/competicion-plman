:-use_module('pl-man-game/main').
% ( condition -> then_clause ; else_clause )

:- dynamic estado/1.

ce(E):- retractall(estado(_)), assert(estado(E)).

fase2:- not(havingObject), see(normal,here,'*'), doAction(move(right)).
fase2:- not(havingObject), doAction(move(left)).
fase2:- see(normal,here,'*'), doAction(move(right)).
fase2:- doAction(drop(right)).

right:- see(normal,right,' '), doAction(move(right)), ce(fase2).
right:- doAction(move(right)).

rej:- estado(fase2), fase2.
rej:- estado(right), right.

rej:- see(normal,right,'G'), doAction(get(right)).
rej:- see(normal,right,'.'), doAction(move(left)).
rej:- see(normal,left,'#'), doAction(move(right)), ce(right).
rej:- ( see(normal,left,'*') ; see(normal,left,'Ǒ') ), doAction(move(left)).
rej:- doAction(move(none)).


