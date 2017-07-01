:-use_module('pl-man-game/main').


%/*rej:-not(havingObject), see(normal,up,''), see(normal,right-up,''), see(normal,right,''),see(normal,right-down,''), see(normal,down,''), see(normal,left-down,''),see(normal,left,''), see(normal, left-up,''), doAction(move(up)).*/

:- dynamic estado/1.

ce(E):- retractall(estado(_)), assert(estado(E)).

%%Inicio espectacular%%
re:- havingObject(appearance('J')), see(normal,up,'ç'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)), ce(rd), writeln('Arriba derecha').
re:- not(havingObject), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'.'), see(list,right,R), nth0(6,R,'e'), see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'#'),see(normal,left,'.'), see(normal, left-up,'#'), doAction(move(right)).
re:- not(havingObject), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'.'), see(list,right,R), nth0(4,R,'e'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
re:- not(havingObject), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'#'),see(normal,left,'.'), see(normal, left-up,'#'), see(list,right,R), nth0(4,R,'e'), doAction(move(up)).
re:- not(havingObject), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(list,up,U), nth0(2,U,'¥'), see(normal,left-down,'.'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(down)).
re:- not(havingObject), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '), see(list,right,R), nth0(2,R,'e'), see(normal,right-down,'#'), see(normal,down,'.'), see(list,up,U), nth0(2,U,'¥'), see(normal,left-down,'#'),see(normal,left,'.'), see(normal, left-up,'#'), doAction(move(left)).
re:- not(havingObject), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'.'), see(normal,down,'#'), see(list,right,R), nth0(2,R,'e'), see(normal,left-down,'#'),see(normal,left,'E'), see(normal, left-up,'#'), doAction(move(right)).
re:- not(havingObject), see(normal,up,'¥'), see(normal,right-up,'#'), see(normal,right,'.'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)).
re:-not(havingObject), see(normal,up,'¥'), see(normal,down,'a'), doAction(move(down)).
re:-not(havingObject), see(normal,up,'¥'), see(normal,here,'a'), doAction(move(right)).
re:-not(havingObject), see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,'l'), see(normal,down,'#'), see(normal,left-down,'.'),see(normal,left,'¥'), see(normal, left-up,' '), doAction(get(left)).
re:-havingObject(appearance(a)), see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,'l'), see(normal,down,'#'), see(normal,left-down,'¥'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
%%------------------%%

re:-havingObject(appearance(a)), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'¥'),see(normal,right-down,'—'), see(normal,down,'Д'), see(normal,left-down,'.'),see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(left)), ce(ai), writeln('Estado abajo izquierda').

%Básicos come-cocos%
re:- see(normal,down,'.'), doAction(move(down)).
re:- see(normal,up,'.'), doAction(move(up)).
re:- see(normal,left,'.'), doAction(move(left)).
re:- see(normal,right,'.'), doAction(move(right)).
%%------------------%%

re:- doAction(move(up)).

%%Estado abajo izquierda%%
ai:- see(normal,up,'l'), doAction(get(up)).

ai:- havingObject(appearance(a)), see(list,up,U), nth0(1,U,'I'), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,'E'), doAction(drop(right)).
ai:-havingObject(appearance(a)), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'.'), doAction(move(left)).
ai:-havingObject(appearance(a)), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'Д'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(left)).
ai:-havingObject(appearance(a)), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'.'),see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,'I'),see(normal,left,'.'), see(normal, left-up,'#'), doAction(move(right)).
ai:- havingObject(appearance(a)), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'I'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(down)).
ai:- havingObject(appearance(a)), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'I'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
ai:- havingObject(appearance(a)), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'I'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
ai:- havingObject(appearance(a)), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'I'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
ai:- havingObject(appearance(a)), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'Д'), see(normal,down,'.'), see(normal,left-down,'I'), see(normal,left-down,'E'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
ai:- havingObject(appearance(a)), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'Д'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,'.'), see(normal, left-up,'E'), doAction(move(down)).
ai:- havingObject, see(normal,up,'.'), see(list,right,R), not(nth0(1,R,'#')), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), not(see(normal, left-up,' ')), doAction(move(right)).
ai:- not(havingObject), see(normal,right,'a'), doAction(move(down)).
ai:- see(normal,down,'#'), not(see(normal,left,'#')), doAction(move(left)).
ai:- havingObject(appearance(l)), see(normal,up,'I'), see(normal,right-up,'#'), see(normal,right,'.'), see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)), ce(ai2), writeln('2ª').
ai:- not(see(normal,up,'#')), doAction(move(up)).
%%------------------------------------------%%


