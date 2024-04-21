import numpy as np
import tensorflow as tf
from flask import Flask, request, jsonify
import pandas as pd
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
# Load the pre-trained TensorFlow model
model = tf.keras.models.load_model("cloud_burst_model.keras")

# Flask application
app = Flask(__name__)


# Endpoint to predict cloud burst
@app.route("/predict", methods=["POST"])
def predict_cloud_burst():
    # Extract input parameters from JSON request
    data = request.json
    temperature = data["Temperature (C)"]
    apparent_temperature = data["Apparent Temperature (C)"]
    humidity = data["Humidity"]
    wind_speed = data["Wind Speed (km/h)"]
    wind_bearing = data["Wind Bearing (degrees)"]
    visibility = data["Visibility (km)"]
    pressure = data["Pressure (millibars)"]

    input_data = np.array(
        [
            [
                temperature,
                apparent_temperature,
                humidity,
                wind_speed,
                wind_bearing,
                visibility,
                pressure,
            ]
        ]
    )
    input_data = scaler.transform(input_data
    )
    # Make predictions using the loaded model
    predictions = model.predict(input_data)
    cloud_burst_probability = float(predictions[0][0])  # Assuming Cloud Burst is the first class
    # Prepare response JSON
    response = {
        "Temperature (C)": temperature,
        "Apparent Temperature (C)": apparent_temperature,
        "Humidity": humidity,
        "Wind Speed (km/h)": wind_speed,
        "Wind Bearing (degrees)": wind_bearing,
        "Visibility (km)": visibility,
        "Pressure (millibars)": pressure,
        "Cloud Burst Probability": cloud_burst_probability,
    }

    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True)