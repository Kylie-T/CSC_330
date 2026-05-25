%% use this predicate from SWI terminal, i.e. "parse_file."
parse_file :- parse_file("src.txt"). % invokes a version of parse_file that takes in a file

%% Parsing and Pretty Printing
parse_file(FileName) :- 
    open(FileName, read, Stream),
    line_by_line(Stream),
    close(Stream), nl.

% define more predicates here
% reads each line and stops when it reaches EOF
line_by_line(Stream) :-
    read_line_to_string(Stream, Line),
    line_by_line(Line, Stream).

% tokenizes each line until EOF
line_by_line(end_of_file, _) :- !.
line_by_line(Line, Stream) :-
    re_split(" ", Line, Token_line, []), % splits line into tokens; space as delimiter
    rid_space(Token_line, Tokens), % func to take out the space characters in token list
    unit(Tokens),
    read_line_to_string(Stream, NextLine),
    line_by_line(NextLine, Stream).

% gets rid of the space charcters in the token list
% checks if not space, if not, add to final list
rid_space([],[]).
rid_space([H|T], List) :- 
    (List = [H|Rest_list], H\= " ", rid_space(T, Rest_list) ;
     rid_space(T, List)).

% turns tokens into string to print
tok_to_str(Tokens, String) :- atomic_list_concat(Tokens, ' ', String).


%% Grammar
unit(Tokens) :- assignment(Tokens).
unit(Tokens) :- print_call(Tokens).

% define assignment, print_call, and more predicates here
assignment([Set, Ident, Eq | Rest]) :- 
    set(Set), ident(Ident), equals(Eq),
    math_exp(Rest, Result),
    atom_string(AtomIdent, Ident), % converts atom to string
    nb_setval(AtomIdent, Result), % sets a value to a variable
    tok_to_str(Rest, Line), % turns tokens to string for printing
    format("set ~w = ~w --> ~w = ~w~n", [Ident, Line, Ident, Result]).

print_call(["print"| Rest]) :- 
    math_exp(Rest, Result),
    tok_to_str(Rest, Line), % turns tokens to string for printing
    format("print ~w --> ~w~n", [Line, Result]).

math_exp([X], Result) :- num_or_ident(X, Result).
math_exp([X, Add | Rest], Result) :- 
    add(Add),
    num_or_ident(X, LeftRes), % checks if number and turns into a number
    math_exp(Rest, RightRes), % evaluates expression
    Result is LeftRes + RightRes. % adds values
math_exp([X, Mul | Rest], Result) :- 
    mul(Mul),
    num_or_ident(X, LeftRes), 
    math_exp(Rest, RightRes),
    Result is LeftRes * RightRes. % multiplies values

num_or_ident(X, Result) :- 
    num(X, Result) ;
    % gets atom version of ident and retrieves and returns that variable value
    ident(X), atom_string(AtomX, X), nb_current(AtomX, Result).

%% Terminal Tokens (facts)
set("set").
print("print").

% more terminal tokens are needed here
equals("=").
add("+").
mul("*").

%% Terminal Tokens (rules)

ident(Chars) :- string_chars(Chars, [H|T]), % string_chars takes in a string and returns a list of characters (built-in)
    char_type(H, alpha), % checks if char in ident is a letter
    ident_chars(T).
% helper func to continue checking if char in ident is a letter
ident_chars([]).
ident_chars([H|T]) :- % match an identifier
    char_type(H, alpha),
    ident_chars(T). % char_type - takes in char and matches if one of the types (upper/lower letter) (built-in)

num(Num, Val) :- % match a number and get its value+
    string_chars(Num, Numbers), % takes a number and adds each char into list
    num_chars(Numbers), 
    number_string(Val, Num). % returns the actual number form of the number
% helper func to check if char is a digit
num_chars([]).
num_chars([H|T]) :- char_type(H, digit), num_chars(T). % char_type - takes in char and matches if one of the types (digit) (built-in)