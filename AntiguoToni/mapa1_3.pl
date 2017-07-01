%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5
%%% PT:	00:30	[STS: 01:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '.', '.', '.', '#'],
['#', '.', '#', '.', '#', '#', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '.', '.', '.', '#'],
['#', '.', '#', '.', '#', '#', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '#', '#', '#', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(10, 17).
num_dots(87).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(EID_0, 'E', mortal, 2, 5, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 4, 7, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 5, 13, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [ u,u,r,r,r,r,r,d,d,l,l,l,l,l,n ], []),
	entitySequentialMovement(init, EID_1, [ l,l,l,d,d,d,r,r,r,r,r,r,r,u,u,u,l,l,l,l,n ], []),
	entitySequentialMovement(init, EID_2, [ r,r,r,u,u,l,l,d,d,l,l,l,l,l,u,u,r,r,d,d,r,r,n ], []).
norule(_).
norule(_,_,_,_,_).
