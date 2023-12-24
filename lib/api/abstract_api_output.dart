import 'package:openwykop/api/api_request_response.dart';

import 'models/models.dart';

abstract class AbstractApiOutput<T extends ApiModel> {

  ApiRequestResponse apiResponse;
  Pagination? pagination;
  WykopError? wykopError;

  Function? modelConstructor;

  AbstractApiOutput(this.apiResponse, [this.modelConstructor]) {

    if (apiResponse.json.isEmpty || apiResponse.json == '""') {
      return;
    }

    if (apiResponse.json['data'] == null) {
      wykopError = WykopError.fromJson(apiResponse.json);
      return;
    }

    if (apiResponse.json['data'].isEmpty) {
      return;
    }

    if (apiResponse.json['pagination'] != null) {
      pagination = Pagination.fromJson(apiResponse.json['pagination']);
    }
    
    parseData();
  }

  void parseData ();

  ApiModel? autoParse(Map<String, dynamic> jsonData) {
    if (jsonData['resource'] == null) {
      return null;
    }

    switch (jsonData['resource']) {
      case 'link':
        return Link.fromJson(jsonData);
      case 'recommended_link':
        return RecomendedLink.fromJson(jsonData);
      case 'entry':
        return Entry.fromJson(jsonData);
      case 'link_comment':
      case 'entry_comment':
        return Comment.fromJson(jsonData);
    }

    return null;
  }
}