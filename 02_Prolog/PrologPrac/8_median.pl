% challenge
% 1 gallon = 16 ounces
oz_gallon(Ounces, Gallons) :-
    number(Ounces), Gallons is Ounces / 16;
    number(Gallons), Ounces is Gallons * 16.
