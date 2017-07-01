:-use_module('pl-man-game/main').
%rej41:-not(havingObject), see(normal,up,''), see(normal,right-up,''), see(normal,right,''),see(normal,right-down,''), see(normal,down,''), see(normal,left-down,''),see(normal,left,''), see(normal, left-up,''), doAction(move(up)).
%rej41:-not(see(normal,up,' ')), not(see(normal,up,'#')), not(see(normal,right-up,' ')), not(see(normal,right-up,'#')), not(see(normal,right,' ')), not(see(normal,right,'#')), not(see(normal,right-down,' ')), not(see(normal,right-down,'#')), not(see(normal,down,' ')), not(see(normal,down,'#')), not(see(normal,left-down,' ')), not(see(normal,left-down,'#')), not(see(normal,left,' ')), not(see(normal,left,'#')), not(see(normal,left-up,' ')), not(see(normal,left-up,'#')), doAction(move(up)).

:- dynamic estado/1.

ce(E):- retractall(estado(_)), assert(estado(E)).
%% Defensas contra F %%
gun:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
gun:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
gun:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
gun:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
gun:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
gun:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
gun:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
gun:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
gun:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
gun:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).

gun:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,'#'), see(normal, left-up,' '), see(list, right,R), nth0(1,R,'#'), see(list, up,U), nth0(3,U,'#'), doAction(move(right)), writeln('Esquina abajo derecha'), ce(ena1).
gun:- not(havingObject), see(list,up,U), nth0(1,U,'F'),  doAction(move(none)).
gun:- not(havingObject), see(list,right,R), nth0(1,R,'F'),  doAction(move(none)).
gun:- not(havingObject), see(list,down,D), nth0(1,D,'F'),  doAction(move(none)).
gun:- not(havingObject), see(list,left,L), nth0(1,L,'F'),  doAction(move(none)).
gun:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,
right-down, left-up, left-down]).
gun:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'F'), see(normal,down,' '),  see(normal, left-up,'#'), doAction(move(down)).
gun:- see(normal,up,'F'), see(normal,right,' '), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), doAction(move(right)).

%Come-cocos
gun:- see(normal,right,'.'), doAction(move(right)). 
gun:- see(normal,left,'.'), doAction(move(left)).
gun:- see(normal,up,'.'),  doAction(move(up)).
gun:- see(normal,down,'.'), doAction(move(down)).

%Esquivar F%

gun:- see(list,left,L), not(nth0(1,L,'F')), see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'F'), not(see(normal,right-down,'F')), see(normal,down,'#'), not(see(normal,left-down,'F')), not(see(normal,left,'F')), see(normal,left-up,'#'),  doAction(move(left)).
gun:- doAction(move(none)).

%EDO inicial
inicio:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
inicio:- see(normal,right,'.'), doAction(move(right)).
inicio:- not(see(normal,up,'#')), not(see(normal,up,' ')), not(see(normal,right-up,'#')), not(see(normal,right-up,' ')), not(see(normal,right,'#')), not(see(normal,right,'.')), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)), writeln('Derecha 1'), ce(de).
inicio:- doAction(move(left)).

%EDO de1
de:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,
right-down, left-up, left-down]).
de:- see(normal,up,'F'), see(normal,right,'#'), doAction(move(left)).
de:- see(normal,up,'F'), not(see(normal,right,'#')), doAction(move(right)).
de:- see(normal,left,'F'), not(see(normal,down,'#')), doAction(move(down)).
de:- see(normal,up,'F'), doAction(move(left)).
de:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
de:- not(see(normal,up,' ')), not(see(normal,right-up,' ')), see(normal,right,'#'),see(normal,right-down,'#'), not(see(normal,down,'.')), not(see(normal,left-down,'.')),not(see(normal,left,'.')), not(see(normal, left-up,' ')), not(see(normal,up,'#')), not(see(normal,right-up,'#')),  not(see(normal,down,'#')), not(see(normal,left-down,'#')),not(see(normal,left,'#')),  not(see(normal, left-up,'#')),  doAction(move(up)), writeln('Sin estado'), retractall(estado(_)).
de:- doAction(move(right)).

%EDO esquina abajo derecha
ena1:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
ena1:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
ena1:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
ena1:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
ena1:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
ena1:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
ena1:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
ena1:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
ena1:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
ena1:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,right-down, left-up, left-down]).

