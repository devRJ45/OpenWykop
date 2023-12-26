// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOutput _$SearchOutputFromJson(Map<String, dynamic> json) => SearchOutput(
      json['links'] == null
          ? null
          : SearchOutputLinks.fromJson(json['links'] as Map<String, dynamic>),
      json['entries'] == null
          ? null
          : SearchOutputEntries.fromJson(
              json['entries'] as Map<String, dynamic>),
      json['users'] == null
          ? null
          : SearchOutputUsers.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchOutputToJson(SearchOutput instance) =>
    <String, dynamic>{
      'links': instance.links,
      'entries': instance.entries,
      'users': instance.users,
    };
