import 'package:flutter/material.dart';
import 'package:nimbus_cast/utilities/cloud_prediction.dart';
import 'package:nimbus_cast/utilities/colors.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  TextEditingController? _temperature,
      _feelsLike,
      _humidity,
      _windSpeed,
      _windBering,
      _pressure;
  double? result;
  @override
  void initState() {
    super.initState();
    _temperature = TextEditingController();
    _feelsLike = TextEditingController();
    _humidity = TextEditingController();
    _windBering = TextEditingController();
    _windSpeed = TextEditingController();
    _pressure = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1.withOpacity(0.3),
      appBar: AppBar(
        backgroundColor: c1,
        centerTitle: true,
        title: Text(
          "NimbusCast",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 30,
                color: Colors.white
              ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 380,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Enter Details:",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 30,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Temperature:",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _temperature,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "In Celsius",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    prefixIcon: const Icon(
                      Icons.thermostat,
                      color: c2,
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Feels Like (Temperature):",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _feelsLike,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "In Celsius",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    prefixIcon: const Icon(
                      Icons.thermostat_auto,
                      color: c2,
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Humidity:",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _humidity,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "In g/Kg",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    prefixIcon: const Icon(
                      Icons.water_drop,
                      color: c2,
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Wind Speed:",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _windSpeed,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "In m/s",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    prefixIcon: const Icon(
                      Icons.wind_power,
                      color: c2,
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Wind Bearing:",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _windBering,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "In Degree",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)),
                    prefixIcon: const Icon(
                      Icons.air,
                      color: c2,
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Pressure:",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              Container(
                width: 380,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: _pressure,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "In Pascal",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: c1),
                        borderRadius: BorderRadius.circular(21)),
                    prefixIcon: const Icon(
                      Icons.line_weight,
                      color: c2,
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () async {
                    result = (await fetchDataFromAPI(
                      int.parse(_temperature!.text),
                      int.parse(_feelsLike!.text),
                      double.parse(_humidity!.text),
                      double.parse(_windSpeed!.text),
                      double.parse(_pressure!.text),
                      double.parse(_windBering!.text),
                    ));
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            width: 300,
                            height: 167,
                            child: Column(
                              children: [
                                Text(
                                  "The chances of Cloud Burst is",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 30,
                                      ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${(result!*100).toStringAsFixed(3)}%",
                                  style: Theme.of(context)

                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        fontSize: 60,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  Navigator.of(context).pop();
                                },
                                child: Text("close"))
                          ],
                        );
                      },
                    );
                  },
                  backgroundColor: c5,
                  child: Text(
                    "Simulate",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
