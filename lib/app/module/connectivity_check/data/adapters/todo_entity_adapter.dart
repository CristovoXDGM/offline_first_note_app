import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

class TodoEntityAdapter {
  static ToDoEntity fromJson(Map<String, dynamic> json) {
    return ToDoEntity(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      done: json['done'] ?? false,
    );
  }
}
