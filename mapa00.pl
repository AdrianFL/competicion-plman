%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(mineExplosion).
load_behaviour(entitySequentialMovement).
load_behaviour(quimicBomb).
load_behaviour(gunSniper).
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
	%createGameEntity(OID_BQ, 'Ǒ', object, 2, 3, active, quimicBomb,
	%		[name(bomba_quimica), solid(false), static(true), use_rule(norule),
	%		description('Bomba química que infecta una sala'), appearance(attribs(normal, red, default))]),
	%quimicBomb(init,OID_BQ, 3, 2, 5, [ no_destroy(['.']) ]),
	
	%% PRUEBA FRANCOTIRADOR
	createGameEntity(OID_FRANCO, 'L', object, 7, 3, inactive, norule,
			[name(rifle_francotirador), solid(false), static(false), use_rule(gunSniper),
			description('Rifle de 3 balas que atraviesa enemigos E'), appearance(attribs(bold, white, default))]), 
	gunSniper(init, OID_G, 3, ['E'], destroy),
	
	%% Enemigos normales
	createGameEntity(EID_0, 'E', mortal, 8, 4, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [n], [no_repeat_moves]),
	createGameEntity(EID_1, 'E', mortal, 8, 5, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, [n], [no_repeat_moves]),
	
	createGameEntity(EID_2, 'E', mortal, 7, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_2, [n], [no_repeat_moves]),
	createGameEntity(EID_3, 'E', mortal, 6, 3, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_3, [n], [no_repeat_moves]),
	createGameEntity(EID_4, 'E', mortal, 5, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_4, [n], [no_repeat_moves]),
	
	createGameEntity(EID_5, 'E', mortal, 9, 3, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_5, [n], [no_repeat_moves]),
	createGameEntity(EID_6, 'E', mortal, 10, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_6, [n], [no_repeat_moves]),
	createGameEntity(EID_7, 'E', mortal, 11, 3, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_7, [n], [no_repeat_moves]),
	createGameEntity(EID_8, 'E', mortal, 12, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_8, [n], [no_repeat_moves]),
	
	%% Mina normal
	createGameEntity(OID_MINE, '+', object, 15, 2, active, mine, 
            [name(mine), solid(false), static(false), use_rule(norule), description('programmable mine')]),
	mine(init, OID_MINE, 5, 1, [ no_destroy(['.']) ]).
	
	
norule(_).
norule(_,_,_,_,_).
