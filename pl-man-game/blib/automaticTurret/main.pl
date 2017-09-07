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
% automaticTurret
%
% Creates an object that automatically shots bullets
% to kill entities. 
%
% Initialization
%--------------------
%  automaticTurret(init, OID, L_AIM, L_DIR, DELAY, L_PARAMS):-
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
:- module(automaticTurret, [automaticTurret/1, automaticTurret/6]).
:- dynamic d_automaticTurretStatus/6, d_MortalEntity/3.

%%%
%%% Initialization
%%%
% init a turret
automaticTurret(init, OID, L_AIM, L_DIR, DELAY, L_PARAMS):-
	integer(OID),
	integer(DELAY), DELAY >= 0, 
	is_list(L_AIM),
	is_list(L_DIR),
	length(L_DIR,LENGTH), LENGTH > 0,
	is_list(L_PARAMS),
	
	correctListMembers(L_DIR, [up,down,left,right]), %% Checks if the list has valid directions
	
	(member(randomFirstShot, L_PARAMS), CYCLESPASSED is random(DELAY)+1 ; CYCLESPASSED is DELAY),
	retractall(d_automaticTurretStatus(OID, _, _, _, _, _)),
	assert(d_automaticTurretStatus(OID, L_AIM, L_DIR, DELAY, L_PARAMS, CYCLESPASSED)), !.
	
automaticTurret(init, OID, _, _, _, _):-
    	'pl-man':lang_message(automaticTurret, bad_parameters, MSG),
	maplist(user:write, [MSG, OID, ')\n']).

% Aux predicate
correctListMembers([],_).
correctListMembers([H|T], LIST):-
	member(H,LIST),
	correctListMembers(T, LIST).

%%%
%%% Control
%%%


% Destroy a mortal entity if it remains in the map (by the turret that created it)
automaticTurret(OID):-
  d_MortalEntity(OID,EID,COMMAND),  
  COMMAND = destroy,
  retract(d_MortalEntity(_, _, _)), % Retract ONLY the state of this turret, not all (retractall)
  'pl-man':destroyGameEntity(EID).


% Cannot shot while in delay from previous shot
automaticTurret(OID):-
	d_automaticTurretStatus(OID, _, _, MAX_DELAY, _, CYCLESPASSED),
	CYCLESPASSED < MAX_DELAY,
	NEWCYCLES is CYCLESPASSED + 1,
	% Cuando la torreta esté lista para disparar, se vuelve verde
	( NEWCYCLES = MAX_DELAY -> 'pl-man':changeEntityAppearance(OID, _, bold, green, _)
	  ; true
	),
	retract(d_automaticTurretStatus(OID, L_AIM, DIR, DELAY, L_PARAMS, _)),
	assert(d_automaticTurretStatus(OID, L_AIM, DIR, DELAY, L_PARAMS, NEWCYCLES)), !.	

% Check if we have to shot
automaticTurret(OID):-
	d_automaticTurretStatus(OID, L_AIM, L_DIR, _, _, _),	
	member(DIR,L_DIR),
	'pl-man':see(OID, list, DIR, SEELIST),
	member(AIM, L_AIM),
	member(AIM, SEELIST),
	
	retract(d_automaticTurretStatus(OID, L_AIM, L_DIR, DELAY, L_PARAMS, _)),
	assert(d_automaticTurretStatus(OID, L_AIM, L_DIR, DELAY, L_PARAMS, 0)), % Time to recharge
	
	% If shoots plman, game ends (plman dies)
	( AIM = '@' -> 
	  'pl-man':entityType(PacID, pacman), 
	  'pl-man':entityLocation(PacID, X, Y, _), % Gets where pacman is
	  
	  'pl-man':getDMap(Map),
	  
		( ('pl-man':whatYouSee(OID, Map, X, Y, WHAT), WHAT \= '@') % Gets all entities where pacman is (that aren't @)				
			 -> 
			'pl-man':entityLocation(NEW_EID, X, Y, WHAT), % Gets the EID of the entity
			'pl-man':changeEntityAppearance(NEW_EID, WHAT, OldAtr, OldTC, OldBC), % Gets entity appearance to create it over plman
			NewApp = WHAT                
			
			;
			
			'pl-man':getCellContent(X, Y, Map, NewApp), OldAtr = normal, OldTC = default, OldBC = default
		),
	  
	  % Create a mortal entity under plman, making him die (but he actually died due to the turret)
	  'pl-man':createGameEntity(EID_WHAT, NewApp, mortal, X, Y, active, entitySequentialMovement, [appearance(attribs(OldAtr, OldTC, OldBC))]),
		'pl-man':entitySequentialMovement(init, EID_WHAT, [n], []),
	
		% The entity must be destroyed in next step (by OID turret)
		assert(d_MortalEntity(OID, EID_WHAT, destroy))
	  	 
	  ;

		nth0(DIST, SEELIST, AIM),
		'pl-man':entityLocation(OID, X, Y, _), % Obtiene X e Y de la torreta
		AUX_DIST is DIST+1,
		p_calculateEntityXY(DIR, AUX_DIST, X, Y, EX, EY),
		'pl-man':entityLocation(DEST_EID,EX,EY,AIM),

		'pl-man':createGameEntity(EID_EXPLOSION, '*', mortal, EX, EY, active, entitySequentialMovement, [appearance(attribs(normal, red, yellow))]), % Creates an "explosion" where the entity died
		'pl-man':entitySequentialMovement(init, EID_EXPLOSION, [n], []),
		
		% The explosion must be destroyed in next step (by the turret that created it)
		assert(d_MortalEntity(OID, EID_EXPLOSION, destroy)),

		'pl-man':destroyGameEntity(DEST_EID), !
	
	),

	% Cambia la apariencia de la torreta para que mire hacia donde dispara. Además, al disparar se sobrecarga (se pone roja)

	( DIR = up -> APP = '┴'
		; ( DIR = down -> APP = 'T'
		    ; ( DIR = left -> APP ='˧'
		        ; APP = '˫'
		      )
		  )
	),
	'pl-man':changeEntityAppearance(OID, _, _, _, OldBC), % Don't change background color
	'pl-man':changeEntityAppearance(OID, APP, bold, red, OldBC), !. % Change turret appearance as it was overheated


% init error
automaticTurret(OID):-
	not(d_automaticTurretStatus(OID, _, _, _, _, _)),
        'pl-man':lang_message(automaticTurret, incorrect_instantiation, MSG),
	maplist(user:write, ['(', OID, '): ', MSG, '\n']).
	
% Calculate X,Y location of the entity we are seeing
p_calculateEntityXY(left, DIST, X, Y, NX, Y):- NX is X-DIST.
p_calculateEntityXY(right, DIST, X, Y, NX, Y):- NX is X+DIST.
p_calculateEntityXY(up, DIST, X, Y, X, NY):- NY is Y-DIST.
p_calculateEntityXY(down, DIST, X, Y, X, NY):- NY is Y+DIST.
	
	
	
