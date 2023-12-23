import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'comment.g.dart';

@JsonSerializable()

class Comment extends StreamItem {

  bool? editable;
  int? id;
  ProfileShort? author;
  String? device;
  @JsonKey(name: 'created_at')
  String? createdAt;
  int? voted;
  String? content;
  Media? media;
  bool? adult;
  List<String>? tags;
  bool? favourite;
  CommentVotes? votes;
  bool? deletable;
  bool? blacklist;
  bool? deleted;
  CommentActions? actions;
  bool? archive;
  String? slug;
  CommentParent? parent;
  
  Comment(
    this.editable,
    this.id,
    this.author,
    this.device,
    this.createdAt,
    this.voted,
    this.content,
    this.media,
    this.adult,
    this.tags,
    this.favourite,
    this.votes,
    this.deletable,
    this.blacklist,
    this.deleted,
    super.resource,
    this.actions,
    this.archive,
    this.slug,
    this.parent,
  );

  @override
  factory  Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  static List<Comment?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Comment.fromJson(e as Map<String, dynamic>)).toList();
  }

}