%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	3
%%% PT:	01:10	[STS: 03:30]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(pushBlocks).
load_behaviour(enemyFollower).
load_behaviour(automaticArcher).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(15, 10).
num_dots(70).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	createGameEntity(OID_PAL, '\\', object, 13, 1, inactive, norule, 
	                 [name(palanca), solid(false), static(false), use_rule(pushBlocks),
			 description('Palanca para empujar bloques móviles'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_AR1, ')', object, 1, 3, active, automaticArcher, 
	                 [name('Arquero 1'), solid(false), static(true), use_rule(norule),
			 description('Arquero ofensivo'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_PB1, '%', object, 6, 3, inactive, norule, 
	                 [name('Bloque empujable 1'), solid(true), static(true), use_rule(norule), 
			  description('Bloque que puede ser empujado con una palanca'), appearance(attribs(bold, cyan, cyan))]), 
	createGameEntity(OID_AR2, '(', object, 13, 4, active, automaticArcher, 
	                 [name('Arquero 2'), solid(false), static(true), use_rule(norule),
			 description('Arquero ofensivo'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_PB2, '%', object, 8, 4, inactive, norule, 
	                 [name('Bloque empujable 2'), solid(true), static(true), use_rule(norule), 
			  description('Bloque que puede ser empujado con una palanca'), appearance(attribs(bold, cyan, cyan))]), 
	createGameEntity(OID_AR3, ')', object, 1, 5, active, automaticArcher, 
	                 [name('Arquero 3'), solid(false), static(true), use_rule(norule),
			 description('Arquero ofensivo'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_PB3, '%', object, 8, 6, inactive, norule, 
	                 [name('Bloque empujable 3'), solid(true), static(true), use_rule(norule), 
			  description('Bloque que puede ser empujado con una palanca'), appearance(attribs(bold, cyan, cyan))]), 
	createGameEntity(OID_AR4, '(', object, 13, 6, active, automaticArcher, 
	                 [name('Arquero 4'), solid(false), static(true), use_rule(norule),
			 description('Arquero ofensivo'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_PB4, '%', object, 6, 5, inactive, norule, 
	                 [name('Bloque empujable 4'), solid(true), static(true), use_rule(norule), 
			  description('Bloque que puede ser empujado con una palanca'), appearance(attribs(bold, cyan, cyan))]), 
	createGameEntity(OID_AR5, ')', object, 1, 7, active, automaticArcher, 
	                 [name('Arquero 5'), solid(false), static(true), use_rule(norule),
			 description('Arquero ofensivo'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(EID_PH, 'F', mortal, 7, 8, active, enemyFollower, [appearance(attribs(normal,red,default))]),
	automaticArcher(init, OID_AR1, ['@'], right, 2, [bullet_appearance('>', normal, red, default)]),
	automaticArcher(init, OID_AR2, ['@'], left, 2, [bullet_appearance('<', normal, red, default)]),
	automaticArcher(init, OID_AR3, ['@'], right, 2, [bullet_appearance('>', normal, red, default)]),
	automaticArcher(init, OID_AR4, ['@'], left, 2, [bullet_appearance('<', normal, red, default)]),
	automaticArcher(init, OID_AR5, ['@'], right, 5, [bullet_appearance('>', normal, red, default)]),
	pushBlocks(init, OID_PAL, [OID_PB1, OID_PB2, OID_PB3, OID_PB4]),
	enemyFollower(init, EID_PH, ['@'], [left, right], [delay(1)]).
norule(_).
norule(_,_,_,_,_).
