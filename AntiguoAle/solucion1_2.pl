:- use_module('pl-man-game/main').
regla:- see(normal,left,'\\'),doAction(get(left)).
regla:- see(normal,right,'%'),doAction(use(right)).
regla:- see(normal,up,'.'),doAction(move(up)).
regla:- see(normal,down,'.'),doAction(move(down)).
regla:- see(normal,right,'.'),doAction(move(right)).
regla:- see(normal,left,'.'),doAction(move(left)).
regla:- see(normal,down,' '),doAction(move(down)).
regla:- see(normal,left,' '),doAction(move(left)).
regla:- see(normal,up,' '),doAction(move(up)).
regla:- see(normal,right,' '),doAction(move(right)).










