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
% armored Vehicle
%
% Controlls the behaviour of an armored vehicle, composed of parts that
% move Synchronized. This object eats a dot on the position assigned
% by the player.
%
% Initialization
%--------------------
%  armoredVehicle(init, EID, INIT_MOVE, X, Y, COMPONENTS, LIMITS)
%   EID: Entity ID of the entity to be controlled
%   INIT_MOVE: right or left, sets the initial direction of movement
%   X,Y: Center of the armored vehicle
%   COMPONENTS: components of the vehicle pre-assigned by the player
%		LIMITS: entities the vehicle avoids when colliding with them, making it turn to the other side
%	its moving direction when it sees one of them.
%
% Example
%--------------------
%createGameEntity(OID_VEHICLE, 'X', mortal, 5, 3, active, armoredVehicle,
%			[name(armoredVehicle), solid(false), static(true), use_rule(norule),
%			description('Vehiculo armado que dispara granadas a diferentes zonas'), appearance(attribs%%%(normal, red, default))]),
%	armoredVehicle(init,OID_VEHICLE, right, 5, 3, [], ['#','|']).
%
% Creates an armored vehicle that starts moving to the right, at 5-3 coordinates,
% and it turns to the other side when it encounters # or | on its way.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(armoredVehicle, [ armoredVehicle/1, armoredVehicle/7 ]).
:- dynamic d_vehicleMove/3.
:- dynamic d_components/2.
:- dynamic d_state/2.
:- dynamic d_dotPosition/3.

%% Init
armoredVehicle(init, EID, INIT_MOVE, X, Y, COMPONENTS, LIMITS):-
	%%Data corroboration
	number(EID),
	is_list(COMPONENTS),
	is_list(LIMITS),
	
	%%Dynamic data assert
	retractall(d_vehicleMove(EID, _, _)),
	assert(d_vehicleMove(EID, INIT_MOVE, LIMITS)),

	retractall(d_components(EID,_)),
	assert(d_components(EID,COMPONENTS)),

	retractall(d_state(EID, _)),
	assert(d_state(EID,move)),

	retractall(d_dotPosition(EID,_,_)),
	assert(d_dotPosition(EID,1,1)),

  %%Piece creation
	LocX is X+1,
	'pl-man':createGameEntity(PIEZA1, 'A', mortal, LocX, Y, inactive, norule, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 1')]),!,
	
	LocX2 is X-1,
	'pl-man':createGameEntity(PIEZA2, 'B', mortal, LocX2, Y, inactive, norule, 
            [name(pieza2), solid(false), static(false), use_rule(norule), description('Armored vehicle component 2')]),!,
	
	LocY is Y+1,
	'pl-man':createGameEntity(PIEZA3, 'C', mortal, X, LocY, inactive, norule, 
            [name(pieza3), solid(false), static(false), use_rule(norule), description('Armored vehicle component 3')]),!,
	append([PIEZA1,PIEZA2,PIEZA3],COMPONENTS,LISTA),

  retractall(d_components(EID,_)),
	assert(d_components(EID,LISTA)), !.
	
%%Vehicle instantiation error
armoredVehicle(init, EID, _, _, _, _, _):-
        'pl-man':lang_message(armoredVehicle, bad_parameters, MSG),
        maplist(user:write, [MSG, EID, '\n']).

%%
%%% VEHICLE BEHAVIOUR
%%

%%Conditions to die and win the map
armoredVehicle(EID):-
		%The player destroyed some components of the vehicle, so it's not functional anymore		
		countComponents(EID,Counter),

		%Conditions for it to be destroyed
		Counter =< 2,

		%ate the dot that the cars holds
		d_dotPosition(EID,X,Y),
		'pl-man':entityType(PlmanID,pacman),
		'pl-man':getDMap(Map),
		'pl-man':eatDot(PlmanID,Map,X,Y),!,

		%%destroy the components of the armored vehicle, 
		destroyComponents(EID),

		%erase states
		retractall(d_components(EID,_)),
		retractall(d_state(EID,_)),
		retractall(d_vehicleMove(EID,_,_)),
		retractall(d_dotPosition(EID,_,_)),

		%destroy object itself
		'pl-man':destroyGameEntity(EID),!.


%%
%%% VEHICLE MOVEMENT
%%  

%%Movement to all pieces connected to this object      
armoredVehicle(EID):-
	%vehicle can move
	d_state(EID,move),

	%Take data
	d_vehicleMove(EID, DIR, LIMITS),

	%Verify an obstacle is not in the way of the vehicle
	'pl-man':see(EID, list, DIR, X),
	nth0(3,X,Object),
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

%%
%%% EXTRA FUNCTIONS
%% 

%%Destroy components left
destroyComponents([]).
destroyComponents([H|T]):-
	( 'pl-man':d_entity(H,_,_,_,_) ->  'pl-man':destroyGameEntity(H) 
	        ;  true
	), 
	destroyComponents(T).

destroyComponents(EID):-
	d_components(EID,List),
	destroyComponents(List).

%%Counts number of components left
countComponents(r, [], C, C).
countComponents(r, [H|T], C, I):-
	( 'pl-man':d_entity(H,_,_,_,_) -> Counter is C+1
	        ;  Counter = C
	), 
	countComponents(r, T, Counter, I).

countComponents(EID,Number):-
	d_components(EID,List),
	countComponents(r, List, 0, Number).

% Next movement direction when the enemy arrives to a limit
p_enemyNextDir(left, right).
p_enemyNextDir(right, left).
