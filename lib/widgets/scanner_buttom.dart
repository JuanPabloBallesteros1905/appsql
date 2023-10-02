// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/util/utilities.dart';

class ScannerButtom extends StatelessWidget {
  const ScannerButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScansListProvider>(context, listen: false);
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "Cancel", false, ScanMode.QR);

        final nuevoScan = await scanListProvider.nuevoScanList(barcodeScanRes);

        launchUrll(context, nuevoScan);
      },
      child: const Icon(Icons.qr_code),
    );
  }
}
