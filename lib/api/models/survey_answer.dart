import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'survey_answer.g.dart';

@JsonSerializable()

class SurveyAnswer extends ApiModel {

  String? text;
  int? id;
  int? count;
  int? voted;

  SurveyAnswer(
    this.text,
    this.id,
    this.count,
    this.voted,
  );

  @override
  factory  SurveyAnswer.fromJson(Map<String, dynamic> json) => _$SurveyAnswerFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SurveyAnswerToJson(this);

  static List<SurveyAnswer?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SurveyAnswer.fromJson(e as Map<String, dynamic>)).toList();
  }

}