% Lexicon
% lex(Word, Role,   Plurality,  Position).
lex(the,    det,    _,          _).
lex(a,      det,    singular,   _).
lex(woman,  n,      singular,   _).
lex(women,  n,      plural,     _).
lex(man,    n,      singular,   _).
lex(men,    n,      plural,     _).
lex(shoots, v,      singular,   _).
lex(shoot,  v,      plural,     _).
lex(he,     pro,    singular,   subject).
lex(him,    pro,    singular,   object).
lex(she,    pro,    singular,   subject).
lex(her,    pro,    singular,   object).

% Rules
s(s(NP, VP)) --> np(NP, subject, Plurality), vp(VP, Plurality).

np(np(DET, N), Position, Plurality) --> 
    det(DET, Plurality), 
    n(N, Position, Plurality).

vp(vp(V, NP), VerbPlurality) --> 
    v(V, VerbPlurality), 
    % The noun phrase can have a different plurality,
    % the plurality of the verb refers back to the noun in
    % subject position.
    np(NP, object, _). 
vp(vp(V), VerbPlurality) --> v(V, VerbPlurality).

det(det(Word), Plurality) --> 
    [Word], {lex(Word, det, Plurality, _)}.

n(n(Word), Position, Plurality) --> 
    [Word], {lex(Word, n, Plurality, Position)}.

v(v(Word), Plurality) --> 
    [Word], {lex(Word, v, Plurality, _)}.

% Example trace to find all parse trees:
% 2 ?- s(T, L, []).
% T = s(np(det(the), n(woman)), vp(v(shoots), np(det(the), n(woman)))),
% L = [the, woman, shoots, the, woman] ;
% T = s(np(det(the), n(woman)), vp(v(shoots), np(det(the), n(women)))),
% L = [the, woman, shoots, the, women] ;
% T = s(np(det(the), n(woman)), vp(v(shoots), np(det(the), n(man)))),
% L = [the, woman, shoots, the, man] ;
% T = s(np(det(the), n(woman)), vp(v(shoots), np(det(the), n(men)))),
% L = [the, woman, shoots, the, men] ;
% T = s(np(det(the), n(woman)), vp(v(shoots), np(det(a), n(woman)))),
% L = [the, woman, shoots, a, woman] ;
% T = s(np(det(the), n(woman)), vp(v(shoots), np(det(a), n(man)))),
% L = [the, woman, shoots, a, man] ;
% T = s(np(det(the), n(woman)), vp(v(shoots))),
% L = [the, woman, shoots] ;
% T = s(np(det(the), n(women)), vp(v(shoot), np(det(the), n(woman)))),
% L = [the, women, shoot, the, woman] ;
% T = s(np(det(the), n(women)), vp(v(shoot), np(det(the), n(women)))),
% L = [the, women, shoot, the, women] ;
% T = s(np(det(the), n(women)), vp(v(shoot), np(det(the), n(man)))),
% L = [the, women, shoot, the, man] ;
% T = s(np(det(the), n(women)), vp(v(shoot), np(det(the), n(men)))),
% L = [the, women, shoot, the, men] ;
% T = s(np(det(the), n(women)), vp(v(shoot), np(det(a), n(woman)))),
% L = [the, women, shoot, a, woman] ;
% T = s(np(det(the), n(women)), vp(v(shoot), np(det(a), n(man)))),
% L = [the, women, shoot, a, man] ;
% T = s(np(det(the), n(women)), vp(v(shoot))),
% L = [the, women, shoot] ;
% T = s(np(det(the), n(man)), vp(v(shoots), np(det(the), n(woman)))),
% L = [the, man, shoots, the, woman] ;
% T = s(np(det(the), n(man)), vp(v(shoots), np(det(the), n(women)))),
% L = [the, man, shoots, the, women] ;
% T = s(np(det(the), n(man)), vp(v(shoots), np(det(the), n(man)))),
% L = [the, man, shoots, the, man] ;
% T = s(np(det(the), n(man)), vp(v(shoots), np(det(the), n(men)))),
% L = [the, man, shoots, the, men] ;
% T = s(np(det(the), n(man)), vp(v(shoots), np(det(a), n(woman)))),
% L = [the, man, shoots, a, woman] ;
% T = s(np(det(the), n(man)), vp(v(shoots), np(det(a), n(man)))),
% L = [the, man, shoots, a, man] ;
% T = s(np(det(the), n(man)), vp(v(shoots))),
% L = [the, man, shoots] ;
% T = s(np(det(the), n(men)), vp(v(shoot), np(det(the), n(woman)))),
% L = [the, men, shoot, the, woman] ;
% T = s(np(det(the), n(men)), vp(v(shoot), np(det(the), n(women)))),
% L = [the, men, shoot, the, women] ;
% T = s(np(det(the), n(men)), vp(v(shoot), np(det(the), n(man)))),
% L = [the, men, shoot, the, man] ;
% T = s(np(det(the), n(men)), vp(v(shoot), np(det(the), n(men)))),
% L = [the, men, shoot, the, men] ;
% T = s(np(det(the), n(men)), vp(v(shoot), np(det(a), n(woman)))),
% L = [the, men, shoot, a, woman] ;
% T = s(np(det(the), n(men)), vp(v(shoot), np(det(a), n(man)))),
% L = [the, men, shoot, a, man] ;
% T = s(np(det(the), n(men)), vp(v(shoot))),
% L = [the, men, shoot] ;
% T = s(np(det(a), n(woman)), vp(v(shoots), np(det(the), n(woman)))),
% L = [a, woman, shoots, the, woman] ;
% T = s(np(det(a), n(woman)), vp(v(shoots), np(det(the), n(women)))),
% L = [a, woman, shoots, the, women] ;
% T = s(np(det(a), n(woman)), vp(v(shoots), np(det(the), n(man)))),
% L = [a, woman, shoots, the, man] ;
% T = s(np(det(a), n(woman)), vp(v(shoots), np(det(the), n(men)))),
% L = [a, woman, shoots, the, men] ;
% T = s(np(det(a), n(woman)), vp(v(shoots), np(det(a), n(woman)))),
% L = [a, woman, shoots, a, woman] ;
% T = s(np(det(a), n(woman)), vp(v(shoots), np(det(a), n(man)))),
% L = [a, woman, shoots, a, man] ;
% T = s(np(det(a), n(woman)), vp(v(shoots))),
% L = [a, woman, shoots] ;
% T = s(np(det(a), n(man)), vp(v(shoots), np(det(the), n(woman)))),
% L = [a, man, shoots, the, woman] ;
% T = s(np(det(a), n(man)), vp(v(shoots), np(det(the), n(women)))),
% L = [a, man, shoots, the, women] ;
% T = s(np(det(a), n(man)), vp(v(shoots), np(det(the), n(man)))),
% L = [a, man, shoots, the, man] ;
% T = s(np(det(a), n(man)), vp(v(shoots), np(det(the), n(men)))),
% L = [a, man, shoots, the, men] ;
% T = s(np(det(a), n(man)), vp(v(shoots), np(det(a), n(woman)))),
% L = [a, man, shoots, a, woman] ;
% T = s(np(det(a), n(man)), vp(v(shoots), np(det(a), n(man)))),
% L = [a, man, shoots, a, man] ;
% T = s(np(det(a), n(man)), vp(v(shoots))),
% L = [a, man, shoots] ;