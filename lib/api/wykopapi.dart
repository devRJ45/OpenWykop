
import 'package:openwykop/api/api_properties.dart';

import 'resources/resoruces.dart';

class WykopApi {

  ApiProperties apiProperties;

  late UsersResource usersResource;

  WykopApi (this.apiProperties) {
    initializeResources();
  }

  void initializeResources () {
    usersResource = UsersResource(apiProperties);
  }
}