import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/pages/direcciones.dart';
import 'package:qrscanner/pages/mapas.dart';
import 'package:qrscanner/providers/scans_list_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';
import 'package:qrscanner/widgets/bottom_navigation.dart';
import 'package:qrscanner/widgets/scanner_buttom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScansListProvider>(context);


    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () async {
          scanListProvider.borrarTodos();
          
        }, icon: const Icon(Icons.delete))],
        title: const Text('Historial'),
        centerTitle: true,
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const BottonNavigation(),
      floatingActionButton: const ScannerButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

  

    final provider = Provider.of<UiProvider>(context);

    final currentIndex = provider.selected;

    final scanListProvider =
        Provider.of<ScansListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return const Direcciones();

      default:
        return const MapasPage();
    }
  }
}
