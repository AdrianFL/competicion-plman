%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa00.txt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(enemyBasicMovement).
load_behaviour(gunSniper).
load_behaviour(automaticArcher).
load_behaviour(automaticTurret).
load_behaviour(respawnPoint).
load_behaviour(spiderGhost).
load_behaviour(entitySequentialMovement).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '#'],
['#', '.', ' ', ' ', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '.', '.', ' ', ' ', ' ', '.', '.', ' ', ' ', ' ', ' ', '.', '.', '#', '.', '#'],
['#', '.', '#', ' ', '.', ' ', '.', '.', '.', ' ', ' ', '.', '.', '.', '.', ' ', '#'],
['#', '.', ' ', ' ', ' ', '.', '.', '.', '.', '.', ' ', ' ', ' ', '.', '#', '#', '#'],
['#', '.', '#', '#', ' ', ' ', ' ', ' ', '.', ' ', ' ', ' ', '.', '.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', ' ', '.', '.', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '#'],
['#', '.', ' ', '.', '.', '.', ' ', '.', '.', '.', ' ', ' ', ' ', '#', '.', '.', '#'],
['#', '.', '.', ' ', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(17, 13).
num_dots(70).
pacman_start(8, 2).
initMap:- 
	addSolidObject('#'),
		
	createGameEntity(OID_RS0, '', object, 1, 1, inactive, norule, 
	            [name(respawn1), solid(false), static(true), use_rule(norule), description('Punto de respawn')]),	
	createGameEntity(OID_RS1, '', object, 7, 1, inactive, norule, 
	            [name(respawn2), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
  createGameEntity(OID_RS2, '', object, 8, 1, inactive, norule, 
	            [name(respawn3), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
  createGameEntity(OID_RS3, '', object, 9, 1, inactive, norule, 
	            [name(respawn4), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
  createGameEntity(OID_RS4, '', object, 10, 1, inactive, norule, 
	            [name(respawn5), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
  createGameEntity(OID_RS5, '', object, 11, 1, inactive, norule, 
	            [name(respawn6), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
  createGameEntity(OID_RS00, '', object, 6, 1, inactive, norule, 
	            [name(respawn2), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
  createGameEntity(OID_RS6, '', object, 3, 11, inactive, norule, 
  						[name(respawn7), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
	createGameEntity(OID_RS7, '', object, 15, 5, inactive, norule, 
	            [name(respawn2), solid(false), static(true), use_rule(norule), description('Punto de respawn')]), 
	            
	  respawnPoint(init, [ OID_RS00, OID_RS1, OID_RS2, OID_RS3, OID_RS4, OID_RS5 ], 5, 	
		[ app('E'), name(enemigo), type(mortal), crule(entitySequentialMovement), appearance(attribs(bold, red, default)) ], 
		[ EID, 'pl-man':entitySequentialMovement(init, EID, [d], [no_repeat_moves]) ], [ probRespawn(400) ]),
		
	respawnPoint(init, [ OID_RS0 ], 2, 
		[ app('E'), name(enemigo), type(mortal), crule(entitySequentialMovement), appearance(attribs(normal, cyan, default)) ], 
		[ EID, 'pl-man':entitySequentialMovement(init, EID, [d,r], [no_repeat_moves]) ], [ probRespawn(400) ]),
		
		respawnPoint(init, [ OID_RS6 ], 3, 
		[ app('E'), name(enemigo), type(mortal), crule(entitySequentialMovement), appearance(attribs(normal, yellow, default)) ], 
		[ EID, 'pl-man':entitySequentialMovement(init, EID, [u,r], [no_repeat_moves]) ], [ probRespawn(200) ]),
		
		respawnPoint(init, [ OID_RS7 ], 3, 
		[ app('E'), name(enemigo), type(mortal), crule(entitySequentialMovement), appearance(attribs(normal, white, default)) ], 
		[ EID, 'pl-man':entitySequentialMovement(init, EID, [l,l,d], [no_repeat_moves]) ], [ probRespawn(200) ]),
	
	
	%% Enemigos normales
	createGameEntity(EID_0, 'E', mortal, 4, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [n,n,d], [no_repeat_moves]),
	createGameEntity(EID_1, 'E', mortal, 5, 1, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, [n,d], [no_repeat_moves]),
	
	createGameEntity(EID_2, 'E', mortal, 7, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_2, [d], [no_repeat_moves]),
	createGameEntity(EID_3, 'E', mortal, 6, 1, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_3, [d], [no_repeat_moves]),
	createGameEntity(EID_4, 'E', mortal, 8, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_4, [d], [no_repeat_moves]),
	
	createGameEntity(EID_5, 'E', mortal, 9, 1, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_5, [n,d], [no_repeat_moves]),
	createGameEntity(EID_6, 'E', mortal, 10, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_6, [d], [no_repeat_moves]),
	createGameEntity(EID_7, 'E', mortal, 11, 1, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_7, [n,d], [no_repeat_moves]),
	createGameEntity(EID_8, 'E', mortal, 12, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_8, [n,n,d], [no_repeat_moves]),
	
		
	%% Torretas giratorias
	
	createGameEntity(OID_TURRET1, '˧', object, 15, 7, active, automaticTurret,
			[name(torretaAutomatica1), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, default))]),
	automaticTurret(init, OID_TURRET1, ['E'], [up,down,left,right], 2, []),	
	
	createGameEntity(OID_TURRET2, '˫', object, 3, 3, active, automaticTurret,
			[name(torretaAutomatica1), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, default))]),
	automaticTurret(init, OID_TURRET2, ['E'], [left,up,down,right], 1, []),
	
	createGameEntity(OID_TURRET3, '˫', object, 3, 6, active, automaticTurret,
			[name(torretaAutomatica1), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, default))]),
	automaticTurret(init, OID_TURRET3, ['E'], [left,up,down,right], 1, []),
	
	createGameEntity(OID_TURRET5, 'T', object, 7, 10, active, automaticTurret,
			[name(torretaAutomatica1), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, default))]),
	automaticTurret(init, OID_TURRET5, ['E'], [up,down,left,right], 2, []),
	
	createGameEntity(OID_TURRET6, 'T', object, 9, 10, active, automaticTurret,
			[name(torretaAutomatica1), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, default))]),
	automaticTurret(init, OID_TURRET6, ['E'], [up,down,left,right], 2, []),
	
	createGameEntity(OID_TURRET7, 'T', object, 3, 8, active, automaticTurret,
			[name(torretaAutomatica1), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, black))]),
	automaticTurret(init, OID_TURRET7, ['E'], [up,down,left,right], 3, []),
	
	createGameEntity(OID_TURRET8, '˧', object, 15, 9, active, automaticTurret,
			[name(torretaAutomatica8), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, default))]),
	automaticTurret(init, OID_TURRET8, ['E'], [up,down,left,right], 2, []),
	
	createGameEntity(OID_TURRET4, '˧', object, 13, 11, active, automaticTurret,
			[name(torretaAutomatica4), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	automaticTurret(init, OID_TURRET4, ['E'/*,'@'*/], [up,down,left,right], 2, []).
	
	
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
