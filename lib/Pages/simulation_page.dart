import 'package:flutter/material.dart';
import 'package:nimbus_cast/utilities/colors.dart';

class SimulationPage extends StatefulWidget {
  const SimulationPage({super.key});

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
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
              ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
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
                color: c1.withOpacity(0.3),
              ),
              child: TextField(
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
                color: c1.withOpacity(0.3),
              ),
              child: TextField(
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
                color: c1.withOpacity(0.3),
              ),
              child: TextField(
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
                color: c1.withOpacity(0.3),
              ),
              child: TextField(
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
                color: c1.withOpacity(0.3),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "In Knots",
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
                color: c1.withOpacity(0.3),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "In Pascal",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: c1),
                      borderRadius: BorderRadius.circular(21)),
                  prefixIcon: const Icon(
                    Icons.line_weight,
                    color: c2,
                  ),
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 150,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {},
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
    );
  }
}
