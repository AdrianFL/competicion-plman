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

% Reglas para agilizar
s(D,O):- see(normal, D, O).
m(D):- doAction(move(D)).
g(D):- doAction(get(D)).
u(D):- doAction(use(D)).

% Comprobación desde arriba hasta arriba-izquierda
todo(U, RU, R, RD, D, LD, L, LU):- s(up,U), s(right-up, RU), s(right,R),s(right-down,RD), s(down,D), s(left-down,LD),s(left,L), s(left-up,LU).

% Avistar al menos una entidad sin importar la distancia
avistar(DIR,OBJ):- see(list,DIR,LIST), nth0(_,LIST,OBJ).

% Lo mismo que antes, pero devuelve la distancia más corta a la que se encuentre
avistar(DIR,OBJ,DISTANCIA):- see(list,DIR,LIST), nth0(DISTANCIA,LIST,OBJ).

% Comprobar si existe la posibilidad de que puedan entrar entidades mortales en la dirección especificada
safeMove(DIR, L_MORTAL):-
member(DIR,[up,right,down,left]),
is_list(L_MORTAL),

not(s(DIR,'#')), % Para agilizar, ya que este functor sirve para moverse

forall(
	member(ENEMY, L_MORTAL),
	(
		(not(s(DIR,ENEMY))), see(list,DIR,LIST), not(nth0(1,LIST,ENEMY)),

		( DIR = up -> 
			not(s(right-up,ENEMY)), not(s(left-up,ENEMY))
			; 
			( DIR = right -> 
				not(s(right-up,ENEMY)), not(s(right-down,ENEMY))
				; 
				( DIR = down -> 
					not(s(right-down,ENEMY)), not(s(left-down,ENEMY))
					; 
					not(s(left-up,ENEMY)), not(s(left-down,ENEMY))
				)
			)
		)			
	)
).

% Comprueba si @ está rodeado de algún enemigo de la lista, con lo cual quedándose quieto no morirá
safeStand(L_MORTAL):-

forall(
	member(ENEMY, L_MORTAL),
	(
		not(s(up,ENEMY)), not(s(right,ENEMY)), not(s(down,ENEMY)), not(s(left,ENEMY))
	)
).

% Comprueba si @ está rodeado por 1 enemigo en 1 dirección, y devuelve dicha dirección
flanked(DIR,ENEMY):-

( ( s(up,ENEMY), not(s(right,ENEMY)), not(s(down,ENEMY)), not(s(left,ENEMY)) ) ->
	DIR = up
	; 
	( ( not(s(up,ENEMY)), s(right,ENEMY), not(s(down,ENEMY)), not(s(left,ENEMY)) ) ->
		DIR = right
		;
		( ( not(s(up,ENEMY)), not(s(right,ENEMY)), s(down,ENEMY), not(s(left,ENEMY)) ) ->
			DIR = down
			;
			( ( not(s(up,ENEMY)), not(s(right,ENEMY)), not(s(down,ENEMY)), s(left,ENEMY) ) ->
				DIR = left
			)
		)
	)			
).


%%% --- REGLAS: --- %%%

% Principio de la partida, ir a coger el francotirador
reg:- not(havingObject(appearance('L'))), s(left,'L'), g(left), obtenerArma(6), ce(areaIzquierda).
reg:- not(havingObject(appearance('L'))), not(s(left,'L')), m(left).

% Si estoy flanqueado por 1 enemigo, acabar con él
reg:- flanked(DIR,'E'), not(flanked(_,'F')), havingObject(appearance('L')), u(DIR), actualizarBalas.
reg:- flanked(DIR,'F'), not(flanked(_,'E')), havingObject(appearance('L')), u(DIR), actualizarBalas.

reg:- m(none), write('none ').


%%% -- Área izquierda -- %%%


ai:- member(DIR,[down,left,up,right]), safeMove(DIR,['E','F']), s(DIR,'.'), m(DIR).
ai:- todo('#','#','#','.',' ',' ',' ',' '), havingObject(appearance('L')), m(down).
ai:- todo(' ','#','.',' ',' ',' ',' ',' '), havingObject(appearance('L')), m(right).
ai:- todo('#','.','#',' ',' ',' ',' ',' '), havingObject(appearance('L')), m(down).
ai:- todo(' ',' ','#','#','#',' ',' ',' '), havingObject(appearance('L')), m(up).
ai:- todo(' ',' ',' ','#',' ',' ',' ',' '), havingObject(appearance('L')), m(up).
ai:- todo(' ',' ',' ',' ',' ',' ',' ',' '), havingObject(appearance('L')), safeMove(left,['F']), m(left).
ai:- todo(' ',' ',' ',' ',' ','#','#','#'), havingObject(appearance('L')), 'pl-man':contarApariencias(right,['E'],COUNT), COUNT >= 8, u(right), actualizarBalas.
ai:- s(left,'#'), s(left-up,'#'), s(left-down,'#'), not(s(up,'#')), safeMove(up,['E','F']), s(up,' '), m(up).
ai:- s(up,'#'), s(left-up,'#'), s(left,'#'), safeMove(right,['E','F']), m(right), ce(areaCentral).

