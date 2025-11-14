import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.tree import DecisionTreeClassifier, export_text
from sklearn.model_selection import train_test_split

# ---------------------------------------
# 1. READ CSV FILE
# ---------------------------------------
# Example: dataset.csv should contain:
# a1,a2,a3,Class
# True,Hot,High,No
# True,Hot,High,No
# False,Hot,High,Yes
# ...

df = pd.read_csv("dataset.csv")   # <-- change filename if needed

# ---------------------------------------
# 2. CONVERT STRING LABELS TO NUMBERS
# ---------------------------------------
label_encoders = {}
for column in df.columns:
    if df[column].dtype == 'object':
        le = LabelEncoder()
        df[column] = le.fit_transform(df[column])
        label_encoders[column] = le

# ---------------------------------------
# 3. SPLIT FEATURES & TARGET
# ---------------------------------------
X = df.drop("Class", axis=1)
y = df["Class"]

# ---------------------------------------
# 4. TRAIN DECISION TREE (Entropy = ID3)
# ---------------------------------------
model = DecisionTreeClassifier(criterion='entropy')
model.fit(X, y)

# ---------------------------------------
# 5. PRINT THE DECISION TREE RULES
# ---------------------------------------
tree_rules = export_text(model, feature_names=list(X.columns))
print("\n=== DECISION TREE RULES ===")
print(tree_rules)

# ---------------------------------------
# 6. PREDICT NEW INPUT
# ---------------------------------------
# Example new sample (edit as required):
new_sample = pd.DataFrame({
    "a1": ["True"],
    "a2": ["Hot"],
    "a3": ["High"]
})

# Encode new sample using saved label encoders
for column in new_sample.columns:
    new_sample[column] = label_encoders[column].transform(new_sample[column])

prediction = model.predict(new_sample)[0]

# Decode prediction back to original label
prediction_label = label_encoders["Class"].inverse_transform([prediction])[0]

print("\nPrediction for new input:")
print(prediction_label)
