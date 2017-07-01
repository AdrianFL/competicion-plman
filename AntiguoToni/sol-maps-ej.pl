:-use_module('pl-man-game/main').


% reglas que resuelven el mapa, por ejemplo
rej1:- see(normal,right,'.'), doAction(move(right)).
rej1:- see(normal,down,'.'), doAction(move(down)).
rej1:- see(normal,left,'.'), doAction(move(left)).


rej2:- see(normal,right,'.'), doAction(move(right)).
rej2:- see(normal,down,'.'), doAction(move(down)).
rej2:- see(normal,left,'.'), doAction(move(left)).
rej2:- see(normal,up,'.'), doAction(move(up)).

rej3:- see(normal,left,'.'), doAction(move(left)).
rej3:- see(normal,right,'.'), doAction(move(right)).
rej3:- see(normal,left,'a'), doAction(get(left)).
rej3:- see(normal,down,'-'), doAction(use(down)).
rej3:- see(normal,down,'.'), doAction(move(down)).
rej3:- see(normal,left,'.'), doAction(get(left)).


rej4:- see(normal,left,'.'), doAction(move(left)).
rej4:- see(normal,left,'U'), doAction(get(left)).
rej4:- see(normal,right,'U'), doAction(get(left)).
rej4:- see(normal,left,'V'), doAction(drop(right)).
rej4:- see(normal,left,'.'), doAction(drop(right)).

rej5:- see(normal,right,'.'), doAction(move(right)).
rej5:- see(normal,down,'.'), doAction(move(down)).
rej5:- see(normal,left,'.'), doAction(move(left)).
rej5:- see(normal,up,'.'), doAction(move(up)).
rej5:- doAction(move(left)).

rej6:- see(normal,down,'.'), doAction(move(down)).
rej6:- see(normal,right,'.'), doAction(move(right)).
rej6:- see(normal,left,' '), doAction(move(left)).
rej6:- see(normal,down,'#'), doAction(move(up)).
rej6:- see(normal,up,'.'), doAction(move(up)).

rej7:- see(normal,down,'.'), doAction(move(down)).
rej7:- see(normal,right,'.'), doAction(move(right)).
rej7:- see(normal,up,'.'), doAction(move(up)).
rej7:- see(normal,right,'E'), doAction(move(none)).
rej7:- see(normal,up,' '), see(normal, left, '#'), doAction(move(up)).
rej7:- see(normal,down,'#'), doAction(move(left)).

rej8:- see(normal,down,'l'), doAction(get(down)).
rej8:- see(normal,right,'E'), doAction(use(right)).
rej8:- see(normal,down,'.'), doAction(move(down)).
rej8:- see(normal,up,' '), doAction(move(up)).
rej8:- see(normal,up,'.'), doAction(move(up)).
rej8:- see(normal,right,'.'), doAction(move(right)).

rej9:- see(normal,left,'.'), doAction(move(left)).
rej9:- see(normal,down,'o'), doAction(get(down)).
rej9:- see(normal,right,'o'), doAction(move(none)).
rej9:- see(normal,right-down,'#'), see(normal,down,' '), doAction(move(none)).
rej9:- see(normal,right,'#'), see(normal,down,'.'), doAction(move(down)).
rej9:- see(normal,right,'#'), see(normal,down,' '), doAction(move(down)).
rej9:- see(normal,right,'|'), doAction(use(right)).
rej9:- see(normal,up,'#'), doAction(move(right)).
rej9:- see(normal,right,' '), doAction(move(right)).
rej9:- see(normal,down,'/'), doAction(move(right)).
rej9:- see(normal,up,'.'), doAction(move(up)).
rej9:- see(normal,right,'.'), doAction(move(right)).
rej9:- see(normal,down,'.'), doAction(move(down)).