% Matar a F si está estorbando
ai:- member(DIR,[down,left,up,right]), avistar(DIR,'F',DIST), DIST =< 1, havingObject(appearance('L')), u(DIR), actualizarBalas.


%%% -- Área central -- %%%


% Transición a la tercera parte (área derecha)
ac:- todo('#','#',' ','#','#','#',' ',' '), safeMove(right, ['E','F']), m(right), ce(areaDerecha), writeln('Transición parte final, área derecha').

%%
% Reglas de movimiento específicas
%%

% La primera bajada, arriba del todo en el centro
ac:- s(up,'#'), avistar(down,'#',DISTD), DISTD=8, avistar(right,'#',DISTR), DISTR=9, safeMove(down, ['E','F']), m(down).
ac:- s(up,'#'), avistar(down,'#',DISTD), DISTD=8, avistar(right,'#',DISTR), DISTR=9, not(safeMove(down, ['E','F'])), safeStand, m(none).
ac:- s(up,'#'), avistar(down,'#',DISTD), DISTD=8, avistar(right,'#',DISTR), DISTR=9, not(safeMove(down, ['E','F'])), not(safeStand), member(DIR,[down,left,up,right]), avistar(DIR,'F'), havingObject(appearance('L')), u(DIR), actualizarBalas.

% La segunda bajada 
ac:- s(right-up,'#'), s(right-down,'#'), avistar(left,'#',DISTL), DISTL=10, not(avistar(left,'.',_)), safeMove(down, ['E','F']), m(down). 
ac:- s(right-up,'#'), s(right-down,'#'), avistar(left,'#',DISTL), DISTL=10, not(avistar(left,'.',_)), not(safeMove(down, ['E','F'])), safeStand, m(none).
ac:- s(right-up,'#'), s(right-down,'#'), avistar(left,'#',DISTL), DISTL=10, not(avistar(left,'.',_)), not(safeMove(down, ['E','F'])), not(safeStand), member(DIR,[down,left,up,right]), avistar(DIR,'F'), havingObject(appearance('L')), u(DIR), actualizarBalas.

% Pasar de mitad arriba a mitad abajo
ac:- s(left,'#'), see(list,up,U), nth0(3,U,'#'), safeMove(down, ['E','F']), m(down).

% Ir izquierda desde el centro casi abajo
ac:- s(right-up,'#'), s(right-down,'#'), avistar(left,'#',DISTL), DISTL=10, avistar(left,'.',_), safeMove(down, ['E','F']), m(left). 
ac:- s(right-up,'#'), s(right-down,'#'), avistar(left,'#',DISTL), DISTL=10, avistar(left,'.',_), not(safeMove(down, ['E','F'])), safeStand, m(none).
ac:- s(right-up,'#'), s(right-down,'#'), avistar(left,'#',DISTL), DISTL=10, avistar(left,'.',_), not(safeMove(down, ['E','F'])), not(safeStand), member(DIR,[down,left,up,right]), avistar(DIR,'F'), havingObject(appearance('L')), u(DIR), actualizarBalas.

% Ir izquierda desde el centro estando abajo
ac:- s(down,'#'), avistar(up,'#',DISTU), DISTU=8, avistar(right,'#',DISTR), DISTR=9, safeMove(left, ['E','F']), m(left).
ac:- s(down,'#'), avistar(up,'#',DISTU), DISTU=8, avistar(right,'#',DISTR), DISTR=9, not(safeMove(left, ['E','F'])), safeStand, m(none).
ac:- s(down,'#'), avistar(up,'#',DISTU), DISTU=8, avistar(right,'#',DISTR), DISTR=9, not(safeMove(left, ['E','F'])), not(safeStand), member(DIR,[down,left,up,right]), avistar(DIR,'F'), havingObject(appearance('L')), u(DIR), actualizarBalas.

%% --

