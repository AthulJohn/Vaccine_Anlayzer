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
  Future<void> initDB() async {
    db = await openDatabase('vaccination_analysis.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Person (pid INTEGER PRIMARY KEY, name TEXT, age INTEGER, gender VARCHAR(7), phone VARCHAR(14), district TEXT)');
      await db.execute(
          'CREATE TABLE Vaccine (vid INTEGER PRIMARY KEY, name TEXT, company TEXT, country TEXT, doses INTEGER)');
      await db.execute(
          'CREATE TABLE Center (cid INTEGER PRIMARY KEY, name TEXT, place TEXT, district TEXT, sector TEXT)');
      await db.execute(
          'CREATE TABLE Vaccination (vcid INTEGER PRIMARY KEY,pid INTEGER ,vid INTEGER ,cid INTEGER, date TEXT, doseno INTEGER, completed VARCHAR(10), FOREIGN KEY (pid) REFERENCES Person(pid), FOREIGN KEY (vid) REFERENCES Vaccine(vid), FOREIGN KEY (cid) REFERENCES Center(cid))');
      await db.execute(
          'CREATE TABLE Positived (pid INTEGER PRIMARY KEY, date TEXT, doseno INTEGER, FOREIGN KEY (pid) REFERENCES Person(pid))');
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

  Future<double> getPercentage() async {
    List<Map> vccount =
        await db.rawQuery('SELECT COUNT(DISTINCT(pid)) from Vaccination');
    int percent = vccount.first.values.first;
    vccount = await db.rawQuery('SELECT COUNT(*) from Person');
    double fpercent = (percent / vccount.first.values.first) * 100;
    return fpercent;
  }

  Future<int> getDoseCount() async {
    List<Map> vccount = await db.rawQuery('SELECT COUNT(*) from Vaccination');
    return vccount.first.values.first;
  }

  Future<int> getVaccinatedPeopleCount() async {
    List<Map> vccount =
        await db.rawQuery('SELECT COUNT(DISTINCT(pid)) from Vaccination');
    return vccount.first.values.first;
  }

  void close() async {
    await db.close();
  }

  getValById(String table, int id, String colnm, List<String> cols) async {
    List<Map> maps = await db
        .query(table, columns: cols, where: '$colnm = ?', whereArgs: [id]);
  }
}
