import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'link_actions.g.dart';

@JsonSerializable()

class LinkActions extends ApiModel {

  bool? update;
  bool? delete;
  bool? vote_up;
  @JsonKey(name: 'vote_down')
  bool? voteDown;
  @JsonKey(name: 'undo_vote')
  bool? undoVote;
  @JsonKey(name: 'create_favourite')
  bool? createFavourite;
  @JsonKey(name: 'delete_favourite')
  bool? deleteFavourite;
  bool? report;
  @JsonKey(name: 'create_ama')
  bool? createAma;
  @JsonKey(name: 'finish_ama')
  bool? finishAma;

  LinkActions(
    this.update,
    this.delete,
    this.vote_up,
    this.voteDown,
    this.undoVote,
    this.createFavourite,
    this.deleteFavourite,
    this.report,
    this.createAma,
    this.finishAma,
  );

  @override
  factory LinkActions.fromJson(Map<String, dynamic> json) => _$LinkActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LinkActionsToJson(this);

  static List<LinkActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : LinkActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}