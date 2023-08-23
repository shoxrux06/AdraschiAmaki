// To parse this JSON data, do
//
//     final unLikedResponse = unLikedResponseFromJson(jsonString);

import 'dart:convert';

UnLikedResponse unLikedResponseFromJson(String str) => UnLikedResponse.fromJson(json.decode(str));

String unLikedResponseToJson(UnLikedResponse data) => json.encode(data.toJson());

class UnLikedResponse {
  String message;

  UnLikedResponse({
    required this.message,
  });

  factory UnLikedResponse.fromJson(Map<String, dynamic> json) => UnLikedResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
