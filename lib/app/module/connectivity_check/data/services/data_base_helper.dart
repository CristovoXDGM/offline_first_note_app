import 'package:offline_first_note_app/app/module/connectivity_check/data/consts.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  late Database _db;

  Future<Database> get db async {
    _db = await initDatabase();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();

    String path = dbPath + DATABASE_NAME;

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);

    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(CREATE_TODO_TABLE);
  }

  Future<int> insertTask(Map<String, dynamic> row) async {
    Database dbClient = await db;
    return await dbClient.insert('tasks', row);
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    Database dbClient = await db;
    return await dbClient.query('tasks');
  }

  Future<int> updateTask(Map<String, dynamic> row) async {
    Database dbClient = await db;
    int id = row['id'];
    return await dbClient.update('tasks', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTask(int id) async {
    Database dbClient = await db;
    return await dbClient.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
