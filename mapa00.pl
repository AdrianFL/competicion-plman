%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(mineExplosion).
load_behaviour(quimicBomb).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#'],
['#', '.', ' ', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(17, 7).
num_dots(70).
pacman_start(8, 3).
initMap:- 
	addSolidObject('#'),
	
	%%PRUEBA DEL OBJETO CREADO
	createGameEntity(OID_BQ, 'Ǒ', object, 2, 3, active, quimicBomb,
			[name(bomba_quimica), solid(false), static(true), use_rule(norule),
			description('Bomba química que infecta una sala'), appearance(attribs(normal, red, default))]),
	quimicBomb(init,OID_BQ, 3, 2, 5, [ no_destroy(['.']) ]),

	createGameEntity(OID_MINE, '+', object, 15, 2, active, mine, 
            [name(mine), solid(false), static(false), use_rule(norule), description('programmable mine')]),
	mine(init, OID_MINE, 5, 1, [ no_destroy(['.']) ]).
norule(_).
norule(_,_,_,_,_).
