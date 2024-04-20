import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder

# Load the dataset
df = pd.read_csv("C:\\Users\\Ayush Benedict Singh\\CP\\Python\\ML\\model\\Model\\weatherHistory.csv", usecols=[2, 3, 4, 5, 6, 7, 8, 10])

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
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# Load the trained model
loaded_model = tf.keras.models.load_model("cloud_burst_model.keras")

def preprocess_user_input(user_input):
    # Convert user input to DataFrame
    user_df = pd.DataFrame(user_input, columns=["Temperature (C)", "Apparent Temperature (C)", "Humidity", "Wind Speed (km/h)", "Wind Bearing (degrees)", "Visibility (km)", "Pressure (millibars)"])
    # Standardize user input using the same scaler used during training
    user_scaled = scaler.transform(user_df)
    return user_scaled

def predict_precip_type_with_prob(user_input):
    # Preprocess user input
    user_scaled = preprocess_user_input(user_input)
    # Make predictions using the loaded model
    predictions = loaded_model.predict(user_scaled)
    # Convert predictions to human-readable labels and probabilities
    precip_types = ["Drizzle", "Foggy", "Rain", "Cloudy", "Clear", "Snow", "Wind"]
    predicted_index = np.argmax(predictions)
    predicted_precip_type = precip_types[predicted_index]
    # Get the probability of the predicted class
    predicted_prob = predictions[0][predicted_index]
    return predicted_precip_type, predicted_prob

def is_cloud_burst(predicted_type):
    return predicted_type == "Cloud Burst"

# Evaluate model accuracy
loss, accuracy = loaded_model.evaluate(X_test, y_test)
print("Model Accuracy on Test Data:", accuracy)

# Example user input
user_input = [[15, 14, 0.75, 10, 180, 10, 1015]]

predicted_type, predicted_prob = predict_precip_type_with_prob(user_input)
print("Predicted Precipitation Type:", predicted_type)
print("Probability of Cloud Burst:", predicted_prob)
print("Is Cloud Burst:", is_cloud_burst(predicted_type))
