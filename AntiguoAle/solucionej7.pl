:- use_module('pl-man-game/main').
regla:- see(normal,up,'.'),doAction(move(up)).
regla:- see(normal,left,'E'),doAction(move(none)).
regla:- see(normal,right,'E'),doAction(move(none)).
regla:- see(normal,right,'.'),doAction(move(right)).
regla:- see(normal,left,' '),doAction(move(left)).
regla:- see(normal,down,' '),doAction(move(down)).
regla:- see(normal,down,'.'),doAction(move(down)).


