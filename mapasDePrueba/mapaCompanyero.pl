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
load_behaviour(automaticTurret).

load_behaviour(gunBasic).
load_behaviour(companion).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(17, 7).
num_dots(70).
pacman_start(7, 1).
initMap:- 
	addSolidObject('#'),
	
	%% Prueba compañero
	createGameEntity(OID_CMP, 'ñ', object, 2, 3, active, companion,
		[name(compi), solid(false), static(true), use_rule(norule),
			description('Compañero que ayuda a @'), appearance(attribs(normal, green, default))]),
	companion(init, OID_CMP, [r,l], [], ['¬'], ['E'], [right,left]),
	
	% Pistola que cogerá
	createGameEntity(OID_P, '¬', object, 4, 3, inactive, norule, 
		data('pistola', not_solid, not_static, gunBasic, 'Derringer')),
	gunBasic(init, OID_P, 3, ['E'], destroy),

	createGameEntity(OID_P1, '¬', object, 1, 3, inactive, norule, 
		data('pistola', not_solid, not_static, gunBasic, 'Derringer')),
	gunBasic(init, OID_P1, 3, ['E'], destroy),
	
	
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
	entitySequentialMovement(init, EID_8, [n], [no_repeat_moves]).
	
	%% ----------
	
	
	
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
