
l_sum_greater([], _, 0).
l_sum_greater([H|T], Target, Total) :- 
    l_sum_greater(T, Target, PrevSum), 
    (H > Target, Total is H + PrevSum ;
     H =< Target, Total is 0 + PrevSum
    ).
