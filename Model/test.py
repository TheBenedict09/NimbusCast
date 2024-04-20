import numpy as np
import tensorflow as tf
from flask import Flask, request, jsonify
from sklearn.preprocessing import StandardScaler

# Load the pre-trained TensorFlow model
model = tf.keras.models.load_model("cloud_burst_model.keras")

# Flask application
app = Flask(__name__)

# StandardScaler instance for normalization
scaler = StandardScaler()

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

    # Fit StandardScaler instance with data
    scaler.fit([
        [
            temperature,
            apparent_temperature,
            humidity,
            wind_speed,
            wind_bearing,
            visibility,
            pressure,
        ]
    ])

    # Normalize input parameters
    input_data = scaler.transform(
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

    # Predict cloud burst
    prediction = model.predict(np.array(input_data))
    # Convert prediction to standard Python float
    prediction_value = float(prediction.flatten()[0])

    # Prepare response JSON
    response = {
        "Temperature (C)": temperature,
        "Apparent Temperature (C)": apparent_temperature,
        "Humidity": humidity,
        "Wind Speed (km/h)": wind_speed,
        "Wind Bearing (degrees)": wind_bearing,
        "Visibility (km)": visibility,
        "Pressure (millibars)": pressure,
        "Cloud Burst Probability": prediction_value,
    }

    return jsonify(response)

if __name__ == "__main__":
    app.run(debug=True)
