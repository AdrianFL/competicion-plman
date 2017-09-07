%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Prolog Code for Map-file generated from mapa3oficial.txt
%%%
%%% DIF:	4
%%% PT:	02:30	[STS: 10:00] % No sé qué es esto
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(enemyBasicMovement).
load_behaviour(gunSniper).
load_behaviour(basicDoorKey).
load_behaviour(automaticTurret).
load_behaviour(automaticArcher).

load_behaviour(functioner).
map([
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', '.', '.', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', '#', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', ' ', ' ', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', '#', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#'],
['#', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '#', '#'],
['#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '#'],
['#', '.', '.', '.', '#', '.', '.', '#', '.', '.', '.', '.', '#', '#', '#', '.', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '#'],
['#', '.', '.', '.', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '#'],
['#', '#', '#', '.', '#', '#', '.', '.', '.', '#', '#', '#', '#', '#', '.', '#', '.', '#', '.', '.', '.', '.', '.', '#', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '#', '.', '#', ' ', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '#', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']
]).
map_size(27, 15).
num_dots(200). %% Por cambiar
pacman_start(25, 13).
initMap:- 
	addSolidObject('#'),

	%% El functioner master

	createGameEntity(OID_FUNCT0, '', non_interactive, 5, 5, active, functioner, 
			[name(functioner), solid(false), static(true), use_rule(norule),
			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),

	createGameEntity(OID_FUNCT1, '', non_interactive, 5, 5, active, functioner, 
			[name(functioner), solid(false), static(true), use_rule(norule),
			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),

	createGameEntity(OID_FUNCT2, '', non_interactive, 5, 5, active, functioner, 
			[name(functioner), solid(false), static(true), use_rule(norule),
			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),

	createGameEntity(OID_FUNCT3, '', non_interactive, 5, 5, active, functioner, 
			[name(functioner), solid(false), static(true), use_rule(norule),
			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),

	createGameEntity(OID_FUNCT4, '', non_interactive, 5, 5, active, functioner, 
			[name(functioner), solid(false), static(true), use_rule(norule),
			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),

	createGameEntity(OID_FUNCT5, '', non_interactive, 5, 5, active, functioner, 
			[name(functioner), solid(false), static(true), use_rule(norule),
			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),

	%FUNCT_LIST = [],
	
	functioner(init, OID_FUNCT0, ['pl-man':createGameEntity(ALLY_SCOUT, 'ñ', mortal, 1, 2, active, entitySequentialMovement, [appearance(attribs(bold, green, default))]),
	'pl-man':entitySequentialMovement(init, ALLY_SCOUT, [r,r,n,r,r,r,r,n,r,r,r,r,n,r,r,r,r,n,n,l,l,l,l,l,l,l,l,l,l,l,l,l,l], [no_repeat_moves]),
'pl-man':createGameEntity(OID_FUNCT, '', non_interactive, 0, 0, active, functioner, []),
'pl-man':functioner(init, OID_FUNCT, ['pl-man':destroyGameEntity(ALLY_SCOUT)], 33, 0) 
], 0, 0),

	functioner(init, OID_FUNCT1, 
['pl-man':createGameEntity(OID_TURRET0, 'T', object, 3, 1, active, automaticTurret,
			[name(torretaAutomatica4), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	'pl-man':automaticTurret(init, OID_TURRET0, ['E','@'], [up,down,left,right], 2, [])], 3, 0),

	functioner(init, OID_FUNCT2, 
['pl-man':createGameEntity(OID_TURRET1, 'T', object, 7, 1, active, automaticTurret,
			[name(torretaAutomatica), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	'pl-man':automaticTurret(init, OID_TURRET1, ['E','@'], [up,down,left,right], 2, [])], 8, 0),

	functioner(init, OID_FUNCT3, 
['pl-man':createGameEntity(OID_TURRET2, 'T', object, 11, 1, active, automaticTurret,
			[name(torretaAutomatica), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	'pl-man':automaticTurret(init, OID_TURRET2, ['E','@'], [up,down,left,right], 2, [])], 13, 0),

	functioner(init, OID_FUNCT4, 
['pl-man':createGameEntity(OID_TURRET3, 'T', object, 15, 1, active, automaticTurret,
			[name(torretaAutomatica), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	'pl-man':automaticTurret(init, OID_TURRET3, ['E','@'], [up,down,left,right], 2, [])], 18, 0),


	%% Capa de invisibilidad э
/*
	createGameEntity(OID_CAPA, '€', object, 2, 2, inactive, norule, 
			[name(capa), solid(true), static(false), use_rule(norule),
			description('Capa de invisibilidad, los enemigos no te verán'), appearance(attribs(bold, cyan, default))]),
		*/
	%% Rifle francotirador
	createGameEntity(OID_FRANCOTIRADOR, 'L', object, 10, 13, inactive, norule,
			[name(rifle_francotirador), solid(false), static(false), use_rule(gunSniper),
			description('Rifle de 5 balas que atraviesa enemigos E y F'), appearance(attribs(bold, white, default))]), 
	gunSniper(init, OID_FRANCOTIRADOR, 5, ['E','F'], destroy),

	%% Torretas
/*
	createGameEntity(OID_TURRET0, 'T', object, 3, 1, active, automaticTurret,
			[name(torretaAutomatica4), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	automaticTurret(init, OID_TURRET0, ['E','@'], [up,down,left,right], 2, []),

	createGameEntity(OID_TURRET1, 'T', object, 7, 1, active, automaticTurret,
			[name(torretaAutomatica4), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	automaticTurret(init, OID_TURRET1, ['E','@'], [up,down,left,right], 2, []),

	createGameEntity(OID_TURRET2, 'T', object, 11, 1, active, automaticTurret,
			[name(torretaAutomatica4), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	automaticTurret(init, OID_TURRET2, ['E','@'], [up,down,left,right], 2, []),

	createGameEntity(OID_TURRET3, 'T', object, 15, 1, active, automaticTurret,
			[name(torretaAutomatica4), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, magenta))]),
	automaticTurret(init, OID_TURRET3, ['E','@'], [up,down,left,right], 2, []),
*/
	%% Arqueros

	createGameEntity(OID_AR0, '(', object, 25, 4, active, automaticArcher, 
			[name(arqueroAutomatico), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(normal, yellow, default))]), 
	automaticArcher(init, OID_AR0, ['@'], left, 1, [ bullet_appearance('<', normal, red, default) ]),

	createGameEntity(OID_AR1, '(', object, 23, 3, active, automaticArcher, 
			[name(arqueroAutomatico), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(normal, yellow, default))]), 
	automaticArcher(init, OID_AR1, ['@'], left, 1, [ continuous, bullet_appearance('<', normal, red, default) ]),

	createGameEntity(OID_AR2, '(', object, 23, 5, active, automaticArcher, 
			[name(arqueroAutomatico), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(normal, yellow, default))]), 
	automaticArcher(init, OID_AR2, ['@'], left, 1, [ continuous, bullet_appearance('<', normal, red, default) ]),

	%% Puertas

	createGameEntity(DOOR0, '|', object, 2, 4, inactive, norule, 
			[name(puerta), solid(true), static(true), use_rule(norule),
			description('Celda que se abre con la llave verde(-)'), appearance(attribs(normal, green, default))]),

	createGameEntity(DOOR1, '-', object, 1, 8, inactive, norule, 
			[name(puerta), solid(true), static(true), use_rule(norule),
			description('Celda que se abre con la llave azul(-)'), appearance(attribs(normal, cyan, default))]),

	%% Llaves

	createGameEntity(KEY0, '-', object, 24, 4, inactive, norule, 
			[name(llave), solid(false), static(false), use_rule(basicDoorKey),
			description('  Llave que abre la celda verde y libera a tu compañero'), appearance(attribs(bold, green, default))]),
	createGameEntity(KEY1, '-', object, 1, 13, inactive, norule, 
			[name(llave), solid(false), static(false), use_rule(basicDoorKey),
			description('  Llave que abre la celda azul'), appearance(attribs(bold, cyan, default))]),

	%% El prisionero/compañero

	createGameEntity(COMPI, 'ñ', object,  1, 4, active, entitySequentialMovement, [name(compi), solid(false), static(true), use_rule(norule), description('El amigo fiel de PL-Man'), appearance(attribs(normal, green, default))]),

	%% Enemigos

	createGameEntity(EID_0, 'E', mortal, 20, 11, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [u,l,l,d,d,r,r,u], [no_repeat_moves]),
	
	createGameEntity(EID_1, 'E', mortal, 20, 11, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_1, [u,r,r,d,d,l,l,u], [no_repeat_moves]),

	/*createGameEntity(EID_2, 'E', mortal, 11, 10, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_2, [l,l,l,r,r,r], [no_repeat_moves]),*/

	createGameEntity(EID_3, 'E', mortal, 11, 10, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, EID_3, left-right, ['#']),

	RP0_MOVEMENT =[d,l,l,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,d,d,d,d,l,l,l,l,l,l,n,n,u,u,r,r,r,r,r,r,r,r,r,u,u,u,u,l,u],
	RP2_MOVEMENT = [u,l,l,l,l,l,l,l,n,r,r,r,r,r,n,l,l,l,l,l,u,u,r,r,r,r,r,n,l,l,l,l,l,n,r,r,r,r,r,u,u,l,l,l,l,l,n,r,r,r,r,r,n,l,l,l,l,l,u,u,r,r,r,r,r,n,l,l,l,l,l,n,r,r,r,r,r,d,d,r,r,r,d,d,d,d,l,d],

	%% Enemigos normales
	ECM_RU = [n,n,r,n,n,n,u,n,n,r,n,l,n,n,u,n,n,n,l], % Entity central movement (right)
	ECM_LU = [n,n,l,n,n,n,u,n,n,l,n,r,n,n,u,n,n,n,r],
	ECM_RD = [n,n,r,n,n,n,d,n,n,r,n,l,n,n,d,n,n,n,l], % Entity central movement (right)
	ECM_LD = [n,n,l,n,n,n,d,n,n,l,n,r,n,n,d,n,n,n,r],
	ECM_UD = [u,n,u,d,n,d],

	append(ECM_RU,ECM_RD,ECM_1),
	append(ECM_LU,ECM_LD,ECM_2),
	append(ECM_1,ECM_UD,ECM_LTOR),
	append(ECM_2,ECM_UD,ECM_RTOL).
	/*createGameEntity(EID_0, 'E', mortal, 7, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, ECM_LTOR, [no_repeat_moves]),
	createGameEntity(EID_1, 'E', mortal, 8, 6, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, ECM_LTOR, [no_repeat_moves]),

	createGameEntity(EID_2, 'E', mortal, 13, 6, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_2, ECM_RTOL, [no_repeat_moves]),
	createGameEntity(EID_3, 'E', mortal, 14, 6, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_3, ECM_RTOL, [no_repeat_moves]).*/
	
	
	
	
norule(_).
norule(_,_,_,_,_).

