import 'package:flutter/material.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/services/data_base_helper.dart';
import 'package:result_dart/result_dart.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/todo_entity.dart';
import '../adapters/todo_entity_adapter.dart';

abstract class ILocalToDosDataSource {
  AsyncResult<List<ToDoEntity>, Exception> getAllTodos();
  AsyncResult<Unit, Exception> updateTodos(List<ToDoEntity> todos);
}

class LocalToDosDataSource implements ILocalToDosDataSource {
  final DatabaseHelper dbHelper;

  LocalToDosDataSource(this.dbHelper);

  @override
  AsyncResult<List<ToDoEntity>, Exception> getAllTodos() async {
    try {
      await dbHelper.initDatabase();

      final todoList = await dbHelper.getTasks();

      final result = todoList.map(TodoEntityAdapter.fromMap).toList();

      return Result.success(result);
    } on Exception catch (error, stackTrace) {
      debugPrint('Error: $error ; Stack: $stackTrace');
      return Result.failure(error);
    }
  }

  @override
  AsyncResult<Unit, Exception> updateTodos(List<ToDoEntity> todos) async {
    try {
      final db = await dbHelper.initDatabase();

      Batch batch = db.batch();

      for (var element in todos) {
        dbHelper.insertTask(TodoEntityAdapter.toMap(element));
      }

      batch.commit();

      return Result.success(unit);
    } on Exception catch (error, stackTrace) {
      debugPrint('Error: $error ; Stack: $stackTrace');
      return Result.failure(error);
    }
  }
}
