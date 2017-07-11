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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mine
%
% Implements the behaviour of a programable mine, that 
% while explode some cycles after it is dropped in
% some place.
%
% Includes the sub-behaviours
%	explosion
%
% Initialization
%--------------------
%  mine(init, OID, TIME, WAVE, L_PARAMS):-
%    OID:  Identifier of the mine object
%    TIME: Cycles before the mine explodes since it is dropped
%    WAVE: Size (in chars) of the radious of the expansive wave
%    L_PARAMS: Params to control the way the mine behaves
%        no_destroy(L_EX): objects or entities that will survive
%		to the explosion of the mine
%
% Example
%--------------------
%   createGameEntity(OID_MINE, '+', object, 5, 2, active, mine, 
%	            [name(mine), solid(false), static(false), use_rule(norule), description('programmable mine'))]), 
%   mine(init, OID_MINE, 2, 1, [ no_destroy(['.']) ]).
%
% Creates a mine that will explode when two cycles of
% execution have passed since the mine has been dropped.
% The explosionAle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-module(quimicBomb, [quimicBomb/1, quimicBomb/6, gas/1, gas/5]).
:-dynamic d_quimicBombStatus/6. %---mineStatus
:-dynamic d_gasStatus/4. %---explosionStatus

%%%
%%% Quimic Bomb Initialization
%%%
%

quimicBomb(init,OID,TIME,WAVE,GAS_TIME,L_PARAMS):-
	integer(OID),
	integer(TIME), TIME >= 1, 
	integer(WAVE), WAVE >= 0,
	integer(GAS_TIME), GAS_TIME >= 1, 
	is_list(L_PARAMS),
	retractall(d_quimicBombStatus(OID, _,_,_,_,_)),
	assert(d_quimicBombStatus(OID, ready, TIME, WAVE, GAS_TIME, L_PARAMS)), !.

%Initialization error message
quimicBomb(init, OID, _, _, _, _):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).

%%%
%%% quimic bomb behaviour
%%%

%%Si la bomba está acabada, no debe de hacer nada.
quimicBomb(OID):-
	d_quimicBombStatus(OID, finished, _, _, _, _).


%% Si la bomba ha sido activada, explota (se pone un * encima y pasa a ser atravesable)
quimicBomb(OID):-
	d_quimicBombStatus(OID, activated, TIME, WAVE, GAS_TIME, L_PARAMS),!,

	%% Se coge la localización de la bomba
	'pl-man':entityLocation(OID, X, Y, _),

	%% Verificamos qué objeto hay colocado en el mapa para dibujar el gas según lo que haya
  'pl-man':getDMap(Map),
  'pl-man':getCellContent(X, Y, Map, WHAT),	

	%% Los 3 ifs que determinan el dibujo del gas
	(WHAT == '.' -> Format = '*' , App = [appearance(attribs(bold, yellow, red))] 
	; (WHAT == ' '-> Format = '˞' ,  App = [appearance(attribs(bold, white, red))]
	; Format = '~' ,  App = [appearance(attribs(bold, blue, red))])), 
	
	%% Creación del gas inicial
  'pl-man':createGameEntity(GAS_ID, Format, mortal, X, Y, active, gas, App),

	%%Inicialización del gas inicial
  gas(init, GAS_ID, GAS_TIME, WAVE, L_PARAMS), !,

	%%Dejamos la bomba química en un estado inerte
	retract(d_quimicBombStatus(OID, _,_,_,_,_)),
	assert(d_quimicBombStatus(OID, finished, TIME, WAVE, GAS_TIME, L_PARAMS)), !.


%% Si el tiempo llega a 0, activa la bomba y explota en el siguiente turno
quimicBomb(OID):-

	%% Cogemos el estado actual, y si el tiempo es 0 se actualiza a activado
	d_quimicBombStatus(OID,ready, TIME, WAVE, GAS_TIME, L_PARAMS),
	TIME=0,!,

	%% Actualizamos el estado activado
	maplist(user:write, ['Paso a activated', '\n']),
	retract(d_quimicBombStatus(OID, _,_,_,_,_)),
	assert(d_quimicBombStatus(OID, activated, TIME, WAVE, GAS_TIME, L_PARAMS)), !.


