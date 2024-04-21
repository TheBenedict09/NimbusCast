import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.preprocessing import LabelEncoder
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
X = (X - X.mean()) / X.std()

# Split data into train and test sets
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Define the neural network architecture
model = tf.keras.Sequential(
    [
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(128, activation="relu"),
        tf.keras.layers.Dense(64, activation="relu"),
        tf.keras.layers.Dense(32, activation="relu"),
        tf.keras.layers.Dense(10, activation="softmax"),
    ]
)
# Compile the model
model.compile(
    loss="sparse_categorical_crossentropy", optimizer="sgd", metrics=["accuracy"]
)


# Define early stopping callback
early_stopping = tf.keras.callbacks.EarlyStopping(monitor="val_loss", patience=5)

# Train the model with early stopping
history = model.fit(
    X_train,
    y_train,
    epochs=15,
    batch_size=32,
    validation_data=(X_test, y_test),
    callbacks=[early_stopping],
)

# Evaluate the model
loss, accuracy = model.evaluate(X_test, y_test)
print("Test Accuracy:", accuracy)

# Save the trained model
model.save("cloud_burst_model.keras")
