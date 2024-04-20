import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nimbus_cast/Pages/accessibility_page.dart';
import 'package:nimbus_cast/Pages/emergency_resources.dart';
import 'package:nimbus_cast/Pages/forecast_page.dart';
import 'package:nimbus_cast/Pages/simulation_page.dart';
import 'package:nimbus_cast/utilities/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _index = 0;
  // late Position currentPosition;
  // String cityName = "";

  // @override
  // void initState() {
  //   super.initState();
  //   _determinePosition();
  // }

  // Future<void> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     Fluttertoast.showToast(msg: "Please keep your Location ON");
  //     return;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.deniedForever) {
  //     Fluttertoast.showToast(msg: "Location Permission Denied Forever");
  //     return;
  //   }
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       Fluttertoast.showToast(msg: "Location Permission Denied");
  //       return;
  //     }
  //   }
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(position.latitude, position.longitude);

  //     if (placemarks.isNotEmpty) {
  //       setState(() {
  //         currentPosition = position;
  //         cityName = placemarks[0].administrativeArea ?? 'Unknown';
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //     Fluttertoast.showToast(msg: "Failed to fetch location data");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _widgetsOptions = <Widget>[
      ForecastPage(),
      const SimulationPage(),
      const EmergencyResources(weatherAlert: false),
      const AccessibilityPage(),
    ];

    return Scaffold(
      body: _widgetsOptions.elementAt(_index),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: c1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.5),
          child: SafeArea(
            child: GNav(
              tabBackgroundColor: c2,
              gap: 15,
              backgroundColor: c1,
              haptic: true,
              padding: const EdgeInsets.all(16),
              tabs: [
                GButton(icon: Icons.cloud, text: "Forecast"),
                const GButton(icon: Icons.auto_awesome, text: "Simulation"),
                const GButton(icon: Icons.emergency_rounded, text: "Emergency"),
                const GButton(icon: Icons.accessibility, text: "Accessibility"),
              ],
              selectedIndex: _index,
              onTabChange: (value) {
                setState(() {
                  _index = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
