%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(armoredVehicle).
load_behaviour(mineExplosion).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '/', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', ' ', ' ', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#', ' ', '#'],
['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(17, 7).
num_dots(1).
pacman_start(8, 1).
initMap:- 
	addSolidObject('#'),
	
	%%PRUEBA DEL OBJETO CREADO
	%createGameEntity(OID_BQ, 'Ǒ', object, 2, 3, active, quimicBomb,
	%		[name(bomba_quimica), solid(false), static(true), use_rule(norule),
	%		description('Bomba química que infecta una sala'), appearance(attribs(normal, red, default))]),
	%quimicBomb(init,OID_BQ, 3, 2, 5, [ no_destroy(['.']) ]),

	%%VEHICULO ARMADO
	createGameEntity(OIDM, '+', object, 7, 2, active, mine,
			[name(mine), solid(false), static(false), use_rule(norule),
			description('Mina para reventar el coche'), appearance(attribs(normal, red, default))]),
	mine(init,OIDM, 1, 1, [ no_destroy(['.','@']) ]),

	createGameEntity(OID_VEHICLE, 'X', mortal, 5, 3, active, armoredVehicle,
			[name(armoredVehicle), solid(false), static(true), use_rule(norule),
			description('Vehiculo armado que dispara granadas a diferentes zonas'), appearance(attribs(normal, red, default))]),
	armoredVehicle(init,OID_VEHICLE, right, 5, 3, 1, 1, ['#','|'], 5).
	
	
norule(_).
norule(_,_,_,_,_).
