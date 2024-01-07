import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'entry.g.dart';

@JsonSerializable()

class Entry extends StreamItem {

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
  bool? deletable;
  String? slug;
  EntryVotes? votes;
  EntryComments? comments;
  @JsonKey(name: 'parent_id')
  int? parentId;
  EntryActions? actions;
  bool? archive;
  String? deleted;

  Entry(
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
    this.deletable,
    this.slug,
    this.votes,
    this.comments,
    this.parentId,
    super.resource,
    this.actions,
    this.archive,
    this.deleted,
  );

  @override
  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EntryToJson(this);

  static List<Entry?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Entry.fromJson(e as Map<String, dynamic>)).toList();
  }

}