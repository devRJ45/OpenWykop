import 'package:openwykop/api/abstract_api_output.dart';

class ApiOutputBool extends AbstractApiOutput {

  bool? data;

  ApiOutputBool(super.rawData);

  @override
  void parseData () {
    data = apiResponse.json['data'];
  }
}