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
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bomba química
%
%
:-module(quimicBomb, [quimicBomb/1]).
:-dynamic d_quimicBombStatus/1. %---mineStatus
:- dynamic d_gasStatus/2. %---explosionStatus

%%%
%%% Quimic Bomb Initialization
%%%

quimicBomb(init,OID):-
	integer(OID),
	retractall(d_quimicBombStatus(OID)),
	assert(d_quimicBombStatus(OID)),!.

%Initialization error message
quimicBomb(init, OID):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).


%%%
%%% Gas Initialization
%%%

%%Gas parameters
gas(init, OID, TIME):-
	integer(OID),
	integer(TIME), TIME >= 1, 
	retractall(d_gasStatus(OID, _)),
        %%---explosion(add_explosion, OID),
	assert(d_gasStatus(OID, TIME)), !.

%%gas init error message
gas(init, OID, _):-
        'pl-man':lang_message(bombaQuimica, quimic_bomb_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).

%%%
%%% Gas behaviour
%%%

%Gas still on the map
gas(OID):-
	retract(d_gasStatus(OID, TIME, L_PARAMS)), 
	NEWTIME is TIME-1,
	assert(d_gasStatus(OID, NEWTIME, L_PARAMS)), 
        gas(destroy_entities, OID), !.


