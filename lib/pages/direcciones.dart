import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/widgets/no_content.dart';

class Direcciones extends StatelessWidget {
  const Direcciones({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScansListProvider>(context);

    return scanListProvider.scans.isEmpty
        ? const NoContent()
        : ListView.builder(
            itemCount: scanListProvider.scans.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),

                onDismissed: (direction, ) {
                  final id = scanListProvider.scans[index].id?.toInt();
                  
                  scanListProvider.borrarScansPorId(id!);
                },
                child: ListTile(
                  title: Text(scanListProvider.scans[index].valor),
                  subtitle: Text(scanListProvider.scans[index].id.toString()),
                ),
              );
            },
          );
  }
}
