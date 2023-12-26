import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'bucket_search_output.g.dart';

@JsonSerializable()

class BucketSearchOutput extends ApiModel {

  int? count;
  List<StreamItem>? items;

  BucketSearchOutput(
    count,
    items,
  );

  @override
  factory BucketSearchOutput.fromJson(Map<String, dynamic> json) => _$BucketSearchOutputFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BucketSearchOutputToJson(this);

  static List<BucketSearchOutput?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BucketSearchOutput.fromJson(e as Map<String, dynamic>)).toList();
  }

}