%%2ª parte ai%%
ai2:- havingObject(appearance(l)), see(list,right,R), nth0(1,R,'Д'), doAction(use(right)).
ai2:- havingObject(appearance(l)), see(list,right,R), nth0(2,R,'Д'), doAction(move(right)).
ai2:- havingObject(appearance(l)), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'.'),see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'E'), doAction(move(right)).
ai2:- havingObject(appearance(l)), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'.'),see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
ai2:- see(normal,right,'.'), doAction(move(right)).
ai2:- see(normal,left,'.'), doAction(move(left)).
ai2:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(down)).
ai2:- havingObject(appearance(l)), see(normal,up,' '), see(normal,right-up,' '), see(list,right,R), nth0(4,R,'#'), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
ai2:- havingObject(appearance(l)), see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,' '),see(normal,right-down,'E'), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,' '), doAction(move(up)).
ai2:- see(list,left,L), nth0(5,L,'#'), see(normal,down,'Ξ'), doAction(move(none)).
ai2:- see(list,left,L), nth0(5,L,'#'), see(normal,down,' '), doAction(move(down)).
ai2:- see(list,right,R), nth0(2,R,'—'), doAction(move(right)).
ai2:- see(list,right,R), nth0(1,R,'—'), doAction(move(right)).
ai2:- see(normal,right,'—'), see(normal,left,'a'), doAction(get(left)).
ai2:- see(normal,right,'—'), see(normal,left,' '), doAction(use(right)).
ai2:- havingObject(appearance(a)), see(normal,right,'ç'), doAction(drop(up)).
ai2:- not(havingObject(appearance(a))), see(normal,right,'ç'), doAction(move(none)).
ai2:- see(normal,right-up,'ç'), doAction(move(right)).
ai2:- see(normal,up,'ç'), doAction(move(none)).
ai2:- see(list,up,U), nth0(1,U,'ç'), doAction(move(up)), ce(ad), writeln('Estado abajo derecha').
%%---------%%

