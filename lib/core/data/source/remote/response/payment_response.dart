// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromJson(jsonString);

import 'dart:convert';

PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));

String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());

class PaymentResponse {
  String message;
  int paymentId;

  PaymentResponse({
    required this.message,
    required this.paymentId,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
    message: json["message"],
    paymentId: json["payment_id"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payment_id": paymentId,
  };
}
