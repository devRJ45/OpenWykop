
import 'package:openwykop/api/api_properties.dart';

import 'resources/resoruces.dart';

class WykopApi {

  ApiProperties apiProperties;

  late UsersResource users;
  late TagsResource tags;
  late ProfilesResource profiles;

  WykopApi (this.apiProperties) {
    initializeResources();
  }

  void initializeResources () {
    users = UsersResource(apiProperties);
    tags = TagsResource(apiProperties);
    profiles = ProfilesResource(apiProperties);
  }
}