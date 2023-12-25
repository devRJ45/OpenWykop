import 'package:openwykop/api/api_properties.dart';
import 'package:openwykop/api/api_request_response.dart';
import 'package:openwykop/api/resources/resoruces.dart';

import '../api_output.dart';
import '../api_output_list.dart';
import '../api_request.dart';
import '../models/models.dart';

class NotificationsResource extends ApiResource {
  NotificationsResource (ApiProperties apiProperties) : super(apiProperties, 'notifications');

  Future<ApiOutput<NotificationsStatus>> getStatus () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'status']).request();

    return ApiOutput<NotificationsStatus>(result, NotificationsStatus.fromJson);
  }

  Future<ApiOutputList<Notification>> getNotifications ([int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries'], queryParameters: queryParameters).request();

    return ApiOutputList<Notification>(result, Notification.fromJsonList);
  }

  Future<ApiOutput> setAllNotificationsAsRead () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries', 'all'], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeAllNotifications () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries', 'all'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<Notification>> getNotification (String notificationId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries', notificationId]).request();

    return ApiOutput<Notification>(result, Notification.fromJson);
  }

  Future<ApiOutput> setNotificationAsRead (String notificationId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries', notificationId], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeNotification (String notificationId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'entries', notificationId], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutputList<PMNotification>> getPMNotifications ([int? page]) async {
    Map<String, String> queryParameters = {};
    if (page != null) queryParameters['page'] = page.toString();

    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'pm'], queryParameters: queryParameters).request();

    return ApiOutputList<PMNotification>(result, PMNotification.fromJsonList);
  }

  Future<ApiOutput> setAllPMNotificationsAsRead () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'pm', 'all'], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removeAllPMNotifications () async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'pm', 'all'], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

  Future<ApiOutput<PMNotification>> getPMNotification (String pmNotificationId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'pm', pmNotificationId]).request();

    return ApiOutput<PMNotification>(result, PMNotification.fromJson);
  }

  Future<ApiOutput> setPMNotificationAsRead (String pmNotificationId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'pm', pmNotificationId], method: RequestMethod.PUT).request();

    return ApiOutput(result);
  }

  Future<ApiOutput> removePMNotification (String pmNotificationId) async {
    ApiRequestResponse result = await ApiRequest(apiProperties, [resourcePath, 'pm', pmNotificationId], method: RequestMethod.DELETE).request();

    return ApiOutput(result);
  }

}

