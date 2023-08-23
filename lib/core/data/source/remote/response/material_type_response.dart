// To parse this JSON data, do
//
//     final materialTypeResponse = materialTypeResponseFromJson(jsonString);

import 'dart:convert';

MaterialTypeResponse materialTypeResponseFromJson(String str) => MaterialTypeResponse.fromJson(json.decode(str));

String materialTypeResponseToJson(MaterialTypeResponse data) => json.encode(data.toJson());

class MaterialTypeResponse {
  List<MahsulotTolasi> mahsulotTolasi;

  MaterialTypeResponse({
    required this.mahsulotTolasi,
  });

  factory MaterialTypeResponse.fromJson(Map<String, dynamic> json) => MaterialTypeResponse(
    mahsulotTolasi: List<MahsulotTolasi>.from(json["mahsulot_tolasi"].map((x) => MahsulotTolasi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mahsulot_tolasi": List<dynamic>.from(mahsulotTolasi.map((x) => x.toJson())),
  };
}

class MahsulotTolasi {
  int id;
  String name;

  MahsulotTolasi({
    required this.id,
    required this.name,
  });

  factory MahsulotTolasi.fromJson(Map<String, dynamic> json) => MahsulotTolasi(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
