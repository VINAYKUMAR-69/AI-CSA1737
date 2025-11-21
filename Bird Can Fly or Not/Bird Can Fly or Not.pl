% Facts about birds
can_fly(sparrow).
can_fly(eagle).
can_fly(crow).
can_fly(pigeon).

cannot_fly(penguin).
cannot_fly(ostrich).
cannot_fly(kiwi).

% Rule to check flying capability
bird_can_fly(X) :-
    can_fly(X),
    write(X), write(' can fly.'), nl.

bird_can_fly(X) :-
    cannot_fly(X),
    write(X), write(' cannot fly.'), nl.
