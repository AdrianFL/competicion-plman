:-use_module('pl-man-game/main').
%/*rej32:-not(havingObject), see(normal,up,''), see(normal,right-up,''), see(normal,right,''),see(normal,right-down,''), see(normal,down,''), see(normal,left-down,''),see(normal,left,''), see(normal, left-up,''), doAction(move(up)).*/

:- dynamic llave/1, estado/1.

cambiar_estado(E):- retractall(estado(_)), assert(estado(E)).
atra:-see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '),doAction(move(up)), retractall(estado(_)), writeln('Sin estado').
atra:-doAction(move(left)).
veiz:-llave(LLAVE),not(havingObject),
	not(see(normal,right-up,'+')),
	not(see(normal,left-up,'+')), 
	see(normal, DIR, LLAVE), 
	member(DIR, [up,down,left,right]), 
	doAction(get(DIR)).
veiz:- see(normal,left-down,')'), writeln('* Ir derecha'), cambiar_estado(vede), doAction(move(down)).
veiz:- doAction(move(left)).

vede:-llave(LLAVE),not(havingObject),
	not(see(normal,right-up,'+')),
	not(see(normal,left-up,'+')), 
	see(normal, DIR, LLAVE), 
	member(DIR, [up,down,left,right]), 
	doAction(get(DIR)).

vede:-see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,right,'#'), see(normal, right-up,'#'), doAction(move(up)), writeln('Atrás'), cambiar_estado(atra).
vede:-see(normal,down,'#'), doAction(move(right)).

vede:-see(normal,right,'#'),doAction(move(down)), writeln('* Ir izquierda'), cambiar_estado(veiz).
vede:-see(normal,up,'#'), doAction(move(right)).
decabeza:- see(normal,down,'.'), doAction(move(down)), writeln('
Sin estado'), retractall(estado(_)).


decabeza:- doAction(move(right)), write('->').
hacer(goiz):-llave(LLAVE),not(havingObject),
	not(see(normal,right-up,'+')),
	not(see(normal,left-up,'+')), 
	see(normal, DIR, LLAVE), 
	member(DIR, [up,down,left,right]), 
	doAction(get(DIR)).
hacer(goiz):-see(normal,up,'#'), see(normal,right-up,'#'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(down)), cambiar_estado(gode), writeln('* Yendo derecha').
hacer(goiz):-see(normal,down,'#'), see(normal,right-down,'#'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)), cambiar_estado(decabeza), writeln('* Yendo derecha (de cabeza)').
hacer(goiz):-see(normal,up,'#'), see(normal,right-up,'#'), see(normal, left-up,'#'), doAction(move(left)).
hacer(goiz):-see(normal,down,'#'), see(normal,right-down,'#'), see(normal, left-down,'#'), doAction(move(left)).
hacer(gode):-llave(LLAVE),not(havingObject),
	not(see(normal,right-up,'+')),
	not(see(normal,left-up,'+')), 
	see(normal, DIR, LLAVE), 
	member(DIR, [up,down,left,right]), 
	doAction(get(DIR)).
hacer(gode):- see(normal,up,'('), doAction(move(down)), writeln('* Yendo izquierda'), cambiar_estado(goiz).
hacer(gode):- doAction(move(right)).









nllave:- havingObject, see(normal,up,'+'), doAction(use(up)).
nllave:- see(normal,up,'#'), see(normal,right-up,'#'), not(see(normal,right,'.')), not(see(normal,right,'#')), not(see(normal,right-down,' ')), not(see(normal,right-down,'#')), not(see(normal,down,' ')),not(see(normal,down,'#')), not(see(normal,left-down,' ')), not(see(normal,left-down,'#')), not(see(normal,left,'#')), not(see(normal,left,'.')), see(normal, left-up,'#'), doAction(move(left)). %esquina_inferior_izquierda_puntarriba

nllave:-see(normal,up,'+'), 
	see(normal,right-up,X), 
	see(normal,right,'.'),
	see(normal,right-down,'.'), 
	see(normal,down,'.'), 
	see(normal,left-down,'.'),
	see(normal,left,' '), 
	see(normal, left-up,Y),
	LLAVE is X+Y,
	assert(llave(LLAVE)),
	write('* La llave que hay que coger es '), writeln(LLAVE), 
	doAction(move(right)).

