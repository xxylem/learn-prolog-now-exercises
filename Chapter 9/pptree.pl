multipleArgFunctor(X) :-
    nonvar(X),
    functor(X, _, ACount),
    ACount > 1.

oneArgFunctor(X) :-
    nonvar(X),
    functor(X, _, ACount),
    ACount == 1.

pptree(Tree, Indentation) :-
    multipleArgFunctor(Tree),
    Tree =.. [Functor|Args],
    tab(Indentation),
    write(Functor),
    write('('),
    nl,
    NewIndentation is Indentation + 4,
    pptreeL(Args, NewIndentation),
    write(')').

pptree(Tree, Indentation) :-
    oneArgFunctor(Tree),
    tab(Indentation),
    write(Tree).
    
pptreeL([], _).
pptreeL([H|[]], Indentation) :-
    pptree(H, Indentation).
pptreeL([H|T], Indentation) :-
    pptree(H, Indentation),
    nl,
    pptreeL(T, Indentation).

pptree(Tree) :-
    pptree(Tree, 0).