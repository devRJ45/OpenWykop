import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_rank.g.dart';

@JsonSerializable()

class ProfileRank extends ApiModel {

  int? position;
  int? trend;

  ProfileRank(
    this.position,
    this.trend,
  );

  @override
  factory  ProfileRank.fromJson(Map<String, dynamic> json) => _$ProfileRankFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileRankToJson(this);

  static List<ProfileRank?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileRank.fromJson(e as Map<String, dynamic>)).toList();
  }

}