// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badges_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgesList _$BadgesListFromJson(Map<String, dynamic> json) => BadgesList(
      (json['items'] as List<dynamic>?)
          ?.map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BadgesListToJson(BadgesList instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
