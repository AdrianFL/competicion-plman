:-use_module('pl-man-game/main').

rej1:- doAction(move(left)).

rej2:- see(normal,up,'E'), doAction(move(up)).
rej2:- see(normal,up,' '), doAction(move(up)).
rej2:- see(normal,up, ), doAction(move(up)).

rej3:- see(normal,down,'h'), doAction(get(down)).
rej3:- doAction(move(none)).

rej4:- see(normal,right,' '), doAction(drop(right)).
rej4:- doAction(move(none)).

rej5:- see(normal,right,'E'), doAction(use(right)).
rej5:- doAction(move(right)).

rej11:- see(normal,up,'#'), see(normal,right,' '), see(normal,down,'.'), see(normal,left,'.'), doAction(move(up)).
rej11:- see(normal,up,'.'), see(normal,right,' '), see(normal,down,'.'), see(normal,left,' '), doAction(move(up)).
rej11:- see(normal,up,' '), see(normal,right,'#'), see(normal,down,'#'), see(normal,left,'#'), doAction(move(up)).
rej11:- see(normal,up,'.'), see(normal,right,' '), see(normal,down,'.'), doAction(move(down)).
rej11:- see(normal,up,'#'), see(normal,right,'#'), see(normal,right-down,'.'), doAction(move(down)).
rej11:- see(normal,up,'.'), doAction(move(up)).
rej11:- see(normal,down,'.'), doAction(move(down)).
rej11:- see(normal,right,'.'), doAction(move(right)).
rej11:- see(normal,left,'.'), doAction(move(left)).
rej11:- see(normal,right,' '), see(normal,left,'#'), doAction(move(up)).
rej11:- doAction(move(left)).

rej12:- see(normal,up,'#'), see(normal,right,' '), see(normal,down,'.'), see(normal,left,'.'), see(normal,right-down,'.'), doAction(move(left)).
rej12:- see(normal,down,' '), see(normal,right,'#'), see(normal,up,' '), see(normal,left,'#'), see(normal, right-up,' '), doAction(move(down)).
rej12:- see(normal,down,'.'), see(normal,right,'#'), see(normal,up,' '), see(normal,left,'.'), doAction(move(left)).
rej12:- see(normal,up,'/'), doAction(use(up)).
rej12:- see(normal,up,'a'), doAction(get(up)).
rej12:- see(normal,up,'.'), doAction(move(up)).
rej12:- see(normal,down,'.'), doAction(move(down)).
rej12:- see(normal,right,'.'), doAction(move(right)).
rej12:- see(normal,left,'.'), doAction(move(left)).
rej12:- see(normal,up,'#'), see(normal,down,'#'), see(normal,left,' '), see(normal, right,' '), see(normal, right-down,' '), doAction(move(left)).
rej12:- see(normal,up,'#'), see(normal,down,'#'), see(normal,left,'#'), doAction(move(right)).
rej12:- see(normal,up,'#'), see(normal,down,'#'), see(normal,right-down,'.'), doAction(move(right)).
rej12:- see(normal,up,'#'), see(normal,left,' '), doAction(move(left)).
rej12:- see(normal,up,' '), see(normal,right,'#'), see(normal,down,' '), see(normal,left,'#'), doAction(move(up)).
rej12:- doAction(move(left)).


