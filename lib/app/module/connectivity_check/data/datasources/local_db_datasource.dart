import 'package:offline_first_note_app/app/module/connectivity_check/data/services/data_base_helper.dart';

import '../../domain/todo_entity.dart';
import '../adapters/todo_entity_adapter.dart';

abstract class ILocalToDosDataSource {
  Future<List<ToDoEntity>> getAllTodos();
  Future<void> updateTodos(List<ToDoEntity> todos);
}

class LocalToDosDataSource implements ILocalToDosDataSource {
  LocalToDosDataSource();

  @override
  Future<List<ToDoEntity>> getAllTodos() async {
    final databaseHelper = await DatabaseHelper.instance.database;

    final todoList = await databaseHelper.query('tasks');

    final result = todoList.map(TodoEntityAdapter.fromMap).toList();

    return result;
  }

  @override
  Future<void> updateTodos(List<ToDoEntity> todos) async {
    final databaseHelper = await DatabaseHelper.instance.database;
    for (var element in todos) {
      await databaseHelper.insert('tasks', TodoEntityAdapter.toMap(element));
    }
  }
}
