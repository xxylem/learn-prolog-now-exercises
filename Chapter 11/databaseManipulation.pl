:- dynamic lookup/3.

add_and_square(X, Y, Res) :-
    lookup(X, Y, Res), !.

add_and_square(X, Y, Res) :-
    Res is (X + Y) * (X + Y),
    assert(lookup(X, Y, Res)).

child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).

descend(X,Y)  :-  child(X,Y).

descend(X,Y)  :-  child(X,Z),
                    descend(Z,Y).

age(harry,13).
age(draco,14).
age(ron,13).
age(hermione,13).
age(dumbledore,60).
age(hagrid,30).