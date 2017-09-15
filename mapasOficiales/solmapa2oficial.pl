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

% Avistar al menos una entidad sin importar la distancia
avistar(DIR,OBJ):- see(list,DIR,LIST), nth0(_,LIST,OBJ).

/*% Devuelve la cantidad de apariencias de una entidad en una dirección
contarApariencias(recursion, [], _, C, C).
contarApariencias(recursion, [H|T], LS, C, I):-
	( member(H,LS) -> NewCantidad is C+1
	        ;  NewCantidad = C
	),
	contarApariencias(recursion, T, LS, NewCantidad, I).

contarApariencias(DIR, LS, A):-
	is_list(LS),
	see(list,DIR,Lista),	
	contarApariencias(recursion, Lista, LS, 0, A).

% ---*/

% Comprobar si existe la posibilidad de que puedan entrar entidades mortales en la dirección especificada
safeMove(DIR, L_MORTAL):-
member(DIR,[up,right,down,left]),
is_list(L_MORTAL),

not(s(DIR,'#')), % Para agilizar, ya que este functor sirve para moverse

forall(
	(member(ENEMY, L_MORTAL)),
		(
			(not(s(DIR,ENEMY))), see(list,DIR,LIST), not(nth0(1,LIST,ENEMY)),

			( DIR = up -> 
			not(s(right-up,ENEMY)), not(s(left-up,ENEMY))
			; ( DIR = right -> 
			  not(s(right-up,ENEMY)), not(s(right-down,ENEMY))
			  ; ( DIR = down -> 
				not(s(right-down,ENEMY)), not(s(left-down,ENEMY))
				; not(s(left-up,ENEMY)), not(s(left-down,ENEMY))
				)
			  )
			)			
		)
	).

% Comprueba si @ está rodeado de algún enemigo, con lo cual quedándose quieto no morirá
safeStand:- not(s(up,'E')), not(s(up,'F')), not(s(right,'E')), not(s(right,'F')), not(s(down,'E')), not(s(down,'F')), not(s(left,'E')), not(s(left,'F')).

% REGLAS

reg:- not(havingObject(appearance('L'))), s(left,'L'), g(left), obtenerArma(5), ce(areaIzquierda).
reg:- not(havingObject(appearance('L'))), not(s(left,'L')), m(left).

ai:- member(DIR,[down,left,up,right]), avistar(DIR,'F'), havingObject(appearance('L')), u(DIR), actualizarBalas.
ai:- member(DIR,[down,left,up,right]), safeMove(DIR,['E','F']), s(DIR,'.'), m(DIR).
ai:- todo('#','#','#','.',' ',' ',' ',' '), havingObject(appearance('L')), m(down).
ai:- todo(' ','#','.',' ',' ',' ',' ',' '), havingObject(appearance('L')), m(right).
ai:- todo('#','.','#',' ',' ',' ',' ',' '), havingObject(appearance('L')), m(down).
ai:- todo(' ',' ','#','#','#',' ',' ',' '), havingObject(appearance('L')), m(up).
ai:- todo(' ',' ',' ','#',' ',' ',' ',' '), havingObject(appearance('L')), m(up).
ai:- todo(' ',' ',' ',' ',' ',' ',' ',' '), havingObject(appearance('L')), safeMove(left,['F']), m(left).
ai:- todo(' ',' ',' ',' ',' ','#','#','#'), havingObject(appearance('L')), contarApariencias(right,['E'],COUNT), COUNT >= 8, u(right), actualizarBalas.
ai:- s(left,'#'), s(left-up,'#'), s(left-down,'#'), not(s(up,'#')), safeMove(up,['E','F']), s(up,' '), m(up).
ai:- s(up,'#'), s(left-up,'#'), s(left,'#'), safeMove(right,['E','F']), m(right), ce(areaCentral).

% No quedarse atrapado en un rincón con F persiguiéndome, intentar escapar
ac:- s(right-down,'#'), s(right-up,'#'), see(list,left,L), nth0(1,L,'F'), see(list,right,R), nth0(1,R,'#'), safeMove(down,['E','F']), m(down).
ac:- s(right-down,'#'), s(right-up,'#'), see(list,left,L), nth0(1,L,'F'), see(list,right,R), nth0(1,R,'#'), not(safeMove(down,['E','F'])), safeStand, m(none).
% --

% Salir del rincón (arriba)
ac:- todo('#','#','#',' ','#','.',' ','#'), safeMove(left,['E','F']), m(left).
% (abajo)
ac:- s(up,'#'), s(right-up, ' '), s(right,'#'),s(right-down,'#'), s(down,'#'), s(left-down,'#'),s(left,' '), safeMove(left,['E','F']), m(left).
% --
ac:- safeMove(right,['E','F']), s(right,'.'), m(right).
ac:- safeMove(left,['E','F']), s(left,'.'), m(left).
ac:- safeMove(down,['E','F']), s(down,'.'), m(down).
ac:- safeMove(up,['E','F']), s(up,'.'), m(up).


/*
reg:- havingObject, see(list,left,L), nth0(1,L,'E'), doAction(use(left)).
reg:- havingObject, not(see(normal,up,'#')), doAction(move(up)).
reg:- havingObject, see(normal,up,'#'), not(see(normal,right,'#')), doAction(move(right)).
reg:- havingObject, see(normal,left,'E'), doAction(use(left)).
reg:- see(normal,right,'L'), doAction(get(right)).
reg:- not(see(normal,right,'L')), not(see(normal,right,'#')), doAction(move(right)).
reg:- doAction(move(none)).
*/


rej:- estado(esperarAlineamiento), ea.
rej:- estado(areaIzquierda), ai.
rej:- estado(areaDerecha), ad.
rej:- estado(areaCentral), ac.
rej:- estado(fn), fn.
rej:- estado(med), med.
rej:- reg.
