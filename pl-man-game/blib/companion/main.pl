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
% companion
%
% Controlls the behaviour of a pl-man's buddy that 
% moves following a predifined sequence of moves, uses 
% objects wisely and dodges enemies like a ninja
%
% Initialization
%--------------------
%  companion(init, EID, MOVE_LIST, ITEMS_LIST MODIFIERS)
%   EID: Entity ID of the entity to be controlled
%   MOVE_LIST: List of movements to follow
%	ITEMS_LIST: List of items available to get and use 
%   MODIFIERS: List of atoms that express modifications to the 
%	standard behaviour.
%	- no_repeat_moves: By default it is always checked that 
%		movements have been effectively done. If not, they are
%		repeated. This modifier disables this feature.
%	- no_cycle: By default, when an entity has done all the movements 
%		from its list, it cycles again. This modifier disables this feature.
%	
%
% Example
%--------------------
%  createGameEntity(EID, 'ñ', object, 1, 1, active, companion, 0),
%  companion(init, EID, [ right, left, up, up, down, down ], []).
%
% Creates a companion that will move following the move list.
% Once it has done all the movements from the list, it
% cycles again.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- module(companion, [ companion/1, companion/7 ]).

% d_entityStatus(EID, was_on(X, Y, Appearance), NextMoveNum, MoveList, Modifiers)
:- dynamic d_entityStatus/5.

% disarmed, not carrying a weapon; armed, carrying a weapon;
:- dynamic d_itemStatus/6.

% Init Sequence
companion(init, EID, MOVE_LIST, MODIF_LIST, ITEM_LIST, AIM_LIST, DIRECTIONS_LIST):-
	number(EID),
	is_list(MOVE_LIST),
	is_list(MODIF_LIST),
	is_list(ITEM_LIST),
	is_list(AIM_LIST),
	is_list(DIRECTIONS_LIST),
	'pl-man':entityLocation(EID,_ , _, Ap),
	retractall(d_entityStatus(EID, _, _, _, _)),
	retractall(d_itemStatus(EID, _, _, _, _, _)),
	assert(d_entityStatus(EID, was_on(-100,-100,Ap), 0, MOVE_LIST, MODIF_LIST)),
	assert(d_itemStatus(EID, ITEM_LIST, AIM_LIST, DIRECTIONS_LIST, disarmed, _)), !.

companion(init, EID, _, _, _, _, _):-
        'pl-man':lang_message(entitySequentialMovement, bad_parameters, MSG),
	maplist(user:write, [MSG, EID, '\n']).

% Control to gather dots
companion(EID):-
	'pl-man':entityLocation(EID, X, Y, _),
	'pl-man':getDMap(Map),
	'pl-man':eatDot(EID, companion, Map, X, Y), % *** functor añadido en pl-man ***
	 false.

% Control to gather items

% Grab a weapon
companion(EID):-
	d_itemStatus(EID, L_ITEMS, L_AIM, L_DIR, disarmed, _), % Make sure companion is not carry anything
	member(DIR,L_DIR),
	'pl-man':see(EID, normal, DIR, WHAT),
	member(WHAT, L_ITEMS),
	'pl-man':entityLocation(EID, X, Y, _),

	% Gather the item in its respective direction
	newdir(DIR,X,Y,NewX,NewY),
	'pl-man':getObjectFrom(EID,NewX,NewY),
	retract(d_itemStatus(EID, _, _, _, _, _)),
	assert(d_itemStatus(EID, L_ITEMS, L_AIM, L_DIR, armed, WHAT)), % Update status (companion now armed) 

	'pl-man':entityLocation(EID, _, _, Ap), % Recupero la apariencia para mostrarla en el mensaje
	maplist(user:write, ['Tu compañero "', Ap, '" ha recogido (', WHAT, ' )\n']).

