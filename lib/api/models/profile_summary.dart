import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_summary.g.dart';

@JsonSerializable()

class ProfileSummary extends ApiModel {

  int? actions;
  int? links;
  @JsonKey(name: 'links_details')
  ProfileSummaryLinks? linksDetails;
  int? entries;
  @JsonKey(name: 'entries_details')
  ProfileSummaryEntries? entriesDetails;
  @JsonKey(name: 'following_users')
  int? followingUsers;
  @JsonKey(name: 'following_tags')
  int? followingTags;
  int? followers;

  ProfileSummary(
    this.actions,
    this.links,
    this.linksDetails,
    this.entries,
    this.entriesDetails,
    this.followingUsers,
    this.followingTags,
    this.followers,
  );

  @override
  factory ProfileSummary.fromJson(Map<String, dynamic> json) => _$ProfileSummaryFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileSummaryToJson(this);

  static List<ProfileSummary?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileSummary.fromJson(e as Map<String, dynamic>)).toList();
  }

}