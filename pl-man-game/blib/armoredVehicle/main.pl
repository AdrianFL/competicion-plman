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
% enemyBasicMovement
%
% Controlls the behaviour of an enemy (or moving entity) 
% that moves from left to right or for up to down
%
% Initialization
%--------------------
%  enemyBasicMovement(init, EID, MOVE_TYPE, LIMITS)
%   EID: Entity ID of the entity to be controlled
%   MOVE_TYPE: up-down, down-up, left-right or right-left
%   LIMITS: List of object that make the entity change
%	its moving direction when it sees one of them.
%
% Example
%--------------------
%  createGameEntity(EID, 'E', mortal, 11, 1, active, enemyBasicMovement, 0),
%  enemyBasicMovement(init, EID, left-right, ['#', '|']).
%
% Creates an enemy that will move from left to right.
% Whenever it sees a '#' or a '|', it will change its
% direction of movement.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(armoredVehicle, [ armoredVehicle/1, armoredVehicle/7 ]).
:- dynamic d_vehicleMove/3.
:- dynamic d_components/2.

%% Init
armoredVehicle(init, EID, INIT_MOVE, X, Y, COMPONENTS, LIMITS):-
	%%Data corroboration
	number(EID),
	is_list(LIMITS),
	
	%%Dynamic data assert
	retractall(d_enemyBMStatus(EID, _, _)),
	assert(d_vehicleMove(EID, INIT_MOVE, LIMITS)),

	retractall(d_components(EID,_)),
	assert(d_components(EID,COMPONENTS)), 
  %%Piece creation
	
	LocX is X+1,
	'pl-man':createGameEntity(PIEZA1, 'A', object, LocX, Y, inactive, mine, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 1')]),!,
	
	LocX2 is X-1,
	'pl-man':createGameEntity(PIEZA2, 'B', object, LocX2, Y, inactive, mine, 
            [name(pieza2), solid(false), static(false), use_rule(norule), description('Armored vehicle component 2')]),!,
	
	LocY is Y+1,
	'pl-man':createGameEntity(PIEZA3, 'C', object, X, LocY, inactive, mine, 
            [name(pieza3), solid(false), static(false), use_rule(norule), description('Armored vehicle component 3')]),!,
	append([PIEZA1,PIEZA2,PIEZA3],COMPONENTS,LISTA),

  retractall(d_components(EID,_)),
	assert(d_components(EID,LISTA)), !.
	
%%Vehicle instantiation error
armoredVehicle(init, EID, _, _, _, _, _):-
        'pl-man':lang_message(armoredVehicle, bad_parameters, MSG),
        maplist(user:write, [MSG, EID, '\n']).

%%
%%% VEHICLE MOVEMENT
%%  

%%Movement to all pieces connected to this object      
armoredVehicle(EID):-
	%Take data
	d_vehicleMove(EID, DIR, LIMITS),

	%Verify an obstacle is not in the way of the vehicle
	'pl-man':see(EID, list, DIR, X),
	nth0(2,X,Object),
	not(member(Object, LIMITS)),

	%%Apply to all vehicles pieces the movement
  'pl-man':doAction(EID, move(DIR)),
	forall(
		(d_components(EID, LISTA),member(PIEZA,LISTA)),
		(

		'pl-man':doAction(PIEZA, move(DIR))

		)		
	),!.

%%Direction change
armoredVehicle(EID):-
	retract(d_vehicleMove(EID, DIR, LIMITS)),
	p_enemyNextDir(DIR, NEXTDIR),
	assert(d_vehicleMove(EID, NEXTDIR, LIMITS)), !.

%%error check
armoredVehicle(EID):-
	not(d_vehicleMove(EID, _, _)),
        'pl-man':lang_message(armoredVehicle, instantiation_error, MSG),
	maplist(user:write, ['(EID: ', EID, '): ', MSG, '\n']).

% Next movement direction when the enemy arrives to a limit
p_enemyNextDir(left, right).
p_enemyNextDir(right, left).
