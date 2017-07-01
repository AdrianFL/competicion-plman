%Apuntes: ESte hombre es dios.
%Me ha enseñado que si un archivo no tiene permisos, se los tengo que dar
%Y eso pasa porque en el USB no tengo, y al pasarlos al escritorio se queda con esa configuración, entonces la solución es coger y escribir:
% chmod +x plman (Para hacérselo a la carpeta/archivo plman). Ya con eso me va a funcionar siempre. Que puto pro.
% Fichero de prueba de pl-man
:- use_module('pl-man-game/main').
mi_regla:- doAction(move(right)).

