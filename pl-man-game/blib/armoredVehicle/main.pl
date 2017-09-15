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
%  armoredVehicle(init, EID, INIT_MOVE, X, Y, X2, Y2, LIMITS, Counter)
%   EID: Entity ID of the entity to be controlled
%   INIT_MOVE: right or left, sets the initial direction of movement
%   X,Y: Center of the armored vehicle
%		X2,Y2: position of the winning dot, if negative, then the dot will be considered off the map
%
%		LIMITS: entities the vehicle avoids when colliding with them, making it turn to the other side
%	its moving direction when it sees one of them.
%   Counter: Number indicating steps the vehicle does before launching an another attack; -1 for no attacks and 0 for no waits
%
% Example
%--------------------
%createGameEntity(OID_VEHICLE, 'X', mortal, 5, 3, active, armoredVehicle,
%			[name(armoredVehicle), solid(false), static(true), use_rule(norule),
%			description('Vehiculo armado que dispara granadas a diferentes zonas'), appearance(attribs%%%(normal, red, default))]),
%	armoredVehicle(init,OID_VEHICLE, right, 5, 3, 1, 1, ['#','|'], 5).
%
% Creates an armored vehicle that starts moving to the right, at 5-3 coordinates,
% eating the dot at 1-1 when destroyed, 
% and it turns to the other side when it encounters # or | on its way.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(armoredVehicle, [ armoredVehicle/1, armoredVehicle/9 ]).
:- dynamic d_vehicleMove/3.
:- dynamic d_components/2.
:- dynamic d_vision/2.
:- dynamic d_state/2.
:- dynamic d_dotPosition/4.
:- dynamic d_attackTime/3.

