import 'package:json_annotation/json_annotation.dart';
import 'package:todo_list/common/model/cursor_pagination_model.dart';
import 'package:todo_list/todo/model/todo_category_model.dart';
import 'package:todo_list/todo/model/todo_model.dart';

part 'todo_list_model.g.dart';

@JsonSerializable()
class TodoListModel {
  @JsonKey(name: 'todo_list')
  final CursorPagination<TodoModel> todoList;
  @JsonKey(name: 'category_list')
  final CursorPagination<TodoCategoryModel> categoryList;

  TodoListModel({
    required this.todoList,
    required this.categoryList,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListModelFromJson(json);
}
