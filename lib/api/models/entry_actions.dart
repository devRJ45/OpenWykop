import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'entry_actions.g.dart';

@JsonSerializable()

class EntryActions extends ApiModel {

  bool? update;
  bool? delete;
  @JsonKey(name: 'vote_up')
  bool? voteUp;
  @JsonKey(name: 'create_favourite')
  bool? createFavourite;
  @JsonKey(name: 'delete_favourite')
  bool? deleteFavourite;
  bool? report;

  EntryActions(
    this.update,
    this.delete,
    this.voteUp,
    this.createFavourite,
    this.deleteFavourite,
    this.report,
  );

  @override
  factory EntryActions.fromJson(Map<String, dynamic> json) => _$EntryActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EntryActionsToJson(this);

  static List<EntryActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : EntryActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}