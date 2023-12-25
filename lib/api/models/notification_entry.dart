import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'notification_entry.g.dart';

@JsonSerializable()

class NotificationEntry extends ApiModel {
  
  int? id;
  String? message;
  String? slug;

  NotificationEntry(
    this.id,
    this.message,
    this.slug,
  );

  @override
  factory NotificationEntry.fromJson(Map<String, dynamic> json) => _$NotificationEntryFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NotificationEntryToJson(this);

  static List<NotificationEntry?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : NotificationEntry.fromJson(e as Map<String, dynamic>)).toList();
  }

}