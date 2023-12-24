import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'auth.g.dart';

@JsonSerializable()

class Auth extends ApiModel {

  String? token;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  Auth(
    this.token,
    this.refreshToken,
  );

  @override
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AuthToJson(this);

  static List<Auth?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Auth.fromJson(e as Map<String, dynamic>)).toList();
  }

}