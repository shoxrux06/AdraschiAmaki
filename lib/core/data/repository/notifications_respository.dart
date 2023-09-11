import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';

import '../../handlers/api_result.dart';
import '../source/remote/response/notification_response.dart';

abstract class NotificationsRepository{
  Future<ApiResult<NotificationResponse>> getAllNotifications();
  Future<ApiResult<NotificationResponse>> getReadNotifications();
  Future<ApiResult<NotificationResponse>> getUnReadNotifications();
  Future<ApiResult<StatusAndMessageResponse>> readNotifications(String notificationId);
}