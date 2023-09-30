import 'package:flutter/material.dart';
import 'package:qrscanner/models/scans_modesl.dart';
import 'package:qrscanner/providers/db_provider.dart';

class ScansListProvider extends ChangeNotifier {
  //*Lista que se llena con los scans que estan en la base de datos
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScanList(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    //*Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    scans.add(nuevoScan);

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getdata();

    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getType(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAll();
    scans = [];
    notifyListeners();
  }

  borrarScansPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScansPorTipo(tipoSeleccionado);
  }
}
