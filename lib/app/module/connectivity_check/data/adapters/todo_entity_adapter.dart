import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

class TodoEntityAdapter {
  static ToDoEntity fromMap(Map<String, dynamic> json) {
    return ToDoEntity(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      done: json['completed'] == 0 ? false : true,
      userId: json['userId'],
    );
  }

  static Map<String, dynamic> toMap(ToDoEntity todos) {
    return {
      'id': todos.id,
      'title': todos.title,
      'completed': todos.done ? 1 : 0,
      'userId': todos.userId,
    };
  }
}
