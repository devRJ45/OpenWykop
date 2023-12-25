import 'package:openwykop/api/abstract_api_output.dart';

class ApiOutputString extends AbstractApiOutput {

  String? data;

  ApiOutputString(super.rawData);

  @override
  void parseData () {
    data = apiResponse.json['data'];
  }
}