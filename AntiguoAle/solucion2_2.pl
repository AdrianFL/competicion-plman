:- use_module('pl-man-game/main').

llevando(nada):- see(normal,left,'l'),doAction(get(left)).
llevando(nada):- see(normal,left,'-'),doAction(get(left)).
llevando(nada):- see(normal,right,'.'),doAction(move(right)).
llevando(nada):- see(normal,down,'.'),doAction(move(down)).
llevando(nada):- see(normal,left,'.'),doAction(move(left)).
llevando(nada):- see(normal,up,'.'),doAction(move(up)).
llevando(nada):- see(normal,up,' '),doAction(move(up)).
llevando(nada):- see(normal,right,' '),doAction(move(right)).
llevando(nada):- see(normal,down,' '),doAction(move(down)).

llevando(l):-see(normal,up,'E'),doAction(use(up)).
llevando(l):-see(normal,right,'E'),doAction(use(right)).
llevando(l):-see(normal,up-right,'E'),doAction(move(none)).
llevando(l):-see(normal,up,'#'),see(normal,right-down,'.'),see(normal,left-down,' '),doAction(move(down)).
llevando(l):-see(normal,up,'#'),see(normal,right-down,'.'),see(normal,left-down,'#'),doAction(move(none)).
llevando(l):-see(normal,left,'.'),doAction(move(left)).
llevando(l):-see(normal,right,'.'),doAction(move(right)).
llevando(l):-see(normal,down,'.'),doAction(move(down)).
llevando(l):-see(normal,up,'.'),doAction(move(up)).
llevando(l):-see(normal,left,' '),doAction(move(left)).


llevando(-):-see(normal,down,'_'),doAction(use(down)).
llevando(-):-see(normal,up,'E'),doAction(move(left)).
llevando(-):-see(normal,left,'E'),doAction(move(down)).
llevando(-):-see(normal,left,'.'),doAction(move(left)).
llevando(-):-see(normal,down,'.'),doAction(move(down)).
llevando(-):-see(normal,right,'.'),doAction(move(right)).
llevando(-):-see(normal,up,'.'),doAction(move(up)).
llevando(-):-see(normal,up,'#'),see(normal,right,'#'),doAction(move(down)).
llevando(-):-see(normal,up-right,'#'),see(normal,up,' '),doAction(move(right)).
llevando(-):-see(normal,left,' '),doAction(move(left)).
llevando(-):-see(normal,up,' '),doAction(move(up)).
llevando(-):-see(normal,right,' '),doAction(move(right)).
llevando(-):-see(normal,down,' '),doAction(move(down)).

regla:- havingObject(appearance('l')), llevando(l).
regla:- havingObject(appearance('-')), llevando(-).
regla:- not(havingObject), llevando(nada).








