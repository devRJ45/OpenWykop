import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'survey.g.dart';

@JsonSerializable()

class Survey extends ApiModel {

  String? key;
  String? question;
  int? voted;
  int? count;
  List<SurveyAnswer>? answers;
  SurveyActions? actions;

  Survey(
    this.key,
    this.question,
    this.voted,
    this.count,
    this.answers,
    this.actions,
  );

  @override
  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SurveyToJson(this);

  static List<Survey?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Survey.fromJson(e as Map<String, dynamic>)).toList();
  }

}