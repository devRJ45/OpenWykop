import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_actions.g.dart';

@JsonSerializable()

class ProfileActions extends ApiModel {

  bool? update;
  bool? update_gender;
  bool? update_note;
  bool? blacklist;
  bool? follow;

  ProfileActions(
    this.update,
    this.update_gender,
    this.update_note,
    this.blacklist,
    this.follow,
  );

  @override
  factory  ProfileActions.fromJson(Map<String, dynamic> json) => _$ProfileActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileActionsToJson(this);

  static List<ProfileActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}