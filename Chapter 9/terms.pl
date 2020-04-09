complexterm(X) :-
    nonvar(X),
    functor(X, _, A),
    A > 0.

:-  op(500,  xf,  is_dead).

is_dead(_).

termtype(Term, atom) :-
    atom(Term).
termtype(Term, variable) :-
    var(Term).
termtype(Term, constant) :-
    atomic(Term).
termtype(Term, simple_term) :-
    var(Term).
termtype(Term, simple_term) :-
    atomic(Term).
termtype(Term, complex_term) :-
    complexterm(Term).
termtype(_, term).

groundterm(Term) :-
    atomic(Term).
groundterm(Term) :-
    complexterm(Term),
    Term =.. [_|Args],
    groundtermL(Args).

groundtermL([]).
groundtermL([H|T]) :-
    groundterm(H), 
    groundtermL(T).

:-  op(300,  xfx,  [are,  is_a]).
:-  op(300,  fx,  likes).
:-  op(200,  xfy,  and).
:-  op(100,  fy,  famous).

run :-
    write("Hello, world!"), nl,
    write(1 + 3 + 5).
