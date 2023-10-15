import 'package:offline_first_note_app/app/module/connectivity_check/data/services/data_base_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/todo_entity.dart';
import '../adapters/todo_entity_adapter.dart';

abstract class ILocalToDosDataSource {
  Future<List<ToDoEntity>> getAllTodos();
  Future<void> updateTodos(List<ToDoEntity> todos);
}

class LocalToDosDataSource implements ILocalToDosDataSource {
  final DatabaseHelper dbHelper;

  LocalToDosDataSource(this.dbHelper);

  @override
  Future<List<ToDoEntity>> getAllTodos() async {
    await dbHelper.initDatabase();

    final todoList = await dbHelper.getTasks();

    final result = todoList.map(TodoEntityAdapter.fromMap).toList();

    return result;
  }

  @override
  Future<void> updateTodos(List<ToDoEntity> todos) async {
    final db = await dbHelper.initDatabase();

    Batch batch = db.batch();

    for (var element in todos) {
      dbHelper.insertTask(TodoEntityAdapter.toMap(element));
    }

    batch.commit();
  }
}
