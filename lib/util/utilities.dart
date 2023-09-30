import 'package:flutter/material.dart';
import 'package:qrscanner/models/scans_modesl.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrll(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    try {
      await launchUrl(url);
    } catch (e) {
      Exception('Could not launch $url');
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
