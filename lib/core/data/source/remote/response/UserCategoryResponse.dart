// To parse this JSON data, do
//
//     final userCategoryResponse = userCategoryResponseFromJson(jsonString);

import 'dart:convert';

UserCategoryResponse userCategoryResponseFromJson(String str) => UserCategoryResponse.fromJson(json.decode(str));

String userCategoryResponseToJson(UserCategoryResponse data) => json.encode(data.toJson());

class UserCategoryResponse {
  bool status;
  List<UserCategory> userCategories;

  UserCategoryResponse({
    required this.status,
    required this.userCategories,
  });

  factory UserCategoryResponse.fromJson(Map<String, dynamic> json) => UserCategoryResponse(
    status: json["status"],
    userCategories: List<UserCategory>.from(json["user_categories"].map((x) => UserCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user_categories": List<dynamic>.from(userCategories.map((x) => x.toJson())),
  };
}

class UserCategory {
  int id;
  String name;

  UserCategory({
    required this.id,
    required this.name,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) => UserCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
