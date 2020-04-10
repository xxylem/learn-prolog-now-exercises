nu1(X, Y) :-
    \+ X = Y.

nu2(X, Y) :-
    X \= Y.

nu3(X, X) :-
    !,
    fail.
nu3(_, _).

unifiable([], _, []).
unifiable([X|Xs], Term, [X|Rest]) :-
    \+ \+ X = Term,
    unifiable(Xs, Term, Rest),
    !.
unifiable([_|Xs], Term, Rest) :-
    unifiable(Xs, Term, Rest).