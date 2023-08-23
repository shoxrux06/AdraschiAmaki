// To parse this JSON data, do
//
//     final regionResponse = regionResponseFromJson(jsonString);

import 'dart:convert';

RegionResponse regionResponseFromJson(String str) => RegionResponse.fromJson(json.decode(str));

String regionResponseToJson(RegionResponse data) => json.encode(data.toJson());

class RegionResponse {
  bool status;
  String message;
  List<Region> data;

  RegionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegionResponse.fromJson(Map<String, dynamic> json) => RegionResponse(
    status: json["status"],
    message: json["message"],
    data: List<Region>.from(json["data"].map((x) => Region.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Region {
  int id;
  String name;
  List<District> districts;

  Region({
    required this.id,
    required this.name,
    required this.districts,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    name: json["name"],
    districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
  };
}

class District {
  int id;
  String name;

  District({
    required this.id,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
