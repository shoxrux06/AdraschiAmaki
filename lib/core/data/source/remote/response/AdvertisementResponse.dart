// To parse this JSON data, do
//
//     final advResponse = advResponseFromJson(jsonString);

import 'dart:convert';

AdvertisementResponse advResponseFromJson(String str) => AdvertisementResponse.fromJson(json.decode(str));

String advResponseToJson(AdvertisementResponse data) => json.encode(data.toJson());

class AdvertisementResponse {
  bool status;
  List<AdvItem> data;

  AdvertisementResponse({
    required this.status,
    required this.data,
  });

  factory AdvertisementResponse.fromJson(Map<String, dynamic> json) => AdvertisementResponse(
    status: json["status"],
    data: List<AdvItem>.from(json["data"].map((x) => AdvItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AdvItem {
  int id;
  List<String> images;

  AdvItem({
    required this.id,
    required this.images,
  });

  factory AdvItem.fromJson(Map<String, dynamic> json) => AdvItem(
    id: json["id"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
