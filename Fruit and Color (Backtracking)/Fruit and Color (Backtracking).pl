% Facts: fruit and their colors
color(apple, red).
color(banana, yellow).
color(grapes, green).
color(grapes, black).
color(orange, orange).
color(papaya, orange).
color(watermelon, green).
color(blueberry, blue).

% Rule to find fruit color
fruit_color(Fruit, Color) :-
    color(Fruit, Color).
