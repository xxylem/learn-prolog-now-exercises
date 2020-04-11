:- module(pptree, [pptree/2]).

multipleArgFunctor(X) :-
    nonvar(X),
    functor(X, _, ACount),
    ACount > 1.

oneArgFunctor(X) :-
    nonvar(X),
    functor(X, _, ACount),
    ACount == 1.

pptree(Stream, Tree, Indentation) :-
    multipleArgFunctor(Tree),
    Tree =.. [Functor|Args],
    tab(Stream, Indentation),
    write(Stream, Functor),
    write(Stream, '('),
    nl(Stream),
    NewIndentation is Indentation + 4,
    pptreeL(Stream, Args, NewIndentation),
    write(Stream, ')').

pptree(Stream, Tree, Indentation) :-
    oneArgFunctor(Tree),
    tab(Stream, Indentation),
    write(Stream, Tree).
    
pptreeL(_, [], _).
pptreeL(Stream, [H|[]], Indentation) :-
    pptree(Stream, H, Indentation).
pptreeL(Stream, [H|T], Indentation) :-
    pptree(Stream, H, Indentation),
    nl(Stream),
    pptreeL(Stream, T, Indentation).

pptree(Stream, Tree) :-
    pptree(Stream, Tree, 0).
