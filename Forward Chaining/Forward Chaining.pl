% Forward Chaining Example

:- dynamic fact/1.

% Initial facts
fact(has_job(john)).
fact(has_bank_account(john)).
fact(has_good_credit(john)).

% Rules
rule(eligible_for_loan(X), [has_job(X), has_bank_account(X), has_good_credit(X)]).
rule(can_buy_house(X), [eligible_for_loan(X)]).

forward_chain :-
    rule(Conclusion, Conditions),
    \+ fact(Conclusion),
    satisfied(Conditions),
    assert(fact(Conclusion)),
    write('Derived: '), write(Conclusion), nl,
    forward_chain.
forward_chain :-
    write('Forward Chaining Complete.'), nl.

% Helper to check all conditions
satisfied([]).
satisfied([H|T]) :-
    fact(H),
    satisfied(T).