ena1:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'F'), see(normal, left-up,' '), doAction(move(up)).
ena1:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,'F'),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'.'), see(normal, left-up,'#'), doAction(move(up)).
ena1:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,'.'),see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(down)).
ena1:- not(see(normal,up,' ')), see(normal,right-up,'#'), not(see(normal,right,'.')),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), not(see(normal,left,' ')), not(see(normal, left-up,' ')), doAction(move(up)), writeln('Medioztado'), ce(medio).
ena1:- see(normal,right,'.'), doAction(move(right)).
ena1:- see(normal,up,'.'),  doAction(move(up)).
ena1:- see(normal,left,'.'), doAction(move(left)).
ena1:- see(normal,down,'.'), doAction(move(down)).
ena1:- see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), not(see(normal,left,'F')), see(list, left,L), not(nth0(1,L,'F')), doAction(move(left)).
ena1:- see(normal,up,'#'), not(see(normal,right-up,'.')), not(see(normal,right,'.')),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), not(see(normal,left,'#')), not(see(normal,left,' ')), not(see(normal,left,'F')), not(see(normal, left-up,'#')), not(see(normal, left-up,' ')), doAction(move(left)).
ena1:- see(normal,left,'F'), see(normal,up,'#'),  not(see(normal,right,'F')), not(see(normal,right,'#')), doAction(move(right)).
ena1:- see(normal,left,'F'), not(see(normal,right,'F')), not(see(normal,right,'#')), not(see(normal,up,'#')), doAction(move(up)).
ena1:- see(normal,left,'#'), not(see(normal,right,'F')), not(see(normal,right,'#')), see(normal,down,'F'), doAction(move(right)).
ena1:- see(normal,left,' '), not(see(normal,right,'F')), not(see(normal,right,'#')), see(normal,down,'F'), doAction(move(left)).
ena1:- see(normal,left,' '), not(see(normal,right,'F')), not(see(normal,right,'#')), see(normal,left,'F'), doAction(move(down)).

ena1:- not(see(normal,down,'F')), not(see(normal,down,'#')), doAction(move(down)).

%EDO medio abajo

med:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
med:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
med:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
med:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
med:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
med:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
med:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
med:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
med:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
med:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
med:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,right-down, left-up, left-down]).

med:- not(see(normal,up,' ')), not(see(normal,up,'#')), see(normal,right-up,'#'), see(normal,right,'#'), not(see(normal,right-down,'.')), not(see(normal,right-down,'#')), not(see(normal,down,'.')), not(see(normal,left-down,' ')),not(see(normal,left,' ')), not(see(normal, left-up,' ')),  not(see(normal,down,'#')), not(see(normal,left-down,'#')),not(see(normal,left,'#')),  not(see(normal, left-up,'#')),  doAction(move(up)).
med:- see(normal,up,' '), not(see(normal,up,'#')), not(see(normal,right-up,'#')), see(normal,right-up,' '), not(see(normal,right,'.')), not(see(normal,right,'#')), not(see(normal,right-down,' ')), not(see(normal,right-down,'#')), not(see(normal,down,' ')), not(see(normal,left-down,' ')), not(see(normal,left,' ')), see(normal, left-up,'.'),  not(see(normal,down,'#')), not(see(normal,left-down,'#')), not(see(normal,left,'#')),  not(see(normal, left-up,'#')),  doAction(move(up)).
%Coger pipa en el centro del mapa
med:- not(havingObject), see(normal,right-up,'l'), doAction(move(up)).
med:- not(havingObject), see(normal,left-up,'l'), doAction(move(up)).
med:- not(havingObject), see(list,up,U), member('l',U), doAction(move(up)).
%-----

med:- not(see(normal,left,' ')),  not(see(normal,left,'#')), doAction(move(left)).
med:- not(see(normal,up,'.')), not(see(normal,up,'#')), not(see(normal,right-up,'.')), not(see(normal,right-up,'#')), not(see(normal,right,' ')), not(see(normal,right,'#')), not(see(normal,right-down,' ')), not(see(normal,right-down,'#')), not(see(normal,down,' ')), not(see(normal,down,'#')), not(see(normal,left-down,' ')), not(see(normal,left-down,'#')), see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)), writeln('Estado derecha 2'), ce(de2).
med:- doAction(move(down)).

