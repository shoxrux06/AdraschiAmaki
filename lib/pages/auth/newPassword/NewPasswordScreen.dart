import 'package:afisha_market/core/di/dependency_manager.dart';
import 'package:afisha_market/pages/auth/newPassword/newPasswordContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/auth/authBloc.dart';
import '../../utils/const.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AuthBloc(authRepository),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Новый пароль',
              style: TextStyle(color: mainColor, fontWeight: FontWeight.w500),
            ),
          ),
          body: const NewPasswordContainer(),
        ));
  }
}