% Use a weapon
companion(EID):-
	d_itemStatus(EID, L_ITEMS, L_AIM, L_DIR, armed, ITEM_APP), % Make sure companion is armed
	member(DIR,L_DIR),
	'pl-man':see(EID, list, DIR, SEELIST),
	member(AIM, L_AIM),
	member(AIM, SEELIST),

	'pl-man':entityLocation(EID, X, Y, _), % Retrieve X and Y coordinates to convert them
	newdir(DIR,X,Y,NewX,NewY), 
	'pl-man':useObjectTo(EID, DIR, NewX, NewY), % Use the object (aren't NewX and NewY unnecessary? Anyway, it works)

	( not('pl-man':havingObject(EID, appearance(ITEM_APP))) ->
	  retract(d_itemStatus(EID, _, _, _, armed, _)),
	  assert(d_itemStatus(EID, L_ITEMS, L_AIM, L_DIR, disarmed, _))
	;
	  true
	).
	  
% ---------------

% Control Sequence
companion(EID):-
	retract(d_entityStatus(EID, was_on(X, Y, _), MOVE_NUM, L_MOVES, L_MODIF)),
	p_moveToDo(MOVE, EID, X, Y, MOVE_NUM, L_MOVES, L_MODIF),
	p_convertToAction(MOVE, ACTION, L_MOVES),
	'pl-man':doAction(EID, ACTION),
	p_nextMovement(NEXT_MOVE, MOVE, L_MOVES, L_MODIF),
	'pl-man':entityLocation(EID, NX, NY, NAP),
	assert(d_entityStatus(EID, was_on(NX,NY,NAP), NEXT_MOVE, L_MOVES, L_MODIF)).

% Subrules
%
p_moveToDo(none, _, _, _, MOVE_NUM, L_MOVES, _):-
	not(nth0(MOVE_NUM, L_MOVES, _)), !.
p_moveToDo(PREV, EID, X, Y, MOVE_NUM, L_MOVES, L_MODIF):-
	not(member(no_repeat_moves, L_MODIF)),
	'pl-man':entityLocation(EID, X, Y, _),
	p_previousMovement(PREV, MOVE_NUM, L_MOVES), 
	p_convertToAction(PREV, ACTION, L_MOVES), 
	ACTION \= move(none), !.
p_moveToDo(MOVE_NUM, _, _, _, MOVE_NUM, L_MOVES, _):-
	nth0(MOVE_NUM, L_MOVES, _), !.
p_moveToDo(none, _, _, _, _, _, _).

% calculate which one will be next movement
p_nextMovement(NEXT, PRESENT, L_MOVES, _):-
	NEXT is PRESENT + 1,
	nth0(NEXT, L_MOVES, _), !.
p_nextMovement(NEXT, PRESENT, _, L_MODIF):-
	member(no_cycle, L_MODIF),
	NEXT is PRESENT + 2, !.
p_nextMovement(0, _, _, _).

% calculate previous movement
p_previousMovement(PREV, 0, L_MOVES):-
	length(L_MOVES, P),
	PREV is P - 1, !.
p_previousMovement(PREV, MOVE_NUM, _):-
	PREV is MOVE_NUM - 1.	

% Movement conversion
p_convertToAction(NUM, ACTION, L_MOVES):-
	nth0(NUM, L_MOVES, MOVE),
	p_convertToAction(MOVE, ACTION).
p_convertToAction(r, move(right)).
p_convertToAction(l, move(left)).
p_convertToAction(u, move(up)).
p_convertToAction(d, move(down)).
p_convertToAction(n, move(none)).
p_convertToAction(right, move(right)).
p_convertToAction(left, move(left)).
p_convertToAction(up, move(up)).
p_convertToAction(down, move(down)).
p_convertToAction(none, move(none)).
p_convertToAction(random, X):- p_convertToAction(rand([u,d,l,r,n]), X).
p_convertToAction(rnd, X):- p_convertToAction(rand([u,d,l,r,n]), X).
p_convertToAction(x, X):- p_convertToAction(rand([u,d,l,r,n]), X).
p_convertToAction(x(L), X):- is_list(L), p_convertToAction(rand(L), X).
p_convertToAction(rand(L), ACTION):-
	length(L, LEN),
	X is random(LEN),
	nth0(X, L, CONV), 
	p_convertToAction(CONV, ACTION).

% Subrules to itemStatus
%%Add directions
newdir(up,X,Y,NewX,NewY):- NewX is X, NewY is Y-1. 
newdir(up-right,X,Y,NewX,NewY):- NewX is X+1, NewY is Y-1. 
newdir(up-left,X,Y,NewX,NewY):- NewX is X-1, NewY is Y-1. 
newdir(down,X,Y,NewX,NewY):- NewX is X, NewY is Y+1. 
newdir(down-right,X,Y,NewX,NewY):- NewX is X+1, NewY is Y+1. 
newdir(down-left,X,Y,NewX,NewY):- NewX is X-1, NewY is Y+1. 
newdir(right,X,Y,NewX,NewY):- NewX is X+1, NewY is Y. 
newdir(left,X,Y,NewX,NewY):- NewX is X-1, NewY is Y. 
