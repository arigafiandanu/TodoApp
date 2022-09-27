import 'package:agenda_hari_ini/model/taskModel.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int version = 2;
  static const String tableName = "tasks";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
        path,
        version: version,
        onCreate: (db, version) {
          print("membuat database baru");
          return db.execute(
            "CREATE TABLE $tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING, "
            "note TEXT, "
            "date STRING,"
            "startTime STRING, "
            "endTime STRING, "
            "remind STRING, "
            "repeat STRING, "
            "color INTEGER, "
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(TaskModel? taskModel) async {
    print("insert model");
    return await _db?.insert(tableName, taskModel!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query fanction called");
    return await _db!.query(tableName);
  }

  static delete(TaskModel? taskModel) async {
    return await _db!
        .delete(tableName, where: 'id=?', whereArgs: [taskModel!.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
    UPDATE tasks 
    SET isCompleted = ?
    Where id = ?
  ''', [1, id]);
  }
}
