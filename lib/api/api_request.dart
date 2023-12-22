import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openwykop/api/api_properties.dart';

import 'api_request_response.dart';

enum RequestMethod {
  GET,
  POST,
  PUT,
  DELETE
}

class ApiRequest {
  ApiProperties apiProperties;
  List<String> pathSegments;
  Map<String, String> headers = {};
  Map<String, String>? queryParameters;
  RequestMethod method;
  Map<String, dynamic> bodyData;

  ApiRequest(this.apiProperties, this.pathSegments, {
    this.queryParameters,
    Map<String, String>? headers,
    this.method = RequestMethod.GET,
    this.bodyData = const {},
  }) {
    initializeHeaders(headers);
  }

  void initializeHeaders (Map<String, String>? customHeaders) {
    if (apiProperties.token != null) {
      headers['Authorization'] = 'Bearer ${apiProperties.token!}';
    }

    if (customHeaders == null) {
      return;
    }

    customHeaders.forEach((key, value) {
      headers[key] = value;
    });
  }

  Uri getRequestUri () {
    List<String> path = [...apiProperties.apiPath, ...pathSegments];

    Uri uri = Uri(scheme: 'https',
                  host: apiProperties.apiHost,
                  pathSegments: path,
                  queryParameters: queryParameters);

    return uri;
  }

  String getBodyData () {
    Map<String, dynamic> package = {
      'data': this.bodyData
    };

    return jsonEncode(package);
  }

  Future<ApiRequestResponse> request () async {
    http.Response res;
    Uri uri = getRequestUri();

    switch (method) {
      case RequestMethod.PUT:
        res = await http.put(uri, headers: headers, body: getBodyData());
        break;

      case RequestMethod.POST:
        res = await http.post(uri, headers: headers, body: getBodyData());
        break;

      case RequestMethod.DELETE:
        res = await http.delete(uri, headers: headers);
        break;

      case RequestMethod.GET:
      default:
        res = await http.get(uri, headers: headers);
        break;
    }

    return ApiRequestResponse(res.statusCode, res.body);
  }
}