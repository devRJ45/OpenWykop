import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'blacklist_domain.g.dart';

@JsonSerializable()

class BlacklistDomain extends ApiModel {

  String? domain;
  @JsonKey(name: 'created_at')
  String? createdAt;

  BlacklistDomain(
    this.domain,
    this.createdAt,
  );

  @override
  factory BlacklistDomain.fromJson(Map<String, dynamic> json) => _$BlacklistDomainFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BlacklistDomainToJson(this);

  static List<BlacklistDomain?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : BlacklistDomain.fromJson(e as Map<String, dynamic>)).toList();
  }

}