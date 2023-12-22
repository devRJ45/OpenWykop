import 'package:openwykop/api/api_request_response.dart';

import 'models/models.dart';

abstract class AbstractApiOutput<T extends ApiModel> {

  ApiRequestResponse apiResponse;
  Pagination? pagination;
  WykopError? wykopError;

  Function modelConstructor;

  AbstractApiOutput(ApiRequestResponse this.apiResponse, this.modelConstructor) {

    if (apiResponse.json['data'] == null) {
      wykopError = WykopError.fromJson(apiResponse.json);
      return;
    }

    if (apiResponse.json['pagination'] != null) {
      pagination = Pagination.fromJson(apiResponse.json['pagination']);
    }
    
    parseData();
  }

  void parseData ();
}