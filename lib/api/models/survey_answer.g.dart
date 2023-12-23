// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyAnswer _$SurveyAnswerFromJson(Map<String, dynamic> json) => SurveyAnswer(
      json['text'] as String?,
      json['id'] as int?,
      json['count'] as int?,
      json['voted'] as int?,
    );

Map<String, dynamic> _$SurveyAnswerToJson(SurveyAnswer instance) =>
    <String, dynamic>{
      'text': instance.text,
      'id': instance.id,
      'count': instance.count,
      'voted': instance.voted,
    };
