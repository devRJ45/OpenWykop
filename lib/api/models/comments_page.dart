import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'comments_page.g.dart';

@JsonSerializable()

class CommentsPage extends ApiModel {

  List<Comment>? items;
  int? count;

  CommentsPage(
    this.items,
    this.count,
  );

  @override
  factory CommentsPage.fromJson(Map<String, dynamic> json) => _$CommentsPageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentsPageToJson(this);

  static List<CommentsPage?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : CommentsPage.fromJson(e as Map<String, dynamic>)).toList();
  }

}