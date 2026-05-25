
comma_list([],[]) :-!.
comma_list([X],[X]) :-!.
comma_list([H|T], CommaList) :-
    comma_list(T, TCommaList),
    append([H, ','],TCommaList, CommaList).

comma_string(String, CommaString) :-
    string_chars(String, Chars),
    comma_list(Chars, CommaChars).
    string_chars(CommaString, CommaChars).