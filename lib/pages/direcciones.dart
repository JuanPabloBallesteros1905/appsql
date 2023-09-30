import 'package:flutter/material.dart';

import 'package:qrscanner/widgets/scans_screen.dart';

class Direcciones extends StatelessWidget {
  const Direcciones({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanScreen(tipo: 'http');
  }
}
