import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_summary_links.g.dart';

@JsonSerializable()

class ProfileSummaryLinks extends ApiModel {

  int? added;
  int? commented;
  int? published;
  int? related;
  int? up;
  int? down;

  ProfileSummaryLinks(
    this.added,
    this.commented,
    this.published,
    this.related,
    this.up,
    this.down,
  );

  @override
  factory ProfileSummaryLinks.fromJson(Map<String, dynamic> json) => _$ProfileSummaryLinksFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileSummaryLinksToJson(this);

  static List<ProfileSummaryLinks?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileSummaryLinks.fromJson(e as Map<String, dynamic>)).toList();
  }

}