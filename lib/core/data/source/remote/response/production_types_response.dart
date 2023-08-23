// To parse this JSON data, do
//
//     final productionTypes = productionTypesFromJson(jsonString);

import 'dart:convert';

ProductionTypesResponse productionTypesFromJson(String str) => ProductionTypesResponse.fromJson(json.decode(str));

String productionTypesToJson(ProductionTypesResponse data) => json.encode(data.toJson());

class ProductionTypesResponse {
  List<IshlabChiqarishlar> ishlabChiqarishlar;

  ProductionTypesResponse({
    required this.ishlabChiqarishlar,
  });

  factory ProductionTypesResponse.fromJson(Map<String, dynamic> json) => ProductionTypesResponse(
    ishlabChiqarishlar: List<IshlabChiqarishlar>.from(json["ishlab_chiqarishlar"].map((x) => IshlabChiqarishlar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ishlab_chiqarishlar": List<dynamic>.from(ishlabChiqarishlar.map((x) => x.toJson())),
  };
}

class IshlabChiqarishlar {
  int id;
  String name;

  IshlabChiqarishlar({
    required this.id,
    required this.name,
  });

  factory IshlabChiqarishlar.fromJson(Map<String, dynamic> json) => IshlabChiqarishlar(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
