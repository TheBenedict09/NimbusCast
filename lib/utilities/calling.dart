import 'package:nimbus_cast/utilities/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void makePhoneCall(String phoneNumber, BuildContext context) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      showSnackbar("Could not place the call", context);
    }
  }
}
