// To parse this JSON data, do
//
//     final updateProfileResponse = updateProfileResponseFromJson(jsonString);

import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
  String message;
  User user;

  UpdateProfileResponse({
    required this.message,
    required this.user,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String fullname;
  String username;
  String phone;
  String status;
  String viloyat;
  String tuman;
  int productNumber;
  DateTime phoneVerifiedAt;
  int role;
  String adminUserCategory;
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
    required this.viloyat,
    required this.tuman,
    required this.productNumber,
    required this.phoneVerifiedAt,
    required this.role,
    required this.adminUserCategory,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
    required this.views,
    required this.blocked,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"]??0,
    fullname: json["fullname"]??'',
    username: json["username"]??'',
    phone: json["phone"]??'',
    status: json["status"],
    viloyat: json["viloyat"]??'',
    tuman: json["tuman"]??'',
    productNumber: json["product_number"]??0,
    phoneVerifiedAt: json["phone_verified_at"] != null? DateTime.parse(json["phone_verified_at"]): DateTime.now(),
    role: json["role"]??0,
    adminUserCategory: json["admin_user_category"]??'',
    createdAt: json["created_at"] != null?DateTime.parse(json["created_at"]): DateTime.now(),
    updatedAt:json["updated_at"] != null? DateTime.parse(json["updated_at"]): DateTime.now(),
    avatar: json["avatar"]??'',
    views: json["views"]??0,
    blocked: json["blocked"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "username": username,
    "phone": phone,
    "status": status,
    "viloyat": viloyat,
    "tuman": tuman,
    "product_number": productNumber,
    "phone_verified_at": phoneVerifiedAt.toIso8601String(),
    "role": role,
    "admin_user_category": adminUserCategory,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "avatar": avatar,
    "views": views,
    "blocked": blocked,
  };
}
