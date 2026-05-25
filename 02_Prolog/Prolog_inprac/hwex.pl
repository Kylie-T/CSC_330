company(sony).
company(microsoft).
company('la bambas').

public(sony).
public(microsoft).

inUSA(microsoft).
inUSA('la bambas').

servesFood('la bambas').

publicUSACompany(C) :- company(C), public(C), inUSA(C).

restaurant(R) :- company(R), servesFood(R).