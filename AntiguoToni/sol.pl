:-use_module('pl-man-game/main').



rej23:- see(normal,up,'<'), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal, left-down,' '), see(normal,left,' '), see(normal, left-up,'%'), doAction(move(right)).
rej23:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal, left-down,' '), see(normal,left,'%'), see(normal, left-up,' '), doAction(use(left)).
rej23:- see(normal,up,'>'), see(normal,right-up,'%'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej23:- see(normal,up,' '), see(normal,right-up,'%'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,'%'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'>'), doAction(use(down)).
rej23:- see(normal,up,'.'), see(normal,right-up,'%'), see(normal,right,'.'), see(normal,right-down,'%'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(left)).
rej23:- see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(up)).
rej23:- see(normal,right,'.'),  doAction(move(right)).
rej23:- see(normal,down,'.'),  doAction(move(down)).
rej23:- see(normal,left,'.'),  doAction(move(left)).
rej23:- see(normal,up,'.'),  doAction(move(up)).
rej23:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), see(normal,right,'/'), doAction(get(right)).
rej23:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
rej23:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal, right, '#'),  see(normal,down,'#'), see(normal,left,' '), doAction(move(left)).
rej23:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
rej23:- see(normal,up,'%'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(right)).
rej23:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'%'), see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'#'), doAction(use(right)).
rej23:- see(normal,up,'%'), see(normal,right-up,' '), see(normal,right,'%'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(use(right)).
rej23:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,'%'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(up)).
rej23:-  see(normal,right,'%'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '),  doAction(use(right)).
rej23:- see(normal,up,' '), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
rej23:- see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), doAction(move(down)).
rej23:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'>'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
rej23:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,'>'), see(normal,down,' '), see(normal, left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej23:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal, left-down,'%'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej23:- see(normal,up,' '), see(normal,right-up,'<'), see(normal,right,' '), see(normal,right-down,'.'), see(normal,down,' '), see(normal, left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rej23:- doAction(get(right)).


:-use_module('pl-man-game/main').

:- dynamic llave/1.

cllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),
see(normal,left,' '), see(normal, left-up,'.'), doAction(move(up)).
cllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,'/'), see(normal,right,'.'),
see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),
see(normal,left,'.'), see(normal, left-up,' '), doAction(move(right)).
cllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,'E'),
see(normal,right-down,'_'), see(normal,down,'_'), see(normal,left-down,'_'),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
cllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'_'), see(normal,down,'_'), see(normal,left-down,'_'),
see(normal,left,'E'), see(normal, left-up,'E'), doAction(move(right)).
cllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,' '),
see(normal,right-down,'_'), see(normal,down,'_'), see(normal,left-down,'_'),
see(normal,left,'E'), see(normal, left-up,' '), doAction(move(right)).
cllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'E'),
see(normal,right-down,'_'), see(normal,down,'_'), see(normal,left-down,'_'),
see(normal,left,' '), see(normal, left-up,'E'), doAction(move(left)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'E'),
see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'E'),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'E'), see(normal,down,'.'), see(normal,left-down,' '),
see(normal,left,'E'), see(normal, left-up,' '), doAction(move(right)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'E'),
see(normal,right-down,'E'), see(normal,down,' '), see(normal,left-down,' '),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'E'),
see(normal,left,'E'), see(normal, left-up,' '), doAction(move(down)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'E'), see(normal,down,'.'), see(normal,left-down,' '),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,'E'), see(normal,left-down,' '),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'E'),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,down,'_'),   doAction(use(down)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
not(see(normal,right-down,'.')), not(see(normal,down,' ')), not(see(normal,left-down,'.')),
see(normal,left,'.'), see(normal, left-up,' '), doAction(move(left)).
cllave:- havingObject(appearance('o')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
not(see(normal,down,'.')), see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'.'),
see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),
see(normal,left,' '), see(normal, left-up,'0'), doAction(move(right)).
cllave:- see(normal,up,'0'), see(normal,right-up,'#'), see(normal,right,'.'),
see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),
see(normal,left,' '), see(normal, left-up,'#'), doAction(move(right)).
cllave:- see(normal,up,'#'), see(normal,right-up,'0'), see(normal,right,'.'),
see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),
see(normal,left,' '), see(normal, left-up,'#'), doAction(move(right)).
cllave:- see(normal,up,'.'), not(see(normal,right-up,'E')), not(see(normal,right,' ')), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).
cllave:- see(normal,up,'.'), see(normal,right-up,'E'), see(normal,right,'.'), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
cllave:- see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,')'), see(normal,left,')'), see(normal, left-up,' '), doAction(move(up)).
cllave:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,')'), see(normal, left-up,')'), doAction(move(up)).
cllave:- not(see(normal,up,' ')), not(see(normal,right-up,' ')), see(normal,right,'.'),
see(normal,right-down,'.'), not(see(normal,down,' ')), see(normal,left-down,' '),
not(see(normal,left,' ')), see(normal, left-up,' '), doAction(move(right)).
cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,'>'), see(normal,left-down,' '),
see(normal,left,'.'), see(normal, left-up,'#'), doAction(move(none)).
cllave:- see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,' '), see(normal, left-up,'>'), doAction(move(none)).
cllave:- see(normal,up,'>'), see(normal,right-up,'#'), see(normal,right,'#'),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,' '), see(normal, left-up,'.'), doAction(move(none)).
cllave:- see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,'>'), see(normal, left-up,'.'), doAction(move(up)).
cllave:- see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'.'),
see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,')'),
see(normal,left,')'), see(normal, left-up,' '), doAction(move(right)).
cllave:- llave(LLAVE), havingObject(appearance(LLAVE)), not(see(normal,up,' ')),
see(normal,right,'.'), not(see(normal,down,' ')), see(normal,left-down,' '),
see(normal,left,' '), see(normal, left-up,' '), doAction(drop(left)).
cllave:- llave(LLAVE), havingObject(appearance(LLAVE)), see(normal,up,' '),
see(normal,right,' '), see(normal,down,' '), see(normal,left-down,' '),
see(normal,left,'c'), see(normal, left-up,' '), doAction(move(right)).
cllave:- llave(LLAVE), havingObject(appearance(LLAVE)), see(normal,up,' '),
see(normal,right,'-'), see(normal,down,' '), see(normal,left-down,' '),
see(normal,left,'c'), see(normal, left-up,' '), doAction(use(right)).
cllave:- llave(LLAVE), havingObject(appearance(LLAVE)), see(normal,up,' '),
see(normal,right-up,'-'), see(normal,right-down,'#'), see(normal,down,'#'),
see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'c'),
doAction(move(up)).
cllave:- llave(LLAVE), havingObject(appearance(LLAVE)), see(normal,up,'c'),
doAction(move(right)).
cllave:- llave(LLAVE), havingObject(appearance(LLAVE)), doAction(move(up)).
cllave:-see(normal,right-up,X), 	
	see(normal,right,'-'), 
	see(normal,right-down,Y), 
	LLAVE is X-Y, 
	assert(llave(LLAVE)),
	write('La llave que hay que encontrar es '), writeln(LLAVE),
	doAction(move(left)).
