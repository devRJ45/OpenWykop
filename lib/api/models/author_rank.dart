import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'author_rank.g.dart';

@JsonSerializable()

class AuthorRank extends ApiModel {

  int? position;
  int? trend;

  AuthorRank(
    this.position,
    this.trend,
  );

  @override
  factory  AuthorRank.fromJson(Map<String, dynamic> json) => _$AuthorRankFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AuthorRankToJson(this);

  static List<AuthorRank?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : AuthorRank.fromJson(e as Map<String, dynamic>)).toList();
  }

}