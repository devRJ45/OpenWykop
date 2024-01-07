import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_actions.g.dart';

@JsonSerializable()

class ProfileActions extends ApiModel {

  bool? update;
  @JsonKey(name: 'update_gender')
  bool? updateGender;
  @JsonKey(name: 'update_note')
  bool? updateNote;
  bool? blacklist;
  bool? follow;

  ProfileActions(
    this.update,
    this.updateGender,
    this.updateNote,
    this.blacklist,
    this.follow,
  );

  @override
  factory ProfileActions.fromJson(Map<String, dynamic> json) => _$ProfileActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileActionsToJson(this);

  static List<ProfileActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}