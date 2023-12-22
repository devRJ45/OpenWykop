import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'autocomplete_user.g.dart';

@JsonSerializable()

class AutocompleteUser extends ApiModel {

  String? username;
  String? color;
  String? gender;
  String? avatar;
  @JsonKey(name: 'followers_qty')
  int? followersQty;

  AutocompleteUser(
    this.username,
    this.color,
    this.gender,
    this.avatar,
    this.followersQty,
  );

  factory  AutocompleteUser.fromJson(Map<String, dynamic> json) => _$AutocompleteUserFromJson(json);
  Map<String, dynamic> toJson() => _$AutocompleteUserToJson(this);

  static List<AutocompleteUser?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : AutocompleteUser.fromJson(e as Map<String, dynamic>)).toList();
  }

}