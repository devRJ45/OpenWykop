import 'dart:convert';

class ApiRequestResponse {
  
  int statusCode;
  String rawData;
  late Map<String, dynamic> json;

  ApiRequestResponse(this. statusCode, this.rawData) {
    if (rawData.isNotEmpty) {
      json = jsonDecode(rawData);
    }
  }
}