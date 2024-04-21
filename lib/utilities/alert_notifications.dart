import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertNotification(flutterLocalNotificationsPlugin),
    );
  }
}

class AlertNotification extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  AlertNotification(this.flutterLocalNotificationsPlugin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: const Text('Show Notification'),
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'burst_alert_channel', // Channel ID
      'Burst Alerts', // Channel Name
      importance: Importance.max,
      priority: Priority.high,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // Customize your notification message here
    String alertTitle = 'Cloud Burst Expected Alert';
    String alertBody = 'There is a cloud burst expected today. Stay safe!';

    await flutterLocalNotificationsPlugin.show(
      0,
      alertTitle,
      alertBody,
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }
}
