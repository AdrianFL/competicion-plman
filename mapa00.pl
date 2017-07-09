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
	
	%% ----------
	
	%% Prueba del enemigo que dispara
	EID_C1_X = 7,
	EID_C1_Y = 1,
	EID_C1_DELAY = 1,
	EID_C1_MOVEMENT = [n,r,r,n,l,d,d,n],
	EID_C1_AIMLIST = ['@'],
	
	createGameEntity(EID_C1, 'x', mortal, EID_C1_X, EID_C1_Y, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(normal, default, default))]),
	entitySequentialMovement(init, EID_C1, EID_C1_MOVEMENT, []),	
  automaticArcher(init, EID_C1, EID_C1_AIMLIST, up, EID_C1_DELAY, [ bullet_appearance('ʌ', normal, red, default) ]),
  
  createGameEntity(EID_C2, 'x', mortal, EID_C1_X, EID_C1_Y, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(normal, default, default))]),
	entitySequentialMovement(init, EID_C2, EID_C1_MOVEMENT, []),	
  automaticArcher(init, EID_C2, EID_C1_AIMLIST, right, EID_C1_DELAY, [ bullet_appearance('>', normal, red, default) ]),
  
  createGameEntity(EID_C3, 'x', mortal, EID_C1_X, EID_C1_Y, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(normal, default, default))]),
	entitySequentialMovement(init, EID_C3, EID_C1_MOVEMENT, []),	
  automaticArcher(init, EID_C3, EID_C1_AIMLIST, down, EID_C1_DELAY, [ bullet_appearance('v', normal, red, default) ]),
  
  % Colores y apariencia se modifican aquí
  createGameEntity(EID_C4, 'x', mortal, EID_C1_X, EID_C1_Y, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(bold, yellow, magenta))]),
	entitySequentialMovement(init, EID_C4, EID_C1_MOVEMENT, []),	
  automaticArcher(init, EID_C4, EID_C1_AIMLIST, left, EID_C1_DELAY, [ bullet_appearance('<', normal, red, default) ]),
    
  %% ----------
	
	%% Mina normal
	createGameEntity(OID_MINE, '+', object, 15, 2, active, mine, 
            [name(mine), solid(false), static(false), use_rule(norule), description('programmable mine')]),
	mine(init, OID_MINE, 5, 1, [ no_destroy(['.']) ]).
	
	
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