%%Estado abajo derecha%%
ad:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'I'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)), retractall(estado(_)), writeln('Sin estado').
ad:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
ad:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'Ξ'),see(normal,left,'#'), see(normal, left-up,' '), doAction(move(down)).
ad:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'Ξ'), see(normal,left-down,' '),see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
ad:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'Ξ'), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
ad:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'Ξ'), see(normal,down,' '), see(normal,left-down,'e'),see(normal,left,' '), see(normal, left-up,'E'), see(list,left,L), nth0(1,L,'.'), doAction(move(left)).
ad:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,' '), see(list,up,U), nth0(1,U,'E'), see(list,left,L), nth0(1,L,'e'), doAction(move(up)).
ad:- havingObject(appearance('J')), see(normal,left,'('), see(list,up,U), nth0(1,U,'E'), see(list,left,L), nth0(1,L,'.'), doAction(move(left)).
ad:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,'.'), see(normal, left-up,' '), doAction(move(left)).
ad:- havingObject(appearance(l)), see(normal,down,'('), see(list,right,R), nth0(1,R,'e'), doAction(use(right)).
ad:- not(havingObject(appearance(l))), see(normal,down,'('), see(list,right,R), nth0(1,R,'.'), doAction(move(right)).
ad:- havingObject(appearance(l)), see(normal,up,'e'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,'.'), doAction(move(none)).
ad:- havingObject(appearance(l)), see(normal,up,'('), see(normal,right-up,'e'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,' '), doAction(move(up)).
ad:- see(list,up,U), nth0(1,U,'('), doAction(move(up)).
ad:- havingObject(appearance(l)), not(see(normal,right,'#')), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), doAction(move(right)).
ad:- havingObject(appearance(l)), see(normal,up,'.'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(down)).
ad:- havingObject(appearance(l)), see(normal,up,' '), see(normal,right-up,'Ξ'), see(normal,right,'e'),see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,' '), doAction(move(down)).
ad:- see(normal,up,'l'), see(list,right,R), nth0(1,R,'e'), doAction(get(up)).
ad:- not(havingObject), see(normal,up,'ç'), see(normal,right-up,'#'), see(normal,right,'.'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,'a'), see(normal, left-up,'#'), doAction(move(right)).
ad:- not(havingObject), not(see(normal,up,'#')), see(normal,right-up,'.'), see(normal,right,'.'),see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'('),see(normal,left,' '), see(normal, left-up,' '), doAction(move(right)).
ad:- not(havingObject), see(normal,here,'J'), see(normal,up,'I'), see(normal,down,' '), see(normal, left-up,'#'), doAction(move(left)).
ad:- not(havingObject), see(normal,right,'J'), see(normal,up,'#'), see(normal,down,' '), see(normal, left-up,'#'), doAction(get(right)).
ad:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right,' '), not(see(normal,left-down,'#')), not(see(normal,left,'#')), doAction(move(left)).
ad:- havingObject(appearance('J')), see(normal,down,'.'), see(normal,right-down,' '), doAction(move(down)).
ad:- not(havingObject(appearance('J'))), not(see(normal,up,'#')), doAction(move(up)).
ad:- havingObject(appearance('J')), see(normal,right,' '), see(normal,right-down,' '), not(see(normal,right,'#')), doAction(move(right)).
ad:- havingObject(appearance('J')), see(normal,right,'#'), see(normal,down,' '), doAction(move(down)).
ad:- havingObject(appearance('J')), see(normal,right,'#'), see(normal,down,'?'), see(normal,left,'#'), doAction(move(up)).
%%-----------------------------%%

%%Estado arriba derecha-izquierda%%

rd:- not(havingObject(appearance('э'))), see(list,up,U), nth0(1,U,'%'), see(normal,up,' '), see(normal,right-up,'('), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'I'), see(normal, left-up,' '), doAction(move(up)).
rd:- havingObject(appearance('э')), see(normal,up,'п'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'('), see(normal,left-down,' '), see(normal,left,'%'), see(normal, left-up,'%'), doAction(drop(up)).
rd:- havingObject(appearance('э')), see(normal,here,'('), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,' '), see(normal, left-up,'%'), doAction(move(up)).
rd:- havingObject(appearance('э')), see(normal,up,'%'), see(normal,right-up,'.'), see(normal,right,'('),see(normal,right-down,'I'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(right)).
rd:- not(havingObject(appearance('J'))), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'э'),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'J'), see(normal, left-up,'#'), doAction(get(right)).
rd:- havingObject(appearance('J')), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'э'),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(drop(left)).
rd:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'Ξ'),see(normal,right-down,'.'), see(normal,down,'#'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
rd:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(down)).
rd:- havingObject(appearance('J')), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'.'),see(normal,right-down,'.'), see(normal,down,'#'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
rd:- not(havingObject(appearance('э'))),  see(list,left,L), nth0(6,L,'#'), see(normal,up,'.'), see(normal,right-up,'%'), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
rd:- see(normal,right,'.'), doAction(move(right)).
rd:- see(normal,down,'.'), doAction(move(down)).
rd:- see(normal,up,'.'), doAction(move(up)).
rd:- see(normal,left,'.'), doAction(move(left)).
rd:- havingObject(appearance('э')), see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'I'), see(normal, left-up,'.'), doAction(move(none)).
rd:- havingObject(appearance('э')), see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'I'), doAction(move(left)).
rd:- not(havingObject(appearance('э'))), see(normal,up,'э'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'('), see(normal,left-down,' '), see(normal,left,'%'), see(normal, left-up,'%'), doAction(move(down)).
rd:- not(havingObject(appearance('э'))),  see(list,left,L), nth0(7,L,'#'), see(normal,up,'%'), see(normal,right-up,' '), see(normal,right,'('),see(normal,right-down,' '), see(normal,down,'I'), see(normal,left-down,'.'), see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
rd:- not(havingObject(appearance('э'))),  see(list,left,L), nth0(5,L,'#'), see(normal,up,'#'), see(normal,right-up,'.'), see(normal,right,' '),see(normal,right-down,'.'), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
rd:- not(havingObject(appearance('э'))),  see(list,right,R), nth0(1,R,'Ξ'), nth0(3,R,'('), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(down)).
rd:- not(havingObject(appearance('э'))), see(normal,up,' '), see(normal,right-up,'Ξ'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'J'), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(down)).
rd:- not(havingObject(appearance('э'))), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'J'), see(normal, left-up,'#'), doAction(get(left)).
rd:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,'Ξ'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
rd:- havingObject(appearance('J')), see(normal,up,'Ξ'), see(normal,right-up,' '), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)), ce(p2), writeln('Palanca 2').



