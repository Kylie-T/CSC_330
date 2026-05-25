membership([], _) :- fail, !.
membership([H|T], Element) :- Element == H.
membership([H|T], Element) :- Element \= H, membership(T, Element).

list1([2, 10, 0, 34, 2]).
list2([1, 10, , 34, 2]).
list3([10, 8, 34, 2]).

list_min([], _) :- write ("empty list is invalid"), fail.
list_min([X], X) :- !.
list_min([H|T], Min) :- 
    list_min(T, TMin),
    ( H =< TMin, Min = H ;
    H > TMin, Min = TMin
    ).

list_len([], 0).
list_len([H|T], Count) :- list_len(T, PrevCount), Count is PrevCount + 1.

list_sum([], 0).
% list_sum([X], X). Don't need; or
list_sum([X], X) :- !.
list_sum([Item1, Item2|T], Sum) :- list_sum(T, PrevSum),
                                   Sum is H + PrevSum.

list_append([], L, L).
list_append([H|L1], L2, [H|L3]) :-
    list_append(L1, L2, L3).

list_rev([],[]).
list_rev([Head|Tail], RevList) :-
    list_rev(Tail, TailRevList),
    append(TailRevList, [Head], RevList).