// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_output_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOutputLinks _$SearchOutputLinksFromJson(Map<String, dynamic> json) =>
    SearchOutputLinks(
      json['total'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchOutputLinksToJson(SearchOutputLinks instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items,
    };
