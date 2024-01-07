import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'count.g.dart';

@JsonSerializable()

class Count extends ApiModel {

  int? count;
  
  Count(
    this.count
  );

  @override
  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CountToJson(this);

  static List<Count?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Count.fromJson(e as Map<String, dynamic>)).toList();
  }

}