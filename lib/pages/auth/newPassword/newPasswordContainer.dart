import 'package:afisha_market/core/bloc/auth/authEvent.dart';
import 'package:afisha_market/core/data/source/remote/request/ResetPasswordRequest.dart';
import 'package:afisha_market/pages/auth/newPassword/empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/auth/authBloc.dart';
import '../../../core/data/source/remote/request/VerifyRequest.dart';
import '../../utils/utils.dart';

class NewPasswordContainer extends StatefulWidget {
  const NewPasswordContainer({Key? key}) : super(key: key);

  @override
  State<NewPasswordContainer> createState() => _NewPasswordContainerState();
}

class _NewPasswordContainerState extends State<NewPasswordContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _pass1Controller = TextEditingController();
  final _pass2Controller = TextEditingController();

  @override
  void dispose() {
    _pass1Controller.dispose();
    _pass2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    VerifyRequest verifyRequest = settings.arguments as VerifyRequest;
    final AuthBloc _bloc = BlocProvider.of<AuthBloc>(context);
    return Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(children: [
              MyTextFormField2(
                'Новый пароль',
                const Icon(CupertinoIcons.lock),
                _pass1Controller,
                validator: (val) {
                  if (val!.length < 5)
                    return 'Password must be at least 6 characters';
                  return null;
                },
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextFormField2(
                'Подтвердите пароль',
                const Icon(CupertinoIcons.lock),
                _pass2Controller,
                validator: (val) {
                  if (val!.length < 5)
                    return 'Password must be at least 6 characters';
                  return null;
                },
                isPassword: true,
              ),
              NewPasswordEmpty(
                phoneNumber: verifyRequest.phone,
                pass1: _pass1Controller.text,
                pass2: _pass2Controller.text,
                code: verifyRequest.code,
              ),
              const SizedBox(
                height: 20,
              ),
              MyBigButton(
                'Регистрация',
                onTap: () {
                  _bloc.add(NewPasswordEvent(ResetPasswordRequest(
                      phone: verifyRequest.phone,
                      password: _pass1Controller.text,
                      passwordConfirmation: _pass2Controller.text,
                      code: verifyRequest.code)));
                },
              )
            ]),
          ),
        ));
  }
}
