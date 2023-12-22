import 'models/models.dart';

abstract class AbstractApiOutput<T extends ApiModel> {

  Map<String, dynamic> json;
  Pagination? pagination;
  WykopError? wykopError;

  Function modelConstructor;

  AbstractApiOutput(this.json, this.modelConstructor) {
    if (json['data'] == null) {
      wykopError = WykopError.fromJson(json);
      return;
    }

    if (json['pagination'] != null) {
      pagination = Pagination.fromJson(json['pagination']);
    }
    
    parseData();
  }

  void parseData ();
}