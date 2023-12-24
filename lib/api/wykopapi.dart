
import 'package:openwykop/api/api_properties.dart';

import 'resources/resoruces.dart';

class WykopApi {

  ApiProperties apiProperties;

  late AuthResource auth;
  late UsersResource users;
  late TagsResource tags;
  late ProfilesResource profiles;
  late LinksResource links;
  late MicroblogResource microblog;
  late MediaResource media;

  WykopApi (this.apiProperties) {
    initializeResources();
  }

  void initializeResources () {
    auth = AuthResource(apiProperties);
    users = UsersResource(apiProperties);
    tags = TagsResource(apiProperties);
    profiles = ProfilesResource(apiProperties);
    links = LinksResource(apiProperties);
    microblog = MicroblogResource(apiProperties);
    media = MediaResource(apiProperties);
  }
}