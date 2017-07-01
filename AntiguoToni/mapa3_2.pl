%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	4
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa hay varios objetos indeterministas, que 
%%% enumeramos a continuación:
%%% 1) Puerta aritmética:
%%%    En el centro del mapa aparece una puerta aritmética que
%%%    da acceso a la zona superior del mapa. Esta puerta siem-
%%%    pre mostrará sumas como operaciones, aunque con operan-
%%%    dos diferentes.
%%% 2) Llaves aritméticas:
%%%    En este mapa aparecen 3 llaves aritméticas, 2 falsas y 
%%%    1 correcta. Cualquiera de estas llaves puede aparecer en
%%%    la sala inferior izquierda o en la sala inferior derecha.
%%%    Dentro de estas salas, las llaves pueden estar en cual-
%%%    quier posición, pero nunca habrán 2 llaves en el mismo 
%%%    sitio. Concretamente, las llaves pueden aparecer en las
%%%    columnas 1-7 o 21-27 y en las filas 5-7.
%%%
%%% El resto de elementos en este mapa son deterministas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(arithmeticDoor).
load_behaviour(automaticArcher).
load_behaviour(entitySequentialMovement).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', ' ', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', ' ', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(29, 9).
num_dots(127).
pacman_start(10, 7).
initMap:- 
	addSolidObject('#'), 

	% Arithmetic Door
	createGameEntity(OID_O1, 0, object, 13, 4, inactive, norule, 
			[name(operando_1), solid(true), static(true), use_rule(norule),
			description('Primer operando de la puerta aritmetica'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_OP, '+', object, 14, 4, inactive, norule, 
			[name(operandor), solid(true), static(true), use_rule(norule),
			description('Operador de la puerta aritmetica'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_O2, 0, object, 15, 4, inactive, norule, 
			[name(operando_2), solid(true), static(true), use_rule(norule),
			description('Segundo operando de la puerta aritmetica'), appearance(attribs(bold, yellow, green))]), 
   arithmeticDoor(init, OID_OP, OID_O1, OID_O2, RES, [operators(['+'])]),
	createGameEntity( _, RES, object, rnd([1,2,3,4,5,6,7,21,22,23,24,25,26,27]), rnd(5,7), inactive, norule,
			[name(llave_aritmetica), solid(false), static(false), use_rule(arithmeticDoorKey),
			description('Objeto llave para puertas aritmeticas'), appearance(attribs(bold, cyan, default)) ]),
	arithmeticDoor(createRandomKeys, OID_OP, 2, location(rnd([1,2,3,4,5,6,7,21,22,23,24,25,26,27]), rnd(5, 7)), _,
			[distributed, add_properties([appearance(attribs(bold, cyan, default))]) ]),

	% Automatic Archers
	createGameEntity(OID_AR1, '(', object, 8, 5, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR2, ')', object, 20, 5, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR3, '(', object, 8, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	createGameEntity(OID_AR4, ')', object, 20, 7, active, automaticArcher, 
			[name(arquero), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(bold, yellow, default))]), 
	automaticArcher(init, OID_AR1, ['@'], left, 5, [ continuous, bullet_appearance('<', bold, red, default) ]),
	automaticArcher(init, OID_AR3, ['@'], left, 6, [ continuous, bullet_appearance('<', bold, red, default) ]),
	automaticArcher(init, OID_AR2, ['@'], right, 6, [ continuous, bullet_appearance('>', bold, red, default) ]),
	automaticArcher(init, OID_AR4, ['@'], right, 5, [ continuous, bullet_appearance('>', bold, red, default) ]),

	% Entities
	createGameEntity(EID_0, 'E', mortal, 1, 1, active,  entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 27, 1, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 18, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [ r,r,r,r,r,r,r,d,d,l,l,l,l,l,l,l,u,u ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_1, [ d,d,l,l,l,l,l,l,l,u,u,r,r,r,r,r,r,r ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_2, [ l,l,l,l,l,l,l,l,u,u,r,r,r,r,r,r,r,r,d,d ], [ no_repeat_moves ]).

norule(_).
norule(_,_,_,_,_).
