// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDoEntity {
  final int id;
  final int userId;
  final String title;
  bool done;
  ToDoEntity(
      {required this.id, required this.title, required this.done, this.userId = 1});

  ToDoEntity copyWith({
    int? id,
    String? title,
    bool? done,
  }) {
    return ToDoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
      userId: userId,
    );
  }
}
