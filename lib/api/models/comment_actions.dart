import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'comment_actions.g.dart';

@JsonSerializable()

class CommentActions extends ApiModel {

  bool? update;
  bool? delete;
  @JsonKey(name: 'vote_up')
  bool? voteUp;
  @JsonKey(name: 'vote_down')
  bool? voteDown;
  @JsonKey(name: 'create_favourite')
  bool? createFavourite;
  @JsonKey(name: 'delete_favourite')
  bool? deleteFavourite;

  CommentActions(
    this.update,
    this.delete,
    this.voteUp,
    this.voteDown,
    this.createFavourite,
    this.deleteFavourite,
  );

  @override
  factory  CommentActions.fromJson(Map<String, dynamic> json) => _$CommentActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentActionsToJson(this);

  static List<CommentActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : CommentActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}