abstract class NotificationEvent {}

class GetAllNotificationsEvent extends NotificationEvent {}

class GetReadNotificationsEvent extends NotificationEvent {}

class GetUnReadNotificationsEvent extends NotificationEvent {}
class ReadNotificationEvent extends NotificationEvent {
  final String notificationId;

  ReadNotificationEvent(this.notificationId);
}
