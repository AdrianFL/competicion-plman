%
% This file is part of Pl-man
% Pl-man is a puzzle game inspired in the popular game pacman, and it is mainly aimed
% to teach programming in PROLOG and introductory courses of Artifial Intelligence.
%
% Copyright (C) 2007-2011 Francisco Gallego <ronaldo@cheesetea.com>
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mine
%
% Implements the behaviour of a programable mine, that 
% while explode some cycles after it is dropped in
% some place.
%
% Includes the sub-behaviours
%	explosion
%
% Initialization
%--------------------
%  mine(init, OID, TIME, WAVE, L_PARAMS):-
%    OID:  Identifier of the mine object
%    TIME: Cycles before the mine explodes since it is dropped
%    WAVE: Size (in chars) of the radious of the expansive wave
%    L_PARAMS: Params to control the way the mine behaves
%        no_destroy(L_EX): objects or entities that will survive
%		to the explosion of the mine
%
% Example
%--------------------
%   createGameEntity(OID_MINE, '+', object, 5, 2, active, mine, 
%	            [name(mine), solid(false), static(false), use_rule(norule), description('programmable mine'))]), 
%   mine(init, OID_MINE, 2, 1, [ no_destroy(['.']) ]).
%
% Creates a mine that will explode when two cycles of
% execution have passed since the mine has been dropped.
% The explosion will destroy everything except surrounding
% dots ('.') in 1 cell of distance from the mine.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-module(quimicBomb, [quimicBomb/1, quimicBomb/5, gas/1, gas/4]).
:-dynamic d_quimicBombStatus/5. %---mineStatus
:- dynamic d_gasStatus/3. %---explosionStatus

%%%
%%% Quimic Bomb Initialization
%%%
%

quimicBomb(init,OID,TIME,WAVE,L_PARAMS):-
	integer(OID),
	integer(OID),
	integer(TIME), TIME >= 1, 
	integer(WAVE), WAVE >= 0,
	is_list(L_PARAMS),
	retractall(d_quimicBombStatus(OID, _,_,_,_)),
	assert(d_quimicBombStatus(OID, ready, TIME, WAVE, L_PARAMS)), !.

%Initialization error message
quimicBomb(init, OID, _, _, _):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).

%%%
%%% quimic bomb behaviour
%%%

%% Si la bomba ha sido activada, explota (se pone un * encima y pasa a ser atravesable)
quimicBomb(OID):-
	d_quimicBombStatus(OID, activated, TIME, WAVE, L_PARAMS)),
	%%Se coge la localización de la bomba
	'pl-man':entityLocation(OID, X, Y, _), !,

	%%Verificamos qué objeto hay colocado en el mapa para dibujar el gas según lo que haya
  'pl-man':getDMap(Map),
  'pl-man':getCellContent(X, Y, Map, WHAT),	

	%%Los 3 ifs que determinan el dibujo del gas
	(WHAT == '.' -> Format = '*' , App = [appearance(attribs(bold, yellow, red))] 
	; (WHAT == ' '-> Format = '˞' ,  App = [appearance(attribs(bold, white, red))]
	; Format = '~' ,  App = [appearance(attribs(bold, blue, red))])),
	
	%%Creación del gas inicial
  'pl-man':createGameEntity(GAS_ID, Format, mortal, X, Y, active, gas, App),

	%%Inicialización del gas inicial
  gas(init, GAS_ID, WAVE, L_PARAMS), !.

%%Si el tiempo llega a 1, activa la bomba y explota en el siguiente turno
quimicBomb(OID):-
	d_quimicBombStatus(OID,ready, TIME, WAVE, L_PARAMS)),!,
	TIME=1,!,
	retractall(d_quimicBombStatus(OID, _,_,_,_)),
	assert(d_quimicBombStatus(OID, activated, TIME, WAVE, L_PARAMS)), !.


%%Renueva el tiempo cogiendo el estado actual, le resta 1 al tiempo, y lo vuelve a guardar el estado
quimicBomb(OID):-
	maplist(user:write, ['Me inicio', '\n']),
	retract(d_quimicBombStatus(OID,ready, TIME, WAVE, L_PARAMS)),!,
	NTIME is TIME-1,

		%%Mensaje de ciclos de explosión		
		'pl-man':lang_message(quimicBomb, cicles_left_for_explosion, MSGMINE),
		maplist(user:write, [MSGMINE, NEWTIME, '\n']),

	assert(d_quimicBombStatus(OID, ready, NTIME, WAVE, L_PARAMS)), !.

% Quimic bomb init error
mine(OID):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_incorrect_instantiation, MSG),
	maplist(user:write, [MSG, OID, '\n']).


%%%
%%% Gas Initialization
%%%

%%Gas parameters
gas(init, OID, TIME, L_PARAMS):-
	integer(OID),
	integer(TIME), TIME >= 1, 
	retractall(d_gasStatus(OID, _, _)),
        %%---explosion(add_explosion, OID),
	assert(d_gasStatus(OID, TIME,_)), !.

%%gas init error message
gas(init, OID, _):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).

%%%
%%% Gas behaviour
%%%

%Gas still on the map,
gas(OID):-
	retract(d_gasStatus(OID, TIME, L_PARAMS)), 
	NEWTIME is TIME-1,
	assert(d_gasStatus(OID, NEWTIME, L_PARAMS)), 
        gas(destroy_entities, OID), !.











