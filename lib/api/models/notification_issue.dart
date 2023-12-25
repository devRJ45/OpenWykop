import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notification_issue.g.dart';

@JsonSerializable()

class NotificationIssue extends ApiModel {
  
  String? title;
  String? url;

  NotificationIssue(
    this.title,
    this.url,
  );

  @override
  factory NotificationIssue.fromJson(Map<String, dynamic> json) => _$NotificationIssueFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationIssueToJson(this);

  static List<NotificationIssue?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : NotificationIssue.fromJson(e as Map<String, dynamic>)).toList();
  }

}