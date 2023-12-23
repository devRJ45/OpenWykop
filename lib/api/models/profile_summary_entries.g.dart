// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_summary_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileSummaryEntries _$ProfileSummaryEntriesFromJson(
        Map<String, dynamic> json) =>
    ProfileSummaryEntries(
      json['added'] as int?,
      json['commented'] as int?,
      json['voted'] as int?,
    );

Map<String, dynamic> _$ProfileSummaryEntriesToJson(
        ProfileSummaryEntries instance) =>
    <String, dynamic>{
      'added': instance.added,
      'commented': instance.commented,
      'voted': instance.voted,
    };