%% Renueva el tiempo cogiendo el estado actual, le resta 1 al tiempo, y lo vuelve a guardar el estado
quimicBomb(OID):-	
	
	%%Verifica que estamos en ready y reduce en -1 su tiempo
	retract(d_quimicBombStatus(OID,ready, TIME, WAVE, GAS_TIME, L_PARAMS)),!,
	NEWTIME is TIME-1,

	%%Mensaje de ciclos de explosión		
	'pl-man':lang_message(quimicBomb, cicles_left_for_explosion, MSGMINE),
	maplist(user:write, [MSGMINE, TIME, '\n']),

	%Actualizamos el estado del tiempo
	assert(d_quimicBombStatus(OID, ready, NEWTIME, WAVE, GAS_TIME, L_PARAMS)), !.


% Quimic bomb init error
quimicBomb(OID):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_incorrect_instantiation, MSG),
	maplist(user:write, [MSG, OID, '\n']).


%%%
%%% Gas Initialization
%%%

%%Gas parameters
gas(init, OID, GAS_TIME, WAVE, L_PARAMS):-
	integer(OID),
	integer(GAS_TIME), GAS_TIME >= 1,
	is_list(L_PARAMS),
	retractall(d_gasStatus(OID, _, _, _)),
        %%---explosion(add_explosion, OID),
	assert(d_gasStatus(OID, GAS_TIME, WAVE, L_PARAMS)), !.

%%gas init error message
gas(init, OID, _, _, _):-
        'pl-man':lang_message(quimicBomb, quimic_bomb_bad_parameters, MSG),
	maplist(user:write, [MSG, OID, '\n']).

%%%
%%% Gas behaviour
%%%

%Gas dies when its life time is 0
gas(OID):-
	d_gasStatus(OID, GAS_TIME, _, _), 
	GAS_TIME=0,
	'pl-man':destroyGameEntity(OID),!.

%Gas still on the map,
gas(OID):-
	retract(d_gasStatus(OID, GAS_TIME, WAVE, L_PARAMS)), 

	%Updating life-time of gas and expansive ratio
	NEWTIME is GAS_TIME-1,
	NEW_WAVE is WAVE-1,

	assert(d_gasStatus(OID, NEWTIME, NEW_WAVE, L_PARAMS)),!,

	%Creating children
	(
		WAVE>0 -> 

		%for every nearby position, we check if we can create a gas

	
	forall(
		(member(Dir, [up,down,right,left,up-right,up-left,down-right,down-left])),
		(
				%Dir = right,

				%We see where the object will be placed
				'pl-man':see(OID,normal,Dir,What),
		    'pl-man':entityLocation(OID, X, Y, _),
				newdir(Dir,X,Y,NewX,NewY),


				%Checking location
				/*(
				'pl-man':entityLocation(OID_NEXT, NewX, NewY, _) 
					->
				not('pl-man':solidEntity(OID_NEXT)) 
				),!,*/
%maplist(user:write, ["EH que peta la direccion: ", Dir, ' en la pos ',X,' - ',Y, ' ----- ',NewX,' - ',NewY,'\n']),!,
			%%%%%%%%%%%PROVISIONAL%%%%%%%%%%%%%%%%%%%%%%%%
				(not(member(What,['#','~','*','˞'])) ->
	

			
		  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

				%% Los 3 ifs que determinan el dibujo del gas
				(What = '.' -> Format = '*' , App = [appearance(attribs(bold, yellow, red))] 
				; (What = ' '-> Format = '˞' ,  App = [appearance(attribs(bold, white, red))]
				; Format = '~' ,  App = [appearance(attribs(bold, blue, red))]
					)
				), 
	
				%% Creating the gas entity
				'pl-man':createGameEntity(GAS_ID, Format, mortal, NewX, NewY, active, gas, App),

				%Adding +1 on the new_time, so it generates an object with the same life-span
				NEW_TIME is NEWTIME+1,

				%%Initializing gas
				gas(init, GAS_ID, NEW_TIME, NEW_WAVE, L_PARAMS), !
				;
				true
				)
			)
		)	
	).

	



%%Add directions
newdir(up,X,Y,NewX,NewY):- NewX is X, NewY is Y-1. 
newdir(up-right,X,Y,NewX,NewY):- NewX is X+1, NewY is Y-1. 
newdir(up-left,X,Y,NewX,NewY):- NewX is X-1, NewY is Y-1. 
newdir(down,X,Y,NewX,NewY):- NewX is X, NewY is Y+1. 
newdir(down-right,X,Y,NewX,NewY):- NewX is X+1, NewY is Y+1. 
newdir(down-left,X,Y,NewX,NewY):- NewX is X-1, NewY is Y+1. 
newdir(right,X,Y,NewX,NewY):- NewX is X+1, NewY is Y. 
newdir(left,X,Y,NewX,NewY):- NewX is X-1, NewY is Y. 








