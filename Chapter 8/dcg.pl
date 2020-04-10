% Lexicon (presumably there is a better way to do this, this is basically all relational tables joined into one big table.)
% lex(Word,     Role,   Plurality,  Position,   Person,     AdjType).
lex(the,        det,    _,          _,          _,          _).
lex(a,          det,    singular,   _,          _,          _).

lex(woman,      n,      singular,   _,          _,          _).
lex(women,      n,      plural,     _,          _,          _).
lex(man,        n,      singular,   _,          _,          _).
lex(men,        n,      plural,     _,          _,          _).
lex(shower,     n,      singular,   _,          _,          _).
lex(showers,    n,      plural,     _,          _,          _).
lex(table,      n,      singular,   _,          _,          _).
lex(tables,     n,      plural,     _,          _,          _).

lex(shoots,     v,      singular,   _,          third,      _).
lex(shoot,      v,      Plurality,  _,          Person,     _) :-
    Plurality = singular, \+ Person = third.
lex(shoot,      v,      _,          _,          _,          _).

lex(i,          pro,    singular,   subject,    first,      _).
lex(me,         pro,    singular,   object,     first,      _).
lex(we,         pro,    plural,     subject,    first,      _).
lex(us,         pro,    plural,     object,     first,      _).
lex(you,        pro,    _,          _,          second,     _).
lex(he,         pro,    singular,   subject,    third,      _).
lex(him,        pro,    singular,   object,     third,      _).
lex(she,        pro,    singular,   subject,    third,      _).
lex(her,        pro,    singular,   object,     third,      _).
lex(it,         pro,    singular,   _,          third,      _).
lex(they,       pro,    plural,     subject,    third,      _).
lex(them,       pro,    plural,     object,     third,      _).

lex(big,        adj,    _,          _,          _,          size).
lex(fat,        adj,    _,          _,          _,          descriptive).
lex(small,      adj,    _,          _,          _,          size).
lex(frightened, adj,    _,          _,          _,          descriptive).

lex(under,      p,      _,          _,          _,          _).
lex(on,        p,      _,          _,          _,          _).

% Rules (presumably these should be able to recurse infinitely, but I have just defined a few finite ones for now.)
s(s(NP, VP, PP)) --> np(NP, Plurality, subject, Person), vp(VP, Plurality, Person), pp(PP, Plurality, Person).
s(s(NP, VP)) --> np(NP, Plurality, subject, Person), vp(VP, Plurality, Person). % Is there a better way to say something is optional?

np(np(DET, AP, N), Plurality, _, _) --> 
    det(DET, Plurality),
    ap(AP),
    n(N, Plurality).
np(np(PRO), Plurality, Position, Person) -->
    pro(PRO, Plurality, Position, Person).

vp(vp(V, NP), VerbPlurality, Person) --> 
    v(V, VerbPlurality, Person), 
    % The noun phrase can have a different plurality,
    % the plurality of the verb refers back to the noun in
    % subject position.
    np(NP, _, object, _). 
vp(vp(V), VerbPlurality, Person) --> v(V, VerbPlurality, Person).

pp(pp(P, NP), Plurality, Person) -->
    p(P),
    np(NP, Plurality, object, Person).

ap(ap(ADJ_SIZE, ADJ_DESCRIPTIVE)) -->
    adj(ADJ_SIZE, size),
    adj(ADJ_DESCRIPTIVE, descriptive).

ap(ap(ADJ_DESCRIPTIVE)) -->
    adj(ADJ_DESCRIPTIVE, descriptive).

ap(ap(ADJ_SIZE)) -->
    adj(ADJ_SIZE, size).

det(det(Word), Plurality) --> 
    [Word], {lex(Word, det, Plurality, _, _, _)}.

n(n(Word), Plurality) --> 
    [Word], {lex(Word, n, Plurality, _, _, _)}.

pro(pro(Word), Plurality, Position, Person) -->
    [Word], {lex(Word, pro, Plurality, Position, Person, _)}.

adj(adj(Word), AdjType) -->
    [Word], {lex(Word, adj, _, _, _, AdjType)}.

v(v(Word), Plurality, Person) --> 
    [Word], {lex(Word, v, Plurality, _, Person, _)}.

p(p(Word)) -->
    [Word], {lex(Word, p, _, _, _, _)}.