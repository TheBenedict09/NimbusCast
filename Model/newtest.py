import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.model_selection import train_test_split

# Load the dataset
df = pd.read_csv(
     "C:\\Users\\Ayush Benedict Singh\\CP\\Python\\ML\\model\\Model\\weatherHistory.csv", usecols=[2, 3, 4, 5, 6, 7, 8, 10]
)

# Handle missing values
df["Precip Type"].fillna("CloudBurst", inplace=True)

# Encode categorical variable
le = LabelEncoder()
df["Precip Type"] = le.fit_transform(df["Precip Type"])

# Split data into features and target
X = df.drop(columns=["Precip Type"])
y = df["Precip Type"]

# Normalize the input data
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Split data into train and test sets
X_train, X_test, y_train, y_test = train_test_split(
    X_scaled, y, test_size=0.2, random_state=42
)

# Load the trained model
loaded_model = tf.keras.models.load_model("cloud_burst_model.keras")

# Example user input
user_input = np.array([[15, 14, 0.75, 10, 180, 10, 1015]])

# Preprocess user input
user_scaled = scaler.transform(user_input)

# Make predictions using the loaded model
predictions = loaded_model.predict(user_scaled)

# Assuming the ground truth label for the user input is known, you can compare the prediction with the ground truth label to evaluate accuracy.
# For example, if the ground truth label is 1 (indicating Cloud Burst), and the model predicts a probability greater than 0.5 for class 1, then you can consider it as a correct prediction.

# Evaluate model accuracy on the test data
test_loss, test_accuracy = loaded_model.evaluate(X_test, y_test)
print("Test Accuracy:", test_accuracy)

# Print probability of cloud burst occurrence for the user input
cloud_burst_probability = predictions[0][0]  # Assuming Cloud Burst is the first class
print("Cloud Burst Probability:", cloud_burst_probability)