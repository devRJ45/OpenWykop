import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'profile_summary_entries.g.dart';

@JsonSerializable()

class ProfileSummaryEntries extends ApiModel {

  int? added;
  int? commented;
  int? voted;

  ProfileSummaryEntries(
    this.added,
    this.commented,
    this.voted,
  );

  @override
  factory ProfileSummaryEntries.fromJson(Map<String, dynamic> json) => _$ProfileSummaryEntriesFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProfileSummaryEntriesToJson(this);

  static List<ProfileSummaryEntries?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : ProfileSummaryEntries.fromJson(e as Map<String, dynamic>)).toList();
  }

}