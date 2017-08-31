%
% This file is part of Pl-man
% Pl-man is a puzzle game inspired in the popular game pacman, and it is mainly aimed
% to teach programming in PROLOG and introductory courses of Artifial Intelligence.
%
% Copyright (C) 2007-2009 Francisco Gallego <ronaldo@cheesetea.com>
% Departamento de Ciencia de la Computación e Inteligencia Artificial
% Universidad de Alicante
% Campus de San Vicente
% Ap.Correos, 99 
% 03080, San Vicente del Raspeig (Alicante)
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <http://www.gnu.org/licenses/>.
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gunSniper
%
% Controlls the behaviour of a sniper rifle which can be got and
% shot, killing all enemies it encounters in its path.
%
% Initialization
%--------------------
%  gunSniper(init, OID, AMMO, AIMLIST, AMMO_END)
%   OID: Object ID of the object to be controlled
%   AMMO: Number of shots the gun comes with
%   AIMLIST: List of objects the gun can hit at
%   AMMO_END: What to do when the gun runs out of ammo
%		(destroy, keep).
%
% Example
%--------------------
% createGameEntity(OID, '¬', object, 6, 5, inactive, norule, 
%                 data(rifle, not_solid, not_static, gunSniper, 'Derringer')),
% gunSniper(init, OID, 1, ['E'], destroy).
%
% Creates a sniper rifle with 1 shot of ammo, which is only capable
% of killing enemies ('E'). This gun will disappear (i.e.
% it will autodestroy itself) once it runs out of ammo.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(gunSniper, [ gunSniper/5 ]).
:- dynamic d_basicSniperStatus/4.

% INIT
gunSniper(init, OID, AMMO, AIMLIST, GUN_END):-
	number(AMMO), 
	is_list(AIMLIST),
	member(GUN_END, [destroy, keep]),
	retractall(d_basicGunStatus(OID, _, _, _)),
	assert(d_basicSniperStatus(OID, AMMO, AIMLIST, GUN_END)), 
        !.
gunSniper(init, OID, _, _, _):-
        'pl-man':lang_message(gunSniper, bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).

% USE RULE
gunSniper(OID, _, _, _, _):-
	d_basicSniperStatus(OID, AMMO, _, _),
	AMMO =< 0,
        'pl-man':lang_message(gunSniper, out_of_ammo, MSG),
        maplist(user:write, [MSG, '\n']),
        !.
% Mientras queden balas
gunSniper(OID, EID, X, Y, DIR):-
	d_basicSniperStatus(OID, AMMO, AIMLIST, GUN_END),
	'pl-man':randomBetween(1, 4, BANG_MESSAGE),  % Chorrada para cambiar el mensaje al disparar
        'pl-man':lang_message(gunSniper, BANG_MESSAGE, MSG), % Totalmente impredecible
        user:writeln(MSG),

  	contarApariencias(DIR, AIMLIST, COUNT), %% Chorrada que viene a continuación
	p_checkShotSuccess(EID, DIR, X, Y, AIMLIST),
	
	%% Elegir mensaje dependiendo de la calidad del francotirador para darle ánimos
	( COUNT = 2 -> maplist(user:write, ['¡Impresionante, has destruido ', COUNT, ' enemigos con 1 bala!', '\n'])
	; ( COUNT = 3 -> maplist(user:write, ['¡Buen tiro! Has destruido ', COUNT, ' enemigos empleando 1 sola bala!', '\n'])
	  ; ( COUNT > 3 -> maplist(user:write, ['Eres un tirador de élite, ', COUNT, ' bajas', '\n'])
	    ; true
	    )
	  )
	),
	
	p_checkSniperStatus(OID, AMMO, GUN_END),	
        !.

gunSniper(OID, _, _, _, _):-
	not(d_basicSniperStatus(OID, _, _, _)),
        'pl-man':lang_message(gunSniper, incorrect_instantiation, MSG),
	maplist(user:write, [MSG, OID, '\n']).

% Calculate X,Y location of the entity we are seeing
p_calculateEntityXY(left, DIST, X, Y, NX, Y):- NX is X-DIST.
p_calculateEntityXY(right, DIST, X, Y, NX, Y):- NX is X+DIST.
p_calculateEntityXY(up, DIST, X, Y, X, NY):- NY is Y-DIST.
p_calculateEntityXY(down, DIST, X, Y, X, NY):- NY is Y+DIST.

% Comprueba si la bala ha colisionado con alguna entidad de la aimlist
p_checkShotSuccess(EID, DIR, X, Y, AIMLIST):-
	'pl-man':see(EID, list, DIR, SEELIST), % Obtiene la lista de objetos que ve el objeto EID en la dirección DIR
	member(AIM, SEELIST), % Coge una entidad de la lista
	member(AIM, AIMLIST), !, % Si la entidad está en la AIMLIST, puede destruirlo
	nth0(DIST, SEELIST, AIM), % Busca la primera posición en la que esté la entidad destruible
	p_calculateEntityXY(DIR, DIST, X, Y, EX, EY), % Obtiene las coordenadas de la entidad (EX y EY)
	'pl-man':entityLocation(DEST_EID,EX,EY,AIM), % Obtiene la EID del objeto a destruir
	'pl-man':destroyGameEntity(DEST_EID), 
        %'pl-man':lang_message(gunSniper, entity_shot, MSG), Comento estas 2 líneas para no sobrecargar la terminal
	%maplist(user:write, [MSG, AIM, '\n']),
	
	%% AÑADIDO: Seguir destruyendo entidades hasta que no quede ninguna en el punto de mira si hay más
	contarApariencias(DIR, AIMLIST, COUNT),
	( COUNT > 0 -> p_checkShotSuccess(EID, DIR, X, Y, AIMLIST)
	           ; !      % Corta para que no salte el error de abajo
	) .
p_checkShotSuccess(_,_,_,_,_):-
        'pl-man':lang_message(gunSniper, futile_shot, MSG),
	user:writeln(MSG).

% check and update the status of the gun depending on ammo
p_checkSniperStatus(OID, 1, destroy):-
	retractall(d_basicSniperStatus(OID,_,_,_)),
	'pl-man':destroyGameEntity(OID), 
        'pl-man':lang_message(gunSniper, out_of_ammo_vanish, MSG),
	user:writeln(MSG),
        !.
p_checkSniperStatus(OID, AMMO, GUN_END):-
	NEWAMMO is AMMO - 1,
	retract(d_basicSniperStatus(OID, _, AIMLIST, _)),
	assert(d_basicSniperStatus(OID, NEWAMMO, AIMLIST, GUN_END)),
        'pl-man':lang_message(gunSniper, ammo_status, MSG),
	maplist(user:write, [MSG, NEWAMMO, '\n']),
        !.

