import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'comment_votes.g.dart';

@JsonSerializable()

class CommentVotes extends ApiModel {

  int? up;
  int? down;
  List<ProfileShort>? users;

  CommentVotes(
    this.up,
    this.down,
    this.users,
  );

  @override
  factory CommentVotes.fromJson(Map<String, dynamic> json) => _$CommentVotesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentVotesToJson(this);

  static List<CommentVotes?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : CommentVotes.fromJson(e as Map<String, dynamic>)).toList();
  }

}