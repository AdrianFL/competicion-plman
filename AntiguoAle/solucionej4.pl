:- use_module('pl-man-game/main').
regla:- see(normal,left,'.'),doAction(move(left)).
regla:- see(normal,left,'U'),doAction(get(left)).
regla:- see(normal,right,' '),doAction(drop(right)).
regla:- see(normal,left,'V'),doAction(get(left)).

