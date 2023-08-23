// To parse this JSON data, do
//
//     final deleteAccountResponse = deleteAccountResponseFromJson(jsonString);

import 'dart:convert';

DeleteAccountResponse deleteAccountResponseFromJson(String str) => DeleteAccountResponse.fromJson(json.decode(str));

String deleteAccountResponseToJson(DeleteAccountResponse data) => json.encode(data.toJson());

class DeleteAccountResponse {
  DeleteAccountResponse({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) => DeleteAccountResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
