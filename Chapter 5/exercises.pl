increment(X, Y) :- Y is X + 1.
sum(X, Y, Z) :- Z is X + Y.

addone([], []).
addone([X|Xt], [Y|Yt]) :- Y is X + 1, addone(Xt, Yt).