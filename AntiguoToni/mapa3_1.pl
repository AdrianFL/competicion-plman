%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIF:	5
%%% PT:	__:__	[STS: __:__]
%%%
%%% INDETERMINISMOS DE ESTE MAPA
%%%------------------------------------------------------------
%%% En este mapa aparecen muchos comportamientos indeterminis-
%%% tas. Para empezar, tenemos una puerta aritmética en la es-
%%% quina superior izquierda. Esta puerta siempre muestra res-
%%% tas, pero con diferentes operandos. En la zona inferior 
%%% izquierda está la cámara de las llaves aritméticas. Ahí 
%%% aparecen 2 llaves falsas y 1 verdadera (la que indica el
%%% resultado de la operación de la puerta aritmética).
%%% Para entrar a la cámara de las llaves aritméticas, hay que
%%% coger la llave de esa cámara, que aparece aleatoriamente 
%%% en algún lugar de la sala superior izquierda.
%%% Más adelante, es necesario coger una pelota para poder 
%%% meter gol en la portería que se encuentra a la derecha 
%%% del mapa. La pelota aparece siempre aleatoria en alguna
%%% posición del pasillo superior del mapa. Concretamente, en
%%% el rango siguiente: columnas 4-18, filas 1-2.
%%% El resto de elementos en este mapa son deterministas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_format_version(1.0).
load_behaviour(entitySequentialMovement).
load_behaviour(automaticArcher).
load_behaviour(arithmeticDoor).
load_behaviour(basicDoorKey).
load_behaviour(soccerGoal).
load_behaviour(launchBall).
map([['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', '#', '#', '#', '#'],
['#', ' ', ' ', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', ' ', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', ' ', ' ', ' ', '.', ' ', ' ', ' ', '#'],
['#', ' ', ' ', ' ', '.', '.', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', ' ', ' ', '.', ' ', ' ', ' ', '#'],
['#', ' ', '#', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '#', '\\', ' ', ' ', ' ', ' ', ' ', '/', '#'],
['#', ' ', ' ', '#', '.', '.', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', ' ', ' ', '#', ' ', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#']]).
map_size(27, 10).
num_dots(123).
pacman_start(1, 1).
initMap:- 
	addSolidObject('#'), 
	addSolidObject('\\'), 
	addSolidObject('/'), 

	% Soccer Goal & Launch Ball
	createGameEntity(OID_SB, '0', object, 22, 0, active, soccerGoal, 
			[name(marcador), solid(true), static(true), use_rule(norule),
			description('Marcador de goles'), appearance(attribs(bold, yellow, green))]), 
	createGameEntity(OID_G1, '_', object, 20, 5, inctive, norule, 
			[name(red1), solid(true), static(true), use_rule(norule),
			description('Red de la porteria 1'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_G2, '_', object, 21, 5, inactive, norule, 
			[name(red2), solid(true), static(true), use_rule(norule),
			description('Red de la porteria 2'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_G3, '_', object, 22, 5, inactive, norule, 
			[name(red3), solid(true), static(true), use_rule(norule),
			description('Red de la porteria 3'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_G4, '_', object, 23, 5, inactive, norule, 
			[name(red4), solid(true), static(true), use_rule(norule),
			description('Red de la porteria 4'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_G5, '_', object, 24, 5, inactive, norule, 
			[name(red5), solid(true), static(true), use_rule(norule),
			description('Red de la porteria 5'), appearance(attribs(bold, cyan, default))]), 
	soccerGoal(init, OID_SB, 1, ['o'], [OID_G1, OID_G2, OID_G3, OID_G4, OID_G5 ], []),
	launchBall(autoBallCreator, 1, 2, rnd(4, 18), rnd(1,2)),
	
	% Door & Key
	createGameEntity(OID_DOOR, '_', object, 1, 5, inactive, norule, 
			[name(puerta), solid(true), static(true), use_rule(norule),
			description('Puerta de la sala de las llaves aritméticas'), appearance(attribs(bold, cyan, default))]), 
	createGameEntity(OID_KEY, 'c', object, rnd(1,2), rnd(2,4), inactive, norule, 
			[name(llave), solid(false), static(false), use_rule(basicDoorKey),
			description('Llave de la sala de las llaves aritméticas'), appearance(attribs(bold, cyan, default))]), 
	basicDoorKey(init, OID_DOOR, [ 'pl-man':destroyGameEntity(OID_DOOR) ], [ OID_KEY ]),

	% Arithmetic Door
	createGameEntity(OID_OP, '+', object, 3, 3, inactive, norule, 
			[name(puerta_aritmetica), solid(true), static(true), use_rule(norule),
			description('Operador de la puerta aritmetica'), appearance(attribs(normal, black, green))]), 
	createGameEntity(OID_N1,  1, object, 3, 2, inactive, norule, 
			[name(operando_1), solid(true), static(true), use_rule(norule),
			description('Primer operando de la puerta aritmetica'), appearance(attribs(normal, black, green))]), 
	createGameEntity(OID_N2,  2, object, 3, 4, inactive, norule, 
			[name(operando_2), solid(true), static(true), use_rule(norule),
			description('Segundo operando de la puerta aritmetica'), appearance(attribs(normal, black, green))]), 
	arithmeticDoor(init, OID_OP, OID_N1, OID_N2, KEYVAL, [operators(['-'])]),
	arithmeticDoor(createRandomKeys, OID_OP, 2, location(rnd(1, 2), rnd(6, 8)), _,
      [ distributed, add_properties([appearance(attribs(bold, cyan, default))]) ]),
	(repeat, 
		createGameEntity(OID_AR_KEY, KEYVAL, object, rnd(1, 2), rnd(6, 8), inactive, norule,
			[name(llave_aritmetica), solid(false), static(false), use_rule(arithmeticDoorKey), 
			description('Objeto llave para puertas aritmeticas'), appearance(attribs(bold, cyan, default)) ]),
		not(checkSamePlaceAsOtherObjectAndDestroy(OID_AR_KEY))
	),

	% Automatic Archers
	createGameEntity(OID_AR1, ')', object, 4, 7, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automatico del rey'), appearance(attribs(normal, yellow, default))]), 
	
   automaticArcher(init, OID_AR1, ['@'], right, 7, [ bullet_appearance('>', normal, red, default) ]),
   automaticArcher(init, OID_AR2, ['@'], right, 9, [ bullet_appearance('>', normal, red, default) ]),

	% Enemies
	createGameEntity(EID_0, 'E', mortal, 19, 3, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_1, 'E', mortal, 6, 4, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_2, 'E', mortal, 25, 4, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_3, 'E', mortal, 17, 5, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [ r,r,r,r,r,r,n,n,l,l,l,l,l,l,n,n ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_1, [ r,r,r,r,r,r,r,r,r,r,r,n,l,l,l,l,l,l,l,l,l,l,l ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_2, [ l,l,l,l,l,l,n,n,r,r,r,r,r,r,n,n ], [ no_repeat_moves ]),
	entitySequentialMovement(init, EID_3, [ l,l,l,l,l,l,l,l,l,l,l,n,r,r,r,r,r,r,r,r,r,r,r ], [ no_repeat_moves ]).	
norule(_).
norule(_,_,_,_,_).

