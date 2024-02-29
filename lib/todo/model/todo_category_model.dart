import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'todo_category_model.g.dart';

@JsonSerializable()
class TodoCategoryModel {
  @JsonKey(name: 'td_category_seq')
  final int tdCategorySeq;
  @JsonKey(name: 'td_category_nm')
  final String tdCategoryNm;
  @JsonKey(name: 'create_dt')
  final String createDt;

  TodoCategoryModel({
    required this.tdCategorySeq,
    required this.tdCategoryNm,
    required this.createDt,
  });

  factory TodoCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TodoCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoCategoryModelToJson(this);
}
