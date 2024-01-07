import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'tag_actions.g.dart';

@JsonSerializable()

class TagActions extends ApiModel {

  bool? report;
  bool? update;
  @JsonKey(name: 'create_coauthor')
  bool? createCoauthor;
  @JsonKey(name: 'delete_coauthor')
  bool? deleteCoauthor;
  bool? blacklist;

  TagActions(
    this.report,
    this.update,
    this.createCoauthor,
    this.deleteCoauthor,
    this.blacklist,
  );

  @override
  factory TagActions.fromJson(Map<String, dynamic> json) => _$TagActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TagActionsToJson(this);

  static List<TagActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : TagActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}