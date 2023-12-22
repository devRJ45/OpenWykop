import 'package:openwykop/api/abstract_api_output.dart';

import 'models/models.dart';

class ApiOutputList<T extends ApiModel> extends AbstractApiOutput {

  List<T?>? data;

  ApiOutputList(super.rawData, [super.modelConstructor]);


  @override
  void parseData () {
    if (modelConstructor == null) {
      data = (apiResponse.json['data'] as List<dynamic>?)?.map((e) => e == null ? null : autoParse(e as Map<String, dynamic>) as T).toList();
      return;
    }
    this.data = modelConstructor!(apiResponse.json['data']);
  }
}