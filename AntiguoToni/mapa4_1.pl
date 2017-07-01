%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	02:30	[STS: 10:00]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% Este mapa cuenta con 3 factores indeterministas que se
%%% describen a continuación:
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
load_behaviour(respawnPoint).
load_behaviour(gunBasic).
load_behaviour(spiderGhost).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#', '#', '.', '.', '#'],
['#', '.', '.', ' ', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '.', ' ', '.', '#', '#', '#', '#', '#', '#', '#', '.', '.', '#', ' ', '.', '.', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#', '#', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(31, 9).
num_dots(168).
pacman_start(15, 4).
initMap:- 
	addSolidObject('#'), 

	% GHOST RESPAWNS
	createGameEntity(OID_0, '', non_interactive, 3, 4, inactive, norule, 
			[name(respawn_de_fantama), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen fantasmas'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_1, '', non_interactive, 27, 4, inactive, norule, 
			[name(respawn_de_fantama), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen fantasmas'), appearance(attribs(normal, default, default))]),
	respawnPoint(init, [OID_0, OID_1], 3, 
		[ app('F'), name(fant), crule(spiderGhost), appearance(attribs(normal, red, default)) ],
		[ EID, 'pl-man':spiderGhost(init, EID, ['#'], [ ] ) ], [ probRespawn(50) ] ),

	% WEAPON RESPAWNS
	createGameEntity(OID_2, '', non_interactive, 11, 3, active, entitySequentialMovement, 
			[name(respawn_de_arma), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen armas'), appearance(attribs(normal, default, default))]), 
	createGameEntity(OID_3, '', non_interactive, 19, 5, active, entitySequentialMovement, 
			[name(respawn_de_arma), solid(false), static(true), use_rule(norule),
			description('Aqui aparecen armas'), appearance(attribs(normal, default, default))]), 
	entitySequentialMovement(init, OID_2, [ r,r,r,r,r,r,r,r,u,u,l,l,l,l,l,l,l,l,d,d ], [ no_repeat_moves ]),
	entitySequentialMovement(init, OID_3, [ l,l,l,l,l,l,l,l,d,d,r,r,r,r,r,r,r,r,u,u ], [ no_repeat_moves ]),
	respawnPoint(init, [OID_2, OID_3], 2, 
		[ app('l'), name(pistola), use_rule(gunBasic), description('Pistola con 3 balas'), 
		  active(inactive), type(object), appearance(attribs(bold, cyan, default)) ],
		[ OID, 'pl-man':gunBasic(init, OID, 3, [ 'F', 'l' ], destroy) ], [ probRespawn(100) ] ).

norule(_).
norule(_,_,_,_,_).
