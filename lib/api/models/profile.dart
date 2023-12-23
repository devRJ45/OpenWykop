import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile.g.dart';

@JsonSerializable()

class Profile extends ApiModel {

  String? username;
  bool? company;
  String? gender;
  String? avatar;
  bool? note;
  bool? online;
  String? status;
  String? color;
  bool? berified;
  bool? follow;
  ProfileRank? rank;
  ProfileActions? actions;
  String? name;
  String? city;
  String? website;
  String? about;
  @JsonKey(name: 'public_email')
  String? publicEmail;
  String? background;
  int? followers;
  @JsonKey(name: 'member_since')
  String? memberSince;
  ProfileSummary? summary;
  @JsonKey(name: 'social_media')
  ProfileSocialMedia? socialMedia;
  ProfileBan? banned;
  @JsonKey(name: 'can_change_gender')
  bool? canChangeGender;

  Profile(
    this.username,
    this.company,
    this.gender,
    this.avatar,
    this.note,
    this.online,
    this.status,
    this.color,
    this.berified,
    this.follow,
    this.rank,
    this.actions,
    this.name,
    this.city,
    this.website,
    this.about,
    this.publicEmail,
    this.background,
    this.followers,
    this.memberSince,
    this.summary,
    this.socialMedia,
    this.banned,
    this.canChangeGender,
  );

  @override
  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  static List<Profile?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Profile.fromJson(e as Map<String, dynamic>)).toList();
  }

}