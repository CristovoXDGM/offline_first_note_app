import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

class TodoEntityAdapter {
  static ToDoEntity fromMap(Map<String, dynamic> json) {
    return ToDoEntity(
      userId: json['userId'],
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      done: json['done'] ?? false,
    );
  }

  static Map<String, dynamic> toMap(ToDoEntity todos) {
    return {
      'userId': todos.userId,
      'id': todos.id,
      'title': todos.title,
      'completed': todos.done,
    };
  }
}