nllave:-not(havingObject), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(left)). %escaloncito_centro_inferior_izquierda
nllave:-not(havingObject), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,' '), doAction(move(up)). %ecaloncito_c_i_iz
nllave:- not(see(normal,up,' ')), not(see(normal,up,'#')), not(see(normal,up,'<')), see(normal,right-up,'('), not(see(normal,right,'.')), not(see(normal,right,'#')), not(see(normal,right-down,' ')), not(see(normal,right-down,'#')), not(see(normal,down,' ')), not(see(normal,down,'#')), not(see(normal,left-down,' ')), not(see(normal,left-down,'#')), not(see(normal,left,' ')), not(see(normal,left,'#')), not(see(normal, left-up,' ')), not(see(normal,left-up,'#')), writeln('* Yendo izquierda'), doAction(move(up)), cambiar_estado(goiz). %empezar_4a_fila
nllave:- not(havingObject), see(normal,up,' '), see(normal,right-up,' '), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)). %entrar_esquina_izquierda
nllave:-see(normal,left-down,')'),see(normal,left,' '), see(normal, left-up,')'), doAction(move(up)), writeln('* Ir derecha'), cambiar_estado(vede).
nllave:-see(normal,up,'.'), see(normal,right-up,'.'), not(see(normal,right,' ')),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),not(see(normal,left,' ')), see(normal, left-up,'.'), doAction(move(up)), writeln('* 2.2'), cambiar_estado(dos).
nllave:-see(normal,up,'.'),  doAction(move(up)). %%arriba
nllave:-see(normal,left,'.'), doAction(move(left)). %%izquierda
nllave:-see(normal,right,'.'),  doAction(move(right)). %%derecha
nllave:-see(normal,down,'.'), doAction(move(down)). %%abajo


nllave:-havingObject,see(normal,up,' '), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,' '), doAction(move(up)).
nllave:- see(normal,up,'('), see(normal,right-up,'#'), see(normal,right,' '),see(normal,right-down,'#'), see(normal,down,'('), not(see(normal,left-down,' ')),not(see(normal,left,' ')), not(see(normal, left-up,' ')), doAction(move(left)).
nllave:- havingObject, see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,'#'),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(left)), writeln('Miniestado'), cambiar_estado(mini).
nllave:- havingObject, see(normal,up,' '), not(see(normal,right-up,'#')), see(normal,right,' '),see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,' '),see(normal,left,' '), not(see(normal, left-up,'#')), doAction(move(up)).

nllave:-doAction(move(right)). %defecto

mini:- see(normal,up,' '), doAction(move(up)), writeln('Sin estado'), retractall(estado(_)).
mini:- see(normal,up,'+'), doAction(use(up)).
mini:- doAction(move(left)).

dos:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'E'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(right)).
dos:- see(normal,up,' '), see(normal,right-up,'E'), see(normal,right,'.'), see(normal,right-down,'.'), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
dos:- see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,' '), see(normal,left-down,'.'),see(normal,left,'.'), see(normal, left-up,'.'), doAction(move(down)).
dos:- see(normal,left,'.'), doAction(move(left)).
dos:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,' '), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
dos:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'E'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'.'), doAction(move(left)).
dos:- see(normal,up,'.'), see(normal,right-up,'.'), see(normal,right,'E'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)).
dos:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,'E'), see(normal,left-down,'#'),see(normal,left,'#'), see(normal, left-up,'#'), doAction(move(up)).
dos:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,'.'), see(normal,right-down,' '), see(normal,down,' '), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(up)).
dos:- see(normal,right,'.'), doAction(move(right)).
dos:- see(normal,up,'.'), doAction(move(up)).
dos:- see(normal,up,'#'), see(normal,right-up,'#'), see(normal,right,' '), see(normal,right-down,'.'), see(normal,down,'.'), see(normal,left-down,'.'),see(normal,left,' '), see(normal, left-up,'#'), doAction(move(right)).
dos:- see(normal,down,'.'), doAction(move(down)).
dos:- see(normal,up,' '), see(normal,right-up,'.'), see(normal,right,'#'), see(normal,right-down,'#'), see(normal,down,'#'), see(normal,left-down,'#'),see(normal,left,' '), see(normal, left-up,' '), doAction(move(up)).
dos:- see(normal,up,'#'), see(normal,right-up,' '), see(normal,right,'E'), see(normal,right-down,' '), see(normal,down,'#'), see(normal,left-down,' '),see(normal,left,' '), see(normal, left-up,' '), doAction(move(none)).

dos:- doAction(move(right)).


rej32(init):- retractall(estado(_)), retractall(llave(_)).
rej32:- estado(goiz), hacer(goiz).
rej32:- estado(gode), hacer(gode).
rej32:- estado(decabeza), decabeza.
rej32:- estado(vede), vede.
rej32:- estado(veiz), veiz.
rej32:- estado(atra), atra.
rej32:- estado(mini), mini.
rej32:- estado(dos), dos.
rej32:- not(havingObject), see(normal,up,'+'), nllave.
rej32:- nllave.
