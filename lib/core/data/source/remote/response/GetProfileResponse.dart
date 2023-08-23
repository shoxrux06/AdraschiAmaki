// To parse this JSON data, do
//
//     final getProfileResponse = getProfileResponseFromJson(jsonString);

import 'dart:convert';

GetProfileResponse getProfileResponseFromJson(String str) => GetProfileResponse.fromJson(json.decode(str));

String getProfileResponseToJson(GetProfileResponse data) => json.encode(data.toJson());

class GetProfileResponse {
  bool status;
  User user;
  List<ProductDetail> products;

  GetProfileResponse({
    required this.status,
    required this.user,
    required this.products,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) => GetProfileResponse(
    status: json["status"],
    user: User.fromJson(json["user"]),
    products: List<ProductDetail>.from(json["products"].map((x) => ProductDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class ProductDetail {
  int id;
  String title;
  int price;
  String body;
  String category;
  String region;
  String district;
  String color;
  String compatibility;
  String user;
  int views;
  dynamic longitude;
  dynamic latitude;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> photos;
  User owner;

  ProductDetail({
    required this.id,
    required this.title,
    required this.price,
    required this.body,
    required this.category,
    required this.region,
    required this.district,
    required this.color,
    required this.compatibility,
    required this.user,
    required this.views,
    this.longitude,
    this.latitude,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
    required this.owner,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"]??0,
    title: json["title"]??'',
    price: json["price"]??0,
    body: json["body"]??'',
    category: json["category"]??'',
    region: json["region"]??'',
    district: json["district"]??'',
    color: json["color"]??'',
    compatibility: json["compatibility"]??'',
    user: json["user"]??'',
    views: json["views"]??0,
    longitude: json["longitude"],
    latitude: json["latitude"],
    createdAt:json["created_at"] != null? DateTime.parse(json["created_at"]): DateTime.now(),
    updatedAt:json["updated_at"] != null? DateTime.parse(json["updated_at"]): DateTime.now(),
    photos: List<String>.from(json["photos"].map((x) => x)),
    owner: User.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "body": body,
    "category": category,
    "region": region,
    "district": district,
    "color": color,
    "compatibility": compatibility,
    "user": user,
    "views": views,
    "longitude": longitude,
    "latitude": latitude,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "owner": owner.toJson(),
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
    id: json["id"]??0,
    fullname: json["fullname"]??'',
    username: json["username"]??'',
    phone: json["phone"]??'',
    status: json["status"]??'',
    productNumber: json["product_number"]??0,
    phoneVerifiedAt:json["phone_verified_at"] != null? DateTime.parse(json["phone_verified_at"]): DateTime.now(),
    role: json["role"]??0,
    createdAt:json["created_at"] != null? DateTime.parse(json["created_at"]): DateTime.now(),
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
