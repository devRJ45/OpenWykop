
import 'package:openwykop/api/api_properties.dart';

import 'resources/resoruces.dart';

class WykopApi {

  ApiProperties apiProperties;

  late AuthResource auth;
  late UsersResource users;
  late TagsResource tags;
  late NotificationsResource notifications;
  late ProfilesResource profiles;
  late LinksResource links;
  late PMResource pm;
  late MicroblogResource microblog;
  late MediaResource media;
  late FavouritesResource favourites;
  late NotesResource notes;
  late HitsResource hits;
  late SearchResource search;
  late CategoriesResource categories;
  late ObservedResource observed;
  late BucketsResource buckets;
  late BadgesResource badges;
  late RankResource rank;

  WykopApi (this.apiProperties) {
    initializeResources();
  }

  void initializeResources () {
    auth = AuthResource(apiProperties);
    users = UsersResource(apiProperties);
    tags = TagsResource(apiProperties);
    notifications = NotificationsResource(apiProperties);
    profiles = ProfilesResource(apiProperties);
    links = LinksResource(apiProperties);
    pm = PMResource(apiProperties);
    microblog = MicroblogResource(apiProperties);
    media = MediaResource(apiProperties);
    favourites = FavouritesResource(apiProperties);
    notes = NotesResource(apiProperties);
    hits = HitsResource(apiProperties);
    search = SearchResource(apiProperties);
    categories = CategoriesResource(apiProperties);
    observed = ObservedResource(apiProperties);
    buckets = BucketsResource(apiProperties);
    badges = BadgesResource(apiProperties);
    rank = RankResource(apiProperties);
  }
}