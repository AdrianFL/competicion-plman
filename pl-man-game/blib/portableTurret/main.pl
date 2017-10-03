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
% portableTurret
%
% Object that can be used to place an ally turret at the desired position. 
%
% Initialization
%--------------------
%  portableTurret(init, OID, L_AIM, L_DIR, DELAY, L_PARAMS):-
%    OID:   Identifier of the automatic turret object
%    L_AIM: Aiming types of objects that make the automatic turret 
%           shoot when seen. Example: ['E']
%    L_DIR: List of directions the turret can shoot (up, down, left or right)
%    DELAY: Cycles between shots
%    L_PARAMS: Params to control the way the automatic Turret behaves
%       continuous: shots continuously every DELAY cycles. By default
%                   it shots only when it sees an objective from L_AIM
%	randomFirstShot: Creates an artificial amount of cycles to wait
%		before the first shot
%       bullet_appearance(AP): AP is the character representing the bullet
%       bullet_appearance(AP, ATR, TC, BC): Extended appearance of the bullet.
%                   AP: Character, ATR: Atribute, TC: Text color, BC, Background color
%
% Example
%--------------------
%   createGameEntity(OID_TURRET, 'T', object, 5, 2, active, automaticTurret, 
%	            [name(turret1), solid(false), static(true), norule, description('automatic turret')]), 
%   automaticTurret(init, OID_TURRET, ['E'], up, 2).
%
% Creates an automatic turret on location 5,2 that will shot
% automatically to every E that it will see on its up,
% shotting at the objective every 2 cycles of execution. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(portableTurret, [portableTurret/5, portableTurret/6]).
:- dynamic d_portableTurretStatus/6.
:- 'pl-man':loadNewBehaviour(automaticTurret).

%%%
%%% Initialization
%%%
portableTurret(init, OID, L_AIM, L_DIR, DELAY, L_PARAMS):-
	integer(OID),
	integer(DELAY), DELAY >= 0, 
	is_list(L_AIM),
	is_list(L_DIR),
	length(L_DIR,LENGTH), LENGTH >= 1, LENGTH =< 4,
	is_list(L_PARAMS),
	
	correctListMembers(L_DIR, [up,down,left,right]),

	retractall(d_portableTurretStatus(OID, _, _, _, _, _)),
	assert(d_portableTurretStatus(OID, L_AIM, L_DIR, DELAY, L_PARAMS, CYCLESPASSED)), !.
	
portableTurret(init, OID, _, _, _, _):-
	'pl-man':lang_message(portableTurret, bad_parameters, MSG),
	maplist(user:write, [MSG, OID, ')\n']).


%%%
%%% Control
%%%

% USE RULE
portableTurret(OID, _, X, Y, _):-
	d_portableTurretStatus(OID, L_AIM, L_DIR, DELAY, L_PARAMS, CYCLESPASSED),
	'pl-man':createGameEntity(OID_TURRET, 'T', object, X, Y, active, automaticTurret,	[name(torretaAutomatica), solid(false), static(true), use_rule(norule), description('Torreta automática de la reina'), appearance(attribs(bold, green, black))]),
	'pl-man':automaticTurret(init, OID_TURRET, L_AIM, L_DIR, DELAY, L_PARAMS),
	
	maplist(user:write, ['Torreta colocada', '\n']),
	'pl-man':destroyGameEntity(OID). % Destroy the object

% Aux predicate
correctListMembers([],_).
correctListMembers([H|T], LIST):-
	member(H,LIST),
	correctListMembers(T, LIST).
	
	
	
	
