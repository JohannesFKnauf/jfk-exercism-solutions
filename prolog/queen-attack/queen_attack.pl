create((X, Y)) :- between(0, 7, X), between(0, 7, Y).

attack((_, B), (_, Y)) :- Y = B.
attack((A, _), (X, _)) :- A = X.
attack((A, B), (X, Y)) :- Y - B =:= X - A.
attack((A, B), (X, Y)) :- A - X =:= Y - B.
