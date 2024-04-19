import 'package:flutter/material.dart';
import 'package:nimbus_cast/utilities/colors.dart';
import 'package:nimbus_cast/utilities/consts.dart';
import 'package:nimbus_cast/utilities/weather_icon.dart';
import 'package:weather/weather.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});
  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  Weather? _weather;
  List _cityDetails = [];
  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName("Rajkot").then(
      (w) {
        setState(
          () {
            _weather = w;
            _cityDetails = [
              _weather?.humidity,
              _weather?.pressure,
              "${_weather?.latitude}° ${_weather?.longitude}° ",
              _weather?.windSpeed,
              "${_weather?.sunrise!.hour.toString().padLeft(2, '0')}:${_weather?.sunrise!.minute.toString().padLeft(2, '0')}",
              "${_weather?.sunset!.hour.toString().padLeft(2, '0')}:${_weather?.sunset!.minute.toString().padLeft(2, '0')}",
            ];
          },
        );
      },
    );
  }

  final List _cityDetailsName = [
    "Humidity",
    "Pressure",
    "Location",
    "Wind Speed",
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _weather!.areaName.toString(),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 40,
                          ),
                    ),
                    Text(
                      "Cloud Burst Risk: ",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    SizedBox(
                      height: 220,
                      child: weatherIconSelection(
                          _weather!.weatherConditionCode as int),
                    ),
                    Container(
                      width: 290,
                      height: 90,
                      decoration: BoxDecoration(
                          color: c5.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(22)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${_weather!.temperature!.celsius!.toStringAsFixed(0)}°C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 20,
                                        ),
                                  ),
                                  Text(
                                    "Temperature",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 20,
                                        ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${_weather!.tempFeelsLike!.celsius!.toStringAsFixed(0)}°C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 20,
                                        ),
                                  ),
                                  Text(
                                    "Feels Like",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 20,
                                        ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 380,
                      height: 46 * _cityDetailsName.length.toDouble(),
                      decoration: BoxDecoration(
                        color: c2.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 380,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _cityDetailsName[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontSize: 20,
                                          ),
                                    ),
                                    Text(
                                      _cityDetails[index].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall
                                          ?.copyWith(
                                            fontSize: 20,
                                          ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: _cityDetailsName.length),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
