import 'package:flutter/material.dart';
import 'package:nimbus_cast/Pages/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff19DB8A)),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'FontSans',
            fontWeight: FontWeight.normal,
          ),
          displayMedium: TextStyle(
            fontFamily: 'FontBorel',
            fontWeight: FontWeight.normal,
          ),
          displaySmall: TextStyle(
            fontFamily: 'FontMadimi',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      home: const BottomNavBar(source: "main", cityName: ""),
      debugShowCheckedModeBanner: false,
    );
  }
}
