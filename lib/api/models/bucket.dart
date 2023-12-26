import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'bucket.g.dart';

@JsonSerializable()

class Bucket extends ApiModel {

  String? title;
  String? query;
  String? hash;
  String? slug;
  @JsonKey(name: 'new')
  bool? haveNew;
  @JsonKey(name: 'default_page')
  String? defaultPage;

  Bucket(
    this.title,
    this.query,
    this.hash,
    this.slug,
    this.haveNew,
    this.defaultPage,
  );

  @override
  factory Bucket.fromJson(Map<String, dynamic> json) => _$BucketFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BucketToJson(this);

  static List<Bucket?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : Bucket.fromJson(e as Map<String, dynamic>)).toList();
  }

}