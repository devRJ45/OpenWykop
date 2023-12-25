import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notification.g.dart';

@JsonSerializable()

class Notification extends ApiModel {

  String? type;
  String? id;
  int? read;
  @JsonKey(name: 'created_at')
  String? createdAt;
  ProfileShort? user;
  NotificationComment? comment;
  NotificationLink? link;
  NotificationEntry? entry;
  String? msg;
  NotificationBadge? badge;
  NotificationIssue? issue;

  Notification(
    this.type,
    this.id,
    this.read,
    this.createdAt,
    this.user,
    this.comment,
    this.link,
    this.entry,
    this.msg,
    this.badge,
    this.issue,
  );

  @override
  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  static List<Notification?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Notification.fromJson(e as Map<String, dynamic>)).toList();
  }

}