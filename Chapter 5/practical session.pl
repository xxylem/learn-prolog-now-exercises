accMin([H|T], A, Min) :-
    H < A,
    accMin(T, H, Min).
accMin([H|T], A, Min) :-
    H >= A,
    accMin(T, A, Min).

accMin([], A, A).

min(List, X) :- 
    List = [H|_],
    accMin(List, H, X).

scalarMult(_, [], []).
scalarMult(X, [Y|Yt], [R|Rt] ) :-
    R is X * Y,
    scalarMult(X, Yt, Rt).

dot([], [], 0).
dot([X|Xt], [Y|Yt], Result) :-
    Z is X * Y,
    dot(Xt, Yt, Sum),
    Result is Z + Sum.
    