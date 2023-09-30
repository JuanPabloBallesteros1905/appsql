import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/util/utilities.dart';

class ScannerButtom extends StatelessWidget {
  const ScannerButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final bardCode = 'geo:11.009264, -74.247413';

    final scanListProvider =
        Provider.of<ScansListProvider>(context, listen: false);
    return FloatingActionButton(
      onPressed: () async {
        // FlutterBarcodeScanner.scanBarcode(
        //     '##FF333C', 'Cancelar', false, ScanMode.QR);

        final nuevoScan = await scanListProvider.nuevoScanList(bardCode);

        // ignore: use_build_context_synchronously
        launchUrll(context, nuevoScan);
      },
      child: const Icon(Icons.qr_code),
    );
  }
}
