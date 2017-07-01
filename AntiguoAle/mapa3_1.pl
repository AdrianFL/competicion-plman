%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa todo es determinista salvo los enemigos que
%%% aparecen. En concreto, aparecen 5 enemigos. Los enemigos
%%% siempre se comportan igual: se mueven arriba y abajo de
%%% pared a pared. Sin embargo, en cada ejecución pueden apa-
%%% recer en una posición inicial diferente. A continuación
%%% se detallan las posibles posiciones iniciales para cada
%%% enemigo:
%%%  ENE_0: columnas  1-2, filas 1-5
%%%  ENE_1: columna     3, filas 1-5
%%%  ENE_2: columnas  4-5, filas 3-5
%%%  ENE_3: columna     6, filas 3-5
%%%  ENE_4: columnas  7-8, filas 3-5
%%%  ENE_5: columnas 9-10, filas 3-5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(gunBasic).
load_behaviour(basicDoorKey).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(15, 9).
num_dots(67).
pacman_start(13, 3).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_OK, 'n', object, 13, 1, inactive, norule, 
			[name(llave_naranja), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta naranja'), appearance(attribs(normal, yellow, default))]), 
	createGameEntity(OID_OD, '|', object, 9, 7, inactive, norule, 
			[name('Puerta Naranja'), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave naranja'), appearance(attribs(normal, yellow, default))]), 
	createGameEntity(OID_GUN, 'l', object, 10, 7, inactive, norule, 
			[name(revolver), solid(false), static(false), use_rule(gunBasic),
			description('Un colt-42 cargado con 6 balas'), appearance(attribs(bold, cyan, default))]),
	createGameEntity(EID_0, 'E', mortal, rnd(1, 2), rnd(1,5), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	createGameEntity(EID_1, 'E', mortal,         3, rnd(1,5), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	createGameEntity(EID_2, 'E', mortal, rnd(4, 5), rnd(3,5), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	createGameEntity(EID_3, 'E', mortal,         6, rnd(3,5), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	createGameEntity(EID_4, 'E', mortal, rnd(7, 8), rnd(3,5), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	createGameEntity(EID_5, 'E', mortal, rnd(9,10), rnd(3,5), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	basicDoorKey(init, OID_OD, ['pl-man':destroyGameEntity(OID_OD)], [OID_OK]),
	gunBasic(init, OID_GUN, 6, ['E', 'n'], keep),
	enemyBasicMovement(init, EID_0, up-down, ['#']),
	enemyBasicMovement(init, EID_1, down-up, ['#']),
	enemyBasicMovement(init, EID_2, up-down, ['#']),
	enemyBasicMovement(init, EID_3, down-up, ['#']),
	enemyBasicMovement(init, EID_4, up-down, ['#']),
	enemyBasicMovement(init, EID_5, down-up, ['#']).
norule(_).
norule(_,_,_,_,_).
