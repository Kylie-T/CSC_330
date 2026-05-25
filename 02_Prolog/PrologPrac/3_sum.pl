
l_sum([], 0).
l_sum([H|T], Total) :- 
    l_sum(T, PrevSum), 
    Total is H + PrevSum.
