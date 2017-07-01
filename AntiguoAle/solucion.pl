:- use_module('pl-man-game/main').
regla:- see(normal,right,'.'),doAction(move(right)).
regla:- see(normal,down,'.'),doAction(move(down)).
regla:- see(normal,left,'.'),doAction(move(left)).


