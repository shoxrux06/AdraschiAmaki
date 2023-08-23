import 'dart:io';

import 'package:dio/dio.dart';

class SignUpRequest {
  SignUpRequest({
    required this.fullname,
    required this.username,
    required this.phone,
    required this.avatar,
    required this.password,
    required this.passwordConfirmation,
  });

  String fullname;
  String username;
  String phone;
  String password;
  String passwordConfirmation;
  File avatar;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        fullname: json["fullname"],
        username: json["username"],
        phone: json["phone"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        avatar: json["avatar"],
      );

  Future<Map<String, dynamic>> toJson() async {
    return {
      "fullname": fullname,
      "username": username,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "avatar": await MultipartFile.fromFile(avatar.path, filename: 'upload.png'),
    };
  }
}
