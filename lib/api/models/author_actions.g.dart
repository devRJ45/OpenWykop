// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorActions _$AuthorActionsFromJson(Map<String, dynamic> json) =>
    AuthorActions(
      json['update'] as bool?,
      json['update_gender'] as bool?,
      json['update_note'] as bool?,
      json['blacklist'] as bool?,
      json['follow'] as bool?,
    );

Map<String, dynamic> _$AuthorActionsToJson(AuthorActions instance) =>
    <String, dynamic>{
      'update': instance.update,
      'update_gender': instance.update_gender,
      'update_note': instance.update_note,
      'blacklist': instance.blacklist,
      'follow': instance.follow,
    };
