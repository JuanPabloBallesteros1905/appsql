import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/scans_modesl.dart';

//*Clase de la base de datos

//*Se crea un singleton
class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

//*Metodo que verifica la base de datos y si no esta la crea
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
    }
    return _database!;
  }

//*Metodo que crea la base de datos
  Future<Database> initDb() async {
    //Creamos el path de la base de datos
    Directory documenDirectory = await getApplicationDocumentsDirectory();

    final path = join(documenDirectory.path, 'Scans.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(''' 
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  // nuevoScanRaw(ScanModel nuevoScan) async {
  //   //verificar la base de datos
  //   final db = await database;

  //   final res = await db.rawInsert('''
  //   INSERT INTO Scans (id, tipo, valor)

  //   VALUES ($nuevoScan.id, '${nuevoScan.tipo}', '${nuevoScan.valor}')

  //    ''');
  // }

  //*Metodo para insertar datos en la base de datos
  Future<int> nuevoScan(ScanModel nuevoScan) async {
    //*Revision de la base de datos
    final db = await database;

    //*El toJson sale del modelado de la base de datos
    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  //*Metodo para obtener todos los datos de la base de datos

  Future getdata() async {
    final db = await database;

    final res = await db.query('Scans');

    res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : null;

    print(res);
  }

  //*Metodo para obtener datos de la base de datos por id o por algo en especifico

  Future getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ? ', whereArgs: [id]);

    res.isNotEmpty ? ScanModel.fromJson(res.first) : [];
  }

  Future<List<ScanModel>> getType(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  //*Actualizar segun el id
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);

    return res;
  }

  //*Borar registros de la base de datos

  Future<int> deleteScan(int id) async {
    final db = await database;

    final res = await db.delete('Scans', where: 'id = ? ', whereArgs: [id]);

    return res;
  }

  //*borrar todos los datos de una tabla

  Future<int> deleteAll() async {
    final db = await database;

    final res = await db.delete('Scans');

    return res;
  }
}
