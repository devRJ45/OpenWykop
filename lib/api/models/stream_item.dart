import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'stream_item.g.dart';

@JsonSerializable()

class StreamItem extends ApiModel {

  String? resource;

  StreamItem(
    this.resource,
  );

  @override
  factory  StreamItem.fromJson(Map<String, dynamic> json) => _$StreamItemFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$StreamItemToJson(this);

  static List<StreamItem?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : StreamItem.fromJson(e as Map<String, dynamic>)).toList();
  }

}