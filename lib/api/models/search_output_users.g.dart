// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_output_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOutputUsers _$SearchOutputUsersFromJson(Map<String, dynamic> json) =>
    SearchOutputUsers(
      json['total'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => ProfileShort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchOutputUsersToJson(SearchOutputUsers instance) =>
    <String, dynamic>{
      'total': instance.total,
      'items': instance.items,
    };
