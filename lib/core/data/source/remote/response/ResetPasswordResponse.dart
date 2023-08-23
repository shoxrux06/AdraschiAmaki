class ResetPasswordResponse {
  ResetPasswordResponse({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) => ResetPasswordResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}