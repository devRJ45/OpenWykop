import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_social_media.g.dart';

@JsonSerializable()

class ProfileSocialMedia extends ApiModel {

  String? facebook;
  String? instagram;
  String? twitter;

  ProfileSocialMedia(
    this.facebook,
    this.instagram,
    this.twitter,
  );

  @override
  factory ProfileSocialMedia.fromJson(Map<String, dynamic> json) => _$ProfileSocialMediaFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileSocialMediaToJson(this);

  static List<ProfileSocialMedia?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileSocialMedia.fromJson(e as Map<String, dynamic>)).toList();
  }

}