import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:nimbus_cast/utilities/colors.dart';

class AccessibilityPage extends StatefulWidget {
  const AccessibilityPage({super.key});

  @override
  State<AccessibilityPage> createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: c1,
        centerTitle: true,
        title: Text(
          "Accessibility",
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
              width: 380,
              height: 70,
              color: Colors.transparent,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(9),
                    backgroundColor: MaterialStatePropertyAll(c5)),
                child: Row(
                  children: [
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
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 23,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 380,
              height: 70,
              color: Colors.transparent,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(9),
                    backgroundColor: MaterialStatePropertyAll(c5)),
                child: Row(
                  children: [
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
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 23,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 380,
              height: 70,
              color: Colors.transparent,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  elevation: MaterialStatePropertyAll(9),
                  backgroundColor: MaterialStatePropertyAll(c5),
                ),
                child: Row(
                  children: [
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
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 23,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 380,
              height: 70,
              color: Colors.transparent,
              child: ElevatedButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(c5),
                    elevation: MaterialStatePropertyAll(9)),
                child: Row(
                  children: [
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
                      "About & Support",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 23,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Lottie.asset('assets/animations/Funny.json', height: 220),
          ],
        ),
      ),
    );
  }
}
