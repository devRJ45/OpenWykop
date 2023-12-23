import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'tag.g.dart';

@JsonSerializable()

class Tag extends ApiModel {

  bool? editable;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? name;
  ProfileShort? author;
  bool? personal;
  Media? media;
  String? description;
  int? followers;
  bool? follow;
  bool? notifications;
  bool? blacklist;
  bool? promoted;
  TagActions? actions;


  Tag(
    this.editable,
    this.createdAt,
    this.name,
    this.author,
    this.personal,
    this.media,
    this.description,
    this.followers,
    this.follow,
    this.notifications,
    this.blacklist,
    this.promoted,
    this.actions,
  );

  @override
  factory  Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TagToJson(this);

  static List<Tag?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>)).toList();
  }

}