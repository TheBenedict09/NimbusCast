import numpy as np
from datetime import datetime

# Load CSV file with headers
data = np.genfromtxt('weatherHistory.csv', delimiter=',', skip_header=1, dtype=str, encoding=None)

# Extract datetime column
datetime_column = [datetime.strptime(row[0], '%Y-%m-%d %H:%M:%S.%f %z').timestamp() for row in data]

# Remove non-numeric columns (assuming they are not needed for prediction)
numeric_data = np.array([row[1:] for row in data if row[1:].dtype == np.dtype('float64')])

# Convert remaining columns to floats
converted_data = numeric_data.astype(float)

# Combine the datetime column with the converted data
converted_data_with_datetime = np.column_stack((datetime_column[:converted_data.shape[0]], converted_data))

# Save the converted data as .npy file
np.save('weather_data.npy', converted_data_with_datetime)
