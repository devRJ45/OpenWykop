import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
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
  Map<String, File> files;
  bool sendWithoutBearerToken;

  ApiRequest(this.apiProperties, this.pathSegments, {
    this.queryParameters,
    Map<String, String>? headers,
    this.method = RequestMethod.GET,
    this.bodyData = const {},
    this.files = const {},
    this.sendWithoutBearerToken = false,
  }) {
    initializeHeaders(headers);
  }

  void initializeHeaders (Map<String, String>? customHeaders) {
    if (!sendWithoutBearerToken && apiProperties.token != null) {
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

    // if request have files
    if (files.isNotEmpty && (method == RequestMethod.POST || method == RequestMethod.PUT)) {
      http.MultipartRequest request = http.MultipartRequest(method == RequestMethod.PUT ? 'PUT' : 'POST', uri);
      request.headers.addAll(headers);
      files.forEach((key, file) {
        request.files.add(http.MultipartFile.fromBytes(key, file.readAsBytesSync(), filename: basename(file.path)));
      });

      res = await http.Response.fromStream(await request.send());
    } else {
      // if request not have files
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
    }

    return ApiRequestResponse(res.statusCode, res.body);
  }
}