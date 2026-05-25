
l_min([], _).
l_min([X], X) :- !.
l_min([H|T], Min) :-
    l_min(T, LMin), 
    (H =< LMin, Min = H;
     H > LMin, Min = LMin
    ).