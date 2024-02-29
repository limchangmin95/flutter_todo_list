import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  @JsonKey(name: 'td_seq')
  final int id;
  @JsonKey(name: 'td_title')
  final String title;
  @JsonKey(name: 'td_detail')
  final String? detail;
  @JsonKey(name: 'td_favorite')
  final bool? tdFavorite;
  @JsonKey(name: 'td_success_flg')
  final bool? tdSuccessFlg;
  @JsonKey(name: 'td_time')
  final DateTime? todoTime;
  @JsonKey(name: 'create_dt')
  final DateTime createDt;

  TodoModel({
    required this.id,
    required this.title,
    this.detail,
    this.tdFavorite,
    this.tdSuccessFlg,
    this.todoTime,
    required this.createDt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
