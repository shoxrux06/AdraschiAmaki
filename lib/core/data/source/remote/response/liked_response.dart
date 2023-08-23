// To parse this JSON data, do
//
//     final likedResponse = likedResponseFromJson(jsonString);

import 'dart:convert';

LikedResponse likedResponseFromJson(String str) => LikedResponse.fromJson(json.decode(str));

String likedResponseToJson(LikedResponse data) => json.encode(data.toJson());

class LikedResponse {
  String message;
  Like like;

  LikedResponse({
    required this.message,
    required this.like,
  });

  factory LikedResponse.fromJson(Map<String, dynamic> json) => LikedResponse(
    message: json["message"],
    like: Like.fromJson(json["like"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "like": like.toJson(),
  };
}

class Like {
  int productId;
  String ipAddress;
  String userAgent;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Like({
    required this.productId,
    required this.ipAddress,
    required this.userAgent,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Like.fromJson(Map<String, dynamic> json) => Like(
    productId: json["product_id"],
    ipAddress: json["ip_address"],
    userAgent: json["user_agent"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "ip_address": ipAddress,
    "user_agent": userAgent,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
