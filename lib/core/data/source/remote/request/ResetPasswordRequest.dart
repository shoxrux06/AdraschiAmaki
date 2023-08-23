
class ResetPasswordRequest {
  ResetPasswordRequest({
    required this.phone,
    required this.code,
    required this.password,
    required this.passwordConfirmation,
  });

  String phone;
  String code;
  String password;
  String passwordConfirmation;

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) => ResetPasswordRequest(
    phone: json["phone"],
    code: json["code"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code,
    "password": password,
    "password_confirmation": passwordConfirmation,
  };
}
