import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';
import 'package:todo_list/common/const/data.dart';
import 'package:todo_list/common/model/cursor_pagination_model.dart';
import 'package:todo_list/todo/model/todo_list_model.dart';
import 'package:todo_list/todo/model/todo_model.dart';
import 'package:todo_list/dio/dio.dart';

part 'todo_repository.g.dart';

final todoRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioProvider);
  final repository = TodoRepository(dio, baseUrl: 'http://$ip/todo');

  return repository;
});

@RestApi()
abstract class TodoRepository {
  factory TodoRepository(
    Dio dio, {
    String baseUrl,
  }) = _TodoRepository;

  @POST('/todo_list')
  @Headers(
    {
      'accessToken': 'true',
    },
  )
  Future<TodoListModel> paginate(
    @Body() Map<String, dynamic> param,
  );
}
