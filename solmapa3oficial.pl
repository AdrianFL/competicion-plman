:-use_module('pl-man-game/main').

/*
rej:-not(havingObject), see(normal,up,''), see(normal,right-up,''), see(normal,right,''),see(normal,right-down,''), see(normal,down,''), see(normal,left-down,''),see(normal,left,''), see(normal, left-up,''), doAction(move(up)).
ai:- todo(' ',' ',' ',' ',' ',' ',' ',' '), m(right).
*/

:- dynamic estado/1, balas/1.

ce(E):- retractall(estado(_)), assert(estado(E)).

% Procedimientos para actualizar las balas del francotirador
obtenerArma(AMMO):- assert(balas(AMMO)), write('BALAS en estado:'), writeln(AMMO).
actualizarBalas:- balas(N), NEW_AMMO is N-1, retractall(balas(_)), assert(balas(NEW_AMMO)), write('BALAS en estado:'), writeln(NEW_AMMO).

s(D,O):- see(normal, D, O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
u(D):- doAction(use(D)).


% Comprobación desde arriba hasta arriba-izquierda
todo(U, RU, R, RD, D, LD, L, LU):- s(up,U), s(right-up, RU), s(right,R),s(right-down,RD), s(down,D), s(left-down,LD),s(left,L), s(left-up,LU).

% Avistar una entidad sin importar la distancia
avistar(DIR,OBJ):- see(list,DIR,LIST), nth0(_,LIST,OBJ).

% Coco o espacio sin la posibilidad de que pueda entrar un enemigo a la dirección especificada
safeMove(DIR,DOT_SPACE):-
( ( DOT_SPACE = '.' ; DOT_SPACE = ' ' ) ->
  s(DIR,DOT_SPACE)
  ; writeln('Carácter no reconocido'), true
),

not(s(DIR,'E')), not(s(DIR,'F')), not(s(DIR,'#')), see(list,DIR,LIST), not(nth0(1,LIST,'E')), not(nth0(1,LIST,'F')),

( DIR = up -> 
not(s(right-up,'E')), not(s(right-up,'F')), not(s(left-up,'E')), not(s(left-up,'F'))
; ( DIR = right -> 
  not(s(right-up,'E')), not(s(right-up,'F')), not(s(right-down,'E')), not(s(right-down,'F'))
  ; ( DIR = down -> 
    not(s(right-down,'E')), not(s(right-down,'F')), not(s(left-down,'E')), not(s(left-down,'F'))
    ; not(s(left-up,'E')), not(s(left-up,'F')), not(s(left-down,'E')), not(s(left-down,'F'))
    )
  )
).

% Procedimiento anterior con 1 parámetro (ignorando coco o espacio)
safeMove(DIR):-

not(s(DIR,'E')), not(s(DIR,'F')), not(s(DIR,'#')), see(list,DIR,LIST), not(nth0(1,LIST,'E')), not(nth0(1,LIST,'F')),

( DIR = up -> 
not(s(right-up,'E')), not(s(right-up,'F')), not(s(left-up,'E')), not(s(left-up,'F'))
; ( DIR = right -> 
  not(s(right-up,'E')), not(s(right-up,'F')), not(s(right-down,'E')), not(s(right-down,'F'))
  ; ( DIR = down -> 
    not(s(right-down,'E')), not(s(right-down,'F')), not(s(left-down,'E')), not(s(left-down,'F'))
    ; not(s(left-up,'E')), not(s(left-up,'F')), not(s(left-down,'E')), not(s(left-down,'F'))
    )
  )
).

% Comprueba si @ está rodeado de algún enemigo, con lo cual quedándose quieto no morirá
safeStand:- not(s(up,'E')), not(s(up,'F')), not(s(right,'E')), not(s(right,'F')), not(s(down,'E')), not(s(down,'F')), not(s(left,'E')), not(s(left,'F')).

% REGLAS

reg:- m(none).
reg:- not(havingObject(appearance('€'))), s(up,'€'), g(up).
reg:- not(havingObject(appearance('L'))), not(s(left,'L')), m(left).

ai:- member(DIR,[down,left,up,right]), avistar(DIR,'F'), havingObject(appearance('L')), u(DIR), actualizarBalas.
ai:- member(DIR,[down,left,up,right]), safeMove(DIR,'.'), m(DIR).


rej:- estado(esperarAlineamiento), ea.
rej:- estado(areaIzquierda), ai.
rej:- estado(areaDerecha), ad.
rej:- estado(areaCentral), ac.
rej:- estado(fn), fn.
rej:- estado(med), med.
rej:- reg.
