import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

abstract class HomePageState {}

class LoadingHomePageState extends HomePageState {}

class InitialHomePageState extends HomePageState {}

class SuccessRetrieveTodosHomePageState extends HomePageState {
  final List<ToDoEntity> toDos;

  SuccessRetrieveTodosHomePageState({this.toDos = const []});
}

class ErrorHomePageState extends HomePageState {
  final String message;

  ErrorHomePageState({this.message = 'Could not execute the action'});
}
