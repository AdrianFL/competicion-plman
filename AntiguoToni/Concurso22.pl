%% 'Д' es una barricada con pinchos
%% Hay enemigos invisibles de color negro
%% Hay diferentes tipos de pistolas, úsalas sabiamente
%% Libera a "ç" para que bloquee los proyectiles, y a "ñ" para que al final de su recorrido te dé el último coco (junto con "ç")
%% Cada vez que se abra una celda, saltará la alarma y se crearán nuevos enemigos o incluso algunos se modificarán, siendo más peligrosos

map_format_version(1.0).
load_behaviour(automaticArcher).
load_behaviour(enemyBasicMovement).
load_behaviour(entitySequentialMovement).
load_behaviour(basicTeletransport).
load_behaviour(pushBlocks).
load_behaviour(gunBasic).
load_behaviour(basicDoorKey).
load_behaviour(combiner).
map([
['#', '#', '#', '#', '#', '#', '#', '#','#', '#', '#', '#', '#', '#', '#', '#','#', '#', '#',  '#'],
['#', ' ', '#', ' ', '#', '.', '.', '.', ' ', '.', '.', ' ', ' ', '.', '.', '.','.', '.', ' ', '#'],
['#', '.', '#', '.', '.', '.', '#', '.', '.', '.', '#', '.', '.', '.', '#', '.','#', ' ', '.', '#'],
['#', '.', '.', '.', '#', '#', '.', '#', '.', '#', '#', '#', '.', '.', '.', '.','#', '.', '.', '#'],
['#', '#', '.', '#', '.', '.', '.', '.', '.', '#', ' ', ' ', '#', '#', '.', '.','#', '.', ' ', '#'],
['#', '.', '.', '#', '.', '#', '#', '#', '.', '#', ' ', ' ', '#', '.', '#', '#','.', '.', '.', '#'],
['#', '.', '#', '.', '.', ' ', ' ', '#', '.', '#', ' ', ' ', '.', '.', '.', '.','.', '.', '.', '#'],
['#', '.', '.', '#', '.', '#', '#', '#', '.', '#', ' ', '#', '.', '#', '.', '#','.', '.', '.', '#'],
['#', '#', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.','#', '.', ' ', '#'],
['#', '.', '#', '#', '#', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#','#', '#', ' ', '#'],
['#', ' ', ' ', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.', '.', '.', '.','.', ' ', ' ', '#'],
['#', ' ', '#', '#', '#', '#', '#', '#', '#', '#', '.', '#', '#', '#', '#', '#','#', '#', ' ', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', ' ', '.', ' ','.', ' ', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', ' ', '.', '.','.', ' ', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '#', ' ', ' ', ' ',' ', ' ', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', ' ', ' ', ' ',' ', ' ', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', ' ', '.', '.','.', '.', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', ' ', ' ', '#', '.', ' ', ' ', ' ',' ', '#', '.', '#'],
['#', '.', '.', '.', '.', '.', '.', '.', '.', '#', ' ', '#', '.', ' ', ' ', ' ','.', '#', ' ', '#'],
['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#','#', '#', '#', '#']]).
map_size(20,20).
num_dots(187).
pacman_start(10,10).

initMap:-
	addSolidObject('#'), 

	createGameEntity(OID_00, '|', object, 5, 6, inactive, norule, 
			[name(puerta), solid(true), static(true), use_rule(norule),
			description('Celda que se abre con la llave azul(r)'), appearance(attribs(normal, green, red))]),

	createGameEntity(OID_0, '—', object, 10, 17, inactive, norule, 
			[name(puerta), solid(true), static(true), use_rule(norule),
			description('Celda que se abre con la llave azul(a)'), appearance(attribs(normal, green, red))]), 
	createGameEntity(OID_1, 'a', object, 10, 14, inactive, norule, 
			[name(llave), solid(false), static(false), use_rule(basicDoorKey),
			description('  Llave que abre la celda roja y libera a ç'), appearance(attribs(bold, cyan, default))]),
	createGameEntity(OID_11, 'r', object, 3, 1, inactive, norule, 
			[name(llave), solid(false), static(false), use_rule(basicDoorKey),
			description('  Llave que abre la celda roja y libera a ñ (un solo uso)'), appearance(attribs(bold, cyan, default))]),
	createGameEntity(OID_2, 'э', object, 15, 8, inactive, norule, 
			[name(capa), solid(true), static(false), use_rule(basicDoorKey),
			description('Capa de invisibilidad sólida'), appearance(attribs(bold, cyan, default))]),
	createGameEntity('п', mortal, 18, 4, inactive, norule, 
	                 data(ventana_mortal, not_solid, static, norule, '')),



	createGameEntity(COM, 'ñ', object,  6, 6, active, entitySequentialMovement, [name(compi), solid(false), static(false), use_rule(norule),
			description('Tu compi eñe'),appearance(attribs(normal, green, default))]), 
	entitySequentialMovement(init, COM, [l,l,u,u,r,r,r,r,u,u,u,l,d,r,u,l,d,r,u,l,l,l,d,l,l,d,l,l,u,u,u,u,u,l,l,l,l,l,l,l,l,u,u,u,u,u,u,u,u,u,u,n,n,n,d,d,d,d,l,l,l,l,l,l,l,l,l,u], []),

	createGameEntity(E, 'E', mortal, 14, 14, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, E, right-left, ['#']),

	createGameEntity('#', object, 9, 1, inactive, norule, 
	                 data(d, not_solid, static, norule, '')),
	createGameEntity('#', object, 11, 1, inactive, norule, 
	                 data(d, not_solid, static, norule, '')),

	createGameEntity(OID_AR3, '(', object, 18, 1, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(normal, yellow, default))]), 
	automaticArcher(init, OID_AR3, ['@'], left, 1, [ bullet_appearance('Ξ', normal, red, default) ]),

	createGameEntity(OID_AR4, '(', object, 18, 6, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(normal, yellow, default))]), 
	automaticArcher(init, OID_AR4, ['@'], left, 2, [ bullet_appearance('Ξ', normal, red, default) ]),

	createGameEntity(OID_AR5, 'ж', object, 18, 3, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]), 
	automaticArcher(init, OID_AR5, ['@'], down, 1, [ bullet_appearance('v', normal, red, default) ]),

	createGameEntity(OID_AR1, '(', object, 16, 16, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(normal, yellow, default))]), 
	automaticArcher(init, OID_AR1, ['@'], left, 12, [ bullet_appearance('Ξ', normal, red, default) ]),

	createGameEntity(A, 'v', object, 10, 4, active, automaticArcher, 
	[name(arquero1), solid(false), static(true), use_rule(norule),
	description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]),
	automaticArcher(init, A, ['@'], down, 2, [ continuous, bullet_appearance('¥', bold, red, default) ]),

	createGameEntity(EID_0, 'E', mortal, 3, 10, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	entitySequentialMovement(init, EID_0, [r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,n,n,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,r,r], [no_repeat_moves]),
	
	createGameEntity(EID_1, 'e', mortal, 17, 10, active, entitySequentialMovement, [appearance(attribs(normal, yellow, default))]),
	entitySequentialMovement(init, EID_1, [l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,n,n,l], [no_repeat_moves]),
	createGameEntity(EID_2, 'e', mortal, 17, 10, active, entitySequentialMovement, [appearance(attribs(bold, yellow, default))]),
	entitySequentialMovement(init, EID_2, [l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,n,n,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,n,n,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,r,n,n,d,d,d,d,d,d,l,l,l,l,l,l,l,l,u,u,u,u,u,u,l,l,l,r,r,r,r,r,r,r,r,r,r,r,n,n,l], [no_repeat_moves]),

	enemyBasicMovement(init, IID_2, left-right, ['#']),
	createGameEntity(D_2, 'Д', mortal, 9, 17, active, entitySequentialMovement, [appearance(attribs(bold, white, default))]),
	entitySequentialMovement(init, D_2, [n,n], [no_repeat_moves]),
	createGameEntity(IID_3, 'I', mortal, 1, 11, active, enemyBasicMovement, [appearance(attribs(normal, black, default))]),
	enemyBasicMovement(init, IID_3, left-right, ['#']),
	createGameEntity(IID_4, 'E', mortal, 18, 9, active, enemyBasicMovement, [appearance(attribs(normal, red, default))]),
	enemyBasicMovement(init, IID_4, left-right, ['#']),
	createGameEntity(IID_5, 'I', mortal, 18, 11, active, enemyBasicMovement, [appearance(attribs(normal, black, default))]),
	enemyBasicMovement(init, IID_5, left-right, ['#']),
	createGameEntity(EID_E1, 'I', mortal,  2, 13, active, entitySequentialMovement, [appearance(attribs(normal, black, default))]), 
	createGameEntity(EID_E2, 'E', mortal,  2, 13, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]), 
	createGameEntity(EID_E3, 'E', mortal,  7, 13, active, entitySequentialMovement, [appearance(attribs(normal, red, default))]),
	createGameEntity(EID_E4, 'ç', object,  10, 18, active, enemyBasicMovement, [name(ce_trencada), solid(true), static(false), use_rule(norule),
			description('Ce trencada'),appearance(attribs(normal, green, default))]), 
	entitySequentialMovement(init, EID_E1, [r,r,r,r,r,d,d,d,d,l,l,l,l,l,u,u,u,u], [no_repeat_moves]),
	entitySequentialMovement(init, EID_E2, [r,d,r,d,r,d,r,d,r,u,l,u,l,u,l,u,l,l], [no_repeat_moves]),
	entitySequentialMovement(init, EID_E3, [l,d,l,d,l,d,l,d,l,u,r,u,r,u,r,u,r,r], [no_repeat_moves]),
	enemyBasicMovement(init, EID_E4, up-down, ['#']),
	


	createGameEntity(OID_G, 'l', object, 1, 12, inactive, norule,
			[name(pistola_especial), solid(false), static(false), use_rule(gunBasic),
			description('Pistola de 1 bala destruye-barricadas'), appearance(attribs(bold, white, default))]), 
	gunBasic(init, OID_G, 1, ['Д'], destroy),

	createGameEntity(OID_G1, 'l', object, 12, 15, inactive, norule,
			[name(pistola), solid(false), static(false), use_rule(gunBasic),
			description('Pistola de 1 bala destruye-e'), appearance(attribs(normal, white, default))]), 
	gunBasic(init, OID_G1, 1, ['e'], destroy),
	createGameEntity(OID_G2, '¬', object, 3, 6, inactive, norule,
			[name(pistola_mortifera), solid(false), static(false), use_rule(gunBasic),
			description('Pistola de 2 balas anti-E y e'), appearance(attribs(bold, red, default))]), 
	gunBasic(init, OID_G2, 2, ['e','E'], destroy),
	
