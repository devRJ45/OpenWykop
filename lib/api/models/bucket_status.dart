import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'bucket_status.g.dart';

@JsonSerializable()

class BucketStatus extends ApiModel {

  String? hash;
  @JsonKey(name: 'new')
  bool? haveNew;

  BucketStatus(
    this.hash,
    this.haveNew,
  );

  @override
  factory BucketStatus.fromJson(Map<String, dynamic> json) => _$BucketStatusFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BucketStatusToJson(this);

  static List<BucketStatus?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BucketStatus.fromJson(e as Map<String, dynamic>)).toList();
  }

}