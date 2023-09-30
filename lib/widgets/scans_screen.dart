import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/util/utilities.dart';
 

class ScanScreen extends StatelessWidget {
  final String tipo;

  const ScanScreen({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScansListProvider>(context);
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          onDismissed: (
            direction,
          ) {
            final id = scanListProvider.scans[index].id?.toInt();

            scanListProvider.borrarScansPorId(id!);
          },
          child: ListTile(
            title: Text(scanListProvider.scans[index].valor),
            subtitle: Text(
              scanListProvider.scans[index].id.toString(),
            ),
            leading: Icon(
              tipo == 'http' ? Icons.directions : Icons.map,
            ),
            onTap: () =>  launchUrll(context, scanListProvider.scans[index] ),
          ),
        );
      },
    );
  }
}