%EDO Derecha 2 (medio)%
de2:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
de2:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
de2:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
de2:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
de2:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
de2:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
de2:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
de2:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
de2:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
de2:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
de2:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,right-down, left-up, left-down]).
de2:- not(see(normal,up,'.')), not(see(normal,up,'#')), not(see(normal,right-up,'.')), not(see(normal,right-up,'#')), not(see(normal,right,'.')), not(see(normal,right,'#')), not(see(normal,right-down,'.')), not(see(normal,right-down,'#')), not(see(normal,down,' ')), not(see(normal,down,'#')), not(see(normal,left-down,' ')), not(see(normal,left-down,'#')), not(see(normal,left,'.')), not(see(normal,left,'#')), not(see(normal,left-up,'.')), not(see(normal,left-up,'#')), doAction(move(down)).
%Buscar pipa--
de2:- not(havingObject), see(normal,up,'#'), not(see(normal,right-up,'.')), not(see(normal,right-up,'#')), not(see(normal,right,'.')), not(see(normal,right,'#')), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), not(see(normal,left,' ')), not(see(normal,left,'#')), not(see(normal,left-up,' ')), not(see(normal,left-up,'#')), doAction(move(right)), writeln('Buscando pipa'), ce(de2pi).
%-----
de2:- see(normal,up,'#'), not(see(normal,right-up,'.')), not(see(normal,right-up,'#')), not(see(normal,right,'.')), not(see(normal,right,'#')), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), not(see(normal,left,' ')), not(see(normal,left,'#')), not(see(normal,left-up,' ')), not(see(normal,left-up,'#')), doAction(move(left)), writeln('Estado sube-baja'), ce(suba).
de2:- see(normal,down,'#'), not(see(normal,left,'F')), see(list,left,L), not(nth0(1,L,'F')), doAction(move(left)).
de2:- not(see(normal,up,'F')), see(list,up,U), not(nth0(1,U,'F')), not(see(normal,right,'#')),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'F'), doAction(move(up)).
de2:- see(normal,down,'F'), see(normal,left-down,'.'),doAction(move(left)).
de2:- doAction(move(right)).

%%De de2 busco pipa%%

pim:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
pim:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
pim:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
pim:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
pim:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
pim:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
pim:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
pim:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
pim:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
pim:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,right-down, left-up, left-down]).
pim:- see(list,up,U), not(nth0(1,U,'F')), not(see(normal,up,'F')), not(see(normal,right-up,'F')), not(see(normal,left-up,'F')), member('l',U), doAction(move(up)).
pim:- see(list,right,R), not(nth0(1,R,'F')), not(see(normal,right,'F')), not(see(normal,right-up,'F')), not(see(normal,right-down,'F')), member('l',R), doAction(move(right)).
pim:- see(list,down,D), not(nth0(1,D,'F')), not(see(normal,down,'F')), not(see(normal,right-down,'F')), not(see(normal,left-down,'F')), member('l',D), doAction(move(down)).
pim:- see(list,left,L), not(nth0(1,L,'F')), not(see(normal,left,'F')), not(see(normal,left-up,'F')), not(see(normal,left-down,'F')), member('l',L), doAction(move(left)).
pim:- see(list,up,U), nth0(2,U,'#'), doAction(move(right)).
pim:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
pim:- not(havingObject), not(see(normal,up,'#')), doAction(move(up)).
pim:- havingObject, see(list,right,R), nth0(1,R,'#'), doAction(move(left)).
pim:- havingObject, see(list,right,R), nth0(2,R,'#'), doAction(move(left)).
pim:- havingObject, see(list,left,L), nth0(1,L,'#'), doAction(move(right)).
pim:- havingObject, see(list,left,L), nth0(2,L,'#'), doAction(move(right)).
pim:- havingObject, not(see(normal,down,'#')), doAction(move(down)).


%%SuBa

suba:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
suba:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
suba:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
suba:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
suba:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
suba:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
suba:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
suba:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
suba:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
suba:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
suba:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,
right-down, left-up, left-down]).

suba:- see(normal,left,'F'), not(see(normal,up,'#')), doAction(move(up)).
suba:- see(normal,down,'F'), not(see(normal,left,'#')), doAction(move(left)).
suba:- see(list,right,R), not(nth0(1,R,'F')), see(normal,up,'#'), see(normal,right-up,'#'), not(see(normal,right,'F')), not(see(normal,right-down,' ')), not(see(normal,down,'#')), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(right)), writeln('Bajamos'), ce(baja).
suba:- see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'), not(see(normal,left,'#')), doAction(move(left)).
suba:- see(normal,up,'.'), not(see(normal,right-up,' ')), not(see(normal,right,'#')),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)).
suba:- see(normal,up,'F'), not(see(normal,left,'#')), doAction(move(left)).
suba:- see(normal,up,'F'), not(see(normal,right,'#')), doAction(move(right)).
suba:- see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), not(see(normal,up,'#')), doAction(move(up)).
suba:- doAction(move(down)).

%Bajamos

