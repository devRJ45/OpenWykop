import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'related.g.dart';

@JsonSerializable()

class Related extends ApiModel {

  bool? editable;
  int? id;
  String? title;
  @JsonKey(name: 'created_at')
  String? createdAt;
  ProfileShort? author;
  Media? media;
  RelatedSource? source;
  RelatedVotes? votes;
  int? voted;
  bool? adult;
  RelatedActions? actions;
  bool? archive;
  String? deleted;

  Related(
    this.editable,
    this.id,
    this.title,
    this.createdAt,
    this.author,
    this.media,
    this.source,
    this.votes,
    this.voted,
    this.adult,
    this.actions,
    this.archive,
    this.deleted,
  );

  @override
  factory Related.fromJson(Map<String, dynamic> json) => _$RelatedFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RelatedToJson(this);

  static List<Related?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Related.fromJson(e as Map<String, dynamic>)).toList();
  }

}