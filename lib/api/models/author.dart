import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'author.g.dart';

@JsonSerializable()

class Author extends ApiModel {

  String? username;
  bool? company;
  String? gender;
  String? avatar;
  bool? note;
  bool? online;
  String? status;
  String? color;
  bool? verified;
  bool? follow;
  AuthorRank? rank; 
  AuthorActions? actions;

  Author(
    this.username,
    this.company,
    this.gender,
    this.avatar,
    this.note,
    this.online,
    this.status,
    this.color,
    this.verified,
    this.follow,
    this.rank,
  );

  @override
  factory  Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  static List<Author?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Author.fromJson(e as Map<String, dynamic>)).toList();
  }

}