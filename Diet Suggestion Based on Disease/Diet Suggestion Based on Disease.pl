% ---- Facts: Diet recommendations ----

diet(diabetes, 'Avoid sugar, rice, potatoes, sweets. Eat green vegetables, whole grains, oats, and drink plenty of water.').
diet(bp, 'Reduce salt and fried foods. Eat fruits, vegetables, oats, and drink low-fat milk.').
diet(obesity, 'Avoid junk food, sweets, and oily foods. Eat salads, fruits, multigrain breads, and drink warm lemon water.').
diet(anaemia, 'Eat spinach, eggs, beans, jaggery, groundnuts, and iron-rich foods. Avoid tea and coffee after meals.').
diet(acidity, 'Avoid spicy food, pickles, and citrus fruits. Eat bananas, curd, coconut water, and drink cold milk.').
diet(ulcer, 'Eat soft foods like rice, banana, oats, milk, and coconut water. Avoid spicy, oily, and fast foods.').
diet(kidney_stone, 'Drink 3-4 liters of water. Avoid spinach, tomato, beetroot, soft drinks. Eat barley water, lemon juice.').
diet(thyroid, 'Eat eggs, meat, walnuts, and iodized salt. Avoid cabbage, cauliflower, soy products.').

% ---- Rules ----

suggest_diet(Disease, Diet) :-
    diet(Disease, Diet).
