create((X, Y)) :- between(0, 7, X), between(0, 7, Y).

attack((A, B), (X, Y)) :- create((A, B)), 
                          create((X, Y)), 
                          (Y = B;
                           A = X;
                           abs(Y - B) =:= abs(X - A)).
