// To parse this JSON data, do
//
//     final verifyResponse = verifyResponseFromJson(jsonString);

import 'dart:convert';

VerifyResponse verifyResponseFromJson(String str) => VerifyResponse.fromJson(json.decode(str));

String verifyResponseToJson(VerifyResponse data) => json.encode(data.toJson());

class VerifyResponse {
  bool status;
  String message;
  String token;
  User user;

  VerifyResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.user,
  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => VerifyResponse(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String fullname;
  String username;
  String phone;
  String status;
  int productNumber;
  DateTime phoneVerifiedAt;
  int role;
  DateTime createdAt;
  DateTime updatedAt;
  String avatar;
  int views;
  String blocked;

  User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.phone,
    required this.status,
    required this.productNumber,
    required this.phoneVerifiedAt,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
    required this.views,
    required this.blocked,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullname: json["fullname"],
    username: json["username"],
    phone: json["phone"],
    status: json["status"],
    productNumber: json["product_number"],
    phoneVerifiedAt: DateTime.parse(json["phone_verified_at"]),
    role: json["role"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    avatar: json["avatar"],
    views: json["views"],
    blocked: json["blocked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "username": username,
    "phone": phone,
    "status": status,
    "product_number": productNumber,
    "phone_verified_at": phoneVerifiedAt.toIso8601String(),
    "role": role,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "avatar": avatar,
    "views": views,
    "blocked": blocked,
  };
}
