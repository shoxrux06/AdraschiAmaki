import 'package:afisha_market/core/bloc/auth/authBloc.dart';
import 'package:afisha_market/core/bloc/auth/authState.dart';
import 'package:afisha_market/core/data/source/remote/request/VerifyRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/source/remote/request/SignInRequest.dart';
import '../../utils/utils.dart';

class NewPasswordEmpty extends StatefulWidget {
  final phoneNumber;
  final pass1;
  final pass2;
  final code;

  const NewPasswordEmpty(
      {Key? key, this.phoneNumber, this.pass1, this.pass2, this.code})
      : super(key: key);

  @override
  State<NewPasswordEmpty> createState() => _NewPasswordEmptyState();
}

class _NewPasswordEmptyState extends State<NewPasswordEmpty> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isErrorOccurred) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: MyText(
                "Something went wrong",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.isAuthenticated) {
          Navigator.pushNamed(context, '/user');
        }
        return Container();
      },
    );
  }
}
