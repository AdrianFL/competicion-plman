:- use_module('pl-man-game/main').
regla:- see(normal,down,'o'),doAction(get(down)).
regla:- see(normal,right,'o'),doAction(move(none)).
regla:- see(normal,right,'|'),doAction(use(right)).
regla:- see(normal,right,'.'),doAction(move(right)).
regla:- see(normal,down,'.'),doAction(move(down)).
regla:- see(normal,left,'.'),doAction(move(left)).
regla:- see(normal,right,' '),doAction(move(right)).





