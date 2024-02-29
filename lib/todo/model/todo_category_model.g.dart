// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoCategoryModel _$TodoCategoryModelFromJson(Map<String, dynamic> json) =>
    TodoCategoryModel(
      tdCategorySeq: json['td_category_seq'] as int,
      tdCategoryNm: json['td_category_nm'] as String,
      createDt: json['create_dt'] as String,
    );

Map<String, dynamic> _$TodoCategoryModelToJson(TodoCategoryModel instance) =>
    <String, dynamic>{
      'td_category_seq': instance.tdCategorySeq,
      'td_category_nm': instance.tdCategoryNm,
      'create_dt': instance.createDt,
    };
