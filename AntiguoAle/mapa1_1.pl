%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	00:07	[STS: 00:21]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(enemyBasicMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', ' ', '#'],
['#', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', ' ', ' ', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(16, 7).
num_dots(48).
pacman_start(1, 3).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(EID_0, 'E', mortal, 8, 3, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_0, up-down, ['#']).
norule(_).
norule(_,_,_,_,_).
