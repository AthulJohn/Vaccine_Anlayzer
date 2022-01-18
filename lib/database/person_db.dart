import 'package:sqflite/sqflite.dart';
import 'package:vaccineanalyzer/models/center.dart';
import 'package:vaccineanalyzer/models/person.dart';
import 'package:vaccineanalyzer/models/vaccination.dart';
import 'package:vaccineanalyzer/models/vaccine.dart';

VaccineDatabase vaccineDatabase = VaccineDatabase();

class VaccineDatabase {
  late Database db;
  Map<String, int> ind = {
    "vid": -1,
    "pid": -1,
    "cid": -1,
    "vcid": -1,
  };
  void initDB() async {
    db = await openDatabase('vaccination_analysis.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Person (pid INTEGER PRIMARY KEY, name TEXT, age INTEGER, gender VARCHAR(7), phone VARCHAR(14), district TEXT)');
      await db.execute(
          'CREATE TABLE Vaccine (vid INTEGER PRIMARY KEY, name TEXT, company TEXT, country TEXT, doses INTEGER)');
      await db.execute(
          'CREATE TABLE Center (cid INTEGER PRIMARY KEY, name TEXT, place TEXT, district TEXT)');
      await db.execute(
          'CREATE TABLE Vaccination (vcid INTEGER PRIMARY KEY,pid INTEGER ,vid INTEGER ,cid INTEGER, date TEXT, doseno INTEGER, FOREIGN KEY (pid) REFERENCES Person(pid), FOREIGN KEY (vid) REFERENCES Vaccine(vid), FOREIGN KEY (cid) REFERENCES Center(cid))');
    });
  }

  Future<void> inserttoTable(dynamic value, String table, String id) async {
    if (ind[id] == -1) await findIndex(table, id);
    Map<String, dynamic> row = value.toMap();
    ind[id] = ind[id]! + 1;
    row.addAll({id: ind[id]});
    await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);

    //TODO
    getList(table);
  }

  Future<void> findIndex(String table, String col) async {
    List<Map> maps = await db.rawQuery('SELECT MAX($col) FROM $table');
    ind[col] = (maps.first.values.first ?? -1);
  }

  void getList(String table) async {
    List<Map> maps = await db.query(table);
    print(maps.toString());
  }

  void close() async {
    await db.close();
  }
}
