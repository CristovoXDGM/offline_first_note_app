import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

abstract class LocalDataBaseService {
  Future<void> initDb(String path);

  Future<void> close();

  Future<int> delete(int id);

  Future<ToDoEntity> insertData(ToDoEntity todo);

  Future<int> updateTodo(ToDoEntity todo);

  Future<ToDoEntity> getSingleData(int id);

  Future<List<ToDoEntity>> getAllData(int id);
}
