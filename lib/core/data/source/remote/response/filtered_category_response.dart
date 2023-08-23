// To parse this JSON data, do
//
//     final filteredCategoryResponse = filteredCategoryResponseFromJson(jsonString);

import 'dart:convert';

FilteredCategoryResponse filteredCategoryResponseFromJson(String str) => FilteredCategoryResponse.fromJson(json.decode(str));

String filteredCategoryResponseToJson(FilteredCategoryResponse data) => json.encode(data.toJson());

class FilteredCategoryResponse {
  bool status;
  Category category;
  String message;
  Data data;

  FilteredCategoryResponse({
    required this.status,
    required this.category,
    required this.message,
    required this.data,
  });

  factory FilteredCategoryResponse.fromJson(Map<String, dynamic> json) => FilteredCategoryResponse(
    status: json["status"],
    category: Category.fromJson(json["category"]),
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "category": category.toJson(),
    "message": message,
    "data": data.toJson(),
  };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Data {
  List<Item> item;
  Links links;
  Meta meta;

  Data({
    required this.item,
    required this.links,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
    links: Links.fromJson(json["_links"]),
    meta: Meta.fromJson(json["_meta"]),
  );

  Map<String, dynamic> toJson() => {
    "item": List<dynamic>.from(item.map((x) => x.toJson())),
    "_links": links.toJson(),
    "_meta": meta.toJson(),
  };
}

class Item {
  int id;
  String category;
  String price;
  String sifat;
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

  Item({
    required this.id,
    required this.category,
    required this.price,
    required this.sifat,
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    category: json["category"],
    price: json["price"],
    sifat: json["sifat"],
    eni: json["eni"],
    boyi: json["boyi"],
    color: json["color"],
    ishlabChiqarishTuri: json["ishlab_chiqarish_turi"],
    mahsulotTola: json["mahsulot_tola"],
    brand: json["brand"],
    user: json["user"],
    views: json["views"],
    likes: json["likes"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    photos: List<String>.from(json["photos"].map((x) => x)),
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "price": price,
    "sifat": sifat,
    "eni": eni,
    "boyi": boyi,
    "color": color,
    "ishlab_chiqarish_turi": ishlabChiqarishTuri,
    "mahsulot_tola": mahsulotTola,
    "brand": brand,
    "user": user,
    "views": views,
    "likes": likes,
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

class Links {
  dynamic prevPageUrl;
  String nextPageUrl;

  Links({
    this.prevPageUrl,
    required this.nextPageUrl,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    prevPageUrl: json["prevPageUrl"],
    nextPageUrl: json["nextPageUrl"],
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
