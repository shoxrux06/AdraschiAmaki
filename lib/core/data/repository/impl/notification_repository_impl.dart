import 'package:afisha_market/core/data/repository/notifications_respository.dart';
import 'package:afisha_market/core/data/source/remote/response/notification_response.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';
import 'package:afisha_market/core/handlers/api_result.dart';

import '../../../di/inject.dart';
import '../../../handlers/http_service.dart';
import '../../../handlers/network_exceptions.dart';

class NotificationRepositoryImpl implements NotificationsRepository{
  @override
  Future<ApiResult<NotificationResponse>> getAllNotifications() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/admin/notifications',
      );
      return ApiResult.success(data: NotificationResponse.fromJson(response.data));
    } catch (e) {
      print('==> NotificationResponse failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<NotificationResponse>> getReadNotifications() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/admin/read-notifications',
      );
      print('Readed ${response.data}');
      return ApiResult.success(data: NotificationResponse.fromJson(response.data));
    } catch (e) {
      print('==> Read NotificationResponse failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<NotificationResponse>> getUnReadNotifications() async{
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/admin/unread-notifications',
      );
      print('Un Readed ${response.data}');
      return ApiResult.success(data: NotificationResponse.fromJson(response.data));
    } catch (e) {
      print('==> UnRead NotificationResponse failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<StatusAndMessageResponse>> readNotifications(String notificationId)async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/admin/notifications/$notificationId/read',
      );
      print('Read ${response.data}');
      return ApiResult.success(data: StatusAndMessageResponse.fromJson(response.data));
    } catch (e) {
      print('==>Read failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}