% Movimiento por defecto
ac:- safeMove(right,['E','F']), s(right,'.'), m(right).
ac:- safeMove(left,['E','F']), s(left,'.'), not(s(right,'.')), (not(s(right,'F'));not(avistar(right,'.'))), m(left).
ac:- safeMove(down,['E','F']), s(down,'.'), not(s(right,'.')), (not(s(right,'F'));not(avistar(right,'.'))), not(s(left,'.')), (not(s(left,'F'));not(avistar(left,'.'))), m(down).
ac:- safeMove(up,['E','F']), s(up,'.'), not(s(right,'.')), (not(s(right,'F'));not(avistar(right,'.'))), not(s(left,'.')), (not(s(left,'F'));not(avistar(left,'.'))), not(s(down,'.')), (not(s(down,'F'));not(avistar(down,'.'))), m(up).

%%
% Reglas de supervivencia específicas (F nos puede dar problemas)
%%
ac:- safeStand(['E','F']), m(none).

% Si avisto al fantasma en mi camino, lo mato (Aparta, malhechor)
ac:- member(DIR,[down,left,up,right]), avistar(DIR,'F',DIST), DIST =< 1, havingObject(appearance('L')), u(DIR), actualizarBalas.


%%% -- Área derecha -- %%%


% Salir del rincón (arriba y abajo)
ad:- s(up,'#'), s(down,'#'), s(right,'#'), (not(s(left-up,'#'));not(s(left-down,'#'))), safeMove(left,['E','F']), m(left).

% No quedarse atrapado en un rincón con F persiguiéndome, intentar escapar
ad:- s(right-down,'#'), s(right-up,'#'), see(list,left,L), nth0(1,L,'F'), see(list,right,R), nth0(1,R,'#'), safeMove(down,['E','F']), m(down).
ad:- s(right-down,'#'), s(right-up,'#'), see(list,left,L), nth0(1,L,'F'), see(list,right,R), nth0(1,R,'#'), safeMove(up,['E','F']), m(up).
ad:- s(right-down,'#'), s(right-up,'#'), see(list,left,L), nth0(1,L,'F'), see(list,right,R), nth0(1,R,'#'), not(safeMove(down,['E','F'])), not(safeMove(up,['E','F'])), safeStand(['E','F']), m(none).

%% Buscar y coger cocos

% Salir de los huecos del centro del mapa
ad:- s(up,'#'), s(down,'#'), not(s(right,'#')), not(s(right-up,'#')), not(s(right-down,'#')), not(s(left-up,'#')), not(s(left-down,'#')), not(s(right-down,'E')), not(s(right-down,'F')), not(s(right,'E')), not(s(right,'F')), not(s(left,'.')), see(list,right,R), not(nth0(1,R,'E')), not(nth0(1,R,'F')), m(right).

% Movimiento por defecto
ad:- safeMove(right,['E','F']), s(right,'.'), m(right).
ad:- safeMove(left,['E','F']), s(left,'.'), not(s(right,'.')), not(s(right,'F')), m(left).
ad:- safeMove(down,['E','F']), s(down,'.'), not(s(right,'.')), not(s(right,'F')), not(s(left,'.')), not(s(left,'F')), m(down).
ad:- safeMove(up,['E','F']), s(up,'.'), not(s(right,'.')), not(s(right,'F')), not(s(left,'.')), not(s(left,'F')), not(s(down,'.')), not(s(down,'F')), m(up).

% Movimiento por defecto con sensor lista
ad:- safeMove(right,['E','F']), avistar(right,'.'), m(right).
ad:- safeMove(left,['E','F']), avistar(left,'.'), not(avistar(right,'.')), m(left).
ad:- safeMove(down,['E','F']), avistar(down,'.'), not(avistar(right,'.')), not(avistar(left,'.')), m(down).
ad:- safeMove(up,['E','F']), avistar(up,'.'), not(avistar(right,'.')), not(avistar(left,'.')), not(avistar(down,'.')), m(up).

%% Movimiento al no avistar cocos
/*ad:- safeMove(right,['E','F']), avistar(right,'#',DIST), DIST >= 1, m(right).
ad:- safeMove(left,['E','F']), avistar(left,'.'), m(left).
ad:- safeMove(down,['E','F']), avistar(down,'.'), m(down).
ad:- safeMove(up,['E','F']), avistar(up,'.'), m(up).*/

% Pasar de la punta izquierda al área derecha
%ad:- safeMove(right, ['E','F']), 'pl-man':contarApariencias(right,['.'],COUNT), COUNT >= 6, m(right). 

%%
% Reglas de supervivencia específicas
%%
ad:- safeStand(['E','F']), m(none).

% Si avisto al fantasma en mi camino, lo mato
ad:- member(DIR,[down,left,up,right]), avistar(DIR,'F',DIST), DIST =< 1, havingObject(appearance('L')), u(DIR), actualizarBalas.


%%% --- Reglas por defecto --- %%%

rej:- estado(areaIzquierda), ai.
rej:- estado(areaDerecha), ad.
rej:- estado(areaCentral), ac.
rej:- reg.
