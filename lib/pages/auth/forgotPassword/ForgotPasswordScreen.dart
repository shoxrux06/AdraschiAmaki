import 'package:afisha_market/core/di/dependency_manager.dart';
import 'package:afisha_market/pages/auth/forgotPassword/forgot_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/auth/authBloc.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AuthBloc(authRepository),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              // title: Text(
              //   'Забыл(а) пароль',
              //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              // ),
            ),
            body: const ForgotPasswordContainer()));
  }
}
