% Sum of integers from 1 to N

sum(1, 1).   % base case

sum(N, Result) :-
    N > 1,
    N1 is N - 1,
    sum(N1, R1),
    Result is R1 + N.
