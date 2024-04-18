import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nimbus_cast/utilities/colors.dart';
import 'package:weather_icons/weather_icons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _index = 0;

  static const List<Widget> _widgetsOptions = <Widget>[
    Text("Real Time Data"),
    Text("Forecast"),
    Text("Emergency Resources")
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
                GButton(
                  icon: Icons.cloud,
                  text: "Real-Time",
                ),
                GButton(icon: Icons.sunny, text: "Local"),
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
