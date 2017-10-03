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
% functioner
%
% Controlls the behaviour of a non-interactive entity that calls functors
% after a delay
%
% Initialization
%--------------------
%  functioner(init, F_OID, FUNCTION_LIST, COUNTER, REPEAT)
%   F_OID: Identifier of the door object
%   FUNCTION_LIST: List of functors to do when COUNTER is 0. They 
%		could be any pl-man actions
%   COUNTER: Number of steps to wait until calling the functors
%   REPEAT: Number of times to recall FUNCTION_LIST
%
% Example
%--------------------
% createGameEntity(OID_FUNCT0, '', non_interactive, 0, 0, active, functioner, 
%			[name(functioner), solid(false), static(true), use_rule(norule),
%			description('Objeto que llamará funciones del sistema'), appearance(attribs(normal, default, default))]),
%
% functioner(init, OID_FUNCT0, 
%  ['pl-man':createGameEntity(ALLY_SCOUT, 'ñ', mortal, 1, 2, active, entitySequentialMovement, [appearance(attribs(bold, green, default))]),
%  'pl-man':entitySequentialMovement(init, ALLY_SCOUT, [r,r,l,l,l], %[no_repeat_moves]),
%  'pl-man':createGameEntity(OID_FUNCT, '', non_interactive, 0, 0, active, functioner, []),
%  'pl-man':functioner(init, OID_FUNCT, ['pl-man':destroyGameEntity(ALLY_SCOUT)], 42, 0) 
%  ], 0, 0),
%
% Creates a functioner that calls a variable number of pl-man functors
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(functioner, [ functioner/5, functioner/1 ] ).
:- dynamic d_Functions/2.
:- dynamic d_Counter/4.

%%%
%%% Initialization
%%%

functioner(init, F_OID, FUNCTION_LIST, COUNTER, REPEAT):-
	number(F_OID),
	is_list(FUNCTION_LIST),
	number(COUNTER), COUNTER >= 0,
	number(REPEAT),
	maplist(callable, FUNCTION_LIST),

	retractall(d_Functions(F_OID, _)),
	assert(d_Functions(F_OID,FUNCTION_LIST)),

	CURRENT = COUNTER,
	retractall(d_Counter(F_OID, _, _, _)), 
	assert(d_Counter(F_OID,COUNTER,REPEAT,CURRENT)).

functioner(init,F_OID,_, _, _):-
	'pl-man':lang_message(functioner, bad_parameters, MSG),
	maplist(user:write, [MSG, F_OID, '\n']).


%%%
%%% Control
%%%

functioner(F_OID):-
	d_Counter(F_OID, COUNTER, REPEAT, CURRENT),
	CURRENT > 0,
	
	NCURRENT is CURRENT-1,
	retract(d_Counter(F_OID, _, _, _)),
	assert(d_Counter(F_OID, COUNTER, REPEAT, NCURRENT)).		

functioner(F_OID):-
	d_Functions(F_OID, F_LIST),
	maplist(call, F_LIST),

	(
		(d_Counter(F_OID,COUNTER,REPEAT,_), REPEAT =\= 0)
		->
		NREPEAT is REPEAT-1,
		NCURRENT = COUNTER,
		retract(d_Counter(F_OID, _, _, _)),
		assert(d_Counter(F_OID, COUNTER, NREPEAT, NCURRENT))
		;
		'pl-man':destroyGameEntity(F_OID)
	).

