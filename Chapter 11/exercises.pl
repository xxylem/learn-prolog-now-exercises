q(blob,blug).
q(blob,blag).
q(blob,blig).
q(blaf,blag).
q(dang,dong).
q(dang,blug).
q(flab,blob).

:- dynamic sigmares/2.

sigma(1, 1).
sigma(X, Y) :-
    sigmares(X, Y),
    !.
sigma(X, Y) :-
    PredX is X - 1,
    sigma(PredX, Res),
    Y is Res + X,
    assert(sigmares(X, Y)),
    !.

subset([], []).
subset([H|Res],  [H|T]) :-
    subset(Res, T).
subset(Res,  [_|T]) :-
    subset(Res, T).

powerset(S, P) :-
    findall(SS, subset(SS, S), P).