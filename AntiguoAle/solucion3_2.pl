:- use_module('pl-man-game/main').
:- dynamic d_estado/1.

hacer(disp):- see(normal,up,'#'),see(normal,down,'#'),retractall(d_estado(_)),assert(d_estado(llave)).
hacer(disp):- see(normal,left,'l'),doAction(get(left)).
hacer(disp):- see(normal,up,'E'),doAction(use(up)).
hacer(disp):- see(normal,left,'E'),doAction(use(left)).
hacer(disp):- see(normal,right,'E'),doAction(use(right)).
hacer(disp):- see(normal,left,'#'),see(normal,down,'#'),retractall(d_estado(_)),assert(d_estado(elE)).
hacer(disp):- see(normal,up-left,'E'),doAction(move(none)).
hacer(disp):- see(normal,up-right,'E'),doAction(move(none)).
hacer(disp):- see(normal,down-left,'E'),doAction(move(none)).
hacer(disp):- see(normal,down-right,'E'),doAction(move(none)).
hacer(disp):- see(normal,right,'.'),doAction(move(right)).
hacer(disp):- see(normal,down,'.'),doAction(move(down)).
hacer(disp):- see(normal,left,'.'),doAction(move(left)).
hacer(disp):- see(normal,up,'.'),doAction(move(up)).
hacer(disp):- see(normal,up,'#'),see(normal,right,' '),doAction(move(left)).
hacer(disp):- see(normal,right,' '),doAction(move(right)).
hacer(disp):- see(normal,up,' '),doAction(move(up)).
hacer(disp):- see(normal,left,' '),doAction(move(left)).



hacer(elE):- see(normal,up,'E'),doAction(use(up)).
hacer(elE):- see(normal,left,'E'),doAction(use(left)).
hacer(elE):- see(normal,right,'E'),doAction(use(right)).
hacer(elE):- see(normal,up-left,'E'),doAction(move(none)).
hacer(elE):- see(normal,up-right,'E'),doAction(move(none)).
hacer(elE):- see(normal,down-left,'E'),doAction(move(none)).
hacer(elE):- see(normal,down-right,'E'),doAction(move(none)).
hacer(elE):- see(normal,down-left,'#'),doAction(move(right)).
hacer(elE):- see(normal,up,'.'),doAction(move(up)),retractall(d_estado(_)),assert(d_estado(disp)).

hacer(llave):- havingObject(appearance('l')),see(normal,up,'#'),see(normal,down,'#'),doAction(drop(left)).
hacer(llave):- see(normal,left,'|'),doAction(use(left)).
hacer(llave):- see(normal,right,'n'),doAction(get(right)).
hacer(llave):- see(normal,right,'.'),doAction(move(right)).
hacer(llave):- see(normal,down,'.'),doAction(move(down)).
hacer(llave):- see(normal,left,'.'),doAction(move(left)).
hacer(llave):- see(normal,up,'.'),doAction(move(down)).
hacer(llave):- see(normal,left,'l'),doAction(move(left)).
hacer(llave):- see(normal,up,' '),see(normal,down,'#'),see(normal,up-left,'#'),doAction(move(left)).
hacer(llave):- see(normal,up,' '),see(normal,down,'#'),doAction(move(right)).
hacer(llave):- see(normal,down,' '),doAction(move(down)).
hacer(llave):- see(normal,left,' '),doAction(move(left)).
hacer(llave):- see(normal,right,' '),doAction(move(right)).

regla(init):- retractall(d_estado(_)),assert(d_estado(disp)).

regla:- d_estado(disp),hacer(disp).
regla:- d_estado(llave),hacer(llave).
regla:- d_estado(elE),hacer(elE).


