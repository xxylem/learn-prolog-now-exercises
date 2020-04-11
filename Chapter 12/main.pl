:-  use_module(printActors,[printActors/1]).
:-  use_module(printMovies,[printMovies/1]).
:-  use_module(library(lists)).

run :- open('hogwarts.txt', write, Stream),
    write(Stream, 'Hogwarts'), nl(Stream),
    close(Stream).

main :-
    open('houses.txt', read, Str),
    read_houses(Str, Houses),
    close(Str),
    write(Houses), nl.

read_houses(Stream, []) :-
    at_end_of_stream(Stream),
    !.

read_houses(Stream, [X|L]) :-
    \+ at_end_of_stream(Stream),
    read(Stream, X),
    read_houses(Stream, L).
    
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

main2 :-
    open('longword.txt', read, Str),
    readWord(Str, W),
    close(Str),
    write(W), nl.
    
main3 :-
    open('hogwart.houses', write, Str),
    tab(Str, 10),
    write(Str, 'gryffindor'),
    nl(Str),
    write(Str, 'hufflepuff'),
    tab(Str, 8),
    write(Str, 'ravenclaw'),
    nl(Str),
    tab(Str, 10),
    write(Str, 'slytherin'),
    close(Str).