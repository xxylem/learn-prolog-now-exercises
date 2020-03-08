combine1([], [], []).
combine1([X|Xt], [Y|Yt], [X, Y | XYt]) :- combine1(Xt, Yt, XYt).