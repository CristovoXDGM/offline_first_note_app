import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/datasources/network_db_datasource.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../datasources/local_db_datasource.dart';

abstract class IGetTodoListRepository {
  AsyncResult<List<ToDoEntity>, Exception> getTodos();
  AsyncResult<Unit, Exception> updateTodosNetwork(List<ToDoEntity> todos);
  AsyncResult<Unit, Exception> updateTodosLocal(List<ToDoEntity> todos);
}

class GetTodoListRepository implements IGetTodoListRepository {
  final ILocalToDosDataSource localToDosDataSource;
  final INetworkToDosDataSource networkToDosDataSource;

  GetTodoListRepository(
    this.localToDosDataSource,
    this.networkToDosDataSource,
  );

  @override
  AsyncResult<List<ToDoEntity>, Exception> getTodos() async {
    try {
      bool hasConnection = await InternetConnectionChecker().hasConnection;

      if (hasConnection) {
        final result = await networkToDosDataSource.getAllTodos();
        return Result.success(result);
      } else {
        final result = await localToDosDataSource.getAllTodos();
        return Result.success(result);
      }
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }

  @override
  AsyncResult<Unit, Exception> updateTodosNetwork(List<ToDoEntity> todos) async {
    try {
      await networkToDosDataSource.updateTodos(todos);

      return Result.success(unit);
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }

  @override
  AsyncResult<Unit, Exception> updateTodosLocal(List<ToDoEntity> todos) async {
    try {
      await localToDosDataSource.updateTodos(todos);

      return Result.success(unit);
    } on Exception catch (error) {
      return Result.failure(error);
    }
  }
}
