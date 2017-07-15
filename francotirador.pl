:-use_module('pl-man-game/main').


rej:- havingObject, see(list,left,L), nth0(1,L,'E'), doAction(use(left)).
rej:- havingObject, not(see(normal,up,'#')), doAction(move(up)).
rej:- havingObject, see(normal,up,'#'), not(see(normal,right,'#')), doAction(move(right)).
rej:- havingObject, see(normal,left,'E'), doAction(use(left)).
rej:- see(normal,right,'L'), doAction(get(right)).
rej:- not(see(normal,right,'L')), not(see(normal,right,'#')), doAction(move(right)).
rej:- doAction(move(none)).