%%------------------------%%

%%Estado palanca 2ª vez%%
p2:- havingObject(appearance('¬')), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'<'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(down)), ce(fn), writeln('Estado final').
p2:- havingObject(appearance('¬')), see(normal,up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'.'),  doAction(move(left)).
p2:- havingObject(appearance('¬')), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'#'),see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(down)).
p2:- not(havingObject(appearance('r'))), see(normal,up,'ñ'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'¬'), see(normal, left-up,'#'), doAction(get(left)).
p2:- not(havingObject(appearance('r'))), see(normal,up,'#'), see(normal,right,'ñ'), see(normal,here,'¬'), doAction(move(right)).
p2:- not(havingObject(appearance('r'))), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'ñ'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'¬'), see(normal, left-up,'#'), doAction(move(left)).
p2:- havingObject(appearance('r')), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'|'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'¬'), see(normal, left-up,'#'), doAction(use(right)).
p2:- not(havingObject(appearance('J'))), see(normal,here,'ж'), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'э'), see(normal,left-down,'J'), see(normal,left,' '), see(normal, left-up,'%'), doAction(get(down)).
p2:- not(havingObject(appearance('J'))), see(normal,up,'%'), see(normal,right-up,'.'), see(normal,right,'ж'),see(normal,right-down,'э'), see(normal,down,'J'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)).
p2:- havingObject(appearance('J')), see(normal,up,'%'), see(normal,right-up,'.'), see(normal,right,'ж'),see(normal,right-down,'э'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(drop(down)).
p2:- havingObject(appearance('J')), see(normal,up,'%'), see(normal,right-up,'ж'), see(normal,right,'э'),see(normal,right-down,'%'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,'#'), doAction(use(up)).
p2:- havingObject(appearance('J')), see(normal,up,'.'), see(normal,right-up,'э'), see(normal,right,'%'),see(normal,right-down,'('), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
p2:- havingObject(appearance('J')), see(normal,up,'%'), see(normal,right-up,'э'), see(normal,right,'%'),see(normal,right-down,'('), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'#'), doAction(use(up)).
p2:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,'%'), see(normal,right,'.'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'Ξ'), see(normal,left,'#'), see(normal, left-up,'.'), doAction(move(right)).
p2:- havingObject(appearance('J')), see(normal,up,'#'), see(normal,right-up,'%'), see(normal,right,'%'),see(normal,right-down,' '), see(normal,down,'Ξ'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,'.'), doAction(use(right)).
p2:- havingObject(appearance('J')), see(normal,up,'.'), see(normal,right-up,'%'), see(normal,right,'Ξ'),see(normal,right-down,' '), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
p2:- havingObject(appearance('J')), see(normal,up,'#'), see(list,right,R), member('(',R), doAction(move(right)). 
p2:- havingObject(appearance('J')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,'Ξ'), doAction(move(up)).
p2:- havingObject(appearance('э')), see(normal,up,'.'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(left)).
p2:- havingObject(appearance('э')), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,'.'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(left)).
p2:- havingObject(appearance('э')), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(drop(right)).
p2:- not(havingObject(appearance('э'))), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'э'),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(left)).
p2:- not(havingObject(appearance('э'))), see(normal,up,'r'), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'.'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(get(up)).
p2:- havingObject(appearance('r')), see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'.'), see(normal,left-down,'#'), see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(left)).
p2:- havingObject(appearance('r')), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(down)).
p2:- havingObject(appearance('r')), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'.'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)).
p2:- havingObject(appearance('¬')), see(normal,up,'#'), not(see(normal,right,'.')), not(see(normal,right-down,'.')), not(see(normal,down,'.')), not(see(normal,left-down,'.')), doAction(move(right)).
p2:- havingObject(appearance('¬')), see(normal,up,'Ξ'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).
p2:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,'Ξ'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'E'), doAction(move(none)).
p2:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'Ξ'), doAction(move(none)).
p2:- havingObject(appearance('¬')), see(normal,up,'Ξ'), see(normal,right-up,'Ξ'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).
p2:- havingObject(appearance('¬')), see(normal,up,'Ξ'), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'Ξ'), doAction(move(none)).
p2:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,' '), see(normal, left-up,'Ξ'), doAction(move(up)).

