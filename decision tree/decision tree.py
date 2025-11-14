import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.tree import DecisionTreeClassifier, export_text


data = {
    "a1": ["True","True","False","False","False","True","True","True","False","False"],
    "a2": ["Hot","Hot","Hot","Cool","Cool","Cool","Hot","Hot","Cool","Cool"],
    "a3": ["High","High","High","Normal","Normal","High","High","Normal","Normal","High"],
    "Class": ["No","No","Yes","Yes","Yes","No","No","Yes","Yes","Yes"]
}

df = pd.DataFrame(data)

label_encoders = {}
for column in df.columns:
    le = LabelEncoder()
    df[column] = le.fit_transform(df[column])
    label_encoders[column] = le


X = df.drop("Class", axis=1)
y = df["Class"]

model = DecisionTreeClassifier(criterion='entropy')
model.fit(X, y)

tree_rules = export_text(model, feature_names=list(X.columns))
print("\n=== DECISION TREE RULES ===")
print(tree_rules)

new_sample = pd.DataFrame({
    "a1": ["True"],
    "a2": ["Hot"],
    "a3": ["High"]
})

for column in new_sample.columns:
    new_sample[column] = label_encoders[column].transform(new_sample[column])

prediction = model.predict(new_sample)[0]
prediction_label = label_encoders["Class"].inverse_transform([prediction])[0]

print("\nPrediction Result =", prediction_label)
