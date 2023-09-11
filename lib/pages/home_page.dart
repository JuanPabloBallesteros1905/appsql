import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/models/scans_modesl.dart';
import 'package:qrscanner/pages/direcciones.dart';
import 'package:qrscanner/pages/mapas.dart';
import 'package:qrscanner/providers/db_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';
import 'package:qrscanner/widgets/bottom_navigation.dart';
import 'package:qrscanner/widgets/scanner_buttom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
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


    //*Para insertar datos en la base de datos 
    // final temp = new ScanModel(valor: 'http://otracosa.com');

    // DBProvider.db.nuevoScan(temp);


    DBProvider.db.getdata();

   
 

    //*Para leer datos de la base de datos

    // DBProvider.db.getScanById(14);

    final provider = Provider.of<UiProvider>(context);

    final currentIndex = provider.selected;

    switch (currentIndex) {
      case 0:
        return const MapasPage();

      case 1:
        return const Direcciones();

      default:
        return const MapasPage();
    }
  }
}
