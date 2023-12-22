import 'package:openwykop/api/abstract_api_output.dart';

import 'models/models.dart';

class ApiOutput<T extends ApiModel> extends AbstractApiOutput {

  T? data;

  ApiOutput(super.json, super.modelConstructor);


  @override
  void parseData () {
    this.data = modelConstructor(json['data']);
  }
}