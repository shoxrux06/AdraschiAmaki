// To parse this JSON data, do
//
//     final advAddResponse = advAddResponseFromJson(jsonString);

import 'dart:convert';

AdvAddResponse advAddResponseFromJson(String str) => AdvAddResponse.fromJson(json.decode(str));

String advAddResponseToJson(AdvAddResponse data) => json.encode(data.toJson());

class AdvAddResponse {
  bool status;
  String message;
  Data data;

  AdvAddResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AdvAddResponse.fromJson(Map<String, dynamic> json) => AdvAddResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  List<String> images;

  Data({
    required this.id,
    required this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
