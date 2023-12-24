import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'survey_id.g.dart';

@JsonSerializable()

class SurveyId extends ApiModel {

  @JsonKey(name: 'survey_id')
  String? surveyId;

  SurveyId(
    this.surveyId,
  );

  @override
  factory SurveyId.fromJson(Map<String, dynamic> json) => _$SurveyIdFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SurveyIdToJson(this);

  static List<SurveyId?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SurveyId.fromJson(e as Map<String, dynamic>)).toList();
  }

}