%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	00:30	[STS: 01:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicDoorKey).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '#', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '#', ' ', ' ', '#', '.', '.', '#', ' ', ' ', '#', '.', '.', '.', '.', '.', '#', ' ', '#'],
['#', '#', ' ', ' ', '#', ' ', '#', '#', ' ', ' ', '#', ' ', '#', '.', '.', '.', '#', '.', '.', '#'],
['#', '#', ' ', '#', ' ', ' ', '#', '#', ' ', '#', ' ', ' ', '#', '.', '.', '#', '.', '.', '.', '#'],
['#', ' ', '#', ' ', ' ', '#', '.', '.', '#', ' ', ' ', '#', '.', '.', '#', '.', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '.', '.', '.', '.', '#', '#', '.', '.', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(20, 10).
num_dots(82).
pacman_start(9, 8).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_BD, '|', object, 4, 1, inactive, norule, 
			[name('Puerta Azul'), solid(true), static(true), use_rule(norule), 
			description('Puerta que se abre con la llave azul'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_RK, 'r', object, 18, 3, inactive, norule, 
			[name(llave_roja), solid(false), static(false), use_rule(basicDoorKey), 
			description('Llave que abre la puerta roja'), appearance(attribs(bold, red, default))]), 
	createGameEntity(OID_BK, 'a', object, 1, 6, inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey), 
			description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_RD, '|', object, 4, 8, inactive, norule, 
			[name('Puerta Roja'), solid(true), static(true), use_rule(norule), 
			description('Puerta que se abre con la llave roja'), appearance(attribs(bold, red, default))]), 
	createGameEntity(EID_E1, 'E', mortal, 18, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_E2, 'E', mortal, 18, 8, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	basicDoorKey(init, OID_BD, ['pl-man':destroyGameEntity(OID_BD)], [OID_BK]),
	basicDoorKey(init, OID_RD, ['pl-man':destroyGameEntity(OID_RD)], [OID_RK]),
	entitySequentialMovement(init, EID_E1, [ l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,d,r,d,r,u,r,u,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_E2, [ u,u,u,u,l,d,l,d,l,d,l,d,n,r,r,r,r,n,n ], [ no_repeat_moves ]).

norule(_).
norule(_,_,_,_,_).
