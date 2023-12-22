import 'package:openwykop/api/abstract_api_output.dart';

import 'models/models.dart';

class ApiOutputList<T extends ApiModel> extends AbstractApiOutput {

  List<T?>? data;

  ApiOutputList(super.json, super.modelConstructor);


  @override
  void parseData () {
    this.data = modelConstructor(json['data']);
  }
}