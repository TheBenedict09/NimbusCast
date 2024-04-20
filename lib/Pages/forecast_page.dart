import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nimbus_cast/Pages/realtime_page.dart';
import 'package:nimbus_cast/utilities/colors.dart';
import 'package:nimbus_cast/utilities/consts.dart';
import 'package:nimbus_cast/utilities/weather_icon.dart';
import 'package:weather/weather.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);
  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  List<Weather> _weatherList = [];
  late Position currentPosition;
  String cityName = "";

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Please keep your Location ON");
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Location Permission Denied Forever");
      return;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location Permission Denied");
        return;
      }
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        setState(() {
          currentPosition = position;
          cityName = placemarks[0].administrativeArea ?? 'Unknown';
        });
        load();
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Failed to fetch location data");
    }
  }

  void load() async {
    print(cityName);

    await _wf.currentWeatherByCityName(cityName).then((w) {
      setState(() {
        _weather = w;
      });
    }).catchError((e) {
      // Handle the error or notify the user
      print('Error fetching current weather: $e');
    });

    List<Weather> forecast = await _wf.fiveDayForecastByCityName("california");
    setState(() {
      _weatherList = forecast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: callRealTimePage,
        label: Text(
          'Real Time Details',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 17,
              ),
        ),
        icon: const Icon(Icons.storm),
      ),
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
      body: (_weather == null || _weatherList.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      cityName ?? "",
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
                          _weather!.weatherConditionCode!.toInt()),
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
                                            color: Colors.grey.shade600),
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
                                          color: Colors.grey.shade600,
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
                      height: 120,
                      decoration: BoxDecoration(
                        color: c5.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _weatherList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 47,
                                  height: 90,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${_weatherList[index].date!.hour.toString().padLeft(2, '0')}:${_weatherList[index].date!.minute.toString().padLeft(2, '0')}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(fontSize: 18),
                                      ),
                                      (weatherIconSelection(
                                        _weatherList[index]
                                            .weatherConditionCode!
                                            .toInt(),
                                      )),
                                      Text(
                                        "${_weatherList[index].temperature!.celsius!.toStringAsFixed(0)}°C",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                fontSize: 16,
                                                color: Colors.grey.shade600),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const VerticalDivider();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 380,
                      height: 265,
                      decoration: BoxDecoration(
                        color: c5.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _weatherList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        index * 10 < 40
                                            ? "${_weatherList[((index + 1) * 8)].date!.day.toString().padLeft(2, '0')}/${_weatherList[index * 5].date!.month.toString().padLeft(2, '0')}"
                                            : "N/A",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      index * 10 < 40
                                          ? Container(
                                              width: 50,
                                              height: 50,
                                              child: weatherIconSelection(
                                                _weatherList[(index + 1) * 8]
                                                    .weatherConditionCode!
                                                    .toInt(),
                                              ),
                                            )
                                          : const Text('N/A'),
                                    ],
                                  ),
                                  Text(
                                    index * 10 < 40
                                        ? _weatherList[(index + 1) * 8]
                                            .weatherDescription
                                            .toString()
                                        : "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                  Text(
                                    index * 10 < 40
                                        ? "${_weatherList[(index + 1) * 8].temperature!.celsius!.toStringAsFixed(0)}°C/${_weatherList[(index + 1) * 8].tempFeelsLike!.celsius!.toStringAsFixed(0)}°C"
                                        : "N/A",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                                width: 360,
                                child: Divider(
                                  color: Colors.grey.shade500,
                                ));
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void callRealTimePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RealTimePage(cityname: cityName,);
        },
      ),
    );
  }
}
