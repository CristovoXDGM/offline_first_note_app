import 'package:flutter/material.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/data/repositories/get_todo_list_repository.dart';
import 'package:offline_first_note_app/app/module/connectivity_check/domain/todo_entity.dart';

import 'home_page_states.dart';

class HomePageStore extends ValueNotifier<HomePageState> {
  final IGetTodoListRepository _repository;

  HomePageStore(
    this._repository,
  ) : super(
          InitialHomePageState(),
        );

  Future<void> getAllTodos() async {
    value = LoadingHomePageState();

    final response = await _repository.getTodos();

    response.fold((success) {
      value = SuccessRetrieveTodosHomePageState(toDos: success);
    }, (failure) {
      value = ErrorHomePageState(message: failure.toString());
    });
  }

  Future<void> updateTodosLocal(List<ToDoEntity> todos) async {
    value = LoadingHomePageState();

    final response = await _repository.updateTodosLocal(todos);

    response.fold((success) {
      value = SuccessRetrieveTodosHomePageState(toDos: todos);
    }, (failure) {
      value = ErrorHomePageState(message: failure.toString());
    });
  }

  Future<void> updateTodosNewtWork(List<ToDoEntity> todos) async {
    value = LoadingHomePageState();

    final response = await _repository.updateTodosNetwork(todos);

    response.fold((success) {
      value = SuccessRetrieveTodosHomePageState(toDos: todos);
    }, (failure) {
      value = ErrorHomePageState(message: failure.toString());
    });
  }
}
