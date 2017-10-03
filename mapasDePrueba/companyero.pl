:-use_module('pl-man-game/main').

rej:- doAction(move(none)).



/*
Utils:

'pl-man':entityLocation(OID, _, _, Ap), % Devuelve X, Y y apariencia del objeto OID
'pl-man':changeEntityAppearance(OID, 'T', Ap). % NewAp, OldAp
'pl-man':changeEntityAppearance(OID, NewAP, NewAtr, NewTC, NewBC).

% Para obtener todos las entidades de una celda, usar "whatYouSee", devuelve primero las entidades con "entityYouCanSee",
% si no hay, llama a getCellContent 
'pl-man':whatYouSee(OID, Map, X, Y, WHAT), 
'pl-man':entityYouCanSee(EID, X, Y, W),
'pl-man':getCellContent(X, Y, Map, WHAT), Dice si es coco o no
*/
