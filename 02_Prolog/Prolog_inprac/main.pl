% facts
store(statrbucks).
expensive(starbucks).
parent_child(kevin, liam).

% atom -> ''; atom('234')
% string -> ""; atom("234")
% float/integer/number -> ''; atom(234)

% ',' is AND; ';' is OR

% Rules
expensiveStore(S) :- store(S), expensive(S).

% writes to the terminal

