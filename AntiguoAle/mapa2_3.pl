%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5
%%% PT:	01:30	[STS: 04:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(mineExplosion).
load_behaviour(basicDoorKey).
load_behaviour(entitySequentialMovement).
load_behaviour(automaticArcher).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '.', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', ' ', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '#', '#', '#', ' ', '#', '#', '#', '#', ' ', '#', '#', '#', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(21, 11).
num_dots(116).
pacman_start(19, 5).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_RK, 'r', object, 19, 1, inactive, norule, 
			[name(llave_roja), solid(false), static(false), use_rule(basicDoorKey), 
			 description('Llave que abre la puerta roja'), appearance(attribs(bold, red, default))]), 
	createGameEntity(OID_AR1, '^', object, 5, 4, active, automaticArcher, 
			[name(arquero1), solid(false), static(true), use_rule(norule), 
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR2, '^', object, 10, 4, active, automaticArcher, 
			[name(arquero2), solid(false), static(true), use_rule(norule), 
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_MINE, 'º', object, 14, 5, active, mine, 
			[name(mina), solid(false), static(false), use_rule(norule), 
			description('Mina que se activa automaticamente al dejarla en el suelo.'), appearance(attribs(bold, white, default))]), 
	createGameEntity(OID_RD, '|', object, 15, 5, inactive, norule, 
			[name(puerta_roja), solid(true), static(true), use_rule(norule), 
			description('Puerta que se abre con la llave roja'), appearance(attribs(bold, red, default))]), 
	createGameEntity(OID_BD, '|', object, 16, 5, inactive, norule, 
			[name(puerta_azul), solid(true), static(true), use_rule(norule), 
			description('Puerta que se abre con la llave azul'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_AR3, 'v', object, 6, 6, active, automaticArcher, 
			[name(arquero3), solid(false), static(true), use_rule(norule), 
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR4, 'v', object, 11, 6, active, automaticArcher, 
			[name(arquero4), solid(false), static(true), use_rule(norule), 
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_BK, 'a', object, 19, 9, inactive, norule, 
			[name(llave_azul), solid(false), static(false), use_rule(basicDoorKey), 
			 description('Llave que abre la puerta azul'), appearance(attribs(bold, cyan, default))]), 
%	createGameEntity(EID_0, 'E', mortal, 8, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 1, 5, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
%	createGameEntity(EID_2, 'E', mortal, 4, 7, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
%	entitySequentialMovement(init, EID_0, [ l,l,l,l,l,u,u,r,r,r,d,d,r,r,r,u,u,r,r,r,d,d,l,l,l,l ], []),
	entitySequentialMovement(init, EID_1, [ u,u,u,u,r,d,d,d,d,d,d,d,d,l,u,u,u,u,n,n,d,d,d,d,r,u,u,u,u,u,u,u,u,l,d,d,d,d,n,n ], []),
%	entitySequentialMovement(init, EID_2, [ r,r,r,r,r,r,r,r,d,l,l,l,l,l,l,l,l,l,l,l,d,r,r,r,r,r,r,r,r,r,r,r,u,l,l,l,l,l,l,l,l,l,l,l,u,r,r,r ], []),
	automaticArcher(init, OID_AR1, ['@'], up, 8, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR2, ['@'], up, 6, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR3, ['@'], down, 7, [ continuous, bullet_appearance('|', bold, red, default) ]),
	automaticArcher(init, OID_AR4, ['@'], down, 6, [ continuous, bullet_appearance('|', bold, red, default) ]),
	basicDoorKey(init, OID_BD, [ 'pl-man':destroyGameEntity(OID_BD) ], [OID_BK]),
	basicDoorKey(init, OID_RD, [ 'pl-man':destroyGameEntity(OID_RD) ], [OID_RK]),
	mine(init, OID_MINE, 2, 1, [ no_destroy(['.']) ]).

norule(_).
norule(_,_,_,_,_).
