:- use_module(dcg, [s/3]).
:- use_module(pptree, [pptree/2]).



test(S, F) :-
    s(T, S, []),
    open(F, write, Stream),
    write(Stream, S), nl(Stream),
    pptree(Stream, T),
    close(Stream),
    !.
test(S, F) :-
    \+ s(_, S, []),
    open(F, write, Stream),
    write(Stream, S), nl(Stream),
    write(Stream, no),
    close(Stream).