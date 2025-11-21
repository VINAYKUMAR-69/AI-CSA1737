% Facts: planet(Name, DistanceFromSun, Diameter, Moons)

planet('Mercury', 57.9, 4879, 0).
planet('Venus', 108.2, 12104, 0).
planet('Earth', 149.6, 12742, 1).
planet('Mars', 227.9, 6779, 2).
planet('Jupiter', 778.3, 139820, 79).
planet('Saturn', 1427, 116460, 83).
planet('Uranus', 2871, 50724, 27).
planet('Neptune', 4495, 49244, 14).

% Rule: planets with more than M moons
planets_with_more_moons(M, Planet) :-
    planet(Planet, _, _, Moons),
    Moons > M.

% Rule: nearest planet to the sun
nearest_planet(Planet) :-
    planet(Planet, Distance, _, _),
    Distance =< 57.9.

% Rule: farthest planet from the sun
farthest_planet(Planet) :-
    planet(Planet, Distance, _, _),
    Distance >= 4495.
