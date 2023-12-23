// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_summary_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileSummaryLinks _$ProfileSummaryLinksFromJson(Map<String, dynamic> json) =>
    ProfileSummaryLinks(
      json['added'] as int?,
      json['commented'] as int?,
      json['published'] as int?,
      json['related'] as int?,
      json['up'] as int?,
      json['down'] as int?,
    );

Map<String, dynamic> _$ProfileSummaryLinksToJson(
        ProfileSummaryLinks instance) =>
    <String, dynamic>{
      'added': instance.added,
      'commented': instance.commented,
      'published': instance.published,
      'related': instance.related,
      'up': instance.up,
      'down': instance.down,
    };
