import 'package:openwykop/api/abstract_api_output.dart';

import 'models/models.dart';

class ApiOutput<T extends ApiModel> extends AbstractApiOutput {

  T? data;

  ApiOutput(super.rawData, [super.modelConstructor]);


  @override
  void parseData () {
    if (modelConstructor == null) {
      this.data = autoParse(apiResponse.json['data']) as T;
      return;
    }
    this.data = modelConstructor!(apiResponse.json['data']);
  }
}