%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	00:55	[STS: 02:45]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(enemyBasicMovement).
load_behaviour(basicDoorKey).
load_behaviour(gunBasic).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '#', '#', '.', '.', '#', '.', '.', '#', '.', '.', '#', '#', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '.', '.', '.', '.', '.', '.', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '#', '#', '.', '.', '.', '.', '#', '#', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '#', '#', '.', '.', '#', '#', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', ' ', '#', '#', ' ', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(18, 10).
num_dots(94).
pacman_start(7, 8).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_D1, '_', object, 8, 3, inactive, norule, 
	                 [name('Puerta 1'), solid(true), static(true), use_rule(norule), 
			  description('Primera puerta del corazon.'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_D2, '_', object, 9, 3, inactive, norule, 
	                 [name('Puerta 2'), solid(true), static(true), use_rule(norule), 
			  description('Segunda puerta del corazon.'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_GUN, 'l', object, 1, 8, inactive, norule, 
	                 [name(pistola), solid(false), static(false), use_rule(gunBasic), 
			  description('Pistola de precision'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_YK, '-', object, 10, 8, inactive, norule, 
	                 [name(llave_del_corazon), solid(false), static(false), use_rule(basicDoorKey), 
			  description('Esta llave te abrira una puerta del corazon.'), appearance(attribs(normal, yellow, default))]), 
	createGameEntity(EID_E1, 'E', mortal, 5, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_E2, 'E', mortal, 6, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_E3, 'E', mortal, 11, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_E4, 'E', mortal, 12, 1, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]), 
	gunBasic(init, OID_GUN, 3, ['E'], destroy),
	enemyBasicMovement(init, EID_E1, left-right, ['#']),
	enemyBasicMovement(init, EID_E2, right-left, ['#']),
	enemyBasicMovement(init, EID_E3, right-left, ['#']),
	enemyBasicMovement(init, EID_E4, left-right, ['#']),
	basicDoorKey(init, OID_D2, ['pl-man':destroyGameEntity(OID_D2), 'pl-man':destroyGameEntity(OID_D1)], [OID_YK]).
norule(_).
norule(_,_,_,_,_).
