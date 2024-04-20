import 'package:flutter/material.dart';
import 'package:nimbus_cast/utilities/colors.dart';
import 'package:nimbus_cast/utilities/consts.dart';
import 'package:weather/weather.dart';

class RealTimePage extends StatefulWidget {
  final String cityname;
  const RealTimePage({super.key, required this.cityname});

  @override
  State<RealTimePage> createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  List _cityDetails = [];

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName(widget.cityname).then(
      (w) {
        setState(
          () {
            _weather = w;
            _cityDetails = [
              _weather?.humidity ?? 'N/A',
              _weather?.pressure ?? 'N/A',
              _weather?.cloudiness,
              "${_weather?.latitude ?? 'N/A'}° ${_weather?.longitude ?? 'N/A'}°",
              _weather?.windSpeed ?? 'N/A',
              _weather?.weatherDescription,
              _weather?.sunrise != null
                  ? "${_weather!.sunrise!.hour.toString().padLeft(2, '0')}:${_weather!.sunrise!.minute.toString().padLeft(2, '0')}"
                  : 'N/A',
              _weather?.sunset != null
                  ? "${_weather!.sunset!.hour.toString().padLeft(2, '0')}:${_weather!.sunset!.minute.toString().padLeft(2, '0')}"
                  : 'N/A',
            ];
          },
        );
      },
    ).catchError((error) {
      print('Failed to fetch weather data: $error');
    });
  }

  final List _cityDetailsName = [
    "Humidity",
    "Pressure",
    "Cloudiness",
    "Location",
    "Wind Speed",
    "Weather Desc",
    "Sunrise",
    "Sunset"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1,
        centerTitle: true,
        title: Text(
          "NimbusCast",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 30,
              ),
        ),
      ),
      body: _weather == null
          ? const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
              ),
            )
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: c5.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _cityDetailsName[index].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  fontSize: 25,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _cityDetails[index].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                    fontSize: 25, color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: _cityDetails.length,
                ),
              ),
            ),
    );
  }
}
