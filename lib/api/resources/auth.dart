import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_request.dart';
import '../models/models.dart';

class AuthResource extends ApiResource {
  AuthResource (ApiProperties apiProperties) : super(apiProperties, '');

  Future<ApiOutput<Auth>> auth (String key, String secret) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, ['auth'], method: RequestMethod.POST, sendWithoutBearerToken: true, bodyData: {
      'key': key,
      'secret': secret
    }).request();

    return ApiOutput<Auth>(result, Auth.fromJson);
  }

  Future<ApiOutput<Auth>> refreshToken (String rToken) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, ['refresh-token'], method: RequestMethod.POST, sendWithoutBearerToken: true, bodyData: {
      'refresh_token': rToken,
    }).request();

    return ApiOutput<Auth>(result, Auth.fromJson);
  }

  Future<ApiOutput<ConnectUrl>> getConnectLink () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, ['connect']).request();

    return ApiOutput<ConnectUrl>(result, ConnectUrl.fromJson);
  }

  Future<ApiOutput> logout () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, ['logout']).request();

    return ApiOutput(result);
  }

}

