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
% Quimic Bomb
%
% Implements the behaviour of a programable Quimic Bomb, that 
% while liberate the gas some cycles of time, and the gas spreads
% the area you want it to expand avoinding select objects
%
% Includes the sub-behaviours
%	gas
%
% Initialization
%--------------------
%  quimicBomb(init, OID, TIME, WAVE,GAS_TIME, L_PARAMS):-
%    OID:  Identifier of the quimic bomb object
%    TIME: Cycles before the gas is released
%    WAVE: Size (in chars) of the radious of the expansive wave of the gas
%		 GAS_TIME: Time the gas exists on its position after being on it
%    L_PARAMS: for later use
%
% Example
%--------------------
%   createGameEntity(OID_QB, 'Ǒ', object, 5, 2, active, quimicBomb, 
%	            [name(mine), solid(false), static(false), use_rule(norule), description('programmable mine'))]), 
%   quimicBomb(init, OID_MINE, 2, 2, 5 [ no_destroy(['.']) ]).
%
% Creates a quimic bomb that will spread the gas when two cycles of
% execution have passed, the radius the gas will spread is 2
% squares in every direction from the quimic bomb, and it will last 5 cycles
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

%% Si la bomba está acabada, no debe de hacer nada.
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
  'pl-man':createGameEntity(GAS_ID, Format, object, X, Y, active, gas, App), %% MÁSCARA GAS (object por mortal)

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
	%

	% Añadido para la máscara de gas
	'pl-man':entityType(PACMANID, pacman),
	'pl-man':entityLocation(OID, X, Y, _),
	( 'pl-man':entityLocation(PACMANID, X, Y, _) ->
	  ( not('pl-man':havingObject(PACMANID, name(mascara_gas))) ->
     	% maplist(user:write, ['PLMAN Ha olido gas en (', X, ',', Y, '), sufrirá una muerte lenta y dolorosa \n']),		
		'pl-man':playerStats(set(game_status(finished)))
		; 
 	  	true
	  )
	  ;
	  true 
	),

	%% Los 3 ifs que determinan el dibujo del gas (actualización)
		'pl-man':entityLocation(OID, _, _, Ap),
		'pl-man':see(OID,normal,here, WHAT),
		(WHAT = '.' -> CHARACTER = '*', NewAtr = bold, NewTC = yellow, NewBC = red 
		; 
		  (WHAT = ' ' -> CHARACTER = '˞', NewAtr = bold, NewTC = white, NewBC = red
		  ; 
			(WHAT = '@' -> CHARACTER = '·', NewAtr = bold, NewTC = white, NewBC = red
		      ; CHARACTER = '~', NewAtr = bold, NewTC = magenta, NewBC = red
		    )
		  )
		),
		'pl-man':changeEntityAppearance(OID, CHARACTER, NewAtr, NewTC, NewBC),

	%
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
				(not(member(What,['#','~','*','˞','·'])) ->
	

			
		  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

				%% Los 4 ifs que determinan el dibujo del gas
				(What = '.' -> Format = '*' , App = [appearance(attribs(bold, yellow, red))] 
				; 
				  (What = ' '-> Format = '˞' ,  App = [appearance(attribs(bold, white, red))]
				  ; 
					(What = '@' -> Format = '·', App = [appearance(attribs(bold,white,red))]
		      		  ; Format = '~' ,  App = [appearance(attribs(bold, magenta, red))]
		    		)
				  )
				), 
	
				%% Creating the gas entity
				'pl-man':createGameEntity(GAS_ID, Format, object, NewX, NewY, active, gas, App), %% CAMBIO MÁSCARA (object por mortal)

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








