// To parse this JSON data, do
//
//     final productCategoryREsponse = productCategoryREsponseFromJson(jsonString);

import 'dart:convert';

FilteredProductCategoryResponse productCategoryREsponseFromJson(String str) => FilteredProductCategoryResponse.fromJson(json.decode(str));

String productCategoryREsponseToJson(FilteredProductCategoryResponse data) => json.encode(data.toJson());

class FilteredProductCategoryResponse {
  bool status;
  String message;
  List<FilteredCategory> categories;

  FilteredProductCategoryResponse({
    required this.status,
    required this.message,
    required this.categories,
  });

  factory FilteredProductCategoryResponse.fromJson(Map<String, dynamic> json) => FilteredProductCategoryResponse(
    status: json["status"],
    message: json["message"],
    categories: List<FilteredCategory>.from(json["categories"].map((x) => FilteredCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class FilteredCategory {
  int id;
  String name;

  FilteredCategory({
    required this.id,
    required this.name,
  });

  factory FilteredCategory.fromJson(Map<String, dynamic> json) => FilteredCategory(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
