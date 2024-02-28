// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      detail: json['detail'] as String?,
      todoTime: json['todoTime'] == null
          ? null
          : DateTime.parse(json['todoTime'] as String),
      createDt: DateTime.parse(json['createDt'] as String),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
      'todoTime': instance.todoTime?.toIso8601String(),
      'createDt': instance.createDt.toIso8601String(),
    };
