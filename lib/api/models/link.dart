import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link.g.dart';

@JsonSerializable()

class Link extends StreamItem {

  bool? editable;
  int? id;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? title;
  String? slug;
  String? description;
  LinkSource? source;
  ProfileShort? author;
  @JsonKey(name: 'published_at')
  String? publishedAt;
  LinkVotes? votes;
  int? voted;
  CommentsPage? comments;
  List<String>? tags;
  bool? hot;
  bool? adult;
  Media? media;
  bool? deletable;
  LinkActions? actions;
  bool? archive;
  String? deleted;
  List<Alert>? alerts;
  bool? favourite;
  LinkAma? ama;

  Link(
    this.editable,
    this.id,
    this.createdAt,
    this.title,
    this.slug,
    this.description,
    this.source,
    this.author,
    this.publishedAt,
    this.votes,
    this.voted,
    this.comments,
    this.tags,
    this.hot,
    this.adult,
    this.media,
    this.deletable,
    super.resource,
    this.actions,
    this.archive,
    this.deleted,
    this.alerts,
    this.favourite,
    this.ama,
  );

  @override
  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkToJson(this);

  static List<Link?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>)).toList();
  }

}