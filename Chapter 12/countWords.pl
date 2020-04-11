:- dynamic word/2.

readWord(InStream, W) :-
    get_code(InStream, Char),
    checkCharAndReadRest(Char, Chars, InStream),
    atom_codes(W, Chars).

checkCharAndReadRest(10, [], _) :- !.
checkCharAndReadRest(32, [], _) :- !.
checkCharAndReadRest(-1, [], _) :- !.
checkCharAndReadRest(end_of_file, [], _) :- !.
checkCharAndReadRest(Char, [Char|Chars], InStream) :-
    get_code(InStream, NextChar),
    checkCharAndReadRest(NextChar, Chars, InStream).

readWords(Stream) :-
    at_end_of_stream(Stream),
    !.
readWords(Stream) :-
    \+ at_end_of_stream(Stream),
    readWord(Stream, Word),
    addWordToDatabase(Word),
    readWords(Stream).

addWordToDatabase(Word) :-
    word(Word, Count),
    NewCount is Count + 1,
    retract(word(Word, Count)),
    assert(word(Word, NewCount)),
    !.
addWordToDatabase(Word) :-
    assert(word(Word, 1)).

main :-
    open('bible.txt', read, Stream),
    readWords(Stream),
    close(Stream).