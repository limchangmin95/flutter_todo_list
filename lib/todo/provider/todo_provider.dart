import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_list/common/model/cursor_pagination_model.dart';
import 'package:todo_list/todo/model/todo_category_model.dart';
import 'package:todo_list/todo/model/todo_list_model.dart';
import 'package:todo_list/todo/model/todo_model.dart';
import 'package:todo_list/todo/repository/todo_repository.dart';
import 'package:todo_list/user/repository/google_sign_repository.dart';

final todoProvider =
    StateNotifierProvider<TodoStateNotifier, TodoListModel>((ref) {
  final user = GoogleSignRepository.currentUser();
  final repository = ref.watch(todoRepositoryProvider);
  final notifier = TodoStateNotifier(
    repository: repository,
    id: '11111',
  );

  return notifier;
});

class TodoStateNotifier extends StateNotifier<TodoListModel> {
  final TodoRepository repository;
  final String id;

  TodoStateNotifier({
    required this.repository,
    required this.id,
  }) : super(
          TodoListModel(
            todoList: CursorPagination<TodoModel>(
              meta: null,
              data: [],
            ),
            categoryList: CursorPagination<TodoCategoryModel>(
              meta: null,
              data: [],
            ),
          ),
        ) {
    paginate(
      id: id,
    );
  }

  Future<void> paginate({
    required String id,
  }) async {
    final resp = await repository.paginate(
      {
        'id': id,
      },
    );

    state = resp;
  }
}
