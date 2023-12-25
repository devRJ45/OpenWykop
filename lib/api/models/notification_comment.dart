import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notification_comment.g.dart';

@JsonSerializable()

class NotificationComment extends ApiModel {
  
  int? id;

  NotificationComment(
    this.id,
  );

  @override
  factory NotificationComment.fromJson(Map<String, dynamic> json) => _$NotificationCommentFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationCommentToJson(this);

  static List<NotificationComment?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : NotificationComment.fromJson(e as Map<String, dynamic>)).toList();
  }

}