import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nimbus_cast/Pages/bottom_navbar.dart';
import 'package:nimbus_cast/Pages/forecast_page.dart';
import 'package:nimbus_cast/utilities/colors.dart';

class AccessibilityPage extends StatefulWidget {
  const AccessibilityPage({super.key});

  @override
  State<AccessibilityPage> createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage> {
  TextEditingController? _changeLocation;
  @override
  void initState() {
    super.initState();
    _changeLocation = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Lottie.asset(
        'assets/animations/Funny.json',
        height: 150,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: c5.withOpacity(0.4),
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
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: c5.withOpacity(0.7),
                boxShadow: const [
                  BoxShadow(blurRadius: 30, spreadRadius: 4, color: c5),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.black,
                  ),
                  const VerticalDivider(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Alert Settings",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 23,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: c5.withOpacity(0.7),
                boxShadow: const [
                  BoxShadow(blurRadius: 30, spreadRadius: 4, color: c5),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.people,
                    size: 40,
                    color: Colors.black,
                  ),
                  const VerticalDivider(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Community Hub",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 23,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: c5.withOpacity(0.7),
                boxShadow: const [
                  BoxShadow(blurRadius: 30, spreadRadius: 4, color: c5),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.dangerous_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                  const VerticalDivider(),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Risk Assessment",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 23,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Change Location",
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontSize: 23,
                                ),
                      ),
                      content: TextField(
                        controller: _changeLocation,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22))),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return BottomNavBar(source: "changeLocation", cityName: _changeLocation!.text,);
                              },
                            ), (route) => false);
                          },
                          child: Text('Done'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: c5.withOpacity(0.7),
                  boxShadow: const [
                    BoxShadow(blurRadius: 30, spreadRadius: 4, color: c5),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(
                      Icons.help_center,
                      size: 40,
                      color: Colors.black,
                    ),
                    const VerticalDivider(),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change Location",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 23,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
