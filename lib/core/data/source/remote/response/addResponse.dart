// To parse this JSON data, do
//
//     final createResponse = createResponseFromJson(jsonString);

import 'dart:convert';

CreateResponse createResponseFromJson(String str) => CreateResponse.fromJson(json.decode(str));

String createResponseToJson(CreateResponse data) => json.encode(data.toJson());

class CreateResponse {
  bool? status;
  String? message;
  Data? data;

  CreateResponse({
    this.status,
    this.message,
    this.data,
  });

  factory CreateResponse.fromJson(Map<String, dynamic> json) => CreateResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int id;
  String category;
  String price;
  String discount;
  String eni;
  String boyi;
  String color;
  String ishlabChiqarishTuri;
  String mahsulotTola;
  String brand;
  String user;
  int likes;
  int views;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> photos;
  Owner owner;

  Data({
    required this.id,
    required this.category,
    required this.price,
    required this.discount,
    required this.eni,
    required this.boyi,
    required this.color,
    required this.ishlabChiqarishTuri,
    required this.mahsulotTola,
    required this.brand,
    required this.user,
    required this.likes,
    required this.views,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
    required this.owner,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??0,
    category: json["category"]??'',
    price: json["price"]??'',
    discount: json["discount"] ?? '',
    eni: json["eni"] ??'',
    boyi: json["boyi"] ??'',
    color: json["color"] ??'',
    ishlabChiqarishTuri: json["ishlab_chiqarish_turi"]??'',
    mahsulotTola: json["mahsulot_tola"],
    brand: json["brand"] ??'',
    user: json["user"] ??'',
    likes: json["likes"] ??0,
    views: json["views"] ??0,
    createdAt:json["created_at"] != null? DateTime.parse(json["created_at"]): DateTime.now(),
    updatedAt:json["updated_at"] != null? DateTime.parse(json["updated_at"]): DateTime.now(),
    photos: List<dynamic>.from(json["photos"].map((x) => x)),
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "price": price,
    "discount": discount,
    "eni": eni,
    "boyi": boyi,
    "color": color,
    "ishlab_chiqarish_turi": ishlabChiqarishTuri,
    "mahsulot_tola": mahsulotTola,
    "brand": brand,
    "user": user,
    "likes": likes,
    "views": views,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "owner": owner.toJson(),
  };
}

class Owner {
  int id;
  String username;

  Owner({
    required this.id,
    required this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
  };
}
