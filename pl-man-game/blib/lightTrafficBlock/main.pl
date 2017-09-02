%
% This file is part of Pl-man
% Pl-man is a puzzle game inspired in the popular game pacman, and it is mainly aimed
% to teach programming in PROLOG and introductory courses of Artifial Intelligence.
%
% Copyright (C) 2007-2008 Francisco Gallego <ronaldo@cheesetea.com>
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
% lightTrafficBlock
%
% Controls the behaviour of a block
% that allows pl-man to walk through it
% at a concrete state
%
% Initialization
% ------------------
% lightTrafficBlock(init, OID, STATE, REDTIME, GREENTIME, X, Y):-
% OID: Identifier of the object
% STATE: Defines the initial state of the block. 0 for red state, and 1 for green state
% REDTIME and GREENTIME: Defines the time in turns that every state lasts
% X and Y: Defines the X and Y coordinates of the block
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-module(lightTrafficBlock, [lightTrafficBlock/7, lightTrafficBlock/1]).
:-dynamic d_lightTrafficStatus/5.
:-dynamic d_lightTime/2. %One for every state

lightTrafficBlock(init, OID, STATE,REDTIME,GREENTIME, X, Y):-
	integer(OID),
	integer(STATE),
	integer(GREENTIME),
	integer(REDTIME),
	retractall(d_lightTime(_,_)),
	assert(d_lightTime(REDTIME, GREENTIME)),
	(STATE=:=0->TIME is REDTIME; STATE=:=1 -> TIME is GREENTIME; TIME is 0),
	retractall(d_lightTrafficStatus(OID, _, _, _, _)),
	assert(d_lightTrafficStatus(OID, STATE, TIME, X, Y)).


%Initialization error message
lightTrafficBlock(init, OID, _, _, _, _, _):-
	'pl-man':lang_message(lightTrafficBlock, lightTrafficBlock_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).


%%%
%%% lightTrafficBlock behaviour
%%%


lightTrafficBlock(OID):-
	d_lightTrafficStatus(OID, STATE, TIME, X, Y),
	d_lightTime(REDTIME, GREENTIME),
	TIME=:=0,
	'pl-man':destroyGameEntity(OID),
	(STATE=:=0 -> NEWSTATE is 1, 
	'pl-man':createGameEntity(OID_LTB, '|', object, X, Y, active, lightTrafficBlock,
			[name(bomba_quimica), solid(false), static(true), use_rule(norule),
			description('Bomba química que infecta una sala'), appearance(attribs(normal, green, default))])
	
	; NEWSTATE is 0, 
	'pl-man':createGameEntity(OID_LTB, '=', object, X, Y, active, lightTrafficBlock,
			[name(bomba_quimica), solid(true), static(true), use_rule(norule),
			description('Bomba química que infecta una sala'), appearance(attribs(normal, red, default))])), 

	lightTrafficBlock(init, OID_LTB, NEWSTATE, REDTIME, GREENTIME, X, Y).


lightTrafficBlock(OID):-
	retract(d_lightTrafficStatus(OID, STATE, TIME, X, Y)), 
	NEWTIME is TIME-1,
	assert(d_lightTrafficStatus(OID, STATE, NEWTIME, X, Y)).






