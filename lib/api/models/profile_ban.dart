import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_ban.g.dart';

@JsonSerializable()

class ProfileBan extends ApiModel {

  String? reason;
  String? expired;

  ProfileBan(
    this.reason,
    this.expired,
  );

  @override
  factory ProfileBan.fromJson(Map<String, dynamic> json) => _$ProfileBanFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileBanToJson(this);

  static List<ProfileBan?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileBan.fromJson(e as Map<String, dynamic>)).toList();
  }

}