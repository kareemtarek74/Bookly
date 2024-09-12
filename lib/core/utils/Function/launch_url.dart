import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(context, String? urL) async {
  if (urL != null) {
    final Uri url = Uri.parse(urL);
    if (await canLaunchUrl(url)) {
      !await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $urL')),
      );
    }
  }
}
