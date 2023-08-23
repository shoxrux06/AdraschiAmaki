import 'package:flutter/material.dart';

String? errorTextName(TextEditingController controller) {
  final text = controller.value.text;
  if (text.isEmpty) {
    return 'Can\'t be empty';
  }
  if (text.length < 3) {
    return 'Too short';
  }
  return null;
}


// String? Function(String?) usernameValidator = (String? username) {
//   if (username != null) {
//     if (username.isEmpty) {
//       return 'Username empty';
//     } else if (username.length < 3) {
//       return 'Username short';
//     }
//   }
//
//   return null;
// };


extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName{
    final nameRegExp =  RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

}