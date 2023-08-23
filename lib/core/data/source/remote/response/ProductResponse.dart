// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

class ProductResponse {
  bool status;
  String message;
  Data data;

  ProductResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    status: json["status"] ??false,
    message: json["message"]??'',
    data: Data.fromJson(json["data"]),
  );

}

class Data {
  List<Product> item;
  Links links;
  Meta meta;

  Data({
    required this.item,
    required this.links,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    item: List<Product>.from(json["item"].map((x) => Product.fromJson(x))),
    links: Links.fromJson(json["_links"]),
    meta: Meta.fromJson(json["_meta"]),
  );

}

class Product {
  int id;
  String category;
  String discount;
  String size;
  String price;
  String gramm;
  String eni;
  String boyi;
  String color;
  String ishlabChiqarishTuri;
  String mahsulotTola;
  String brand;
  String user;
  int views;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> photos;
  Owner owner;

  Product({
    required this.id,
    required this.category,
    required this.discount,
    required this.size,
    required this.price,
    required this.gramm,
    required this.eni,
    required this.boyi,
    required this.color,
    required this.ishlabChiqarishTuri,
    required this.mahsulotTola,
    required this.brand,
    required this.user,
    required this.views,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
    required this.owner,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"]??0,
    category: json["category"]??'',
    discount: json["discount"]??'',
    size: json["size"]??'',
    price: json["price"]??'',
    gramm: json["gramm"]??'',
    eni: json["eni"]??'',
    boyi: json["boyi"]??"",
    color: json["color"]??'',
    ishlabChiqarishTuri: json["ishlab_chiqarish_turi"]??"",
    mahsulotTola: json["mahsulot_tola"]??"",
    brand: json["brand"]??'',
    user: json["user"]??'',
    views: json["views"]??0,
    likes: json["likes"]??0,
    createdAt: json["created_at"] != null? DateTime.parse(json["created_at"]): DateTime.now(),
    updatedAt: json["updated_at"] != null? DateTime.parse(json["updated_at"]): DateTime.now(),
    photos: List<String>.from(json["photos"].map((x) => x)),
    owner: Owner.fromJson(json["owner"]),
  );

}

class Owner {
  int id;
  String username;

  Owner({
    required this.id,
    required this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"]??0,
    username: json["username"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
  };
}

class Links {
  String prevPageUrl;
  String nextPageUrl;

  Links({
    required this.prevPageUrl,
    required this.nextPageUrl,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    prevPageUrl: json["prevPageUrl"] ??'',
    nextPageUrl: json["nextPageUrl"] ??'',
  );

  Map<String, dynamic> toJson() => {
    "prevPageUrl": prevPageUrl,
    "nextPageUrl": nextPageUrl,
  };
}

class Meta {
  int total;
  int perPage;
  int currentPage;
  int lastPage;

  Meta({
    required this.total,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    total: json["total"],
    perPage: json["perPage"],
    currentPage: json["currentPage"],
    lastPage: json["lastPage"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "perPage": perPage,
    "currentPage": currentPage,
    "lastPage": lastPage,
  };
}