%% As en la manga, en realidad se cumple cuando SÍ ve a ç y a ñ 
	not(see(normal,here,'ç'))-> dotEaten,
	not(see(normal,here,'ñ'))-> dotEaten,
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	basicDoorKey(init, OID_0, ['pl-man':destroyGameEntity(OID_0), 'pl-man':destroyGameEntity(A), 'pl-man':destroyGameEntity(OID_AR1),
	'pl-man':destroyGameEntity(IID_3), 
	'pl-man':createGameEntity(AID_1, 'Ж', object, 10, 4, active, automaticArcher, [name(arquero1), solid(false), static(true), use_rule(norule), description('Arquero automático del rey'), appearance(attribs(bold, yellow, default))]),
	'pl-man':createGameEntity(OID_AR2, '(', object, 16, 16, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, cyan, default))]), 
	'pl-man':automaticArcher(init, OID_AR2, ['@'], left, 1, [ bullet_appearance('Ξ', normal, red, default) ]),
	'pl-man':automaticArcher(init, AID_1, ['@'], down, 1, [ continuous, bullet_appearance('¥', bold, red, default) ]),
	'pl-man':createGameEntity(D2, 'I', mortal, 18, 11, active, entitySequentialMovement, [appearance(attribs(bold, red, default))]),
	'pl-man':createGameEntity(D, 'I', mortal, 1, 11, active, entitySequentialMovement, [appearance(attribs(bold, red, default))]),
	'pl-man':createGameEntity(D3, 'e', mortal, 18, 18, active, entitySequentialMovement, [appearance(attribs(normal, white, default))]),
	'pl-man':entitySequentialMovement(init, D2, [d,d,l,l,l,d,d,l,l,l,d,d,r,d,r,r,r,u,u,l,l,l,l,l,l,u,u,u,u,u,u,u,u,u,u,r,r,r,r,r,r,d,r,d,r,d,d,d], [no_repeat_moves]),
	'pl-man':entitySequentialMovement(init, D3, [u,u,l,l,l,l,d,l,l,u,r,r,r,r,r,r,d,d], [no_repeat_moves]),
	'pl-man':entitySequentialMovement(init, D, [d,d,r,r,r,d,r,d,r,r,d,r,r,r,d,n,n,d,u,u,u,u,r,l,u,u,u,u,l,l,l,l,l,l,l,l,l,d, d,d,r,r,r,d,r,d,r,r,d,r,r,r,d,n,n,d,u,u,u,u,r,l,u,u,u,u,u,u,u,u,r,r,n,d,d,r,r,u,u,r,r,r,d,r,d,d,d,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,l,d], [no_repeat_moves])],
 [OID_1]),

	basicDoorKey(init, OID_00, [ 'pl-man':destroyGameEntity(OID_00),
	'pl-man':destroyGameEntity(IID_5), 
	'pl-man':destroyGameEntity(EID_E4), 
	'pl-man':destroyGameEntity(OID_11),
	'pl-man':destroyGameEntity(OID_AR3),
	'pl-man':createGameEntity(QA, 'e', mortal, 11, 4, active, entitySequentialMovement, [appearance(attribs(normal, cyan, default))]),
	'pl-man':entitySequentialMovement(init, QA, [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,d,l,d,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,d,d,d,d,n,n,l,n,n,l,n,n,l,n,n,l,n,n,l], []),
	'pl-man':createGameEntity(OID_TTT, '?', object, 1, 1, active, basicTeletransport,
	[name(teletransporte), solid(false), static(true), use_rule(norule),
	description('Runa antigua de teletransporte'), appearance(attribs(bold, yellow, red))]),
	'pl-man':basicTeletransport(init, OID_TTT, from(1, 1), to(18, 19), ['@','ñ','ç'] , []),

	'pl-man':createGameEntity(OID_TTTT, '?', object, 11, 4, active, basicTeletransport,
	[name(teletransporte), solid(false), static(true), use_rule(norule),
	description('Runa antigua de teletransporte'), appearance(attribs(bold, green, yellow))]),
	'pl-man':basicTeletransport(init, OID_TTTT, from(11, 4), to(1, 19), ['@','ñ','ç','x'] , []),
	'pl-man':createGameEntity(OID_TTTTT, '?', object, 15, 4, active, basicTeletransport,
	[name(teletransporte), solid(false), static(true), use_rule(norule),
	description('Runa antigua de teletransporte'), appearance(attribs(bold, cyan, default))]),
	'pl-man':basicTeletransport(init, OID_TTTTT, from(15, 4), to(16, 5), ['@','ñ','ç','x'] , []),
	'pl-man':createGameEntity(EID_E6, 'ç', object,  10, 5, active, entitySequentialMovement, [name(ce_trencada), solid(false), static(false), use_rule(norule), description('Ce trencada'),appearance(attribs(normal, green, default))]),
	'pl-man':entitySequentialMovement(init, EID_E6, [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,r,u,u,u,u,u,u,u,u,u,n,n,u,u], []),




	'pl-man':createGameEntity(AA, 'x', mortal, 10, 10, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(bold, yellow, red))]),	
	'pl-man':automaticArcher(init, AA, ['@'], left, 1, [ bullet_appearance('<', bold, red, default) ]),
	'pl-man':entitySequentialMovement(init, AA, [u,n,n,n,n,n,u,u,u,r,r,n,n,r,n,n,r,n,n,r,n,n,r,n,n,r,u,u,u,r,u,u,n,n,n,n,n,n,n,n,l,n,n,l,l,l,l,d,n,n,d,n,n,r,n,n,r,n,n,d,n,n,d,d,r,n,n,r,n,n,n,n,n,d,n,n,n,n,n,n,n,l,u,r,u,d,n,u,n,n,l,n,l,n,l,n,l,n,l,n,l,l,u,u,n,u,n,u,u,u,n,u,n,u,n,n,u,n,n,u,n,u,r,r,r,r,r,r,r,r,r], []),	
	'pl-man':createGameEntity(AAA, 'x', object, 10, 10, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(bold, yellow, red))]),	
	'pl-man':automaticArcher(init, AAA, ['@'], down, 1, [ bullet_appearance('*', bold, red, default) ]),
	'pl-man':entitySequentialMovement(init, AAA, [u,n,n,n,n,n,u,u,u,r,r,n,n,r,n,n,r,n,n,r,n,n,r,n,n,r,u,u,u,r,u,u,n,n,n,n,n,n,n,n,l,n,n,l,l,l,l,d,n,n,d,n,n,r,n,n,r,n,n,d,n,n,d,d,r,n,n,r,n,n,n,n,n,d,n,n,n,n,n,n,n,l,u,r,u,d,n,u,n,n,l,n,l,n,l,n,l,n,l,n,l,l,u,u,n,u,n,u,u,u,n,u,n,u,n,n,u,n,n,u,n,u,r,r,r,r,r,r,r,r,r], []),	
	'pl-man':createGameEntity(AAAA, 'x', object, 10, 10, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(bold, yellow, red))]),	
	'pl-man':automaticArcher(init, AAAA, ['@'], up, 1, [ bullet_appearance('^', bold, red, default) ]),
	'pl-man':entitySequentialMovement(init, AAAA, [u,n,n,n,n,n,u,u,u,r,r,n,n,r,n,n,r,n,n,r,n,n,r,n,n,r,u,u,u,r,u,u,n,n,n,n,n,n,n,n,l,n,n,l,l,l,l,d,n,n,d,n,n,r,n,n,r,n,n,d,n,n,d,d,r,n,n,r,n,n,n,n,n,d,n,n,n,n,n,n,n,l,u,r,u,d,n,u,n,n,l,n,l,n,l,n,l,n,l,n,l,l,u,u,n,u,n,u,u,u,n,u,n,u,n,n,u,n,n,u,n,u,r,r,r,r,r,r,r,r,r], []),	
	'pl-man':createGameEntity(AAAAA, 'x', object, 10, 10, active, combiner([entitySequentialMovement, automaticArcher]), [appearance(attribs(bold, yellow, red))]),	
	'pl-man':automaticArcher(init, AAAAA, ['@'], right, 1, [ bullet_appearance('>', bold, red, default) ]),
	'pl-man':entitySequentialMovement(init, AAAAA, [u,n,n,n,n,n,u,u,u,r,r,n,n,r,n,n,r,n,n,r,n,n,r,n,n,r,u,u,u,r,u,u,n,n,n,n,n,n,n,n,l,n,n,l,l,l,l,d,n,n,d,n,n,r,n,n,r,n,n,d,n,n,d,d,r,n,n,r,n,n,n,n,n,d,n,n,n,n,n,n,n,l,u,r,u,d,n,u,n,n,l,n,l,n,l,n,l,n,l,n,l,l,u,u,n,u,n,u,u,u,n,u,n,u,n,n,u,n,n,u,n,u,r,r,r,r,r,r,r,r,r], []),	

	'pl-man':createGameEntity(D11, 'e', mortal, 2, 8, active, entitySequentialMovement, [appearance(attribs(bold, yellow, default))]),
	'pl-man':createGameEntity(D111, 'e', mortal, 18, 1, active, entitySequentialMovement, [appearance(attribs(bold, white, default))]),
	'pl-man':createGameEntity(D1111, 'E', mortal, 16, 16, active, entitySequentialMovement, [appearance(attribs(bold, red, default))]),
	'pl-man':entitySequentialMovement(init, D11, [u,l,u,u,r,u,u,r,u,r,r,n,n,u,n,n,r,n,n,l,d,l,l,d,l,d,n,u], []),
	'pl-man':entitySequentialMovement(init, D111, [l,l,l,l,l,l,l,l,n,l,l,l,d,r,u,l,d,r,u,l,l,l,d,l,l,d,l,l,n,r,r,u,r,r,u,r,r,r,r,r,r,r,r,r,r,r,r,r], []),
	'pl-man':entitySequentialMovement(init, D1111, [r,r,n,n,d,d,d,d,r,r,l,d,d,l,d,d,r,d,r,r,r,r,r,r,u,u,u,u,u,u,u,r,r,r,r,r,r,r,r,r,r,d,d,l,d,d,d,r,d,d,d,d,d,d,d,d,l,l,d,d], []),
	'pl-man':createGameEntity(OID_AR33, '(', object, 18, 1, active, automaticArcher, 
			[name(arqueroAutomatico1), solid(false), static(true), use_rule(norule),
			description('Arquero automático del rey'), appearance(attribs(bold, cyan, default))]), 
	'pl-man':automaticArcher(init, OID_AR33, ['@'], left, 0, [ bullet_appearance('Ξ', normal, red, default) ])
	
	], [OID_11]),

	createGameEntity(OID_TT, '?', object, 18, 18, active, basicTeletransport, 
			[name(teletransporte), solid(false), static(true), use_rule(norule),
			description('Runa antigua de teletransporte'), appearance(attribs(bold, white, magenta))]), 
	basicTeletransport(init, OID_TT, from(18, 18), to(1, 1), ['@','E'] , []),
	createGameEntity(OID_BL, '%', object, 17, 5, inactive, norule, 
			[name(bloque_movil), solid(true), static(true), use_rule(norule),
			description('Bloque pesado que puede ser movido con una palanca'), appearance(attribs(bold, black, green))]), 
	createGameEntity(OID_BL2, '%', object, 17, 4, inactive, norule, 
			[name(bloque_movil), solid(true), static(true), use_rule(norule),
			description('Bloque pesado que puede ser movido con una palanca'), appearance(attribs(bold, black, green))]),
	createGameEntity(OID_P, 'J', object, 18, 12, inactive, norule, 
			[name(palanca), solid(false), static(false), use_rule(pushBlocks),
			description('Palanca con la que empujar bloques pesados'), appearance(attribs(normal, cyan, default))]),
			pushBlocks(init, OID_P, [OID_BL,OID_BL2]).
			
norule(_).
norule(_,_,_,_,_).

