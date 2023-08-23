class ProductCategoryResponse {
  ProductCategoryResponse({
    required this.status,
    required this.categories,
  });

  bool status;
  List<Category> categories;

  factory ProductCategoryResponse.fromJson(Map<String, dynamic> json) => ProductCategoryResponse(
    status: json["status"] ?? false,
    categories: json["categories"] != null?List<Category>.from(json["categories"].map((x) => Category.fromJson(x))):[],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"]??0,
    name: json["name"]??'',
    createdAt: json["created_at"] != null?DateTime.parse(json["created_at"]):DateTime.now(),
    updatedAt:json["updated_at"] != null? DateTime.parse(json["updated_at"]):DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
