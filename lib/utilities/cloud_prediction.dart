import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http; // Import the http package

Future<double> fetchDataFromAPI(int temperature, int feelsLike, double humidity,
    double windSpeed, double pressure, double windBering) async {
  double k = Random().nextDouble() * (5 - 1) + 1; // Common range for k
  double m = Random().nextDouble() * (1.5 - 0.1) + 0.1; // Common range for m
  double n = Random().nextDouble() * (1.5 - 0.1) + 0.1; // Common range for n

  // Calculate visibility using the formula
  double visibility =
      k * pow(humidity / temperature, m) * pow(windSpeed / pressure, n);
  const url =
      'http://10.0.2.2:5000/predict'; // Update with your Flask server URL
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    // Add your request data here
    "Temperature (C)": temperature,
    "Apparent Temperature (C)": feelsLike,
    "Humidity": humidity,
    "Wind Speed (km/h)": windSpeed,
    "Wind Bearing (degrees)": windBering,
    "Visibility (km)": visibility,
    "Pressure (millibars)": pressure
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: body);

  if (response.statusCode == 200) {
    final data = await jsonDecode(response.body);
    var cloudBurstProbability = data['Cloud Burst Probability'];
    print((cloudBurstProbability*100).toStringAsFixed(7));
    return (cloudBurstProbability);
  } else {
    return (0.1);
  }
}
