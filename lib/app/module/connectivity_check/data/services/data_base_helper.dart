// ignore_for_file: depend_on_referenced_packages

import 'package:offline_first_note_app/app/module/connectivity_check/data/consts.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    final result = await initDatabase();
    return result;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();

    String path = join(dbPath, DATABASE_NAME);

    final result = await openDatabase(path, version: 1, onCreate: _onCreate);

    return result;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(CREATE_TODO_TABLE);
  }

  // Future<int> updateTask(Map<String, dynamic> row) async {
  //   Database dbClient = await database;
  //   int id = row['id'];
  //   return await dbClient.update('tasks', row, where: 'id = ?', whereArgs: [id]);
  // }

  // Future<int> deleteTask(int id) async {
  //   Database dbClient = await database;
  //   return await dbClient.delete('tasks', where: 'id = ?', whereArgs: [id]);
  // }
}