%% Init
armoredVehicle(init, EID, INIT_MOVE, X, Y, X2, Y2, LIMITS, Counter):-
	%%Data corroboration
	number(EID),
	integer(X),
	integer(Y),
	integer(X2),
	integer(Y2),
	integer(Counter),
	-1 =< Counter, 
	(
		
		(X2 < 0 ; Y2 < 0)
	 
		-> 
			
		(
			retractall(d_dotPosition(EID,_,_,_)),
			assert(d_dotPosition(EID,not,0,0))
		) 
			;
		(
			retractall(d_dotPosition(EID,_,_,_)),
			assert(d_dotPosition(EID,eat,X2,Y2))
		)
	),

	is_list(LIMITS),
	
	%%Dynamic data assert
	retractall(d_vehicleMove(EID, _, _)),
	assert(d_vehicleMove(EID, INIT_MOVE, LIMITS)),

	retractall(d_state(EID, _)),
	assert(d_state(EID,move)),

	retractall(d_attackTime(EID, _, _)),
	assert(d_attackTime(EID,Counter,Counter)),

  %%Piece creation
	LocX is X+1,
	'pl-man':createGameEntity(PIEZA1, 'A', mortal, LocX, Y, inactive, norule, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 1')]),!,
	
	LocY2 is Y-1,
	'pl-man':createGameEntity(PIEZA2, 'B', mortal, X, LocY2, inactive, norule, 
            [name(pieza2), solid(false), static(false), use_rule(norule), description('Armored vehicle component 2')]),!,
	
	LocY is Y+1,
	'pl-man':createGameEntity(PIEZA3, 'C', mortal, X, LocY, inactive, norule, 
            [name(pieza3), solid(false), static(false), use_rule(norule), description('Armored vehicle component 3')]),!,

	LocX3 is X+2,
	LocY3 is Y+1,
	'pl-man':createGameEntity(PIEZA4, '˨', mortal, LocX3, LocY3, inactive, norule, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 4')]),!,

	LocX4 is X+2,
	LocY4 is Y-1,
	'pl-man':createGameEntity(PIEZA5, '˦', mortal, LocX4, LocY4, inactive, norule, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 5')]),!,

	LocX5 is X+1,
	LocY5 is Y+1,
	'pl-man':createGameEntity(PIEZA6, 'Ħ', mortal, LocX5, LocY5, inactive, norule, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 6')]),!,

	LocX6 is X+1,
	LocY6 is Y-1,
	'pl-man':createGameEntity(PIEZA7, 'Ħ', mortal, LocX6, LocY6, inactive, norule, 
            [name(pieza1), solid(false), static(false), use_rule(norule), description('Armored vehicle component 7')]),!,

	'pl-man':createGameEntity(PIEZACENTRO, '¥', mortal, X, Y, inactive, norule, 
            [name(pieza3), solid(false), static(false), use_rule(norule), description('Armored vehicle component center')]),!,

	%appending pieces to vehicle's list of compoments
	append([PIEZA1,PIEZA2,PIEZA3, PIEZA4, PIEZA5, PIEZA6, PIEZA7, PIEZACENTRO],[],LISTA),
	append([PIEZA2,PIEZA3, PIEZACENTRO],[],VISION),

  retractall(d_components(EID,_)),
	assert(d_components(EID,LISTA)),

	retractall(d_vision(EID,_)),
	assert(d_vision(EID,VISION)),!.
	

% Ғ Ł Ҵ Ԥ Ԩ Ԫ Ц Ш
%%Vehicle instantiation error
armoredVehicle(init, EID, _, _, _, _, _, _, _):-
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
		(
			d_dotPosition(EID,eat,X,Y)
			->
			(
				'pl-man':entityType(PlmanID,pacman),
				'pl-man':getDMap(Map),
				'pl-man':eatDot(PlmanID,Map,X,Y), !
			)
			;
			(
				%Or just it a dot, which must be added on map's dots counter
				d_dotPosition(EID,not,X,Y)
				->
				(
					'pl-man':dotEaten
				)
				;
				(
					false
				)
			)
		),

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
%%% VEHICLE ATTACK
%% 
 
%%If it is on attack, then launch missil in order   
armoredVehicle(EID):-
	%vehicle on attack mode
	d_state(EID,attack),!,

	%launch missiles in turns
		%Check attack period, and if it's not attack time reduce 1 in counter
	(
		(
			d_attackTime(EID ,_ ,Rtime),
			Rtime =<0
		) 
		->
		(
			retract(d_attackTime(EID, Otime2 ,_)),
			NewRTime = Otime2,
			assert(d_attackTime(EID, Otime2 ,NewRTime)),

			%change state to attack mode
			retract(d_state(EID, _)),
			assert(d_state(EID,move))
		)
		;
		(
			retract(d_attackTime(EID ,Otime3 ,Rtime3)),
			maplist(user:write, ['(Está bien atacando)\n']),
			NewRTime2 is Rtime3-1,
			assert(d_attackTime(EID,Otime3,NewRTime2))
		)
	),
	
	maplist(user:write, ['(Está atacando)\n']),!.

%%
%%% VEHICLE MOVEMENT
%% 

%%Movement to all pieces connected to this object      
armoredVehicle(EID):-

	%vehicle can move
	d_state(EID,move),

	%Check attack period, and if it's not attack time reduce 1 in counter
	(
		(
			d_attackTime(EID ,_ ,Rtime),
			Rtime =<0
		) 
		->
		(
			retract(d_attackTime(EID, Otime2 ,_)),
			NewRTime = 3,
			assert(d_attackTime(EID, Otime2 ,NewRTime)),

			%change state to attack mode
			retract(d_state(EID, _)),
			assert(d_state(EID,attack))
		)
		;
		(
			retract(d_attackTime(EID ,Otime3 ,Rtime3)),
			maplist(user:write, ['(Está bien)\n']),
			NewRTime2 is Rtime3-1,
			assert(d_attackTime(EID,Otime3,NewRTime2))
		)
	),

	

	%Take data
	d_vehicleMove(EID, DIR, LIMITS),

	%Verify an obstacle is not in the way of the vehicle
	countObstacles(EID,Number),
	Number =< 0,!,

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

%%Counting number of obstacles in the way
countObstacles(EID,[],C,C).
countObstacles(EID,[H|T],C, I):-
	(
			(
				d_vehicleMove(EID, DIR, LIMITS),
				'pl-man':see(H, list, DIR, X),
				nth0(2,X,Object),
				member(Object, LIMITS)
			)
			->
			Counter is C+1
			;
			Counter = C
		
	),
	countObstacles(EID,T,Counter, I).

countObstacles(EID,Counter):-
	d_vision(EID,List),
	countObstacles(EID,List,0,Counter).

% Next movement direction when the enemy arrives to a limit
p_enemyNextDir(left, right).
p_enemyNextDir(right, left).
