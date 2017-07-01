%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4-
%%% PT:	00:18	[STS: 00:54]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicDoorKey).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', '.', '.', '#', '.', '#', '.', '.', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '#', '#', '#', '#', '.', '#', '.', '.', '#', '.', '#', '#', '.', '.', '.', '#'],
['#', ' ', '#', '.', '.', '.', '.', '#', '#', '#', '#', '.', '#', '.', '.', '#', '.', '.', ' ', '#', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '.', '#', ' ', ' ', '#', '.', '#', '#', '#', '#', '.', '#', '#', '#', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(23, 8).
num_dots(78).
pacman_start(18, 4).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_D, '/', object, 1, 4, inactive, norule, 
			[ name(puerta), solid(true), static(true), use_rule(norule), 
			  description('Puerta que se abre con la llave azul'), appearance(attribs(bold, cyan, green)) ]),
	createGameEntity('r', object, 9, 5, inactive, norule, 
			[ name(llave_roja), solid(false), static(false), use_rule(basicDoorKey), 
			  description('Llave de color rojo'), appearance(attribs(bold, red, default)) ]),
	createGameEntity(OID_A, 'a', object, 8, 5, inactive, norule, 
			[ name(llave_azul), solid(false), static(false), use_rule(basicDoorKey), 
			  description('Llave de color azul'), appearance(attribs(bold, cyan, default)) ]),
	basicDoorKey(init, OID_D, ['pl-man':destroyGameEntity(OID_D), 'pl-man':destroyGameEntity(OID_A)], [OID_A]).
norule(_).
norule(_,_,_,_,_).
