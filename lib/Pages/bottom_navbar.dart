import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nimbus_cast/Pages/accessibility_page.dart';
import 'package:nimbus_cast/Pages/emergency_resources.dart';
import 'package:nimbus_cast/Pages/forecast_page.dart';
import 'package:nimbus_cast/Pages/map.dart';
import 'package:nimbus_cast/Pages/realtime_page.dart';
import 'package:nimbus_cast/Pages/simulation_page.dart';
import 'package:nimbus_cast/utilities/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _index = 0;

  static const List<Widget> _widgetsOptions = <Widget>[
    ForecastPage(),
    SimulationPage(),
    EmergencyResources(weatherAlert: false),
    AccessibilityPage(),
  ];
  @override
  Widget build(BuildContext context) {
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
              tabs: const [
                GButton(icon: Icons.cloud, text: "Local"),
                GButton(icon: Icons.auto_awesome, text: "Simulation"),
                GButton(icon: Icons.emergency_rounded, text: "Emergency"),
                GButton(icon: Icons.accessibility, text: "Accessibility"),
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
