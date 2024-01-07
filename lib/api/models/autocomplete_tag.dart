import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'autocomplete_tag.g.dart';

@JsonSerializable()

class AutocompleteTag extends ApiModel {

  String? name;
  @JsonKey(name: 'observed_qty')
  int? observedQty;

  AutocompleteTag(
    this.name,
    this.observedQty,
  );

  @override
  factory AutocompleteTag.fromJson(Map<String, dynamic> json) => _$AutocompleteTagFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AutocompleteTagToJson(this);

  static List<AutocompleteTag?>? fromJsonList (List<dynamic> jsonList) {
    return (jsonList as List<dynamic>?)?.map((e) => e == null ? null : AutocompleteTag.fromJson(e as Map<String, dynamic>)).toList();
  }

}