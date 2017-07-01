:- use_module('pl-man-game/main').
:- dynamic d_estado/1.

%%Esquivar dobles cosas para no morirse
hacermatar:- see(normal,left,'F'),see(normal,up,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermatar:- see(normal,left,'F'),see(normal,up,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermatar:- see(normal,left,'F'),see(normal,down,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermatar:- see(normal,left,'F'),see(normal,down,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermatar:- see(normal,right,'F'),see(normal,up,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermatar:- see(normal,right,'F'),see(normal,up,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermatar:- see(normal,right,'F'),see(normal,down,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermatar:- see(normal,right,'F'),see(normal,down,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermatar:- see(normal,right,'F'),see(normal,left,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermatar:- see(normal,right,'F'),see(normal,left,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermatar:- see(normal,up,'F'),see(normal,down,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermatar:- see(normal,up,'F'),see(normal,down,'F'),not(see(normal,left,'#')),doAction(move(left)).

%% trap de los enemigos en diagonal:
hacermatar:- see(normal,up-right,'F'), see(normal,down-right,'F'),doAction(move(none)).
hacermatar:- see(normal,up-left,'F'), see(normal,down-left,'F'), doAction(move(none)).


%% Puto trap de los enemigos a los lados diagonales y yo en paredes:
hacermatar:- see(normal,up-right,'F'),see(normal,down-right,'F'),doAction(move(none)).
hacermatar:- see(normal,up-right,'F'),see(normal,up-left,'F'),doAction(move(none)).
hacermatar:- see(normal,up-left,'F'),see(normal,down-left,'F'),doAction(move(none)).
hacermatar:- see(normal,down-left,'F'),see(normal,down-right,'F'),doAction(move(none)).

%%Sin pistola,  no ir a por el arma si tiene enemigos encima y está allado
hacermatar:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermatar:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermatar:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermatar:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermatar:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermatar:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermatar:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermatar:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermatar:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermatar:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermatar:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermatar:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%%Sin pistola, ver enemigo a 1 distancia o menos significa huir al lado opuesto
hacermatar:- not(havingObject),not(see(normal,left,'#')),see(list,right,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(left)).
hacermatar:- not(havingObject),not(see(normal,up,'#')),see(normal,right,'F'),doAction(move(up)).
hacermatar:- not(havingObject),not(see(normal,down,'#')),see(normal,right,'F'),doAction(move(down)).

hacermatar:- not(havingObject),not(see(normal,down,'#')),see(list,up,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(down)).
hacermatar:- not(havingObject),not(see(normal,left,'#')),see(normal,up,'F'),doAction(move(up)).
hacermatar:- not(havingObject),not(see(normal,right,'#')),see(normal,up,'F'),doAction(move(up)).

hacermatar:- not(havingObject),not(see(normal,up,'#')),see(list,down,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(up)).
hacermatar:- not(havingObject),not(see(normal,left,'#')),see(normal,down,'F'),doAction(move(left)).
hacermatar:- not(havingObject),not(see(normal,right,'#')),see(normal,down,'F'),doAction(move(right)).

hacermatar:- not(havingObject),not(see(normal,right,'#')),see(list,left,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(right)).
hacermatar:- not(havingObject),not(see(normal,up,'#')),see(normal,left,'F'),doAction(move(up)).
hacermatar:- not(havingObject),not(see(normal,down,'#')),see(normal,left,'F'),doAction(move(down)).



hacermatar:- not(havingObject),retractall(d_estado(_)),assert(d_estado(moverad)).
hacermatar:- havingObject,member(DIR,[up,right,down,left]),see(normal,DIR,'F'),doAction(use(DIR)).

hacermatar:- havingObject,see(list,right,L),nth0(1,L,'F'),doAction(use(right)).
hacermatar:- havingObject,see(list,down,L),nth0(1,L,'F'),doAction(use(down)).
hacermatar:- havingObject,see(list,up,L),nth0(1,L,'F'),doAction(use(up)).
hacermatar:- havingObject,see(list,left,L),nth0(1,L,'F'),doAction(use(left)).

hacermatar:- havingObject,see(list,right,L),member('F',L),doAction(use(right)).
hacermatar:- havingObject,see(list,down,L),member('F',L),doAction(use(down)).
hacermatar:- havingObject,see(list,up,L),member('F',L),doAction(use(up)).
hacermatar:- havingObject,see(list,left,L),member('F',L),doAction(use(left)).
hacermatar:- see(normal,DIR,'F'),doAction(move(none)),member(DIR,[up-right,right-down,down-left,up-left]).
hacermatar:- see(normal,down,'#'),see(normal,left,'#'),see(list,right,R),see(list,up,U),not(member('F',R)),not(member('F',U)),retractall(d_estado(_)),assert(d_estado(moverad)).
hacermatar:- see(normal,up,'#'),see(normal,right,'#'),see(list,left,L),see(list,down,D),not(member('F',L)),not(member('F',D)),retractall(d_estado(_)),assert(d_estado(moverbi)).

hacermatar:- see(list,up,L),member('.',L),doAction(move(up)).
hacermatar:- see(list,right,L),member('.',L),doAction(move(right)).
hacermatar:- see(list,left,L),member('.',L),doAction(move(left)).
hacermatar:- see(list,down,L),member('.',L),doAction(move(down)).

hacermatar:- see(list,up,L),not(member('.',L)),retractall(d_estado(_)),assert(d_estado(moverad)).
hacermatar:- see(list,down,L),not(member('.',L)),retractall(d_estado(_)),assert(d_estado(moverbi)).
hacermatar:- see(list,right,L),not(member('.',L)),retractall(d_estado(_)),assert(d_estado(moverad)).
hacermatar:- see(list,left,L),not(member('.',L)),retractall(d_estado(_)),assert(d_estado(moverbi)).

%Si ves que la pistola estorba, pégale un tiro
hacermatar:- havingObject, see(normal,down,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(down)).
hacermatar:- havingObject, see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(right)).
hacermatar:- havingObject, see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(up)).
hacermatar:- havingObject, see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(left)).






%%Todo posible trap entre 2 enemigos, con y sin pistola
hacermoverad:- see(normal,left,'F'),see(normal,up,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- see(normal,left,'F'),see(normal,up,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(normal,left,'F'),see(normal,down,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- see(normal,left,'F'),see(normal,down,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(normal,right,'F'),see(normal,up,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(normal,right,'F'),see(normal,up,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(normal,right,'F'),see(normal,down,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(normal,right,'F'),see(normal,down,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,right,R),see(list,left,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,right,R),see(list,left,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,up,R),see(list,down,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,up,R),see(list,down,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,right,R),see(normal,left,'F'),nth0(1,R,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,right,R),see(normal,left,'F'),nth0(1,R,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,up,R),see(normal,down,'F'),nth0(1,R,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,up,R),see(normal,down,'F'),nth0(1,R,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,right,'F'),see(list,left,L),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,right,'F'),see(list,left,L),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,up,'F'),see(list,down,L),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,up,'F'),see(list,down,L),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,right,'F'),see(normal,left,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(normal,right,'F'),see(normal,left,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(normal,up,'F'),see(normal,down,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,up,'F'),see(normal,down,'F'),not(see(normal,left,'#')),doAction(move(left)).


%% Trap de los enemigos a los lados y tu en una pared y sin pistola
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(1,L,'F'),nth0(2,R,'F'),see(normal,down-right,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(1,R,'F'),see(normal,down-left,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(1,L,'F'),nth0(2,R,'F'),see(normal,up-right,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(1,R,'F'),see(normal,up-left,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(0,L,'F'),nth0(2,R,'F'),see(normal,down-right,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(0,R,'F'),see(normal,down-left,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(0,L,'F'),nth0(2,R,'F'),see(normal,up-right,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(0,R,'F'),see(normal,up-left,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).


%% Trap de los enemigos a los lados y tu en medio de la pared y sin pistola
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(1,L,'F'),nth0(2,R,'F'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(1,R,'F'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

%% trap de los enemigos en diagonal:
hacermoverad:- see(normal,up-right,'F'), see(normal,down-right,'F'),doAction(move(none)).
hacermoverad:- see(normal,up-left,'F'), see(normal,down-left,'F'), doAction(move(none)).


%% Puto trap de los enemigos a los lados diagonales y yo en paredes:
hacermoverad:- see(normal,up-right,'F'),see(normal,down-right,'F'),doAction(move(none)).
hacermoverad:- see(normal,up-right,'F'),see(normal,up-left,'F'),doAction(move(none)).
hacermoverad:- see(normal,up-left,'F'),see(normal,down-left,'F'),doAction(move(none)).
hacermoverad:- see(normal,down-left,'F'),see(normal,down-right,'F'),doAction(move(none)).

%%Parámetro de elección en caso de estar cerca de la esquina para 2 enemigos que te siguen:
hacermoverad:- see(list,up,R),see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(left)).
hacermoverad:- see(list,down,R),see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,up,R),see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(left)).
hacermoverad:- see(list,down,R),see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

hacermoverad:- see(list,left,R),see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- see(list,right,R),see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(list,left,R),see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- see(list,right,R),see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).


%%Ver dos enemigos seguidos significa huir, no vaya a ser que les dispares
hacermoverad:- see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).

%%Con pistola, no ir a por el arma si tiene enemigos encima a 1 distancia,vete a un lado mejor
hacermoverad:- see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermoverad:- see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermoverad:- see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverad:- see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima y está allado
hacermoverad:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermoverad:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermoverad:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverad:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima a 2 distancia y pistola al lado
hacermoverad:- not(havingObject),see(list,right,L), nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,down,L), nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L), nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima a 2 distancia
hacermoverad:- not(havingObject),see(list,right,L), nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,down,L), nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L), nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima a 1 distancia,vete a un lado mejor
hacermoverad:- not(havingObject),see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermoverad:- not(havingObject),see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverad:- not(havingObject),see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%%Con pistola o no, no ir a por el arma si tiene putas F al lado hija de perra
hacermoverad:- see(normal,down-right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,down-right,'F'),see(normal,right,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(normal,up-right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,up-right,'F'),see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(normal,down-left,'F'),see(normal,down,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,down-left,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(normal,down-right,'F'),see(normal,down,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,down-right,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverad:- see(normal,up-right,'F'),see(normal,up,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,up-right,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(normal,up-left,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverad:- see(normal,up-left,'F'),see(normal,up,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,down-left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,down-left,'F'),see(normal,left,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverad:- see(normal,up-left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,up-left,'F'),see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).


%%Si tienes la pipa úsala
hacermoverad:- havingObject,member(DIR,[up,down,right,left]),see(normal,DIR,'F'),doAction(use(DIR)).

%%Solo si tienes pistola, Ver enemigo = matar
hacermoverad:- havingObject,see(list,right,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).
hacermoverad:- havingObject,see(list,up,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).
hacermoverad:- havingObject,see(list,down,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).
hacermoverad:- havingObject,see(list,left,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).

%%Sin pistola, cuidado de la esquina suprema,que vas corriendo a por la pistola y te chocascontra un enemy 
hacermoverad:- not(havingObject),see(normal,up-right,'F'), see(list,up,L),see(list,right,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,down,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverad:- not(havingObject),see(normal,up-left,'F'), see(list,up,L),see(list,left,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,down,'#'),see(normal,right,'#'),doAction(move(none)).
hacermoverad:- not(havingObject),see(normal,down-right,'F'), see(list,right,L),see(list,down,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,up,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverad:- not(havingObject),see(normal,down-left,'F'), see(list,down,L),see(list,left,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,up,'#'),see(normal,right,'#'),doAction(move(none)).

%%Sin pistola, si te sigue un enemigo en esquinica, ve a por la pistola si la ves
hacermoverad:- not(havingObject),see(normal,up-right,'F'),not(see(normal,down,'F')),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,up-right,'F'),not(see(normal,left,'F')),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,up-left,'F'),not(see(normal,down,'F')),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,up-left,'F'),not(see(normal,right,'F')),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,down-left,'F'),not(see(normal,right,'F')),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,down-left,'F'),not(see(normal,up,'F')),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,down-right,'F'),not(see(normal,left,'F')),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,down-right,'F'),not(see(normal,up,'F')),see(list,up,R),member('l',R),doAction(move(up)).


%% Si estás en una esquinica rara, quédate quieto
hacermoverad:- see(normal,up-right,'F'), see(list,up,L),see(list,right,R),not(member('F',L)),not(member('F',R)),see(normal,down,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverad:- see(normal,up-left,'F'), see(list,up,L),see(list,left,R),not(member('F',L)),not(member('F',R)),see(normal,down,'#'),see(normal,right,'#'),doAction(move(none)).
hacermoverad:- see(normal,down-right,'F'), see(list,right,L),see(list,down,R),not(member('F',L)),not(member('F',R)), see(normal,up,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverad:- see(normal,down-left,'F'), see(list,down,L),see(list,left,R),not(member('F',L)),not(member('F',R)),see(normal,up,'#'),see(normal,right,'#'),doAction(move(none)).


%%la mierda esa donde la palmas siempre, pa esquivarla
hacermoverad:- see(normal,down-right,'F'),see(list,left,L),nth0(1,L,'F'),see(normal,up,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,down-left,'F'),see(list,right,L),nth0(1,L,'F'),see(normal,up,'#'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,up-right,'F'),see(list,left,L),nth0(1,L,'F'),see(normal,down,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,up-left,'F'),see(list,right,L),nth0(1,L,'F'),see(normal,down,'#'),not(see(normal,left,'#')),doAction(move(left)).

%%la mierda esa donde la palmas siempre pero ahora al ladito, pa esquivarla
hacermoverad:- see(normal,down-right,'F'),see(normal,left,'F'),see(normal,up,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,down-left,'F'),see(normal,right,'F'),see(normal,up,'#'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,up-right,'F'),see(normal,left,'F'),see(normal,down,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,up-left,'F'),see(normal,right,'F'),see(normal,down,'#'),not(see(normal,left,'#')),doAction(move(left)).

%%El spawn de lado pero con el enemigo arriba a una distancia y al lado
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),see(list,up,U),nth0(1,U,'F'),doAction(move(down)).
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),see(list,down,D),nth0(1,D,'F'),doAction(move(up)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),see(list,up,U),nth0(1,U,'F'),doAction(move(down)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),see(list,down,D),nth0(1,D,'F'),doAction(move(up)).

%%El spawn, jodido spawn de lado
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

%%El spawn, jodido spawn en diagonal
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,down-right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,up-right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,down-left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,up-left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

%%Si no tienes pistola, y encima te coge en el spawn con los enemigos al lado, haz esta mierda:
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,up,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,up,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,down,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,down,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Si no tienes pistola, y encima te coge en el spawn, haz esta mierda:
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,down-right,'F'),see(normal,up,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,down-left,'F'),see(normal,up,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(normal,up-right,'F'),see(normal,down,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,right,L),nth0(1,L,'#'),see(normal,up-left,'F'),see(normal,down,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Cosa al lado del spawn, que con la regla de abajo te mata. Arriba derecha enemy y abajo, ten cuidado
hacermoverad:- see(normal,down-right,'F'),see(normal,up,'F'),see(normal,left,'#'),see(list,right,L),nth0(1,L,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(normal,down-left,'F'),see(normal,up,'F'),see(normal,right,'#'),see(list,left,L),nth0(1,L,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(normal,up-right,'F'),see(normal,down,'F'),see(normal,left,'#'),see(list,right,L),nth0(1,L,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(normal,up-left,'F'),see(normal,down,'F'),see(normal,right,'#'),see(list,left,L),nth0(1,L,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Si tienes un enemigo en esquina y el otro al lado y te embalas a por el coco, pues mejor no
hacermoverad:- see(normal,down-right,'F'),see(normal,up,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,down-left,'F'),see(normal,up,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverad:- see(normal,up-right,'F'),see(normal,down,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverad:- see(normal,up-left,'F'),see(normal,down,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(left)).

%%Si tienes un enemigo en esquina y el otro a distancia 1 y te embalas a por el coco, pues mejor no
hacermoverad:- see(normal,down-right,'F'),see(list,up,L),nth0(1,L,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(none)).
hacermoverad:- see(normal,down-left,'F'),see(list,up,L),nth0(1,L,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(none)).
hacermoverad:- see(normal,up-right,'F'),see(list,down,L),nth0(1,L,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(none)).
hacermoverad:- see(normal,up-left,'F'),see(list,down,L),nth0(1,L,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(none)).

%%Sin pistola, Si estás en la situación de izquierad y abajo derecha enemigo (de lado) y (de pie), dale a esquivar:
hacermoverad:- see(normal,left,'F'),see(normal,down-right,'F'),see(normal,up,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- see(normal,right,'F'),see(normal,down-left,'F'),see(normal,up,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(normal,right,'F'),see(normal,up-left,'F'),see(normal,down,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(normal,left,'F'),see(normal,up-right,'F'),see(normal,down,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

hacermoverad:- see(normal,up,'F'),see(normal,down-left,'F'),see(normal,right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(normal,down,'F'),see(normal,up-left,'F'),see(normal,right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(normal,up,'F'),see(normal,down-right,'F'),see(normal,left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(normal,down,'F'),see(normal,up-right,'F'),see(normal,left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, en una esquina con enemigo arriba derecha y detrás a distancia 1:
hacermoverad:- see(list,right,R),nth0(1,R,'#'),see(list,left,L),nth0(1,L,'F'),see(normal,down-right,'F'),see(normal,up,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(list,right,R),nth0(1,R,'F'),see(normal,down-left,'F'),see(normal,up,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- see(list,left,L),nth0(1,L,'#'),see(list,right,R),nth0(1,R,'F'),see(normal,up-left,'F'),see(normal,down,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- see(list,right,R),nth0(1,R,'#'),see(list,left,L),nth0(1,L,'F'),see(normal,up-right,'F'),see(normal,down,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

hacermoverad:- see(list,down,D),nth0(1,D,'#'),see(list,up,U),nth0(1,U,'F'),see(normal,down-left,'F'),see(normal,right,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(list,up,U),nth0(1,U,'#'),see(list,down,D),nth0(1,D,'F'),see(normal,up-left,'F'),see(normal,right,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- see(list,down,D),nth0(1,D,'#'),see(list,up,U),nth0(1,U,'F'),see(normal,down-right,'F'),see(normal,left,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- see(list,up,U),nth0(1,U,'#'),see(list,down,D),nth0(1,D,'F'),see(normal,up-right,'F'),see(normal,left,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).


%%Sin pistola, Ahora la chabaca. Enemigo a distancia y enemigo abajo, a esquivar.
hacermoverad:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(normal,down,'F'),see(normal,up,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(normal,down,'F'),see(normal,up,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(normal,up,'F'),see(normal,down,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(normal,up,'F'),see(normal,down,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(normal,left,'F'),see(normal,right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(normal,left,'F'),see(normal,right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(normal,right,'F'),see(normal,left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(normal,right,'F'),see(normal,left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, Si ves un enemigo a una esquina, muévete al otro lado
hacermoverad:- see(normal,up-right,'F'),not(see(normal,down,'#')),see(list,down,L),not(see(normal,down,'F')),not(nth0(1,L,'F')),doAction(move(down)).
hacermoverad:- see(normal,up-right,'F'),not(see(normal,left,'#')),see(list,left,L),not(see(normal,left,'F')),not(nth0(1,L,'F')),doAction(move(left)).
hacermoverad:- see(normal,up-left,'F'),not(see(normal,right,'#')),see(list,right,L),not(see(normal,right,'F')),not(nth0(1,L,'F')),doAction(move(right)).
hacermoverad:- see(normal,up-left,'F'),not(see(normal,down,'#')),see(list,down,L),not(see(normal,down,'F')),not(nth0(1,L,'F')),doAction(move(down)).
hacermoverad:- see(normal,down-right,'F'),not(see(normal,left,'#')),see(list,left,L),not(see(normal,left,'F')),not(nth0(1,L,'F')),doAction(move(left)).
hacermoverad:- see(normal,down-right,'F'),not(see(normal,up,'#')),see(list,up,L),not(see(normal,up,'F')),not(nth0(1,L,'F')),doAction(move(up)).
hacermoverad:- see(normal,down-left,'F'),not(see(normal,up,'#')),see(list,up,L),not(see(normal,up,'F')),not(nth0(1,L,'F')),doAction(move(up)).
hacermoverad:- see(normal,down-left,'F'),not(see(normal,right,'#')),see(list,right,L),not(see(normal,right,'F')),not(nth0(1,L,'F')),doAction(move(right)).

%% Sin pistola, si ves un enemigo,prioriza ir a por la pistola antes que huir
hacermoverad:- not(havingObject),see(list,right,L),nth0(0,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,right,L),nth0(0,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),nth0(0,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L),nth0(0,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(0,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(0,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,down,L),nth0(0,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,down,L),nth0(0,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverad:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).


%%Sin pistola, Parámetro de elección con enemy a 1 de distancia y pared a 1 de distancia en esquina pared para no quedarse encerrado
hacermoverad:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

hacermoverad:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

%%Sin pistola, Parámetro de elección con enemy a 1 de distancia para no quedarse encerrado.
hacermoverad:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).

hacermoverad:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, Parámetro de elección con enemy al lado para no quedarse encerrado.
hacermoverad:- not(havingObject), see(normal,down,'F'),see(normal,up,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject), see(normal,up,'F'),see(normal,down,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject), see(normal,down,'F'),see(normal,up,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject), see(normal,up,'F'),see(normal,down,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).

hacermoverad:- not(havingObject), see(normal,right,'F'),see(normal,left,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject), see(normal,right,'F'),see(normal,left,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject), see(normal,left,'F'),see(normal,right,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject), see(normal,left,'F'),see(normal,right,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, Si ves una pared a 1 de distancia y un enemigo detrás,dobla
hacermoverad:- not(havingObject),see(normal,left,'F'),not(see(normal,up,'F')),see(list,right,L),nth0(1,L,'#'),see(normal,down,'#'), doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,up,'F'),not(see(normal,left,'F')),see(list,down,L),nth0(1,L,'#'),see(normal,right,'#'), doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,right,'F'),not(see(normal,up,'F')),see(list,left,L),nth0(1,L,'#'),see(normal,down,'#'), doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,up,'F'),not(see(normal,right,'F')),see(list,down,L),nth0(1,L,'#'),see(normal,left,'#'), doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,left,'F'),not(see(normal,down,'F')),see(list,right,L),nth0(1,L,'#'),see(normal,up,'#'), doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,down,'F'),not(see(normal,left,'F')),see(list,up,L),nth0(1,L,'#'),see(normal,right,'#'), doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,right,'F'),not(see(normal,down,'F')),see(list,left,L),nth0(1,L,'#'),see(normal,up,'#'), doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,down,'F'),not(see(normal,right,'F')),see(list,up,L),nth0(1,L,'#'),see(normal,left,'#'), doAction(move(right)).

%%Sin pistola, si ves una pared al lado y un enemigo detrás, dobla a otro lado
hacermoverad:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(0,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(0,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(0,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(0,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(0,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(0,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(0,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(0,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(1,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(1,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(1,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverad:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(1,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverad:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(1,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(1,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverad:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(1,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverad:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(1,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

%%El de ni zorra que está mal hecho, pero ara bien
hacermoverad:- not(havingObject),not(see(normal,left,'#')),see(normal,up-left,'F'),see(list,right,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(left)).
hacermoverad:- not(havingObject),not(see(normal,down,'#')),see(normal,down-left,'F'),see(list,up,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(down)).
hacermoverad:- not(havingObject),not(see(normal,up,'#')),see(normal,up-right,'F'),see(list,down,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(up)).
hacermoverad:- not(havingObject),not(see(normal,right,'#')),see(normal,down-right,'F'),see(list,left,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(right)).

%%ni zorra,seráde esquivar enemigos
hacermoverad:- not(havingObject),not(see(normal,left,'#')),see(normal,up-left,'F'),see(list,right,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(up)).
hacermoverad:- not(havingObject),not(see(normal,down,'#')),see(normal,down-left,'F'),see(list,up,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(left)).
hacermoverad:- not(havingObject),not(see(normal,up,'#')),see(normal,up-right,'F'),see(list,down,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(right)).
hacermoverad:- not(havingObject),not(see(normal,right,'#')),see(normal,down-right,'F'),see(list,left,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(down)).

%%Sin pistola, ver enemigo a 1 distancia o menos significa huir al lado opuesto
hacermoverad:- not(havingObject),not(see(normal,left,'#')),see(list,right,L),nth0(1,L,'F'),doAction(move(left)).
hacermoverad:- not(havingObject),not(see(normal,down,'#')),see(list,up,L),nth0(1,L,'F'),doAction(move(down)).
hacermoverad:- not(havingObject),not(see(normal,up,'#')),see(list,down,L),nth0(1,L,'F'),doAction(move(up)).
hacermoverad:- not(havingObject),not(see(normal,right,'#')),see(list,left,L),nth0(1,L,'F'),doAction(move(right)).
hacermoverad:- not(havingObject),not(see(normal,left,'#')),see(list,right,L),nth0(0,L,'F'),doAction(move(left)).
hacermoverad:- not(havingObject),not(see(normal,down,'#')),see(list,up,L),nth0(0,L,'F'),doAction(move(down)).
hacermoverad:- not(havingObject),not(see(normal,up,'#')),see(list,down,L),nth0(0,L,'F'),doAction(move(up)).
hacermoverad:- not(havingObject),not(see(normal,right,'#')),see(list,left,L),nth0(0,L,'F'),doAction(move(right)).


%% cambiar patron de movimiento hacia abajo
hacermoverad:- see(normal,up,'#'),see(normal,right,'#'),retractall(d_estado(_)),assert(d_estado(moverbi)).

%%Si no ves cocos a la izquierda que comer, ve a la derecha copón:
hacermoverad:- see(normal,up,'#'),see(normal,up-right,'#'),see(normal,up-left,'#'),not(see(normal,right,'#')),not(see(normal,left,'#')),not(nth0(1,R,'#')),see(list,right,R),not(nth0(1,L,'#')),see(list,left,L),see(list,down,D),not(member('.',D)),not(member('F',D)),not(member('.',L)),not(member('F',L)),retractall(d_estado(_)),assert(d_estado(moverbi)).


%ir a por el arma si no hay nada
hacermoverad:- not(havingObject),see(normal,DIR,'l'),doAction(get(DIR)),member(DIR,[up,right,down,left]).
hacermoverad:- not(havingObject),see(list,right,L),member('l',L),doAction(move(right)).
hacermoverad:- not(havingObject),see(list,up,L),member('l',L),doAction(move(up)).
hacermoverad:- not(havingObject),see(list,down,L),member('l',L),doAction(move(down)).
hacermoverad:- not(havingObject),see(list,left,L),member('l',L),doAction(move(left)).

%%comer coquitos
hacermoverad:- see(list,up,L),member('.',L),doAction(move(up)).
hacermoverad:- see(list,down,L),member('.',L),doAction(move(down)).
hacermoverad:- see(list,right,L),member('.',L),doAction(move(right)).
hacermoverad:- see(list,left,L),member('.',L),doAction(move(left)).
%Si ves que la pistola estorba, pégale un tiro
hacermoverad:- havingObject, see(normal,down,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(down)).
hacermoverad:- havingObject, see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(right)).
hacermoverad:- havingObject, see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(up)).
hacermoverad:- havingObject, see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(left)).
%%lo vacio
hacermoverad:- see(normal,up,' '),doAction(move(up)).
hacermoverad:- see(normal,right,' '),doAction(move(right)).
hacermoverad:- see(normal,down,' '),doAction(move(down)).
hacermoverad:- see(normal,left,' '),doAction(move(left)).






%%Todo posible trap entre 2 enemigos, con y sin pistola

hacermoverbi:- see(normal,left,'F'),see(normal,up,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- see(normal,left,'F'),see(normal,up,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(normal,left,'F'),see(normal,down,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- see(normal,left,'F'),see(normal,down,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(normal,right,'F'),see(normal,up,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(normal,right,'F'),see(normal,up,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(normal,right,'F'),see(normal,down,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(normal,right,'F'),see(normal,down,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,right,R),see(list,left,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,right,R),see(list,left,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,up,R),see(list,down,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,up,R),see(list,down,L),nth0(1,L,'F'),nth0(1,R,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,right,R),see(normal,left,'F'),nth0(1,R,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,right,R),see(normal,left,'F'),nth0(1,R,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,up,R),see(normal,down,'F'),nth0(1,R,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,up,R),see(normal,down,'F'),nth0(1,R,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,right,'F'),see(list,left,L),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,right,'F'),see(list,left,L),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,up,'F'),see(list,down,L),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,up,'F'),see(list,down,L),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,right,'F'),see(normal,left,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(normal,right,'F'),see(normal,left,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(normal,up,'F'),see(normal,down,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,up,'F'),see(normal,down,'F'),not(see(normal,left,'#')),doAction(move(left)).



%% Trap de los enemigos a los lados y tu en una pared y sin pistola
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(1,L,'F'),nth0(2,R,'F'),see(normal,down-right,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(1,R,'F'),see(normal,down-left,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(1,L,'F'),nth0(2,R,'F'),see(normal,up-right,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(1,R,'F'),see(normal,up-left,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(0,L,'F'),nth0(2,R,'F'),see(normal,down-right,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(0,R,'F'),see(normal,down-left,'#'),see(normal,up,'#'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(0,L,'F'),nth0(2,R,'F'),see(normal,up-right,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(0,R,'F'),see(normal,up-left,'#'),see(normal,down,'#'),not(see(normal,up,'#')),doAction(move(up)).

%% Trap de los enemigos a los lados y tu en medio de la pared y sin pistola
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(1,L,'F'),nth0(2,R,'F'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,left,L),see(list,right,R),nth0(2,L,'F'),nth0(1,R,'F'),see(normal,down,'#'),see(normal,up,'#'),doAction(move(left)).

%% trap de los enemigos en diagonal:
hacermoverbi:- see(normal,up-right,'F'), see(normal,down-right,'F'),doAction(move(none)).
hacermoverbi:- see(normal,up-left,'F'), see(normal,down-left,'F'), doAction(move(none)).

%% Puto trap de los enemigos en diagonal y yo en paredes:
hacermoverbi:- see(normal,up-right,'F'),see(normal,down-right,'F'),doAction(move(none)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,up-left,'F'),doAction(move(none)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,down-left,'F'),doAction(move(none)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,down-right,'F'),doAction(move(none)).

%%Parámetro de elección en caso de estar cerca de la esquina para 2 enemigos que te siguen:
hacermoverbi:- see(list,up,R),see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(left)).
hacermoverbi:- see(list,down,R),see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,up,R),see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(left)).
hacermoverbi:- see(list,down,R),see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

hacermoverbi:- see(list,left,R),see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- see(list,right,R),see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(list,left,R),see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- see(list,right,R),see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).

%%Ver dos enemigos seguidos significa huir, no vaya a ser que les dispares
hacermoverbi:- see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(list,right,L),see(normal,right,'F'),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(list,up,L),see(normal,up,'F'),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(list,left,L),see(normal,left,'F'),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(list,down,L),see(normal,down,'F'),nth0(1,L,'F'),not(see(normal,right,'#')),doAction(move(right)).

%%Con pistola, no ir a por el arma si tiene enemigos encima a 1 distancia,vete a un lado mejor
hacermoverbi:- see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermoverbi:- see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermoverbi:- see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverbi:- see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima y está allado

hacermoverbi:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject), see(normal,right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermoverbi:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject), see(normal,up,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermoverbi:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject), see(normal,down,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverbi:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(normal,left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima a 2 distancia y pistola al lado
hacermoverbi:- not(havingObject),see(list,right,L), nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,down,L), nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L), nth0(2,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%% no ir a por el arma si tiene enemigos encima a 2 distancia
hacermoverbi:- not(havingObject),see(list,right,L), nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,down,L), nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L), nth0(2,L,'F'),nth0(1,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).


%% no ir a por el arma si tiene enemigos encima a 1 distancia,vete a un lado mejor
hacermoverbi:- not(havingObject),see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,right,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).

hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

hacermoverbi:- not(havingObject),see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,down,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverbi:- not(havingObject),see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L), nth0(1,L,'F'),nth0(0,L,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).

%%Con pistola o no, no ir a por el arma si tiene putas F al lado hija de perra
hacermoverbi:- see(normal,down-right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,down-right,'F'),see(normal,right,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,right,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,down,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(normal,down-right,'F'),see(normal,down,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,down-right,'F'),see(normal,down,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).

hacermoverbi:- see(normal,up-right,'F'),see(normal,up,'l'),not(see(normal,left,'F')),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,up,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,left,'l'),not(see(normal,up,'F')),not(see(normal,up,'#')),doAction(move(up)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,left,'l'),not(see(normal,right,'F')),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down,'#')),doAction(move(down)).

%%Si tienes la pipa úsala
hacermoverbi:- havingObject,member(DIR,[up,down,right,left]),see(normal,DIR,'F'),doAction(use(DIR)).

%%Solo si tienes pistola, Ver enemigo = matar
hacermoverbi:- havingObject,see(list,right,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).
hacermoverbi:- havingObject,see(list,up,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).
hacermoverbi:- havingObject,see(list,down,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).
hacermoverbi:- havingObject,see(list,left,L),member('F',L),retractall(d_estado(_)),assert(d_estado(matar)).




%%Sin pistola, cuidado de la esquina suprema,que vas corriendo a por la pistola y te chocascontra un enemy 
hacermoverbi:- not(havingObject),see(normal,up-right,'F'), see(list,up,L),see(list,right,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,down,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverbi:- not(havingObject),see(normal,up-left,'F'), see(list,up,L),see(list,left,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,down,'#'),see(normal,right,'#'),doAction(move(none)).
hacermoverbi:- not(havingObject),see(normal,down-right,'F'), see(list,right,L),see(list,down,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')), see(normal,up,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverbi:- not(havingObject),see(normal,down-left,'F'), see(list,down,L),see(list,left,R),not(nth0(1,L,'F')),not(nth0(1,R,'F')),not(nth0(2,L,'F')),not(nth0(2,R,'F')),not(nth0(3,L,'F')),not(nth0(3,R,'F')),see(normal,up,'#'),see(normal,right,'#'),doAction(move(none)).

%%Sin pistola, si te sigue un enemigo en esquinica, ve a por la pistola si la ves
hacermoverbi:- not(havingObject),see(normal,up-right,'F'),not(see(normal,down,'F')),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,up-right,'F'),not(see(normal,left,'F')),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,up-left,'F'),not(see(normal,down,'F')),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,up-left,'F'),not(see(normal,right,'F')),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,down-left,'F'),not(see(normal,right,'F')),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,down-left,'F'),not(see(normal,up,'F')),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,down-right,'F'),not(see(normal,left,'F')),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,down-right,'F'),not(see(normal,up,'F')),see(list,up,R),member('l',R),doAction(move(up)).




%%Sin pistola, Si estás en una esquinica rara, quédate quieto
hacermoverbi:- see(normal,up-right,'F'), see(list,up,L),see(list,right,R),not(member('F',L)),not(member('F',R)),
see(normal,down,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverbi:- see(normal,up-left,'F'), see(list,up,L),see(list,left,R),not(member('F',L)),not(member('F',R)),
see(normal,down,'#'),see(normal,right,'#'),doAction(move(none)).
hacermoverbi:- see(normal,down-right,'F'), see(list,right,L),see(list,down,R),not(member('F',L)),not(member('F',R)), see(normal,up,'#'),see(normal,left,'#'),doAction(move(none)).
hacermoverbi:- see(normal,down-left,'F'), see(list,down,L),see(list,left,R),not(member('F',L)),not(member('F',R)),see(normal,up,'#'),see(normal,right,'#'),doAction(move(none)).

%%la mierda esa donde la palmas siempre, pa esquivarla
hacermoverbi:- see(normal,down-right,'F'),see(list,left,L),nth0(1,L,'F'),see(normal,up,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,down-left,'F'),see(list,right,L),nth0(1,L,'F'),see(normal,up,'#'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,up-right,'F'),see(list,left,L),nth0(1,L,'F'),see(normal,down,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,up-left,'F'),see(list,right,L),nth0(1,L,'F'),see(normal,down,'#'),not(see(normal,left,'#')),doAction(move(left)).

%%la mierda esa donde la palmas siempre pero ahora al ladito, pa esquivarla
hacermoverbi:- see(normal,down-right,'F'),see(normal,left,'F'),see(normal,up,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,right,'F'),see(normal,up,'#'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,left,'F'),see(normal,down,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,right,'F'),see(normal,down,'#'),not(see(normal,left,'#')),doAction(move(left)).

%%El spawn de lado pero con el enemigo arriba a una distancia y al lado
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),see(list,up,U),nth0(1,U,'F'),doAction(move(down)).
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),see(list,down,D),nth0(1,D,'F'),doAction(move(up)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),see(list,up,U),nth0(1,U,'F'),doAction(move(down)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),see(list,down,D),nth0(1,D,'F'),doAction(move(up)).

%%El spawn, jodido spawn de lado
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

%%El spawn, jodido spawn en diagonal
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,down-right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,up-right,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,down-left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,up-left,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

%%Si no tienes pistola, y encima te coge en el spawn con los enemigos al lado, haz esta mierda:
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,up,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,up,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,right,'F'),see(normal,down,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,left,'F'),see(normal,down,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Si no tienes pistola, y encima te coge en el spawn, haz esta mierda:
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,down-right,'F'),see(normal,up,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,down-left,'F'),see(normal,up,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(normal,up-right,'F'),see(normal,down,'F'),see(normal,left,' '),see(normal,up-left,'#'),see(normal,down-left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,right,L),nth0(1,L,'#'),see(normal,up-left,'F'),see(normal,down,'F'),see(normal,right,' '),see(normal,up-right,'#'),see(normal,down-right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Cosa al lado del spawn, que con la regla de abajo te mata. Arriba derecha enemy y abajo, ten cuidado
hacermoverbi:- see(normal,down-right,'F'),see(normal,up,'F'),see(normal,left,'#'),see(list,right,L),nth0(1,L,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,up,'F'),see(normal,right,'#'),see(list,left,L),nth0(1,L,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,down,'F'),see(normal,left,'#'),see(list,right,L),nth0(1,L,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,down,'F'),see(normal,right,'#'),see(list,left,L),nth0(1,L,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).


%%Si tienes un enemigo en esquina y el otro al lado y te embalas a por el coco, pues mejor no
hacermoverbi:- see(normal,down-right,'F'),see(normal,up,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,down-left,'F'),see(normal,up,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(left)).
hacermoverbi:- see(normal,up-right,'F'),see(normal,down,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(right)).
hacermoverbi:- see(normal,up-left,'F'),see(normal,down,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(left)).

%%Si tienes un enemigo en esquina y el otro a distancia 1 y te embalas a por el coco, pues mejor no
hacermoverbi:- see(normal,down-right,'F'),see(list,up,L),nth0(1,L,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(none)).
hacermoverbi:- see(normal,down-left,'F'),see(list,up,L),nth0(1,L,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(none)).
hacermoverbi:- see(normal,up-right,'F'),see(list,down,L),nth0(1,L,'F'),see(normal,left,'#'),not(see(normal,right,'#')),doAction(move(none)).
hacermoverbi:- see(normal,up-left,'F'),see(list,down,L),nth0(1,L,'F'),see(normal,right,'#'),not(see(normal,left,'#')),doAction(move(none)).

%%Sin pistola, Si estás en la situación de izquierad y abajo derecha enemigo (de lado) y ( de pie), dale a esquivar:
hacermoverbi:- see(normal,left,'F'),see(normal,down-right,'F'),see(normal,up,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- see(normal,right,'F'),see(normal,down-left,'F'),see(normal,up,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(normal,right,'F'),see(normal,up-left,'F'),see(normal,down,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(normal,left,'F'),see(normal,up-right,'F'),see(normal,down,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

hacermoverbi:- see(normal,up,'F'),see(normal,down-left,'F'),see(normal,right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(normal,down,'F'),see(normal,up-left,'F'),see(normal,right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(normal,up,'F'),see(normal,down-right,'F'),see(normal,left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(normal,down,'F'),see(normal,up-right,'F'),see(normal,left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, en una esquina con enemigo arriba derecha y detrás a distancia 1:
hacermoverbi:- see(list,right,R),nth0(1,R,'#'),see(list,left,L),nth0(1,L,'F'),see(normal,down-right,'F'),see(normal,up,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(list,right,R),nth0(1,R,'F'),see(normal,down-left,'F'),see(normal,up,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- see(list,left,L),nth0(1,L,'#'),see(list,right,R),nth0(1,R,'F'),see(normal,up-left,'F'),see(normal,down,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- see(list,right,R),nth0(1,R,'#'),see(list,left,L),nth0(1,L,'F'),see(normal,up-right,'F'),see(normal,down,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

hacermoverbi:- see(list,down,D),nth0(1,D,'#'),see(list,up,U),nth0(1,U,'F'),see(normal,down-left,'F'),see(normal,right,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(list,up,U),nth0(1,U,'#'),see(list,down,D),nth0(1,D,'F'),see(normal,up-left,'F'),see(normal,right,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- see(list,down,D),nth0(1,D,'#'),see(list,up,U),nth0(1,U,'F'),see(normal,down-right,'F'),see(normal,left,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- see(list,up,U),nth0(1,U,'#'),see(list,down,D),nth0(1,D,'F'),see(normal,up-right,'F'),see(normal,left,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

%%Sin pistola, Ahora la chabaca. Enemigo a distancia y enemigo abajo, a esquivar.
hacermoverbi:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(normal,down,'F'),see(normal,up,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(normal,down,'F'),see(normal,up,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(normal,up,'F'),see(normal,down,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(normal,up,'F'),see(normal,down,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(normal,left,'F'),see(normal,right,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(normal,left,'F'),see(normal,right,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(normal,right,'F'),see(normal,left,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(normal,right,'F'),see(normal,left,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, Si ves un enemigo a una esquina, muévete al otro lado
hacermoverbi:- see(normal,up-right,'F'),not(see(normal,down,'#')),see(list,down,L),not(see(normal,down,'F')),not(nth0(1,L,'F')),doAction(move(down)).
hacermoverbi:- see(normal,up-right,'F'),not(see(normal,left,'#')),see(list,left,L),not(see(normal,left,'F')),not(nth0(1,L,'F')),doAction(move(left)).
hacermoverbi:- see(normal,up-left,'F'),not(see(normal,right,'#')),see(list,right,L),not(see(normal,right,'F')),not(nth0(1,L,'F')),doAction(move(right)).
hacermoverbi:- see(normal,up-left,'F'),not(see(normal,down,'#')),see(list,down,L),not(see(normal,down,'F')),not(nth0(1,L,'F')),doAction(move(down)).
hacermoverbi:- see(normal,down-right,'F'),not(see(normal,left,'#')),see(list,left,L),not(see(normal,left,'F')),not(nth0(1,L,'F')),doAction(move(left)).
hacermoverbi:- see(normal,down-right,'F'),not(see(normal,up,'#')),see(list,up,L),not(see(normal,up,'F')),not(nth0(1,L,'F')),doAction(move(up)).
hacermoverbi:- see(normal,down-left,'F'),not(see(normal,up,'#')),see(list,up,L),not(see(normal,up,'F')),not(nth0(1,L,'F')),doAction(move(up)).
hacermoverbi:- see(normal,down-left,'F'),not(see(normal,right,'#')),see(list,right,L),not(see(normal,right,'F')),not(nth0(1,L,'F')),doAction(move(right)).

%% Sin pistola, si ves un enemigo,prioriza ir a por la pistola antes que huir
hacermoverbi:- not(havingObject),see(list,right,L),nth0(0,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,right,L),nth0(0,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),nth0(0,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L),nth0(0,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(0,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(0,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,down,L),nth0(0,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,down,L),nth0(0,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,right,L),nth0(1,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(list,up,R),member('l',R),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,left,L),nth0(1,L,'F'),see(list,down,R),member('l',R),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,up,L),nth0(1,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(list,left,R),member('l',R),doAction(move(left)).
hacermoverbi:- not(havingObject),see(list,down,L),nth0(1,L,'F'),see(list,right,R),member('l',R),doAction(move(right)).


%%Sin pistola, Parámetro de elección con enemy a 1 de distancia y pared a 1 de distancia en esquina pared para no quedarse encerrado
hacermoverbi:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

hacermoverbi:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).

%%Sin pistola, Parámetro de elección con enemy a 1 de distancia para no quedarse encerrado.
hacermoverbi:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(list,down,L),nth0(1,L,'F'),see(normal,up,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject), see(list,up,L),nth0(1,L,'F'),see(normal,down,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).

hacermoverbi:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(list,right,L),nth0(1,L,'F'),see(normal,left,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(list,left,L),nth0(1,L,'F'),see(normal,right,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Sin pistola, Parámetro de elección con enemy al lado para no quedarse encerrado.
hacermoverbi:- not(havingObject), see(normal,down,'F'),see(normal,up,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(normal,up,'F'),see(normal,down,'#'),see(list,left,R),nth0(1,R,'#'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject), see(normal,down,'F'),see(normal,up,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject), see(normal,up,'F'),see(normal,down,'#'),see(list,right,R),nth0(1,R,'#'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).

hacermoverbi:- not(havingObject), see(normal,right,'F'),see(normal,left,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(normal,right,'F'),see(normal,left,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject), see(normal,left,'F'),see(normal,right,'#'),see(list,up,R),nth0(1,R,'#'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject), see(normal,left,'F'),see(normal,right,'#'),see(list,down,R),nth0(1,R,'#'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).

%%Si no tienes pistola, Si ves una pared a 1 de distancia y un enemigo detrás,dobla
hacermoverbi:- not(havingObject),see(normal,left,'F'),not(see(normal,up,'F')),see(list,right,L),nth0(1,L,'#'),see(normal,down,'#'), doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,up,'F'),not(see(normal,left,'F')),see(list,down,L),nth0(1,L,'#'),see(normal,right,'#'), doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,right,'F'),not(see(normal,up,'F')),see(list,left,L),nth0(1,L,'#'),see(normal,down,'#'), doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,up,'F'),not(see(normal,right,'F')),see(list,down,L),nth0(1,L,'#'),see(normal,left,'#'), doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,left,'F'),not(see(normal,down,'F')),see(list,right,L),nth0(1,L,'#'),see(normal,up,'#'), doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,down,'F'),not(see(normal,left,'F')),see(list,up,L),nth0(1,L,'#'),see(normal,right,'#'), doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,right,'F'),not(see(normal,down,'F')),see(list,left,L),nth0(1,L,'#'),see(normal,up,'#'), doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,down,'F'),not(see(normal,right,'F')),see(list,up,L),nth0(1,L,'#'),see(normal,left,'#'), doAction(move(right)).

%%Sin pistola, si ves una pared al lado y un enemigo detrás, dobla a otro lado
hacermoverbi:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(0,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(0,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(0,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(0,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(0,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(0,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(0,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(0,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(1,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,left,'#'),see(list,right,L),nth0(1,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(1,L,'F'),not(see(normal,up,'#')),not(see(normal,up,'F')),doAction(move(up)).
hacermoverbi:- not(havingObject),see(normal,right,'#'),see(list,left,L),nth0(1,L,'F'),not(see(normal,down,'#')),not(see(normal,down,'F')),doAction(move(down)).
hacermoverbi:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(1,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,up,'#'),see(list,down,L),nth0(1,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).
hacermoverbi:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(1,L,'F'),not(see(normal,left,'#')),not(see(normal,left,'F')),doAction(move(left)).
hacermoverbi:- not(havingObject),see(normal,down,'#'),see(list,up,L),nth0(1,L,'F'),not(see(normal,right,'#')),not(see(normal,right,'F')),doAction(move(right)).

%%El de ni zorra que está mal hecho, pero ara bien
hacermoverbi:- not(havingObject),not(see(normal,left,'#')),see(normal,up-left,'F'),see(list,right,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(left)).
hacermoverbi:- not(havingObject),not(see(normal,down,'#')),see(normal,down-left,'F'),see(list,up,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(down)).
hacermoverbi:- not(havingObject),not(see(normal,up,'#')),see(normal,up-right,'F'),see(list,down,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(up)).
hacermoverbi:- not(havingObject),not(see(normal,right,'#')),see(normal,down-right,'F'),see(list,left,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(right)).

%%ni zorra,seráde esquivar enemigos
hacermoverbi:- not(havingObject),not(see(normal,left,'#')),see(normal,up-left,'F'),see(list,right,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(up)).
hacermoverbi:- not(havingObject),not(see(normal,down,'#')),see(normal,down-left,'F'),see(list,up,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(left)).
hacermoverbi:- not(havingObject),not(see(normal,up,'#')),see(normal,up-right,'F'),see(list,down,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(right)).
hacermoverbi:- not(havingObject),not(see(normal,right,'#')),see(normal,down-right,'F'),see(list,left,L),member(POS,[0,1]),nth0(POS,L,'F'),doAction(move(down)).

%%Sin pistola, ver enemigo a 1 distancia o menos significa huir al lado opuesto
hacermoverbi:- not(havingObject),not(see(normal,left,'#')),see(list,right,L),nth0(1,L,'F'),doAction(move(left)).
hacermoverbi:- not(havingObject),not(see(normal,down,'#')),see(list,up,L),nth0(1,L,'F'),doAction(move(down)).
hacermoverbi:- not(havingObject),not(see(normal,up,'#')),see(list,down,L),nth0(1,L,'F'),doAction(move(up)).
hacermoverbi:- not(havingObject),not(see(normal,right,'#')),see(list,left,L),nth0(1,L,'F'),doAction(move(right)).
hacermoverbi:- not(havingObject),not(see(normal,left,'#')),see(list,right,L),nth0(0,L,'F'),doAction(move(left)).
hacermoverbi:- not(havingObject),not(see(normal,down,'#')),see(list,up,L),nth0(0,L,'F'),doAction(move(down)).
hacermoverbi:- not(havingObject),not(see(normal,up,'#')),see(list,down,L),nth0(0,L,'F'),doAction(move(up)).
hacermoverbi:- not(havingObject),not(see(normal,right,'#')),see(list,left,L),nth0(0,L,'F'),doAction(move(right)).

%% cambiar patron de movimiento hacia arriba
hacermoverbi:- see(normal,down,'#'),see(normal,left,'#'),retractall(d_estado(_)),assert(d_estado(moverad)).

%%Si no ves cocos a la izquierda que comer, ve a la derecha copón:
hacermoverbi:- see(normal,down,'#'),see(normal,down-right,'#'),see(normal,down-left,'#'),not(see(normal,right,'#')),not(see(normal,left,'#')),not(nth0(1,R,'#')),see(list,left,L),not(nth0(1,L,'#')),see(list,right,R),see(list,up,U),not(member('.',R)),not(member('F',R)),not(member('.',U)),not(member('F',U)),retractall(d_estado(_)),assert(d_estado(moverad)).


%ir a por el arma si no hay nada
hacermoverbi:- not(havingObject),see(normal,DIR,'l'),doAction(get(DIR)),member(DIR,[up,right,down,left]).
hacermoverbi:- not(havingObject),see(list,right,L),member('l',L),doAction(move(right)).
hacermoverbi:- not(havingObject),see(list,up,L),member('l',L),doAction(move(up)).
hacermoverbi:- not(havingObject),see(list,down,L),member('l',L),doAction(move(down)).
hacermoverbi:- not(havingObject),see(list,left,L),member('l',L),doAction(move(left)).
%%comer coquitos
hacermoverbi:- see(list,down,L),member('.',L),doAction(move(down)).
hacermoverbi:- see(list,up,L),member('.',L),doAction(move(up)).
hacermoverbi:- see(list,left,L),member('.',L),doAction(move(left)).
hacermoverbi:- see(list,right,L),member('.',L),doAction(move(right)).

%Si ves que la pistola estorba, pégale un tiro
hacermoverbi:- havingObject, see(normal,down,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(down)).
hacermoverbi:- havingObject, see(normal,right,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(right)).
hacermoverbi:- havingObject, see(normal,up,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(up)).
hacermoverbi:- havingObject, see(normal,left,'l'),not(see(normal,down,'F')),not(see(normal,down-right,'F')),not(see(normal,right,'F')),not(see(normal,up-right,'F')),not(see(normal,up,'F')),not(see(normal,up-left,'F')),not(see(normal,left,'F')),not(see(normal,down-left,'F')),doAction(use(left)).
%%lo vacio
hacermoverbi:- see(normal,down,' '),doAction(move(down)).
hacermoverbi:- see(normal,left,' '),doAction(move(left)).
hacermoverbi:- see(normal,up,' '),doAction(move(up)).
hacermoverbi:- see(normal,right,' '),doAction(move(right)).






regla(init):- retractall(d_estado(_)),assert(d_estado(moverad)).

regla:- d_estado(moverad),hacermoverad.
regla:- d_estado(moverbi),hacermoverbi.
regla:- d_estado(matar),hacermatar.
