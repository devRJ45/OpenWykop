import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'related_actions.g.dart';

@JsonSerializable()

class RelatedActions extends ApiModel {

  bool? update;
  bool? delete;
  @JsonKey(name: 'vote_up')
  bool? voteUp;
  @JsonKey(name: 'vote_down')
  bool? voteDown;
  bool? report;

  RelatedActions(
    this.update,
    this.delete,
    this.voteUp,
    this.voteDown,
    this.report,
  );

  @override
  factory RelatedActions.fromJson(Map<String, dynamic> json) => _$RelatedActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RelatedActionsToJson(this);

  static List<RelatedActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : RelatedActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}