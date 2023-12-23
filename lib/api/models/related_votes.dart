import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'related_votes.g.dart';

@JsonSerializable()

class RelatedVotes extends ApiModel {

  int? up;
  int? down;
  int? count;

  RelatedVotes(
    this.up,
    this.down,
    this.count,
  );

  @override
  factory RelatedVotes.fromJson(Map<String, dynamic> json) => _$RelatedVotesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RelatedVotesToJson(this);

  static List<RelatedVotes?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : RelatedVotes.fromJson(e as Map<String, dynamic>)).toList();
  }

}