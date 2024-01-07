import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_comments.g.dart';

@JsonSerializable()

class LinkComments extends ApiModel {

  bool? hot;
  int? count;

  LinkComments(
    this.hot,
    this.count,
  );

  @override
  factory LinkComments.fromJson(Map<String, dynamic> json) => _$LinkCommentsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkCommentsToJson(this);

  static List<LinkComments?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkComments.fromJson(e as Map<String, dynamic>)).toList();
  }

}