import 'package:uno/uno.dart';

import '../../domain/todo_entity.dart';
import '../adapters/todo_entity_adapter.dart';

abstract class INetworkToDosDataSource {
  Future<List<ToDoEntity>> getAllTodos();
  Future<void> updateTodos(List<ToDoEntity> todos);
}

class NetworkToDosDataSource implements INetworkToDosDataSource {
  final Uno clientHttp;

  final url = 'https://jsonplaceholder.typicode.com/todos';

  NetworkToDosDataSource(this.clientHttp);

  @override
  Future<List<ToDoEntity>> getAllTodos() async {
    final response = await clientHttp.get(url);

    final todoList = List<Map<String, dynamic>>.from(response.data);

    final result = todoList.map(TodoEntityAdapter.fromMap).toList();

    return result;
  }

  @override
  Future<void> updateTodos(List<ToDoEntity> todos) async {
    final todosMap = todos.map(TodoEntityAdapter.toMap);
    await clientHttp.post(url, data: todosMap);
  }
}
