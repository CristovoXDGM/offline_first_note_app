import 'package:offline_first_note_app/app/module/connectivity_check/data/adapters/todo_entity_adapter.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';
import 'package:result_dart/result_dart.dart';
import 'package:uno/uno.dart';

abstract class IGetTodoListRepository {
  AsyncResult<List<ToDoEntity>, Exception> call();
}

class GetTodoListRepository implements IGetTodoListRepository {
  final uno = Uno();
  final url = 'https://jsonplaceholder.typicode.com/todos';
  GetTodoListRepository();

  @override
  AsyncResult<List<ToDoEntity>, Exception> call() async {
    try {
      final response = await uno.get(url);

      var todoList = List<Map<String, dynamic>>.from(response.data);

      final lastREsult = todoList.map(TodoEntityAdapter.fromJson).toList();

      return Result.success(lastREsult);
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }
}
