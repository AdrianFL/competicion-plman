%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(gunSniper).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '#'],
['#', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(17, 7).
num_dots(70).
pacman_start(7, 3).
initMap:- 
	addSolidObject('#'),
	
		
	%% Rifle francotirador
	createGameEntity(OID_FRANCO, 'L', object, 15, 3, inactive, norule,
			[name(rifle_francotirador), solid(false), static(false), use_rule(gunSniper),
			description('Rifle de 3 balas que atraviesa enemigos E'), appearance(attribs(bold, white, default))]), 
	gunSniper(init, OID_FRANCO, 3, ['E'], destroy),
	
	%% Enemigos normales
	createGameEntity(EID_0, 'E', mortal, 1, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [r], [no_repeat_moves]),
	createGameEntity(EID_1, 'E', mortal, 2, 3, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, [r], [no_repeat_moves]),
	createGameEntity(EID_2, 'E', mortal, 3, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_2, [r], [no_repeat_moves]),
	createGameEntity(EID_3, 'E', mortal, 4, 3, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_3, [r], [no_repeat_moves]),
	createGameEntity(EID_4, 'E', mortal, 5, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_4, [r], [no_repeat_moves]),
	
	
	createGameEntity(EID_5, 'E', mortal, 9, 2, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_5, [n], [no_repeat_moves]),	
	createGameEntity(EID_6, 'E', mortal, 12, 2, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_6, [n], [no_repeat_moves]),
		
	createGameEntity(EID_8, 'E', mortal, 12, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_8, [n], [no_repeat_moves]),
	createGameEntity(EID_9, 'E', mortal, 8, 1, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_9, [n], [no_repeat_moves]),
	createGameEntity(OID_11, 'E', mortal, 2, 1, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, OID_11, [n], [no_repeat_moves]).
	
	
	
	
norule(_).
norule(_,_,_,_,_).

/*
attribCode(normal, 0).
attribCode(bold, 1).
attribCode(faint, 2).
attribCode(standout, 3).
attribCode(underline, 4).
attribCode(blink, 5).
attribCode(reverse, 7).
attribCode(invisible, 8).
attribCode(no_standout, 23).
attribCode(no_underline, 24).
attribCode(no_blink, 25).
attribCode(no_reverse, 27).
colorCode(foreground, black, 30).
colorCode(foreground, red, 31).
colorCode(foreground, green, 32).
colorCode(foreground, yellow, 33).
colorCode(foreground, magenta, 35).
colorCode(foreground, cyan, 36).
colorCode(foreground, white, 37).
colorCode(foreground, default, 39).
colorCode(background, black, 40).
colorCode(background, red, 41).
colorCode(background, green, 42).
colorCode(background, yellow, 43).
colorCode(background, magenta, 45).
colorCode(background, cyan, 46).
colorCode(background, white, 47).
colorCode(background, default, 49).
*/
