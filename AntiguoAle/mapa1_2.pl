%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	00:16	[STS: 00:48]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(pushBlocks).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#', '.', '#', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '#', ' ', ' ', ' ', '#', '.', '#', ' ', ' ', ' ', '#', '.', '#', '#', '.', '.', '#', '.', '#'],
['#', '.', '#', '#', '#', '.', '.', '.', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#', '.', '#', ' ', '#', '.', '#', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '#', ' ', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '#', '#', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(27, 10).
num_dots(112).
pacman_start(21, 4).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(EID_B, '%', object, 2, 3, inactive, norule, 
			[ name(bloque_movil), solid(true), static(true), use_rule(norule), 
			  description('Bloque movil pesado. Se requiere almenos 1 palanca para moverlo'), appearance(attribs(bold, black, green)) ]),
	createGameEntity(EID_P, '\\', object, 12, 5, inactive, norule, 
			[ name(palanca), solid(false), static(false), use_rule(pushBlocks), 
			  description('Palanca de acero con la que puedes mover bloques muy pesados'), appearance(attribs(bold, cyan, default)) ]),
	pushBlocks(init, EID_P, [EID_B]).
norule(_).
norule(_,_,_,_,_).
