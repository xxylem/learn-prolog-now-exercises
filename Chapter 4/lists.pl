member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

a2b([], []).
a2b([a|Ta], [b|Tb]) :- a2b(Ta, Tb).

second(X, [_, X|_]).

swap12([X, Y|T], [Y, X|T]).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([], []).
listtran([G|Gt], [E|Et]) :- tran(G, E),
                             listtran(Gt, Et).

twice([], []).
twice([X|Xt], [X, X | XXt]) :- twice(Xt, XXt).