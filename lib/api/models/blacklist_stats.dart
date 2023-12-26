import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'blacklist_stats.g.dart';

@JsonSerializable()

class BlacklistStats extends ApiModel {

  @JsonKey(name: 'total_users')
  int? totalUsers;
  @JsonKey(name: 'total_tags')
  int? totalTags;
  @JsonKey(name: 'total_domains')
  int? totalDomains;

  BlacklistStats(
    this.totalUsers,
    this.totalTags,
    this.totalDomains,
  );

  @override
  factory BlacklistStats.fromJson(Map<String, dynamic> json) => _$BlacklistStatsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BlacklistStatsToJson(this);

  static List<BlacklistStats?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BlacklistStats.fromJson(e as Map<String, dynamic>)).toList();
  }

}