%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%
%%% DIF:	4
%%% PT:	02:30	[STS: 10:00] % No sé qué es esto
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% Este mapa cuenta con 2 factores indeterministas que se
%%% describen a continuación:
%%% 1) Aparicion de enemigos y 1 fantasma en el mapa:
%%%	En este mapa puede haber hasta 1 fantasma y 2 enemigos de respawn.
%%%	El mapa comenzará siempre con 8 enemigos, 4 y 4, que seguirán un mismo patrón. 
%%%	El fantasma y los 2 enemigos de respawn aparecerán de forma aleatoria.
%%% El fantasma siempre aparecerá en el punto de renacimiento del medio.
%%% Los 2 enemigos aparecerán en los puntos de respawn de arriba y abajo,
%%% saliendo como mucho 1 por cada punto.
%%%	En cada ciclo de ejecucion, hay un 5% de posibilidades de
%%%	que aparezca el fantasma siempre que no haya ninguno, y un 10%
%%% de que aparezcan enemigos normales, hasta 2.
%%% 2) Comportamiento de los fantasmas:
%%%	Los fantasmas eligen una dirección aleatoria en la que
%%%	moverse y la siguen hasta llegar a una pared. Cuando
%%%	llegan a la pared, cambian aleatoriamente de dirección
%%%	y repiten. Si por el camino, yendo de pared a pared,
%%%	ven a PL-MAN en alguna dirección, cambian su dirección
%%%	de movimiento para seguir a PL-MAN con una probabilidad
%%%	del 90%. Nunca cambian de dirección más de 2 veces
%%%	entre pared y pared que tocan. 
%%%
%%% El resto de elementos del mapa son deterministas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(gunSniper).
load_behaviour(respawnPoint).
load_behaviour(spiderGhost).
load_behaviour(lightTrafficBlock).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', ' ', ' ', ' ', '.', ' ', ' ', ' ', '#'],
['#', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', ' ', ' ', ' ', ' ', ' ', '.', ' ', '#', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', ' ', ' ', ' ', ' ', ' ', '.', '#', ' ', ' ', '#'],
['#', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', ' ', ' ', ' ', ' ', ' ', '.', ' ', '#', ' ', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', ' ', ' ', ' ', '.', ' ', ' ', ' ', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(28, 11).
num_dots(171). %% Cambiar si varían los cocos
pacman_start(14, 5).
initMap:- 
	addSolidObject('#'),
	
		
	%% Rifle francotirador

	createGameEntity(OID_FRANCOTIRADOR, 'L', object, 1, 5, inactive, norule,
			[name(rifle_francotirador), solid(false), static(false), use_rule(gunSniper),
			description('Rifle de 6 balas que atraviesa enemigos E y F'), appearance(attribs(bold, white, default))]), 
	gunSniper(init, OID_FRANCOTIRADOR, 6, ['E','F'], destroy),

	%% Respawns del fantasma y los 4 enemigos

	createGameEntity(OID_RS0, '', non_interactive, 25, 2, inactive, norule, 
			[name(respawn_de_enemigo), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen enemigos'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_RS1, '', non_interactive, 25, 5, inactive, norule, 
			[name(respawn_de_fantama), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen fantasmas'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_RS2, '', non_interactive, 25, 8, inactive, norule, 
			[name(respawn_de_enemigo), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen enemigos'), appearance(attribs(normal, default, default))]),

	%% Patrón de movimientos que harán los enemigos 'E' que nazcan de los puntos de renacimiento

	RP0_MOVEMENT =[d,l,l,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,r,r,r,u,u,u,u,l,u],
	RP2_MOVEMENT = [u,l,l,l,l,l,l,l,l,n,r,r,r,r,r,r,n,l,l,l,l,l,l,u,u,r,r,r,r,r,r,n,l,l,l,l,l,l,n,r,r,r,r,r,r,u,u,l,l,l,l,l,l,n,r,r,r,r,r,r,n,l,l,l,l,l,l,u,u,r,r,r,r,r,r,n,l,l,l,l,l,l,n,r,r,r,r,r,r,d,d,r,r,r,d,d,d,d,l,d],

	respawnPoint(init, [OID_RS0], 1, 
		[ app('E'), name(enemigo), crule(entitySequentialMovement), appearance(attribs(normal, magenta, default)) ],
		[ EID_RP0, 'pl-man':entitySequentialMovement(init, EID_RP0, RP0_MOVEMENT, [no_repeat_moves]) ], [ probRespawn(100) ]),

	respawnPoint(init, [OID_RS1], 1, 
		[ app('F'), name(fantasma), crule(spiderGhost), appearance(attribs(normal, yellow, default)) ],
		[ EID_RP1, 'pl-man':spiderGhost(init, EID_RP1, ['#'], [ probFollowPacman(90), maxFollowTimes(1) ] ) ], [ probRespawn(50) ]),

	respawnPoint(init, [OID_RS2], 1, 
		[ app('E'), name(enemigo), crule(entitySequentialMovement), appearance(attribs(normal, magenta, default)) ],
		[ EID_RP2, 'pl-man':entitySequentialMovement(init, EID_RP2, RP2_MOVEMENT, [no_repeat_moves]) ], [ probRespawn(100) ]),
	
	%% Variables de los patrones de movimiento de los enemigos normales (parte izquierda del mapa):
	
	ECM_RU = [n,n,r,n,n,n,u,n,n,r,n,l,n,n,u,n,n,n,l], % Entity central movement (right-up)
	ECM_LU = [n,n,l,n,n,n,u,n,n,l,n,r,n,n,u,n,n,n,r], % left-up
	ECM_RD = [n,n,r,n,n,n,d,n,n,r,n,l,n,n,d,n,n,n,l], % right-down
	ECM_LD = [n,n,l,n,n,n,d,n,n,l,n,r,n,n,d,n,n,n,r], % left-down
	ECM_UD = [u,n,u,d,n,d],

	append(ECM_RU,ECM_RD,ECM_0),
	append(ECM_LU,ECM_LD,ECM_1),
	append(ECM_0,ECM_UD,ECM_LTOR),
	append(ECM_1,ECM_UD,ECM_RTOL),

	createGameEntity(EID_0, 'E', mortal, 7, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, ECM_LTOR, [no_repeat_moves]),
	createGameEntity(EID_1, 'E', mortal, 8, 6, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, ECM_LTOR, [no_repeat_moves]),

	createGameEntity(EID_2, 'E', mortal, 13, 6, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_2, ECM_RTOL, [no_repeat_moves]),
	createGameEntity(EID_3, 'E', mortal, 14, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_3, ECM_RTOL, [no_repeat_moves]),

	%% Variables de los patrones de movimiento de los enemigos normales (parte derecha del mapa)

	ECM2_LU = [n,u,n,n,u,n,d,n,n,d],
	ECM2_RD = [n,d,n,n,d,n,u,n,n,u],
	ECM2_D = [n,d,d],
	ECM2_U = [u,u,n],

	% Enemigos izquierda
	append(ECM2_LU, ECM2_D, ECM2_LD0), % Repetición completa bajando
	append(ECM2_LU, ECM2_U, ECM2_LU0), % Repetición completa subiendo

	append(ECM2_LD0, ECM2_LD0, ECM2_LD1), % Doble repetición
	append(ECM2_LU0, ECM2_LU0, ECM2_LU1), 
	
	append(ECM2_LD1, ECM2_LU1, ECM2_L4), % Patrón completo

	% Enemigos derecha
	append(ECM2_RD, ECM2_D, ECM2_RD0),
	append(ECM2_RD, ECM2_U, ECM2_RU0),

	append(ECM2_RD0, ECM2_RD0, ECM2_RD1),
	append(ECM2_RU0, ECM2_RU0, ECM2_RU1),

	append(ECM2_RD1, ECM2_RU1, ECM2_R4),

	createGameEntity(EID_4, 'E', mortal, 18, 4, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_4, ECM2_L4, [no_repeat_moves]),
	createGameEntity(EID_5, 'E', mortal, 19, 4, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_5, ECM2_L4, [no_repeat_moves]),

	createGameEntity(EID_6, 'E', mortal, 21, 2, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_6, ECM2_R4, [no_repeat_moves]),
	createGameEntity(EID_7, 'E', mortal, 22, 2, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_7, ECM2_R4, [no_repeat_moves]),

	% Bloques semáforo (decorativos, referencia al próximo mapa)

	createGameEntity(OID_LTB0, '=', object, 26, 1, active, lightTrafficBlock,
			[name(bloque_semaforo), solid(true), static(true), use_rule(norule),
			description('Bloque semáforo decorativo'), appearance(attribs(normal, red, default))]),
	lightTrafficBlock(init, OID_LTB0, 0, 1, 1, 26, 1),

	createGameEntity(OID_LTB1, '=', object, 26, 9, active, lightTrafficBlock,
			[name(bloque_semaforo), solid(true), static(true), use_rule(norule),
			description('Bloque semáforo decorativo'), appearance(attribs(normal, red, default))]),
	lightTrafficBlock(init, OID_LTB1, 0, 1, 1, 26, 9).
	
	
	
	
norule(_).
norule(_,_,_,_,_).

