import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http; // Import the http package

Future<String> fetchDataFromAPI(int temp, int feels, double humi,
    double windSpeed, double pressure, double windBering) async {
  double k = Random().nextDouble() * (5 - 1) + 1; // Common range for k
  double m = Random().nextDouble() * (1.5 - 0.1) + 0.1; // Common range for m
  double n = Random().nextDouble() * (1.5 - 0.1) + 0.1; // Common range for n

  // Calculate visibility using the formula
  double visibility = k * pow(humi / temp, m) * pow(windSpeed / pressure, n);
  const url =
      'http://10.0.2.2:5000/predict'; // Update with your Flask server URL
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    // Add your request data here
    "Temperature (C)": temp,
    "Apparent Temperature (C)": feels,
    "Humidity": humi,
    "Wind Speed (km/h)": windSpeed,
    "Wind Bearing (degrees)": windBering,
    "Visibility (km)": visibility,
    "Pressure (millibars)": pressure
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    final data = await jsonDecode(response.body);
    final double cloudBurstProbability = data['Cloud Burst Probability'];
    // Use the cloudBurstProbability in your Flutter app
    return ((double.parse(cloudBurstProbability.toStringAsFixed(3)) * 100)
        .toStringAsFixed(1));
  } else {
    return ('N/A');
  }
}
