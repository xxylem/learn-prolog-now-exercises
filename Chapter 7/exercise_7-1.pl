s --> foo, bar, wiggle.
% s(A, B) :- 
    % foo(A, C), 
    % bar(C, D), 
    % wiggle(D, B).

foo --> [choo].
% foo([choo|W], W).
foo --> foo, foo.
% foo(A, B) -> 
%     foo(A, C), 
%     foo(C, B).

bar --> mar, zar.

mar --> me, my.

me --> [i].

my --> [am].

zar --> blar, car.

blar --> [a].

car --> [train].

wiggle --> [toot].
wiggle --> wiggle, wiggle.

