import 'package:flutter/material.dart';
import 'package:qrscanner/widgets/scans_screen.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const ScanScreen(tipo: 'geo' );
  }
}