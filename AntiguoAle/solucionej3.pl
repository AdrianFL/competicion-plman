:- use_module('pl-man-game/main').
regla:- see(normal,left,'.'),doAction(move(left)).
regla:- see(normal,left,'a'),doAction(get(left)).
regla:- see(normal,down,'-'),doAction(use(down)).
regla:- see(normal,down,'.'),doAction(move(down)).
regla:- see(normal,right,'.'),doAction(move(right)).
