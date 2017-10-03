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
% missileVehicle
%
% Implements the behaviour of missile that moves along
% the screen in one of the 8 main directions. Used only for the vehicle.
%
% Uses subbehaviours
%       explosion (from mineExplosion)
%
% Direct Missile Creation
%-------------------------
%  missileVehicle(create, X, Y, DIR, L_PARAMS).
%  missileVehicle(create, OID_M, X, Y, DIR, L_PARAMS).
%   OID_M:    OID of the Missile
%   DIR:      Direction of movement
%   X, Y:     Starting location coordinates
%   L_PARAMS: List of parameters to modify standard behaviour
%       power(X): Missile power (explosion radius, default=1)
%       speed(S): Missile speed in chars/turn (default=1)
%				no_destroy(Y): List of objects that the missile does not destroy.
%
%   Directly creates an entity for the missile and initiates it,
%   easying the task. 
%
%  Example
% --------------------
%
%   missile(create, 10, 12, left, []).
%
%   Creates a new missile at location 10,12, that will move to its
%   left until it collides with any solid object or entity.
%
% Manual Missile Creation
%-------------------------
%  
%  If you wanted, you will be able to manually perform the requiered
%  steps to create a missile, so having a greater control.
%
%  Initialization
% --------------------
%  missile(init, OID_M, DIR, L_PARAMS):-
%   OID_M:    OID of the Missile
%   DIR:      Direction of movement
%   L_PARAMS: List of parameters to modify standard behaviour
%       speed(S): Missile speed in chars/turn (default=1)
%       power(X): Missile power (explosion radius, default=1)
%				no_destroy(Y): the missile does not destroy this objects, (default = '.')
%
%  Example
% --------------------
%
%   createGameEntity(OID_M, '*', mortal, 10, 12, active, missile, 
% 	[name(misil), solid(false), static(true), use_rule(norule),
%	description('Misil'), appearance(attribs(bold, red, default))]),
%   missile(init, OID_M, left, []).
%
%   Does same as previous example.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(missileVehicle, [ missileVehicle/1, missileVehicle/4, missileVehicle/7, missileVehicle/8 ]).

% d_missileStatus(OID_MISSILE, VEL, DIR, POWER)
:- dynamic d_missileStatus/5.
:- 'pl-man':loadNewBehaviour(mineExplosion).

%%
%% Initialization
%%

missileVehicle(init, OID_M, DIR, L_PARAMS):-
	number(OID_M), is_list(L_PARAMS), 
	p_velocity(DIR, _, _),
        cheeseTools:getParamFromList(POWER, power, 1, L_PARAMS), 
        cheeseTools:getParamFromList(SPEED, speed, 1, L_PARAMS),
				cheeseTools:getParamFromList(AVOID, no_destroy, 1, L_PARAMS),
        POWER >= 1, SPEED >= 1, is_list(AVOID),
        retractall(d_missileStatus(OID_M, _, _, _, _)),
	assert(d_missileStatus(OID_M, SPEED, DIR, POWER, AVOID)), 
        !.

missileVehicle(init, OID_M, _, _):-
        'pl-man':lang_message(missile, bad_parameters, MSG),
	maplist(user:write, [MSG, OID_M, '\n']).
	
%%
%% Creation
%%

missileVehicle(create, X, Y, DIR, L_PARAMS, FORM, APP):-
    missile(create, _, X, Y, DIR, L_PARAMS, FORM, APP).
missileVehicle(create, OID_M, X, Y, DIR, L_PARAMS, FORM, APP):-
    'pl-man':createGameEntity(OID_M, FORM, mortal, X, Y, active, missile, 
		[name(misil), solid(false), static(true), use_rule(norule),
		description('Misil'), APP ]),
    missileVehicle(init, OID_M, DIR, L_PARAMS).

%% APP = appearance(attribs(bold, red, default))

%%
%% Control
%%
missileVehicle(EID):-
    d_missileStatus(EID, VEL, DIR, _, _),
    p_velocity(DIR, VX, VY),
    'pl-man':getDMap(MAP),
    'pl-man':entityLocation(EID, X, Y, _),
    missileVehicle(move, EID, MAP, VEL, X, Y, VX, VY), !.
missileVehicle(EID):-
    'pl-man':lang_message(missile, bad_instantiation, MSG),
    maplist(user:write, [MSG, EID, '\n']), !.
    
% Subrules
%

%% Move Missile checking possible explosions
%
missileVehicle(move, EID, _, _, _, _, _, _):-
    missile(checkHitAndExplode, EID), !.
missileVehicle(move, _, _, 0, _, _, _, _):- !.
missileVehicle(move, EID, MAP, VEL, X, Y, VX, VY):-
    X1 is X + VX,
    Y1 is Y + VY,
    VEL1 is VEL - 1,
    'pl-man':moveEntity(EID, MAP, X1, Y1),
    missileVehicle(move, EID, MAP, VEL1, X1, Y1, VX, VY).

% Check if missile has hit something and explode
%
missileVehicle(checkHitAndExplode, EID):-
    'pl-man':entityLocation(EID, X, Y, _),
    'pl-man':entityLocation(OID_2, X, Y, _),
    OID_2\=EID,
    'pl-man':entityType(OID_2, TYPE),
    ( not(TYPE=object) ; 'pl-man':solidEntity(OID_2) ),
    missileVehicle(destroy, EID), !.
missileVehicle(checkHitAndExplode, EID):-
    'pl-man':entityLocation(EID, X, Y, _),
    'pl-man':getDMap(Map),
    'pl-man':collision(X, Y, Map),
    missileVehicle(destroy, EID).

%% Destroy missile when hits something solid
%
missileVehicle(destroy, EID):-
    d_missileStatus(EID, _, _, POWER),
    'pl-man':explosion(wave, EID, POWER, [ no_destroy(['.']) ]),
    'pl-man':destroyGameEntity(EID),
    retractall(d_missileStatus(EID, _, _, _)).

% Conversions from Directions to velocities
%
p_velocity(right, 1, 0).
p_velocity(left, -1, 0).
p_velocity(down, 0, 1).
p_velocity(up, 0, -1).
p_velocity(up-left, -1, -1).
p_velocity(left-up, -1, -1).
p_velocity(up-right, 1, -1).
p_velocity(right-up, 1, -1).
p_velocity(down-right, 1, 1).
p_velocity(right-down, 1, 1).
p_velocity(down-left, -1, 1).
p_velocity(left-down, -1, 1).
