// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) => NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) => json.encode(data.toJson());

class NotificationResponse {
  List<Notification> notifications;

  NotificationResponse({
    required this.notifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => NotificationResponse(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  String id;
  String type;
  String notifiableType;
  String notifiableId;
  Data data;
  DateTime readAt;
  DateTime createdAt;
  DateTime updatedAt;

  Notification({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"] ??'',
    type: json["type"] ??'',
    notifiableType: json["notifiable_type"] ??'',
    notifiableId: json["notifiable_id"] ??'',
    data: json["data"] != null? Data.fromJson(json["data"]): Data.fromJson({}),
    readAt:json["read_at"] != null? DateTime.parse(json["read_at"]) : DateTime.now(),
    createdAt:json["created_at"] != null? DateTime.parse(json["created_at"]): DateTime.now(),
    updatedAt:json["updated_at"] != null? DateTime.parse(json["updated_at"]): DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "notifiable_type": notifiableType,
    "notifiable_id": notifiableId,
    "data": data.toJson(),
    "read_at": readAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Data {
  int orderId;
  String user;

  Data({
    required this.orderId,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["order_id"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user": user,
  };
}
