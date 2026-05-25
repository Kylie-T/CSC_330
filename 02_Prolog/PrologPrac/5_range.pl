
l_range(Min, Max, []) :-
    Max is Min - 1.
l_range(Min, Max, [Min|T]) :- 
    Next is Min + 1, 
     l_range(Next, Max, T). 
