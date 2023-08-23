class SignInRequest {
  SignInRequest({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  factory SignInRequest.fromJson(Map<String, dynamic> json) => SignInRequest(
    login: json["login"] ?? "",
    password: json["password"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "password": password,
  };
}
