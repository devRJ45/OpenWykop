import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'blacklist_user.g.dart';

@JsonSerializable()

class BlacklistUser extends ApiModel {

  String? username;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? gender;
  String? color;
  String? avatar;

  BlacklistUser(
    this.username,
    this.createdAt,
    this.gender,
    this.color,
    this.avatar,
  );

  @override
  factory BlacklistUser.fromJson(Map<String, dynamic> json) => _$BlacklistUserFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BlacklistUserToJson(this);

  static List<BlacklistUser?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BlacklistUser.fromJson(e as Map<String, dynamic>)).toList();
  }

}