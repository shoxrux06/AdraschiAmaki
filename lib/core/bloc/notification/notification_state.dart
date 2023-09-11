import 'package:afisha_market/core/data/source/remote/response/notification_response.dart';
import 'package:afisha_market/core/data/source/remote/response/status_and_message_response.dart';

class NotificationState {
  final NotificationResponse? notificationResponse;
  final NotificationResponse? readNotificationResponse;
  final NotificationResponse? unReadNotificationResponse;
  final StatusAndMessageResponse? statusAndMessageResponse;
  final bool isRead;

  NotificationState({
    this.notificationResponse,
    this.readNotificationResponse,
    this.unReadNotificationResponse,
    this.statusAndMessageResponse,
    this.isRead = false,
  });

  NotificationState copyWith({
    NotificationResponse? notificationResponse,
    NotificationResponse? readNotificationResponse,
    NotificationResponse? unReadNotificationResponse,
    StatusAndMessageResponse? statusAndMessageResponse,
    bool? isRead,
  }) {
    return NotificationState(
      notificationResponse: notificationResponse ?? this.notificationResponse,
      readNotificationResponse: readNotificationResponse ?? this.readNotificationResponse,
      unReadNotificationResponse: unReadNotificationResponse ?? this.unReadNotificationResponse,
     statusAndMessageResponse: statusAndMessageResponse?? this.statusAndMessageResponse,
      isRead: isRead?? this.isRead
    );
  }
}
