// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagActions _$TagActionsFromJson(Map<String, dynamic> json) => TagActions(
      json['report'] as bool?,
      json['update'] as bool?,
      json['create_coauthor'] as bool?,
      json['delete_coauthor'] as bool?,
      json['blacklist'] as bool?,
    );

Map<String, dynamic> _$TagActionsToJson(TagActions instance) =>
    <String, dynamic>{
      'report': instance.report,
      'update': instance.update,
      'create_coauthor': instance.createCoauthor,
      'delete_coauthor': instance.deleteCoauthor,
      'blacklist': instance.blacklist,
    };
