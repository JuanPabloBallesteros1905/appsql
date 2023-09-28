import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/widgets/no_content.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScansListProvider>(context);

    return scanListProvider.scans.isEmpty
        ? const NoContent()
        : ListView.builder(
            itemCount: scanListProvider.scans.length,
            itemBuilder: (BuildContext _, i) {
              return Dismissible(
                background: Container(color: Colors.red,),
                key: UniqueKey(),
                onDismissed: (direction) {

                  final id = scanListProvider.scans[i].id;

                  scanListProvider.borrarScansPorId(id!.toInt());

                  
                },
                child: ListTile(
                  title: Text(scanListProvider.scans[i].valor),
                  subtitle: Text(scanListProvider.scans[i].id.toString()),
                  leading: const Icon(Icons.map),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () => print('algo...'),
                ),
              );
            },
          );
  }
}