baja:- havingObject, see(normal,DIR,'F'), doAction(use(DIR)), member(DIR,[up,right,down,left]).
baja:- havingObject, see(list,up,U), nth0(1,U,'F'),  not(see(normal,up,'l')), doAction(use(up)).
baja:- havingObject, see(list,up,U), nth0(2,U,'F'), not(nth0(1,U,'l')), see(normal,up,'l'), doAction(move(up)).
baja:- havingObject, see(list,right,R), nth0(1,R,'F'), not(see(normal,right,'l')), doAction(use(right)).
baja:- havingObject, see(list,right,R), nth0(2,R,'F'), not(nth0(1,R,'l')), see(normal,right,'l'), doAction(move(right)).
baja:- havingObject, see(list,down,D), nth0(1,D,'F'), not(see(normal,down,'l')), doAction(use(down)).
baja:- havingObject, see(list,down,D), nth0(2,D,'F'), not(nth0(1,D,'l')), see(normal,down,'l'), doAction(move(down)).
baja:- havingObject, see(list,left,L), nth0(1,L,'F'), not(see(normal,left,'l')), doAction(use(left)).
baja:- havingObject, see(list,left,L), nth0(2,L,'F'), not(nth0(1,L,'l')), see(normal,left,'l'), doAction(move(left)).
baja:- not(havingObject), see(normal,DIR,'l'), not(see(normal,DAR,'F')), doAction(get(DIR)), member(DIR,[up,right,down,left]), member(DAR,[up,right,down,left]).
baja:- see(normal, ESQ, 'F'),  doAction(move(none)), member(ESQ,[right-up,
right-down, left-up, left-down]).

baja:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'F'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '), see(normal, left-up,'#'), doAction(move(down)).
baja:- see(normal,up,'F'), see(normal,right-up,' '), see(normal,right,' '), doAction(move(right)).
baja:- see(list,down,D), not(nth0(1,D,'F')), see(normal,down,'.'), doAction(move(down)).
baja:- see(list,right,R), not(nth0(1,R,'F')), see(normal,right,'.'), doAction(move(right)).
baja:- see(list,left,L), not(nth0(1,L,'F')), see(normal,left,'.'), doAction(move(left)).
baja:- see(list,up,U), not(nth0(1,U,'F')), see(normal,up,'.'), doAction(move(up)).
baja:- see(list,up,U), not(nth0(1,U,'F')), see(normal,up,' '), not(see(normal,left-up,' ')), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'.'), doAction(move(up)).
baja:- see(normal,up,'F'), see(normal,right-up,' '), see(normal,right,' '), see(normal,left-down,'#'),see(normal,left,'#'), doAction(move(right)).
baja:- see(normal,up,'F'), see(normal,right,' '), not(see(normal,down,'.')), not(see(normal,down,'#')), doAction(move(right)).
baja:-  see(normal,up,'F'), not(see(normal,right-up,'F')), see(normal,right,' '), not(see(normal,right-down,'F')), doAction(move(right)).
baja:- see(normal,left,'F'), see(list,up,U), not(nth0(1,U,'F')), member('.',U), doAction(move(up)).
baja:- not(see(normal,left,'F')), see(list,left,L), not(nth0(1,L,'F')), member('.',L), doAction(move(left)).
baja:- not(see(normal,left,'F')), see(normal,down,'F'),  see(normal,right-up,'#'), see(normal,right-down,'#'), not(see(normal,left,'#')), see(list,right,R), nth0(1,R,'#'),  doAction(move(left)).
baja:- not(see(normal,right,'#')), not(see(normal,right,'F')), see(list,right,R), not(nth0(1,R,'F')), doAction(move(right)).

%%Reglas principales%%
rej41(init):- retractall(estado(_)).
%Inicio----
rej41:-not(havingObject), not(see(normal,up,' ')), not(see(normal,right-up,' ')), see(normal,right,'#'),not(see(normal,right-down,' ')), not(see(normal,down,' ')), not(see(normal,left-down,' ')),see(normal,left,' '), not(see(normal, left-up,' ')), not(see(normal,up,'#')), not(see(normal,right-up,'#')), not(see(normal,right-down,'#')), not(see(normal,down,'#')), not(see(normal,left-down,'#')), not(see(normal, left-up,'#')), doAction(move(up)), ce(inicio), writeln('Estado inicial').
%------
rej41:-estado(inicio), inicio.
rej41:-estado(de), de.
rej41:-estado(ena1), ena1.
rej41:-estado(medio), med.
rej41:-estado(de2), de2.
rej41:-estado(de2pi), pim.
rej41:-estado(suba), suba.
rej41:-estado(baja), baja.
rej41:- see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)).
rej41:-gun.




