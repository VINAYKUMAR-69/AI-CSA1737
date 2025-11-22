% ---------- Heuristic Values ----------
h(a, 10).
h(b, 8).
h(c, 5).
h(d, 7).
h(e, 3).
h(f, 6).
h(g, 0).  % Goal

% ---------- Graph ----------
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).

% ---------- Best First Search ----------
best_first_search(Start, Goal, Path) :-
    bestfs([[Start]], Goal, Path).

bestfs([[Goal | Rest] | _], Goal, [Goal | Rest]).  % Success

bestfs([CurrentPath | OtherPaths], Goal, FinalPath) :-
    CurrentPath = [CurrentNode | _],
    findall([Next | CurrentPath],
            (edge(CurrentNode, Next), \+ member(Next, CurrentPath)),
            NewPaths),
    append(OtherPaths, NewPaths, TempPaths),
    sort_by_heuristic(TempPaths, SortedPaths),
    bestfs(SortedPaths, Goal, FinalPath).

% ---------- Sorting function ----------
sort_by_heuristic(Paths, SortedPaths) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, Sorted),
    pairs_values(Sorted, SortedPaths).

path_heuristic([Node | _], H) :- h(Node, H).
