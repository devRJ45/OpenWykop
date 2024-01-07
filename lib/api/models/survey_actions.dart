import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'survey_actions.g.dart';

@JsonSerializable()

class SurveyActions extends ApiModel {

  bool? create;
  bool? update;
  bool? delete;
  bool? vote;

  SurveyActions(
    this.create,
    this.update,
    this.delete,
    this.vote,
  );

  @override
  factory SurveyActions.fromJson(Map<String, dynamic> json) => _$SurveyActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SurveyActionsToJson(this);

  static List<SurveyActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : SurveyActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}