import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/wykopapi.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();

  static final WykopApi api = WykopApi(ApiProperties());

  static void setToken (String token, [String? refreshToken]) {
    api.apiProperties.setToken(token, refreshToken);
  }

  factory ApiService () {
    return _apiService;
  }

  ApiService._internal();
}
