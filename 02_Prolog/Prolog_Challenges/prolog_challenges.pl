/* LEVEL 0: intro */

% challenge a
sanitycheck(42).

/* LEVEL 1: simple */

% challenge a

% challenge b
f_c(F, C) :- (number(F), C is (F - 32.0) * (5/9)). 
f_c(F, C) :- F is (C * (9/5)) + (32.0).
    
    
% (°C × 9/5) + 32 = °F C to F

% (32°F − 32) × 5/9 = 0°C F to C

% challenge c
range(Min, Max, []) :-
    Max is Min - 1, !.
range(Min, Max, [Min|T]) :- 
    Next is Min + 1, 
    range(Next, Max, T). 

% challenge d


/* LEVEL 2: hard */

% challenge a

% challenge b

% challenge c
list_evensum_oddsum([], 0, 0) :- !.
list_evensum_oddsum([H|T], EvenSum, OddSum) :- 
    list_evensum_oddsum(T, EvSum, OSum),
    (0 is (H mod 2), EvenSum is EvSum + H;
    OddSum is OSum + H).

% challenge d


/* LEVEL 3: nightmare fuel */

% challenge a

