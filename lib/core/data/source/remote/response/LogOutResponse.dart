class LogOutResponse {
  LogOutResponse({
    required this.message,
  });

  String message;

  factory LogOutResponse.fromJson(Map<String, dynamic> json) => LogOutResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
