
l_even_list([], []).
l_even_list([H|T], Evens) :-
    0 is (H mod 2), !,
    l_even_list(T, TailEvens),
    append([H], TailEvens, Evens).
l_even_list([H|T], Evens) :-
    1 is (H mod 2), !,
    l_even_list(T, Evens).
