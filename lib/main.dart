import 'package:flutter/material.dart';
import 'package:win/pages/main_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


String dir = "";
void initPath() async {
  //new Directory.fromUri(new Path(filename).directoryPath).createSync(recursive: true);
  dir = "${(await getApplicationDocumentsDirectory()).path}\\MDetect";
}
initDB() async {
  //Directory documentsDirectory = await getApplicationDocumentsDirectory();
  print("eto zhe $dir\\DateBase.db");
  return await openDatabase("$dir\\DateBase.db", version: 1, onOpen: (db) {
  }, onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS 'scans' ("
        "'id' INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,"
        "'file_name' TEXT,"
        "'place_name' TEXT,"
        "'date_uploaded' DATE,"
        "'date_shooted' DATE,"
        "'result' INTEGER"
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




void main() {
  initPath();
  initDB();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.blueAccent),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
    },
  ));
}

