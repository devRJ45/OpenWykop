import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'pm_notification.g.dart';

@JsonSerializable()

class PMNotification extends ApiModel {

  String? type;
  String? id;
  int? read;
  @JsonKey(name: 'created_at')
  String? createdAt;
  ProfileShort? user;
  String? content;

  PMNotification(
    this.type,
    this.id,
    this.read,
    this.createdAt,
    this.user,
    this.content
  );

  @override
  factory PMNotification.fromJson(Map<String, dynamic> json) => _$PMNotificationFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PMNotificationToJson(this);

  static List<PMNotification?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : PMNotification.fromJson(e as Map<String, dynamic>)).toList();
  }

}