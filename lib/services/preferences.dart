import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();

  final FlutterSecureStorage securedStorage = const FlutterSecureStorage();

  Map<String, String?> apiProperties = {
    'appkey': null,
    'appsecret': null,
    'apptoken': null,
    'token': null,
    'refresh_token': null
  };

  factory PreferencesService () {
    return _instance;
  }

  Future loadPreferences () async {
    // secured
    apiProperties['appkey'] = await securedStorage.read(key: 'appkey');
    apiProperties['appsecret'] = await securedStorage.read(key: 'appsecret');
    apiProperties['apptoken'] = await securedStorage.read(key: 'apptoken');
    apiProperties['token'] = await securedStorage.read(key: 'token');
    apiProperties['refresh_token'] = await securedStorage.read(key: 'refresh_token');
  }

  String? getApiProperty (String propertyName) {
    return apiProperties[propertyName];
  }
  
  void setApiProperty (String propertyName, String? value) async {
    if (value == null || value.isEmpty) {
      apiProperties[propertyName] = null;
      await securedStorage.delete(key: propertyName);
      return; 
    }

    apiProperties[propertyName] = value;
    await securedStorage.write(key: propertyName, value: value);
  }

  PreferencesService._internal ();
}
