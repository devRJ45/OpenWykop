import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'author_actions.g.dart';

@JsonSerializable()

class AuthorActions extends ApiModel {

  bool? update;
  bool? update_gender;
  bool? update_note;
  bool? blacklist;
  bool? follow;

  AuthorActions(
    this.update,
    this.update_gender,
    this.update_note,
    this.blacklist,
    this.follow,
  );

  @override
  factory  AuthorActions.fromJson(Map<String, dynamic> json) => _$AuthorActionsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AuthorActionsToJson(this);

  static List<AuthorActions?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : AuthorActions.fromJson(e as Map<String, dynamic>)).toList();
  }

}