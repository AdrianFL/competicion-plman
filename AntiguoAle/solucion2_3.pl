:- use_module('pl-man-game/main').

llevando(nada):- see(normal,left,'º'),see(normal,up,' '),doAction(move(right)).
llevando(nada):- see(normal,left,'º'),doAction(get(left)).
llevando(nada):- see(normal,right,'a'),doAction(get(right)).
llevando(nada):- see(normal,up,'r'),doAction(get(up)).
llevando(nada):- see(normal,right,'a'),doAction(move(right)).
llevando(nada):- see(normal,up-left,'|'),doAction(move(right)).
llevando(nada):- see(normal,down-right,'|'),doAction(move(left)).
llevando(nada):- see(normal,right,'|'),doAction(move(none)).
llevando(nada):- see(normal,left,'|'),doAction(move(none)).
llevando(nada):- see(normal,left,'E'),see(normal,up,'#'),doAction(move(right)).
llevando(nada):- see(normal,left,'E'),doAction(move(none)).
llevando(nada):- see(normal,right,'E'),doAction(move(none)).

llevando(nada):- see(normal,right,'.'),doAction(move(right)).
llevando(nada):- see(normal,down,'.'),doAction(move(down)).
llevando(nada):- see(normal,left,'.'),doAction(move(left)).
llevando(nada):- see(normal,up,'.'),doAction(move(up)).

llevando(nada):- see(normal,left,' '),doAction(move(left)).
llevando(nada):- see(normal,up,' '),doAction(move(up)).
llevando(nada):- see(normal,right,' '),doAction(move(right)).
llevando(nada):- see(normal,down,' '),doAction(move(down)).



llevando(º):-see(normal,up,' '),see(normal,down,'#'),doAction(drop(left)).
llevando(º):-see(normal,right,'r'),doAction(move(right)).
llevando(º):-see(normal,down-right,'a'),doAction(move(right)).
llevando(º):-see(normal,down,'a'),doAction(move(down)).
llevando(º):-see(normal,left,' '),doAction(move(left)).
llevando(º):-see(normal,down,' '),doAction(move(down)).


llevando(a):-see(normal,left,'|'),doAction(use(left)).
llevando(a):-see(normal,right,'.'),see(normal,down-left,'#'),doAction(drop(down)).
llevando(a):-see(normal,down,'.'),doAction(move(down)).
llevando(a):-see(normal,left,'.'),doAction(move(left)).
llevando(a):-see(normal,right,'.'),doAction(move(right)).
llevando(a):-see(normal,up,'.'),doAction(move(up)).
llevando(a):-see(normal,right,' '),doAction(move(right)).



llevando(r):-see(normal,left,'|'),doAction(use(left)).
llevando(r):-see(normal,left,'º'),doAction(drop(right)).

llevando(r):-see(normal,left,'.'),doAction(move(left)).
llevando(r):-see(normal,down,'.'),doAction(move(down)).
llevando(r):-see(normal,right,'.'),doAction(move(right)).
llevando(r):-see(normal,up,'.'),doAction(move(up)).
llevando(r):-see(normal,left,' '),see(normal,down-left,'#'),see(normal,down,' '),doAction(move(down)).
llevando(r):-see(normal,left,' '),doAction(move(left)).
llevando(r):-see(normal,down,' '),doAction(move(down)).
llevando(r):-see(normal,right,' '),doAction(move(right)).
llevando(r):-see(normal,up,' '),doAction(move(up)).

regla:- havingObject(appearance('a')), llevando(a).
regla:- havingObject(appearance('r')), llevando(r).
regla:- havingObject(appearance('º')), llevando(º).
regla:- not(havingObject), llevando(nada).








