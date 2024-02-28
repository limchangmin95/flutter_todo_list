import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  final int id;
  final String title;
  final String? detail;
  final DateTime? todoTime;
  final DateTime createDt;

  TodoModel({
    required this.id,
    required this.title,
    this.detail,
    this.todoTime,
    required this.createDt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
