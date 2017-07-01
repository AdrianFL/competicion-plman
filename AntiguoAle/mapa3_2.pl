%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa hay varios objetos indeterministas, que 
%%% enumeramos a continuación:
%%% 1) Pelotas para meter gol:
%%%    En la sala superior izquierda aparecen pelotas con las
%%%    que habrá que meter goles para destruir la portería. 
%%%    Cada pelota aparece aleatoria en cualquier posición
%%%    de esa sala, es decir, en la columnas 1-4 y en las 
%%%    filas 1-3.
%%% 2) Enemigo portero:
%%%    Este enemigo siempre aparece delante de la portería y
%%%    siempre se mueve de arriba a abajo, pero puede aparecer
%%%    en cualquier fila de la portería, es decir, columna 6,
%%%    filas 1-3.
%%% 3) Enemigos patrulla:
%%%    Los enemigos de la sala central aparecen siempre uno en
%%%    cada fila (filas 3 y 4), pero en cualquier columna dentro
%%%    de esa sala central. Es decir, en las columnas 10-18. 
%%%    Ambos enemigos se comportan siempre igual, moviéndose de
%%%    izquierda a derecha.
%%% 4) Llave de la sala de la pistola:
%%%    La llave de la sala de la pistola aparece aleatoria en 
%%%    el pasillo horizontal superior o en el pasillo horizontal
%%%    inferior. En ambos casos, puede aparecer en cualquier
%%%    parte del pasillo, es decir, en las columnas 9-20. Las
%%%    filas, que son las de los pasillos, son la 1 o la 6.
%%% 5) Puerta de la sala de la pistola:
%%%    La puerta de la sala de la pistola puede cambiar de fila,
%%%    aunque siempre aparecerá en la pared derecha de la sala
%%%    de la pistola. Puede estar en las filas 5 o 6, y siempre
%%%    en la columna 7.
%%%
%%% El resto de elementos en este mapa son deterministas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicDoorKey).
load_behaviour(launchBall).
load_behaviour(soccerGoal).
load_behaviour(gunBasic).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '\\', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
[' ', ' ', '.', '.', '.', '.', ' ', ' ', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', ' ', ' ', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '#', '#', '#', '#', '#', '/', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', ' ', '.', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', ' ', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(22, 8).
num_dots(81).
pacman_start(1, 2).
initMap:- 
	addSolidObject('#'), 
	addSolidObject('\\'), 
	addSolidObject('/'), 
	createGameEntity(OID_SB, '0', object, 0, 2, active, soccerGoal, 
			[name(marcador), solid(true), static(true), use_rule(norule),
			description('Goles marcados hasta el momento'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_R0, '|', object, 7, 1, inactive, norule, 
			[name(red), solid(true), static(true), use_rule(norule),
			description('Red de la porteria'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_R1, '|', object, 7, 2, inactive, norule, 
			[name(red), solid(true), static(true), use_rule(norule),
			description('Red de la porteria'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_R2, '|', object, 7, 3, inactive, norule, 
			[name(red), solid(true), static(true), use_rule(norule),
			description('Red de la porteria'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_DOOR, '|', object, 7, rnd(5,6), inactive, norule, 
			[name(puerta_azul), solid(true), static(true), use_rule(norule),
			description('Puerta que se abre con la llave azul'), appearance(attribs(bold, black, cyan))]),
	createGameEntity(OID_KEY, 'a', object, rnd(9,20), rnd([1,6]), inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]),
	(entityLocation(OID_DOOR,_,5,_)
	 -> PY = 6 ; PY = 5
	),
	createGameEntity('#', object, 7, PY, inactive, norule, 
			[name(pared), solid(true), static(true), use_rule(norule),
			description('Pared'), appearance(attribs(normal, default, default))]),
	createGameEntity(OID_GUN, 'l', object, 1, 6, inactive, norule, 
			[name(pistola), solid(false), static(false), use_rule(gunBasic),
			description('Pistola con 2 balas'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(EID_0, 'E', mortal, 6, rnd(1,3), active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, rnd(10,18), 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, rnd(10,18), 4, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_0, up-down, ['\\', '/']),
	enemyBasicMovement(init, EID_1, left-right, ['#']),
	enemyBasicMovement(init, EID_2, right-left, ['#']),
	basicDoorKey(init, OID_DOOR, [ 'pl-man':destroyGameEntity(OID_DOOR) ], [ OID_KEY ]),
	gunBasic(init, OID_GUN, 2, ['E'], keep),
    soccerGoal(init, OID_SB, 3, ['o'], [OID_R0, OID_R1, OID_R2], []),
    launchBall(autoBallCreator, 1, 7, rnd(1,5), rnd(1,3)).

norule(_).
norule(_,_,_,_,_).
