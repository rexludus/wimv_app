import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class HelperDB {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'records.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_records(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await HelperDB.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm
          .replace, //overwrite the existing data with the help of the conflictAlghorithm
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await HelperDB.database();
    return db.query(table, orderBy: "id DESC"); //fetch all the data in the "table" and return it
  }

  static Future<int> delete(String table, String id) async {
    final db = await HelperDB.database();
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
