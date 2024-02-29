// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoListModel _$TodoListModelFromJson(Map<String, dynamic> json) =>
    TodoListModel(
      todoList: CursorPagination<TodoModel>.fromJson(
          json['todo_list'] as Map<String, dynamic>,
          (value) => TodoModel.fromJson(value as Map<String, dynamic>)),
      categoryList: CursorPagination<TodoCategoryModel>.fromJson(
          json['category_list'] as Map<String, dynamic>,
          (value) => TodoCategoryModel.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$TodoListModelToJson(TodoListModel instance) =>
    <String, dynamic>{
      'todo_list': instance.todoList,
      'category_list': instance.categoryList,
    };
