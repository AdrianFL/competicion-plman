%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5
%%% PT:	00:20	[STS: 01:00]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(basicDoorKey).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#', '.', '#', ' ', '#', '#', ' ', '.', '#', '.', '.', '.', '.', '.', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '#', ' ', ' ', ' ', '#', '.', '#', ' ', ' ', ' ', '#', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#', '.', '#', '#', ' ', '#', '.', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#', '#', ' ', '#', ' ', '.', '#', '#', '#', '#', '#', '.', '#', '#', '#', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(33, 9).
num_dots(138).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_SECDOOR1, '/', object, 15, 2, inactive, norule, 
			[ name(puerta_blindada), solid(true), static(true), use_rule(norule), 
			  description('Puerta que solo se abre con la tarjeta de acceso'), appearance(attribs(bold, yellow, green)) ]),
	createGameEntity(OID_SECDOOR2, '/', object, 16, 4, inactive, norule, 
			[ name(puerta_blindada), solid(true), static(true), use_rule(norule), 
			  description('Puerta que solo se abre con la tarjeta de acceso'), appearance(attribs(bold, yellow, green)) ]),
	createGameEntity(OID_SECDOOR3, '/', object, 16, 6, inactive, norule, 
			[ name(puerta_blindada), solid(true), static(true), use_rule(norule), 
			  description('Puerta que solo se abre con la tarjeta de acceso'), appearance(attribs(bold, yellow, green)) ]),
	createGameEntity(OID_ACARD, '=', object, 18, 2, inactive, norule, 
			[ name(tarjeta_acceso), solid(false), static(false), use_rule(basicDoorKey), 
			  description('Tarjeta para abrir la puertas blindadas'), appearance(attribs(bold, yellow, default)) ]),
	createGameEntity(OID_DOOR, '_', object, 29, 6, inactive, norule, 
			[ name(puerta_normal), solid(true), static(true), use_rule(norule), 
			  description('Puerta que se abre con la llave azul'), appearance(attribs(bold, cyan, default)) ]),
	createGameEntity(OID_KEY, '-', object, 18, 6, inactive, norule, 
			[ name(llave_azul), solid(false), static(false), use_rule(basicDoorKey), 
			  description('Llave apta para abrir una puerta normal'), appearance(attribs(bold, cyan, default)) ]),
	basicDoorKey(init, OID_SECDOOR1, ['pl-man':destroyGameEntity(OID_SECDOOR1)], [OID_ACARD]),
	basicDoorKey(init, OID_SECDOOR2, ['pl-man':destroyGameEntity(OID_SECDOOR2)], [OID_ACARD]),
	basicDoorKey(init, OID_SECDOOR3, ['pl-man':destroyGameEntity(OID_SECDOOR3), 'pl-man':destroyGameEntity(OID_ACARD), writeln('La tarjeta de acceso se ha volatilizado!')], [OID_ACARD]),
	basicDoorKey(init, OID_DOOR, ['pl-man':destroyGameEntity(OID_DOOR)], [OID_KEY]).

norule(_).
norule(_,_,_,_,_).
