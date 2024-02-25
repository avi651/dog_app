import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const allDogTable = 'AllDogCeo';

  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'AllDogCeo.db'),
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE IF NOT EXISTS $allDogTable(id TEXT PRIMARY KEY ,"
            " dogImgBase TEXT)");
      },
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> selectAll(String table) async {
    final db = await DBHelper.database();

    return db.query(table);
    // with Query
    // return db.rawQuery("SELECT * FROM $todo");
  }

  static Future insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();

    return db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future deleteTable(String tableName) async {
    final db = await DBHelper.database();

    return db.rawQuery('DELETE FROM $tableName');
  }
}
