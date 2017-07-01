sumatorio(1,1):-!.
sumatorio(N,S):-N1 is N-1,
								sumatorio(N1,S1),
								S is N+S1.
%prueba(X,N):- sumatorio(N,0).
algo(Y,X):- X>10, Y = x.
algo(x,X):- X > 10.
