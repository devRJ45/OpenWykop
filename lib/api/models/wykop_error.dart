import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'wykop_error.g.dart';

@JsonSerializable()

class WykopError extends ApiModel {

  int? code;
  String? hash;
  WykopErrorMessage? error;

  WykopError(
    this.code,
    this.hash,
    this.error
  );

  @override
  factory WykopError.fromJson(Map<String, dynamic> json) => _$WykopErrorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WykopErrorToJson(this);
}