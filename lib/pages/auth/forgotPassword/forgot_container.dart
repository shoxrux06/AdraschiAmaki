import 'package:afisha_market/core/bloc/auth/authEvent.dart';
import 'package:afisha_market/core/data/source/remote/request/ForgotPasswordRequest.dart';
import 'package:afisha_market/pages/auth/forgotPassword/empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const.dart';
import '../../../core/bloc/auth/authBloc.dart';
import '../../utils/const.dart';
import '../../utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../signUp/widgets/country_text_form_field.dart';
import '../signUp/widgets/masked_text_controller.dart';

class ForgotPasswordContainer extends StatefulWidget {
  const ForgotPasswordContainer({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordContainer> createState() =>
      _ForgotPasswordContainerState();
}

class _ForgotPasswordContainerState extends State<ForgotPasswordContainer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _phoneController = MaskedTextController(
    mask: '+000 (00) 000-00-00',
  );
  @override
  void initState() {
    // TODO: implement initState
    _phoneController.text = '+998';
    final val = TextSelection.collapsed(offset: _phoneController.text.length);
    _phoneController.selection = val;
    super.initState();
  }
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final AuthBloc _bloc = BlocProvider.of<AuthBloc>(context);
    return Form(
        key: _formKey,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                CountryTextFormField(
                  l10n?.phoneNumber ?? '',
                  const Icon(CupertinoIcons.phone),
                  _phoneController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(child: MyText(
                  l10n?.enterYourPhoneNumberToReceiveVerificationCode ?? '',
                  color: mainColor,
                  textAlign: TextAlign.center,
                )),
                const Spacer(),
                ForgotEmpty(
                  phoneNumber: _phoneController.text,
                ),
                MyBigButton(
                  l10n?.next ?? '',
                  // 'Далее',
                  onTap: () {
                    final phone = _phoneController.text
                        .replaceAll(' ', '')
                        .replaceAll('(', '')
                        .replaceAll(')', '')
                        .replaceAll('-', '');
                    AppConst.pHONENUMBER = phone;
                    print('Forgot phone --> $phone');
                    _bloc.add(ForgotPasswordEvent(context,ForgotPasswordRequest(phone: phone)));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
