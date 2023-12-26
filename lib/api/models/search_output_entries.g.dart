// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_output_entries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOutputEntries _$SearchOutputEntriesFromJson(Map<String, dynamic> json) =>
    SearchOutputEntries(
      json['total'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchOutputEntriesToJson(
        SearchOutputEntries instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items,
    };
