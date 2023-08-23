// To parse this JSON data, do
//
//     final deleteAccountResponse = deleteAccountResponseFromJson(jsonString);

import 'dart:convert';

StatusAndMessageResponse deleteAccountResponseFromJson(String str) => StatusAndMessageResponse.fromJson(json.decode(str));

String deleteAccountResponseToJson(StatusAndMessageResponse data) => json.encode(data.toJson());

class StatusAndMessageResponse {
  StatusAndMessageResponse({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory StatusAndMessageResponse.fromJson(Map<String, dynamic> json) => StatusAndMessageResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
