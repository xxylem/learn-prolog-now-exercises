append([], L, L).
append([H|T], L2, [H|L3]) :- append(T, L2, L3).

prefix(P, L) :- append(P, _, L).

suffix(S, L) :- append(_, S, L).

sublist(SubL, L) :- suffix(S, L), prefix(SubL, S).

naiverev([], []).
naiverev([H|T], R) :- naiverev(T, RevT), append(RevT, [H], R).

accRev([H|T], A, R) :- accRev(T, [H|A], R).
accRev([], A, A).

rev(L, R) :- accRev(L, [], R).