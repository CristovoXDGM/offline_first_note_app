import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

class TodoEntityAdapter {
  Future<ToDoEntity> fromAdapter(Map json) async {
    return ToDoEntity(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      done: json['done'] ?? '',
    );
  }
}
