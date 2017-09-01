%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(mineExplosion).
load_behaviour(entitySequentialMovement).
load_behaviour(quimicBomb).
load_behaviour(gunSniper).
load_behaviour(combiner). % Para enemigo que dispare
load_behaviour(automaticArcher).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#'],
['#', '.', ' ', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(17, 7).
num_dots(70).
pacman_start(8, 3).
initMap:- 
	addSolidObject('#'),

	% Máscara de gas
	createGameEntity(OID_MG, 'G', object, 9, 3, inactive, norule,
			[name(mascara_gas), solid(false), static(false), use_rule(norule),
			description('Máscara antigás, permite sobrevivir al gas'), appearance(attribs(bold, white, default))]), 
	
	%%PRUEBA DEL OBJETO CREADO
	createGameEntity(OID_BQ, 'Ǒ', object, 2, 3, active, quimicBomb,
		[name(bomba_quimica), solid(false), static(true), use_rule(norule),
			description('Bomba química que infecta una sala'), appearance(attribs(normal, red, default))]),
	quimicBomb(init,OID_BQ, 1, 4, 15, [ no_destroy(['.']) ]). % Cambiad el 15 por 14 para vez el caso especial

norule(_).
norule(_,_,_,_,_).
