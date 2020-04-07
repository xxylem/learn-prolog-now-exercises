append([], L, L).
append([H|T], L2, [H|L3]) :- append(T, L2, L3).

memberA(X, L) :- append(_, [X], FrontHalf), append(FrontHalf, _, L).

set([], []).
set([H|T], OutList) :-
    member(H, T),
    set(T, OutList).
set([H|T], [H|OutList]) :-
    not(member(H, T)),
    set(T, OutList).

% Accumulate version (reverses list but since it's a set presumably order doesn't matter): 
accSet([H|T], A, R) :- 
    member(H, T),
    accSet(T, A, R).
accSet([H|T], A, R) :-
    not(member(H, T)),
    accSet(T, [H|A], R).
accSet([], A, A).
accSetStart(L, R) :- accSet(L, [], R).

flatten([], []).
flatten([[]|T], Flat) :-
    flatten(T, Flat).
flatten([[H|TInner]|T], [H|Flat]) :-
    flatten([TInner|T], Flat).
flatten([H|T], [H|Flat]) :-
    flatten(T, Flat).

accRev([H|T], A, R) :- accRev(T, [H|A], R).
accRev([], A, A).

rev(L, R) :- accRev(L, [], R).

doubled(L) :- append(HalfL, HalfL, L).

palindrome(L) :- rev(L, L).

toptail([_|T], TopTail) :- rev(T, L),
    L = [_|TopTail].

last(L, X) :- rev(L, R),
    R = [X|_].

lastRec([H|[]], H).
lastRec([_|T], X) :- lastRec(T, X).

swapfl([H1|T1], [H2|T2]) :- 
    append(Middle, [H2], T1),
    append(Middle, [H1], T2).

% There is a street with three neighbouring houses that all have a different colour, namely red, blue, and green. People of different nationalities live in the different houses and they all have a different pet. Here are some more facts about them:

% (Hint: Think of a representation for the houses and the street. Code the four constraints in Prolog. You may find member/2 and sublist/2 useful.)

% three nationalities, three colours, three pets

prefix(P, L) :- append(P, _, L).
suffix(S, L) :- append(_, S, L).
sublist(SubL,L):-  suffix(S,L),  prefix(SubL,S).

nationality(english).
nationality(spanish).
nationality(japanese).

colour(red).
colour(blue).
colour(green).

pet(snail).
pet(jaguar).
pet(zebra).

house(N, C, P) :-
    nationality(N),
    colour(C),
    pet(P).

street(House1, House2, House3) :-
    House1 = house(N1, C1, P1),
    House2 = house(N2, C2, P2),
    House3 = house(N3, C3, P3),

    % Selects distinct nationalities, colours, pets.
    dif(N1, N2), dif(N1, N3), dif(N2, N3),
    dif(C1, C2), dif(C1, C3), dif(C2, C3),
    dif(P1, P2), dif(P1, P3), dif(P2, P3),

    % The Englishman lives in the red house.
    member( house(english, red, _), [House1, House2, House3] ),

    % The jaguar is the pet of the Spanish family.
    member( house(spanish, _, jaguar), [House1, House2, House3]),

    % The Japanese lives to the right of the snail keeper.
    sublist([house(_, _, snail), house(japanese, _, _)], [House1, House2, House3]),

    % The snail keeper lives to the left of the blue house.
    sublist([house(_, _, snail), house(_, blue, _)], [House1, House2, House3]).

zebra(N) :- street(house(N, _, zebra), _, _).
zebra(N) :- street(_, house(N, _, zebra), _).
zebra(N) :- street(_, _, house(N, _, zebra)).
