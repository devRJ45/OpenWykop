// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyActions _$SurveyActionsFromJson(Map<String, dynamic> json) =>
    SurveyActions(
      json['create'] as bool?,
      json['update'] as bool?,
      json['delete'] as bool?,
      json['vote'] as bool?,
    );

Map<String, dynamic> _$SurveyActionsToJson(SurveyActions instance) =>
    <String, dynamic>{
      'create': instance.create,
      'update': instance.update,
      'delete': instance.delete,
      'vote': instance.vote,
    };
