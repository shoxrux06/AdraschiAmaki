
class ForgotPasswordRequest {
  ForgotPasswordRequest({
    required this.phone,
  });

  String phone;

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) => ForgotPasswordRequest(
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}
