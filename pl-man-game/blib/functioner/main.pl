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
% basicDoorKey
%
% Controlls the behaviour of a door and the group of
% keys that available to open it.
%
% Initialization
%--------------------
%  basicDoorKey(init, OID, ON_OPEN, KEYLIST)
%   OID: Identifier of the door object
%   ON_OPEN: List of actions to do when door is open. They 
%		could be any pl-man actions
%   KEYLIST: List of OIDs of keys that can open the door
%
% Example
%--------------------
% createGameEntity(OID_D, '/', object, 1, 4, inactive, norule, 
%                 data(puerta, solid, static, norule, 'Puerta que se abre con la llave azul')), 
% createGameEntity(OID_A, '-', object, 8, 5, inactive, norule, 
%                 data(llave_azul, not_solid, not_static, basicDoorKey, 'Llave Azul')),
% basicDoorKey(init, OID_D, 
%	['pl-man':destroyGameEntity(OID_D), 'pl-man':destroyGameEntity(OID_A)], [OID_A]).
%
% Creates a door that can only be opened with 'llave_azul'.
% The door and the key simply vanish when the door is opened.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module('functioner', [ functioner/5, functioner/1 ] ).
:- dynamic d_Functions/2.
:- dynamic d_Counter/4.

functioner(init, F_OID, FUNCTION_LIST, COUNTER, REPEAT):-
	number(F_OID),
	is_list(FUNCTION_LIST),
	maplist(callable, FUNCTION_LIST),

	retractall(d_Functions(F_OID, _)),
	assert(d_Functions(F_OID,FUNCTION_LIST)),

	CURRENT = COUNTER, 
	retractall(d_Counter(F_OID, _, _, _)),
	assert(d_Counter(F_OID,COUNTER,REPEAT,CURRENT)).

functioner(init,F_OID,_):-
	 'pl-man':lang_message(functioner, bad_parameters, MSG),
   maplist(user:write, [MSG, F_OID, '\n']).

functioner(F_OID):-
		d_Counter(F_OID, COUNTER, REPEAT, CURRENT),
		CURRENT > 0,!,
	
		NCURRENT is CURRENT-1,
	
		retract(d_Counter(F_OID, _, _, _)),
		assert(d_Counter(F_OID, COUNTER, REPEAT, NCURRENT)).
		

functioner(F_OID):-
	d_Functions(F_OID, F_LIST),
	maplist(call, F_LIST),!,

	(
		d_Counter(F_OID,COUNTER,REPEAT,_), REPEAT =/= 0
	)
	->
	(
		NREPEAT is REPEAT-1,
		NCURRENT = COUNTER,
		retract(d_Counter(F_OID, _, _, _)),
		assert(d_Counter(F_OID, COUNTER, NREPEAT, NCURRENT))
	)
	;
	(
		'pl-man':destroyGameEntity(F_OID)
	).
