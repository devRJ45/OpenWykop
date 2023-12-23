import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_vote.g.dart';

@JsonSerializable()

class LinkVote extends ApiModel {

  ProfileShort? user;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? reason;

  LinkVote(
    this.user,
    this.createdAt,
    this.reason,
  );

  @override
  factory LinkVote.fromJson(Map<String, dynamic> json) => _$LinkVoteFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkVoteToJson(this);

  static List<LinkVote?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkVote.fromJson(e as Map<String, dynamic>)).toList();
  }

}