// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Survey _$SurveyFromJson(Map<String, dynamic> json) => Survey(
      json['key'] as String?,
      json['question'] as String?,
      json['voted'] as int?,
      json['count'] as int?,
      (json['answers'] as List<dynamic>?)
          ?.map((e) => SurveyAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['actions'] == null
          ? null
          : SurveyActions.fromJson(json['actions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'key': instance.key,
      'question': instance.question,
      'voted': instance.voted,
      'count': instance.count,
      'answers': instance.answers,
      'actions': instance.actions,
    };
