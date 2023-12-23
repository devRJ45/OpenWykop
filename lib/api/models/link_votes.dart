import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_votes.g.dart';

@JsonSerializable()

class LinkVotes extends ApiModel {

  int? up;
  int? down;
  int? count;

  LinkVotes(
    this.up,
    this.down,
    this.count,
  );

  @override
  factory  LinkVotes.fromJson(Map<String, dynamic> json) => _$LinkVotesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkVotesToJson(this);

  static List<LinkVotes?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkVotes.fromJson(e as Map<String, dynamic>)).toList();
  }

}