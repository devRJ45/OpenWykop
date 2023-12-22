import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'wykop_error_message.g.dart';

@JsonSerializable()

class WykopErrorMessage extends ApiModel {

  int? key;
  String? message;

  WykopErrorMessage(
    this.key,
    this.message
  );

  @override
  factory WykopErrorMessage.fromJson(Map<String, dynamic> json) => _$WykopErrorMessageFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WykopErrorMessageToJson(this);
}