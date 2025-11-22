% Monkey-Banana Problem (fully working version)

% State representation:
% state(MonkeyPos, BoxPos, MonkeyStatus, HasBanana)
% MonkeyStatus: onFloor / onBox
% HasBanana: has / hasNot

initial(state(door, window, onFloor, hasNot)).
goal(state(_, _, _, has)).

% Actions

% Monkey walks anywhere
move(state(M, B, onFloor, H), walk(M, N), state(N, B, onFloor, H)) :-
    M \= N.

% Monkey pushes the box only if at same location and on floor
move(state(M, M, onFloor, H), push(M, N), state(N, N, onFloor, H)) :-
    M \= N.

% Monkey climbs on the box
move(state(M, M, onFloor, H), climb, state(M, M, onBox, H)).

% Monkey grabs the banana
move(state(middle, middle, onBox, hasNot), grab, state(middle, middle, onBox, has)).

% Solver with loop-prevention
solve(State, State, _Visited, []).
solve(State, Goal, Visited, [Action | Rest]) :-
    move(State, Action, NewState),
    \+ member(NewState, Visited),         % avoid revisits
    solve(NewState, Goal, [NewState|Visited], Rest).

solve(State, Goal, Plan) :-
    solve(State, Goal, [State], Plan).
