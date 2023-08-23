
class VerifyRequest {
  VerifyRequest({
    required this.phone,
    required this.code,
  });

  String phone;
  String code;

  factory VerifyRequest.fromJson(Map<String, dynamic> json) => VerifyRequest(
    phone: json["phone"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code,
  };
}
