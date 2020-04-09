s --> np(X), vp(X).

np(X) --> det(X), n(X).

vp(X) --> v(X), np(_).
vp(X) --> v(X).

det(_) --> [the].
det(singular) --> [a].
det(plural) --> [].

n(singular) --> [woman].
n(plural) --> [women].
n(singular) --> [man].
n(plural) --> [men].
n(singular) --> [pear].
n(plural) --> [pears].

v(singular) --> [eats].
v(plural) --> [eat].


% kanga(V, R, Q) --> roo(V, R),
%     jumps(Q, Q),
%     {marsupial(V, R, Q)}.
% kanga(V, R, Q, A, B) :-
%     roo(V, R, A, C),
%     jumps(Q, Q, C, B),
%     marsupial(V, R, Q).