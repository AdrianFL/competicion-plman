:- use_module('pl-man-game/main').
regla:- see(normal,up,'.'),doAction(move(up)).
regla:- see(normal,down,'.'),doAction(move(down)).
regla:- see(normal,down,'l'),doAction(get(down)).
regla:- see(normal,up,' '),doAction(move(up)).
regla:- see(normal,right,'E'),doAction(use(right)).
regla:- see(normal,right,'.'),doAction(move(right)).





