// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['td_seq'] as int,
      title: json['td_title'] as String,
      detail: json['td_detail'] as String?,
      tdFavorite: json['td_favorite'] as bool?,
      tdSuccessFlg: json['td_success_flg'] as bool?,
      todoTime: json['td_time'] == null
          ? null
          : DateTime.parse(json['td_time'] as String),
      createDt: DateTime.parse(json['create_dt'] as String),
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'td_seq': instance.id,
      'td_title': instance.title,
      'td_detail': instance.detail,
      'td_favorite': instance.tdFavorite,
      'td_success_flg': instance.tdSuccessFlg,
      'td_time': instance.todoTime?.toIso8601String(),
      'create_dt': instance.createDt.toIso8601String(),
    };
