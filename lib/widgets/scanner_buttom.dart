import 'package:flutter/material.dart';

class ScannerButtom extends StatelessWidget {
  const ScannerButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async {
          // FlutterBarcodeScanner.scanBarcode(
          //     '##FF333C', 'Cancelar', false, ScanMode.QR);
        },
        child: const Icon(Icons.qr_code));
  }
}