rej13:- see(normal,right,'#'), see(normal,up,'.'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,'.'), see(normal,right-down,'#'), see(normal,right-up,'.'),  doAction(move(left)).
rej13:- see(normal,right,'.'), see(normal,up,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,'#'), see(normal,right-down,'.'), see(normal,right-up,'#'), doAction(move(right)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,' '), see(normal,right-down,'#'), see(normal,right-up,'.'), doAction(move(up)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,' '), see(normal,right-down,'#'), see(normal,right-up,' '), doAction(move(left)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,left-down,'E'), see(normal,left,'#'), see(normal,left-up,' '), doAction(move(down)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,left-down,'.'), see(normal,left,'#'), see(normal,left-up,' '), doAction(move(none)).
rej13:- see(normal,right,'.'), see(normal,up,'#'), see(normal,left-down,'#'), see(normal,left,' '), doAction(move(right)).
rej13:- see(normal,right,'.'), see(normal,up,'#'), see(normal,left-down,'E'), doAction(move(right)).
rej13:- see(normal,right,'.'), see(normal,up,'#'), see(normal,left-down,' '), doAction(move(right)).
rej13:- see(normal,right,' '), see(normal,up,'.'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,'#'), see(normal,right-down,'#'), see(normal,right-up,'#'), doAction(move(left)).
rej13:- see(normal,up,'.'), doAction(move(up)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,' '), see(normal,right,'#'), doAction(move(left)).
rej13:- see(normal,right,'.'), see(normal,up,' '), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,'.'), see(normal,left-up,'#'), see(normal,right-down,'#'), see(normal,right-up,'#'), doAction(move(left)).
rej13:- see(normal,down,'.'), doAction(move(down)).
rej13:- see(normal,right,'.'), doAction(move(right)).
rej13:- see(normal,left,'.'), doAction(move(left)).
rej13:- see(normal,right,' '), see(normal,up,'#'), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,'#'), see(normal,right-down,'#'), see(normal,right-up,'#'),  doAction(move(left)).
rej13:- see(normal,down,' '), see(normal,up,'#'), see(normal,left,'#'), see(normal,right,' '), see(normal,left-down,'#'), see(normal,right-down,'#'), doAction(move(down)).
rej13:- see(normal,down,' '), see(normal,up,' '), see(normal,left,'#'), see(normal,right,'#'), see(normal,left-down,'#'), see(normal,right-down,'.'), doAction(move(down)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,'E'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal,left-up,'#'), see(normal,right,'#'), doAction(move(none)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,left-down,'.'), see(normal,left,'E'), see(normal,left-up,' '), doAction(move(none)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,'E'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal,left-up,'#'), see(normal,right,'#'), doAction(move(none)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal,left-up,'#'), see(normal, right-down,'#'), doAction(move(down)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,' '), see(normal,right-down,'.'), see(normal,right-up,' '), doAction(move(right)).
rej13:- see(normal,right,' '), see(normal,up,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'E'), see(normal,left-up,'#'), see(normal,right-down,'#'), see(normal,right-up,' '), doAction(move(right)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'E'), see(normal,left-up,'#'), see(normal,right-down,'#'), see(normal,right-up,'#'), doAction(move(up)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,' '), see(normal,left-down,'E'), see(normal,left,'#'), see(normal,left-up,'#'), see(normal,right-down,' '), see(normal,right-up,' '), doAction(move(none)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,'E'), see(normal,left-down,' '), see(normal,left,'#'), see(normal,left-up,'#'), see(normal,right-down,' '), see(normal,right-up,' '), doAction(move(none)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal,left-up,'#'), see(normal,right-down,'E'), see(normal,right-up,' '), doAction(move(down)).
rej13:- see(normal,right,' '), see(normal,up,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,' '), see(normal,right-down,' '), see(normal,right-up,' '), doAction(move(left)).
rej13:- see(normal,right,' '), see(normal,up,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,'#'), see(normal,right-down,'#'), see(normal,right-up,'#'),  doAction(move(left)).
rej13:- see(normal,right,'#'), see(normal,up,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal,left-up,' '), see(normal,right-down,'.'), see(normal,right-up,'#'),  doAction(move(down)).
rej13:- doAction(move(right)).


rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'|'), see(normal,left-up,'v'), doAction(move(none)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,'|'), doAction(move(none)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'|'), see(normal,left-up,'#'), doAction(move(none)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'|'), see(normal,left,'.'), see(normal,left-up,'#'), doAction(move(none)).
rej21:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'.'), see(normal,left,'.'), see(normal,left-up,'E'), doAction(move(right)).
rej21:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'|'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,'.'), doAction(move(none)).
rej21:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,'.'), see(normal,left-up,'E'), doAction(move(up)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'º'), see(normal,left-up,'#'), doAction(move(right)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,'#'), doAction(drop(left)).
rej21:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'r'), see(normal,right-down,'a'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,'#'), doAction(move(right)).
rej21:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,'a'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,'#'), doAction(drop(right)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'º'), see(normal,left-up,'#'), doAction(get(left)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,'#'), doAction(move(right)). %
rej21:- see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'), see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,' '), doAction(move(up)).
rej21:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,' '), doAction(move(right)).
rej21:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'.'), see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,' '), see(normal,left,'.'), see(normal,left-up,' '), doAction(move(left)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'.'), see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,'#'), doAction(move(right)).
rej21:-  see(normal,left-down,'#'), see(normal,left,'|'), see(normal,left-up,'#'), doAction(use(left)).
rej21:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,'a'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,'#'), doAction(move(right)).
rej21:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'.'), see(normal,left-up,'#'), doAction(drop(down)).
rej21:- see(normal,down,'a'), see(normal,right-down,'#'), doAction(get(down)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'r'), see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,' '), see(normal,left-up,'#'), doAction(get(right)).
rej21:- see(normal,down,'.'), doAction(move(down)).
rej21:- see(normal,left,'.'), doAction(move(left)).
rej21:- see(normal,right,'.'), doAction(move(right)).
rej21:- see(normal,up,'.'), doAction(move(up)).
rej21:- see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,left,'#'), see(normal,left-up,'#'), doAction(move(right)).
rej21:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal,left-up,'#'), doAction(move(right)).
rej21:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal,left-up,' '), doAction(move(down)).
rej21:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'r'), see(normal,left-down,' '), see(normal,left,'#'), see(normal,left-up,' '), doAction(move(up)).
rej21:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'a'), see(normal,left-down,'#'), see(normal,left,' '), see(normal,left-up,'#'), see(normal,here,'r'), doAction(move(up)).
rej21:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), doAction(move(up)).
rej21:- doAction(move(left)).

rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'|'), see(normal, left-up,'#'), doAction(use(left)).
rej22:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,'|'), doAction(move(up)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'|'), see(normal, left-up,'#'), doAction(move(down)).
rej22:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'E'), see(normal, left-up,'#'), doAction(move(down)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'E'), see(normal, left-up,'#'), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'.'), see(normal,left,'E'), see(normal, left-up,'#'), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,left-down,'E'), see(normal,left,'.'), see(normal, left-up,'#'), doAction(move(none)).
rej22:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,'.'), doAction(move(none)).
rej22:- see(normal,up,'.'), see(normal,right-up,'E'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,'.'), doAction(move(right)).
rej22:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'.'), doAction(move(up)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(down)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
rej22:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
rej22:- see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), see(normal,here,'a'), doAction(move(right)).
rej22:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(up)).
rej22:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'a'), see(normal, left-up,'#'), doAction(get(left)).
rej22:- see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'a'), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(down)).
rej22:- see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), see(normal,here,'a'), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'a'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'r'), see(normal, left-up,' '), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'r'), see(normal, left-up,' '), doAction(drop(right)).
rej22:- see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), see(normal,here,'r'), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,'r'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej22:- see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'r'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)).
rej22:- see(normal,left,'r'), doAction(move(right)).
rej22:- see(normal,up,'a'), see(normal,right-down,'r'), doAction(get(up)).
rej22:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(drop(right)).
rej22:- see(normal,up,'.'), see(normal,right,' '),   see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), doAction(move(left)).
rej22:- see(normal,up,'.'), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'.'), doAction(move(up)).
rej22:- see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'|'), doAction(use(left)).
rej22:- see(normal,up,'r'), see(normal,right-up,'#'), see(normal,right,'#'), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'.'), see(normal,left,'.'), doAction(get(up)).
rej22:- see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left,'.'), doAction(move(up)).
rej22:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
rej22:- see(normal,right,'.'), doAction(move(right)).
rej22:- see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,'.'), doAction(move(down)).
rej22:- see(normal,left,'.'), doAction(move(left)).
rej22:- see(normal,down,'.'), doAction(move(down)).
rej22:- see(normal,up,'.'), doAction(move(up)).
rej22:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left,'#'), see(normal, left-up,'.'), doAction(move(down)).
rej22:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'r'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(drop(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
rej22:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej22:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'a'), see(normal, left-up,'#'), doAction(get(left)).
rej22:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), doAction(move(left)).
rej22:- see(normal,up,'#'), see(normal,down,'#'), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
rej22:- see(normal,up,'#'), see(normal,right,' '), see(normal,down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
rej22:- see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
rej22:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'a'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
rej22:- see(normal,up,'E'), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
rej22:- see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(up)).
rej22:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)).
rej22:- doAction(move(left)).
















