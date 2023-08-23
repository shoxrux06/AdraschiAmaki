import 'package:afisha_market/core/bloc/auth/authBloc.dart';
import 'package:afisha_market/core/bloc/auth/authState.dart';
import 'package:afisha_market/pages/auth/otp/otp_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/source/remote/request/SignInRequest.dart';
import '../../utils/utils.dart';

class ForgotEmpty extends StatefulWidget {
  final phoneNumber;

  const ForgotEmpty({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<ForgotEmpty> createState() => _ForgotEmptyState();
}

class _ForgotEmptyState extends State<ForgotEmpty> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isErrorOccurred) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: MyText(
            "Something went wrong",
          )));
        }
        if (state.isAuthenticated) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => OTPContainer(phone: widget.phoneNumber)));
        }
      },
      builder: (context, state) {
        return Container();
      },
    );
  }
}
