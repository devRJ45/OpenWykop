import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_short.g.dart';

@JsonSerializable()

class ProfileShort extends ApiModel {

  String? username;
  bool? company;
  String? gender;
  String? avatar;
  bool? note;
  bool? online;
  String? status;
  String? color;
  bool? verified;
  bool? follow;
  ProfileRank? rank; 
  ProfileActions? actions;

  ProfileShort(
    this.username,
    this.company,
    this.gender,
    this.avatar,
    this.note,
    this.online,
    this.status,
    this.color,
    this.verified,
    this.follow,
    this.rank,
  );

  String? getAvatar ({required int size}) {
    if (avatar == null) {
      return null;
    }

    int extensionPosition = avatar!.lastIndexOf('.');
    
    if (extensionPosition < 0) {
      return null;
    }

    return '${avatar!.substring(0, extensionPosition)},q$size${avatar!.substring(extensionPosition)}';
  }

  @override
  factory ProfileShort.fromJson(Map<String, dynamic> json) => _$ProfileShortFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileShortToJson(this);

  static List<ProfileShort?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileShort.fromJson(e as Map<String, dynamic>)).toList();
  }

}