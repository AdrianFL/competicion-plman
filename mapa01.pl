%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(armoredVehicle).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#'],
['#', '.', ' ', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
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

	%%VEHICULO ARMADO

	createGameEntity(OID_VEHICLE, 'X', object, 5, 3, active, armoredVehicle,
			[name(armoredVehicle), solid(false), static(true), use_rule(norule),
			description('Vehiculo armado que dispara granadas a diferentes zonas'), appearance(attribs(normal, red, default))]),
	armoredVehicle(init,OID_VEHICLE, right, 5, 3, [], ['#','|']).
	
	
norule(_).
norule(_,_,_,_,_).
