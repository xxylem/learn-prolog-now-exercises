p(1).
p(2) :- !.
p(3).

class(Number, positive) :- Number > 0, !.
class(0, zero) :- !.
class(Number, negative) :- Number < 0.

split([], [], []).
split([X|Xs], [X|Ps], Ns) :-
    X >= 0,
    !,
    split(Xs, Ps, Ns).
split([X|Xs], Ps, [X|Ns]) :-
    X < 0,
    split(Xs, Ps, Ns).

directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

directRoute(A, B) :-
    directTrain(A, B), 
    !. % Avoids recursion.
directRoute(A, B) :-
    directTrain(B, A).

route(A, B, [A, B]) :-
    directRoute(A, B),
    !. % Takes the first route found.
route(A, B, [A|Route]) :-
    directRoute(C, A),
    route(C, B, Route).

loves(vincent, mia).
loves(marsellus, mia).
jealous(X,Y):-
    loves(X,Z),
    loves(Y,Z),
    \+ X = Y.