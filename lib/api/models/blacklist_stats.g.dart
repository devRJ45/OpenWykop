// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blacklist_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlacklistStats _$BlacklistStatsFromJson(Map<String, dynamic> json) =>
    BlacklistStats(
      json['total_users'] as int?,
      json['total_tags'] as int?,
      json['total_domains'] as int?,
    );

Map<String, dynamic> _$BlacklistStatsToJson(BlacklistStats instance) =>
    <String, dynamic>{
      'total_users': instance.totalUsers,
      'total_tags': instance.totalTags,
      'total_domains': instance.totalDomains,
    };