%%----------------%%


%%FINAL%%
fn:- havingObject(appearance('¬')), see(list,up,U), nth0(2,U,'('), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'e'), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)), ce(med), writeln('Al medio').
fn:- havingObject(appearance('¬')), see(list,up,U), nth0(2,U,'('), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
fn:- havingObject(appearance('¬')), see(list,up,U), see(list,down,D), nth0(1,D,'E'), nth0(1,U,'('), doAction(use(down)).
fn:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(up)).
fn:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'E'),see(normal,right-down,'E'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
fn:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'E'), see(normal,down,'#'), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(right)).
fn:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'.'), see(normal,down,'#'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(right)).
fn:- doAction(move(down)).
%%------%%


%%FINAL%%
med:- not(havingObject), see(normal,up,'#'), see(normal,right,'e'), see(normal,down,'#'), doAction(move(left)).
med:- havingObject(appearance('¬')), see(list,right,R), nth0(1,R,'E'),  see(normal,right,'e'), doAction(use(right)).
med:- havingObject(appearance('¬')), see(normal,right-up,'#'), see(normal,right-down,'#'), see(list,right,R), nth0(1,R,'E'),  see(normal,right,' '), doAction(move(right)).
med:- havingObject(appearance('¬')), see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,'#'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)).
med:- havingObject(appearance('¬')), see(normal,up,'E'), see(normal,right-up,' '), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(none)).
med:- havingObject(appearance('¬')),  see(list,right,U), nth0(1,U,'ñ'), doAction(move(none)).
med:- havingObject(appearance('¬')), see(list,left,L), see(list,up,U), nth0(1,L,'#'), member('?',U),  doAction(move(up)).
med:- havingObject(appearance('¬')), see(list,left,L), see(list,right,R), nth0(1,L,' '), member('(',R), doAction(move(left)).
med:- havingObject(appearance('¬')), see(normal,up,'*'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
med:- havingObject(appearance('¬')), see(list,up,U), nth0(2,U,'('), see(normal,up,'*'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'e'), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(down)).
med:- havingObject(appearance('¬')), see(list,up,U), nth0(2,U,'('), see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,'e'), see(normal,left-down,' '), see(normal,left,'#'), see(normal, left-up,' '), doAction(move(none)).
med:- havingObject(appearance('¬')), see(list,up,U), nth0(3,U,'('), see(normal,up,'*'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'#'), see(list,left,L), nth0(1,L,'e'), see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)).
med:- havingObject(appearance('¬')), see(list,left,L), nth0(1,L,'E'), see(normal,right,' '), see(normal,down,'#'), doAction(move(right)).





rej:- estado(ai), ai.
rej:- estado(ai2), ai2.
rej:- estado(ad), ad.
rej:- estado(rd), rd.
rej:- estado(p2), p2.
rej:- estado(fn), fn.
rej:- estado(med), med.
rej:- re.

















