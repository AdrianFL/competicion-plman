%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
/*load_behaviour(quimicBomb).
load_behaviour(armoredVehicle).*/
load_behaviour(lightTrafficBlock).
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

	createGameEntity(OID_LTB, '=', object, 9, 3, active, lightTrafficBlock,
			[name(bomba_quimica), solid(true), static(true), use_rule(norule),
			description('Bloque semáforo'), appearance(attribs(normal, red, default))]),
	lightTrafficBlock(init, OID_LTB, 1, 4, 1, 9, 3).	
	
norule(_).
norule(_,_,_,_,_).
