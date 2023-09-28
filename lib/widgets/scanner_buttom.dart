import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';

class ScannerButtom extends StatelessWidget {
  const ScannerButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final bardCode = 'geo:15.15';

    final scanListProvider =
        Provider.of<ScansListProvider>(context, listen: false);
    return FloatingActionButton(
        onPressed: () async {
          // FlutterBarcodeScanner.scanBarcode(
          //     '##FF333C', 'Cancelar', false, ScanMode.QR);

          await scanListProvider.nuevoScanList(bardCode);
        },
        child: const Icon(Icons.qr_code));
  }
}
