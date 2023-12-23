// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileSummary _$ProfileSummaryFromJson(Map<String, dynamic> json) =>
    ProfileSummary(
      json['actions'] as int?,
      json['links'] as int?,
      json['links_details'] == null
          ? null
          : ProfileSummaryLinks.fromJson(
              json['links_details'] as Map<String, dynamic>),
      json['entries'] as int?,
      json['entries_details'] == null
          ? null
          : ProfileSummaryEntries.fromJson(
              json['entries_details'] as Map<String, dynamic>),
      json['following_users'] as int?,
      json['following_tags'] as int?,
      json['followers'] as int?,
    );

Map<String, dynamic> _$ProfileSummaryToJson(ProfileSummary instance) =>
    <String, dynamic>{
      'actions': instance.actions,
      'links': instance.links,
      'links_details': instance.linksDetails,
      'entries': instance.entries,
      'entries_details': instance.entriesDetails,
      'following_users': instance.followingUsers,
      'following_tags': instance.followingTags,
      'followers': instance.followers,
    };