cllave:- llave(LLAVE), see(normal,right, LLAVE), doAction(get(right)).
cllave:- llave(LLAVE), see(normal,down, LLAVE), doAction(get(down)).

cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'.'),  see(normal,left,' '), see(normal, left-up,'#'), doAction(move(right)).
cllave:- see(normal, down,'.'), doAction(move(down)).
cllave:- see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,'.'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(up)).
cllave:- see(normal,up,'.'), not(see(normal,right-up,' ')), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), not(see(normal, left-up,' ')), doAction(move(left)).
cllave:- see(normal,up,'.'), not(see(normal,right-up,' ')), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), not(see(normal,left,' ')), see(normal, left-up,'#'), doAction(move(up)).
cllave:- see(normal, right,'.'), doAction(move(right)).
cllave:- see(normal, left,'.'), doAction(move(left)).
cllave:- see(normal,up,'.'), doAction(move(up)).



cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),
see(normal,left,'>'), see(normal, left-up,'#'), doAction(move(down)).
cllave:- see(normal,up,'>'), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),
see(normal,right-down,'>'), see(normal,down,' '), see(normal,left-down,' '),
see(normal,left,'>'), see(normal, left-up,'#'), doAction(move(down)).
cllave:- see(normal,up,'>'), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'),
see(normal,right-down,'#'), see(normal,down,' '), not(see(normal,left-down,'E')), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,' '), not(see(normal,left-down,'E')), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(none)).
cllave:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),
see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'E'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
cllave:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
cllave:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
cllave:- doAction(move(down)).


rej31(init):- retractall(llave(_)).
rej31:- not(havingObject), see(normal,up,'o'), not(see(normal,right-down,'_')), not(see(normal,left,'E')), not(see(normal,right,'E')), doAction(get(up)).
rej31:- not(havingObject), see(normal,right,'o'), not(see(normal,right-down,'_')), not(see(normal,left,'E')), not(see(normal,right,'E')), doAction(get(right)).
rej31:- not(havingObject), see(normal,left,'o'), not(see(normal,right-down,'_')), not(see(normal,left,'E')), not(see(normal,right,'E')), doAction(get(left)).
rej31:- not(havingObject), see(normal,down,'o'), not(see(normal,right-down,'_')), not(see(normal,left,'E')), not(see(normal,right,'E')), doAction(get(down)).
rej31:- see(normal,up,'E'), see(normal,right-up,'.'), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,'.'), see(normal, left-up,' '), doAction(move(right)).
rej31:- see(normal,right,'c'), not(havingObject), doAction(get(right)).
rej31:- see(normal,down,'c'), not(havingObject), doAction(get(down)).
rej31:- see(normal,left,'c'), not(havingObject), doAction(get(left)).
rej31:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,'_'), see(normal,left-down,'#'),
see(normal,left,'#'), see(normal, left-up,'#'), doAction(use(down)).
rej31:- see(normal,right,'-'), cllave.
rej31:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'#'),
see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'#'),
see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)).
rej31:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),
see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'),
see(normal,left,'#'), see(normal, left-up,'#'), doAction(drop(up)).
rej31:- see(normal,up,'#'), see(normal,right-up,'#'),see(normal,left-down,'#'),
see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)).
rej31:- cllave.
