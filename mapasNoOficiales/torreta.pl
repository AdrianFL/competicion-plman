:-use_module('pl-man-game/main').


rej:- not(see(normal,down,'#')), doAction(move(down)).
rej:- see(normal,up,'E'), not(see(normal,left-up,'E')), not(see(normal,left,'E')), doAction(move(left)).
rej:- see(normal,up,'E'), not(see(normal,right-up,'E')), not(see(normal,right,'E')), doAction(move(right)).
rej:- doAction(move(none)), 'pl-man':randomBetween(1,10000,X), X = 1, writeln('@: Me siento seguro').
rej:- see(list,left,L), nth0(2,L,'#'), doAction(move(right)).
rej:- see(list,left,L), nth0(3,L,'#'), doAction(move(left)).
