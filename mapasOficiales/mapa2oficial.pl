%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%
%%% DIF:	4
%%% PT:	02:30	[STS: 10:00] % No sé qué es esto
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% Este mapa cuenta con 1 factor indeterministas que se
%%% describe a continuación:
%%% 1) Aparicion de fantasmas en el mapa:
%%%	En este mapa pueden haber hasta 3 fantasmas simultaneos.
%%%	El mapa comenzará siempre con 0 fantasmas, y estos iran
%%%	apereciendo espaciados en el tiempo de forma aleatoria.
%%%   Los fantasmas pueden aparecer aleatoriamente en uno de
%%%   los dos puntos de renacimiento (respawn points) habilitados
%%%   para que aparezcan. Estos puntos a la izquierda y a la
%%%	derecha del mapa, concretamente en las casillas (3,4) y (27,4).
%%%	En cada ciclo de ejecucion, hay un 5% de posibilidades de
%%%	que aparezca un nuevo fantasma (siempre que hayan menos de 3)
%%% 2) Comportamiento de los fantasmas:
%%%	Los fantasmas eligen una dirección aleatoria en la que
%%%	moverse y la siguen hasta llegar a una pared. Cuando
%%%	llegan a la pared, cambian aleatoriamente de dirección
%%%	y repiten. Si por el camino, yendo de pared a pared,
%%%	ven a PL-MAN en alguna dirección, cambian su dirección
%%%	de movimiento para seguir a PL-MAN con una probabilidad
%%%	del 50%. Nunca cambian de dirección más de 2 veces
%%%	entre pared y pared que tocan. Además, los porteros nunca
%%%	salen de su área (aunque pueden moverse por detrás
%%%	de la portería), y los defensas nunca entran en el área ni
%%%     cruzan el medio campo.
%%% 3) Aparición de las armas:
%%%	Al igual que los fantasmas, en este mapa pueden haber
%%%	hasta un máximo de 2 pistolas que aparecen aleatoriamente
%%%	en sus puntos de renacimiento (respawn points). Los respawns
%%%	de las armas están en la parte de arriba y abajo de la zona
%%%	central del mapa. Las armas siempre son pistolas de 3 balas.
%%%
%%% El resto de elementos del mapa son deterministas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(gunSniper).
load_behaviour(respawnPoint).
load_behaviour(spiderGhost).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', ' ', '#'],
['#', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(28, 11).
num_dots(200). %% Por cambiar
pacman_start(14, 5).
initMap:- 
	addSolidObject('#'),
	
		
	%% Rifle francotirador
	createGameEntity(OID_FRANCOTIRADOR, 'L', object, 1, 5, inactive, norule,
			[name(rifle_francotirador), solid(false), static(false), use_rule(gunSniper),
			description('Rifle de 5 balas que atraviesa enemigos E y F'), appearance(attribs(bold, white, default))]), 
	gunSniper(init, OID_FRANCOTIRADOR, 5, ['E','F'], destroy),

	%% GHOST AND ENEMY RESPAWNS

	createGameEntity(OID_RS0, '', non_interactive, 25, 2, inactive, norule, 
			[name(respawn_de_enemigo), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen enemigos'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_RS1, '', non_interactive, 25, 5, inactive, norule, 
			[name(respawn_de_fantama), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen fantasmas'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_RS2, '', non_interactive, 25, 8, inactive, norule, 
			[name(respawn_de_enemigo), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen enemigos'), appearance(attribs(normal, default, default))]),

	RP0_MOVEMENT =[d,l,l,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,r,r,r,u,u,u,u,l,u],
	RP2_MOVEMENT = [u,l,l,l,l,l,l,l,n,r,r,r,r,r,n,l,l,l,l,l,u,u,r,r,r,r,r,n,l,l,l,l,l,n,r,r,r,r,r,u,u,l,l,l,l,l,n,r,r,r,r,r,n,l,l,l,l,l,u,u,r,r,r,r,r,n,l,l,l,l,l,n,r,r,r,r,r,d,d,r,r,r,d,d,d,d,l,d],

	respawnPoint(init, [OID_RS0], 2, 
		[ app('E'), name(enemigo), crule(entitySequentialMovement), appearance(attribs(normal, magenta, default)) ],
		[ EID_RP0, 'pl-man':entitySequentialMovement(init, EID_RP0, RP0_MOVEMENT, [no_repeat_moves]) ], [ probRespawn(100) ]),

	respawnPoint(init, [OID_RS1], 1, 
		[ app('F'), name(fantasma), crule(spiderGhost), appearance(attribs(normal, yellow, default)) ],
		[ EID_RP1, 'pl-man':spiderGhost(init, EID_RP1, ['#'], [ probFollowPacman(100), maxFollowTimes(1) ] ) ], [ probRespawn(1000) ]),

	respawnPoint(init, [OID_RS2], 2, 
		[ app('E'), name(enemigo), crule(entitySequentialMovement), appearance(attribs(normal, magenta, default)) ],
		[ EID_RP2, 'pl-man':entitySequentialMovement(init, EID_RP2, RP2_MOVEMENT, [no_repeat_moves]) ], [ probRespawn(100) ]),
	
	%% Enemigos normales
	ECM_RU = [n,n,r,n,n,n,u,n,n,r,n,l,n,n,u,n,n,n,l], % Entity central movement (right)
	ECM_LU = [n,n,l,n,n,n,u,n,n,l,n,r,n,n,u,n,n,n,r],
	ECM_RD = [n,n,r,n,n,n,d,n,n,r,n,l,n,n,d,n,n,n,l], % Entity central movement (right)
	ECM_LD = [n,n,l,n,n,n,d,n,n,l,n,r,n,n,d,n,n,n,r],
	ECM_UD = [u,n,u,d,n,d],
/*
	ECM_RU = [n,n,r,n,n,n,u,n,n,r,n,n,u,n,n,r], % Entity central movement (right)
	ECM_LU = [n,n,l,n,n,n,u,n,n,l,n,n,u,n,n,l],
	ECM_RD = [n,n,r,n,n,n,d,n,n,r,n,n,d,n,n,r], % Entity central movement (right)
	ECM_LD = [n,n,l,n,n,n,d,n,n,l,n,n,d,n,n,l],
*/
/*
	append(ECM_RU,ECM_LD,ECM_LTOR),
	append(ECM_LU,ECM_RD,ECM_RTOL),
*/
	append(ECM_RU,ECM_RD,ECM_1),
	append(ECM_LU,ECM_LD,ECM_2),
	append(ECM_1,ECM_UD,ECM_LTOR),
	append(ECM_2,ECM_UD,ECM_RTOL),
	createGameEntity(EID_0, 'E', mortal, 7, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, ECM_LTOR, [no_repeat_moves]),
	createGameEntity(EID_1, 'E', mortal, 8, 6, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, ECM_LTOR, [no_repeat_moves]),

	createGameEntity(EID_2, 'E', mortal, 13, 6, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_2, ECM_RTOL, [no_repeat_moves]),
	createGameEntity(EID_3, 'E', mortal, 14, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_3, ECM_RTOL, [no_repeat_moves]).
	
	
	
	
norule(_).
norule(_,_,_,_,_).

