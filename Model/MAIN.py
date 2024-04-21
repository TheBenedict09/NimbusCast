import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import LabelEncoder

# Load the trained model
loaded_model = tf.keras.models.load_model("cloud_burst_model.keras")

# Load the scaler used during training
scaler = StandardScaler()
scaler.mean_ = np.array([288.6, 288.1, 0.735, 10.8, 191.4, 10.4, 1013.2])  # Update with your mean values
scaler.scale_ = np.array([12.4, 13.4, 0.195, 7.4, 107.4, 4.2, 7.7])  # Update with your standard deviation values

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
    return predicted_type == "Cloudy"  # Change to "Cloudy" instead of "Cloud Burst"


# Example user input
user_input = [[15, 14, 0.75, 10, 180, 10, 1015]]  # Update with your preferred values

predicted_type, predicted_prob = predict_precip_type_with_prob(user_input)
print("Predicted Precipitation Type:", predicted_type)
print("Probability of Cloud Burst:", predicted_prob)
print("Is Cloud Burst:", is_cloud_burst(predicted_type))

  # Predict cloud burst
prediction = loaded_model.predict(user_input)
    # Convert prediction to standard Python float
prediction_value = (prediction.flatten())
print(prediction_value)