import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:uno/uno.dart';

import '../../domain/todo_entity.dart';
import '../adapters/todo_entity_adapter.dart';

abstract class INetworkToDosDataSource {
  AsyncResult<List<ToDoEntity>, Exception> getAllTodos();
  AsyncResult<Unit, Exception> updateTodos(List<ToDoEntity> todos);
}

class NetworkToDosDataSource implements INetworkToDosDataSource {
  final Uno clientHttp;

  final url = 'https://jsonplaceholder.typicode.com/todos';

  NetworkToDosDataSource(this.clientHttp);

  @override
  AsyncResult<List<ToDoEntity>, Exception> getAllTodos() async {
    try {
      final response = await clientHttp.get(url);

      var todoList = List<Map<String, dynamic>>.from(response.data);

      final lastREsult = todoList.map(TodoEntityAdapter.fromMap).toList();

      return Result.success(lastREsult);
    } on Exception catch (error, stackTrace) {
      debugPrint('Error: $error ; Stack: $stackTrace');
      return Result.failure(error);
    }
  }

  @override
  AsyncResult<Unit, Exception> updateTodos(List<ToDoEntity> todos) async {
    try {
      final todosMap = todos.map(TodoEntityAdapter.toMap);

      await clientHttp.post(url, data: todosMap);

      return Result.success(unit);
    } on Exception catch (error, stackTrace) {
      debugPrint('Error: $error ; Stack: $stackTrace');
      return Result.failure(error);
    }
  }
}
