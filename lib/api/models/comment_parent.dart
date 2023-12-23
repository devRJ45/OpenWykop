import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'comment_parent.g.dart';

@JsonSerializable()

class CommentParent extends ApiModel {

  String? resource;
  int? id;
  String? slug;
  ProfileShort? author;
  List<ParentLocation>? location;

  CommentParent(
    this.resource,
    this.id,
    this.slug,
    this.author,
    this.location,
  );

  @override
  factory  CommentParent.fromJson(Map<String, dynamic> json) => _$CommentParentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentParentToJson(this);

  static List<CommentParent?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : CommentParent.fromJson(e as Map<String, dynamic>)).toList();
  }

}