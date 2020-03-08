combine1([], [], []).
combine1([X|Xt], [Y|Yt], [X, Y | XYt]) :- combine1(Xt, Yt, XYt).

combine2([], [], []).
combine2([X|Xt], [Y|Yt], [[X, Y] | XYt]) :- combine2(Xt, Yt, XYt).

combine3([], [], []).
combine3([X|Xt], [Y|Yt], [j(X, Y) | XYt]) :- combine3(Xt, Yt, XYt).