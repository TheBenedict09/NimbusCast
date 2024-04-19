import 'package:flutter/material.dart';
import 'package:nimbus_cast/utilities/colors.dart';

import '../utilities/calling.dart';

class EmergencyResources extends StatefulWidget {
  final weatherAlert;
  const EmergencyResources({super.key, this.weatherAlert});

  @override
  State<EmergencyResources> createState() => _EmergencyResourcesState();
}

class _EmergencyResourcesState extends State<EmergencyResources> {
  final List _authorityNames = [
    "Local Police",
    "Hospital",
    "Fire Department",
    "SDRF",
    "NDRF",
  ];
  final List _authorityContacts = [
    "100",
    "108",
    "112",
    "+91-8436750990(M)",
    "9711077372",
  ];
  final _authorityIcons = [
    Icons.local_police,
    Icons.local_hospital,
    Icons.fire_truck,
    Icons.shield,
    Icons.shield_moon
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 380,
                child: Text(
                  "Weather Alerts:",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              widget.weatherAlert
                  ? Container(
                      width: 380,
                      height: 200,
                      decoration: BoxDecoration(
                        color: c5.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 360,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Cloud Burst Alert",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              "Heavy rain and Thunderstorm expected in your area",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w100),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(c5)),
                              child: const Text(
                                "       More Details      ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Text(
                      "No Alerts",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 20, color: Colors.grey.shade600),
                    ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 380,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Emergency Contacts:",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 380,
                height: 100 * _authorityContacts.length.toDouble(),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () =>
                            makePhoneCall(_authorityContacts[index], context),
                        child: Container(
                          width: 380,
                          height: 85,
                          decoration: BoxDecoration(
                            color: c5.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 20),
                                child: Container(
                                  width: 190,
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _authorityNames[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(fontSize: 25),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _authorityContacts[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.copyWith(
                                                  fontSize: 20,
                                                  color: Colors.grey.shade600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Icon(
                                  _authorityIcons[index],
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: _authorityContacts.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
