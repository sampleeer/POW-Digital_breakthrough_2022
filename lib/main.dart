import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:win/pages/main_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';


String dir = "";
String picpath = "";
initDB() async {
  //Directory documentsDirectory = await getApplicationDocumentsDirectory();
  dir = "${(await getApplicationDocumentsDirectory()).path}\\MDetect";
  picpath = "$dir\\Pictures";
  print("eto zhe $dir\\DateBase.db");
  return await openDatabase("$dir\\DateBase.db", version: 1, onOpen: (db) {
  }, onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS 'scans' ("
        "'id' INTEGER NOT NULL,"
        "'file_name' TEXT,"
        "'place_name' TEXT,"
        "'date_uploaded' DATE,"
        "'date_shooted' DATE,"
        "'result' INTEGER,"
        "PRIMARY KEY ('id')"
        ");"
    );
  });
}

Database? _database;
Future<Database?> get database async {
  if (_database != null) {
    return _database;
  }

  // if _database is null we instantiate it
  _database = await initDB();
  return _database;
}
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}

Future<List<Map<String, Object?>>> getShotsFrom(DateTime first, DateTime second) async {
  first = first.subtract(Duration(hours: first.hour, minutes: first.minute, seconds: first.second, milliseconds: first.millisecond, microseconds: first.microsecond));
  second = second.subtract(Duration(hours: second.hour, minutes: second.minute, seconds: second.second, milliseconds: second.millisecond, microseconds: second.microsecond));
  second = second.add(const Duration(days: 1));

  print("from ${first} to ${second}");
  final db = await database;
  print("SELECT * FROM scans where date_shooted >= '${first.toString()}' and date_shooted <= '${second.toString()}' ORDER BY date_shooted ASC");
  return db!.rawQuery("SELECT * FROM scans where date_shooted >= '${first.toString()}' and date_shooted <= '${second.toString()}' ORDER BY date_shooted ASC");
  //return result.toList();
}

int getMorzh(String path) {
  int cnt =  Random().nextInt(100);

  /*
  тут код питона, который меняет cnt или как-то возвращает что-то
   */

  return cnt;
}

void exportSingleTable() async {
  final db = await database;
  String? path = await FilePicker.platform.getDirectoryPath(
    dialogTitle: 'Save to folder'
  );
  print("SELECT * FROM scans ORDER BY date_shooted ASC");
  db!.rawQuery("SELECT * FROM scans  ORDER BY date_shooted ASC").then((value) => exportTable(value, path));

}
void exportTable(List<Map<String, Object?>> input, String? path) {

  var excel = Excel.createExcel();

  List<String> dataList = ["id", "Имя Файла", "Имя лежбища", "Дата загрузки", "Дата съёмки", "Результат"];

  excel["Sheet1"].insertRowIterables(dataList, 0);
  int sum = 0;
  for(int i = 1; i <= input.length; i++) {
    var ls = input[i-1].values.toList();
    excel["Sheet1"].insertRowIterables(ls, i);
    //sum += int.parse(ls[ls.length-1].toString());
  } //
  excel.encode().then((onValue) {
    File("$path\\MDetect_bd.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(onValue);
  });
}


void main() {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
  // this step, it will use the sqlite version available on the system.
  databaseFactory = databaseFactoryFfi;
//f
  initDB();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.blueAccent),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
    },
  ));
}

