import 'package:afisha_market/const.dart';
import 'package:afisha_market/core/bloc/auth/authEvent.dart';
import 'package:afisha_market/core/bloc/auth/authState.dart';
import 'package:afisha_market/core/data/source/remote/request/VerifyRequest.dart';
import 'package:afisha_market/pages/main_container.dart';
import 'package:afisha_market/pages/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import '../../../core/bloc/auth/authBloc.dart';
import '../../utils/const.dart';
import '../../utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OTPContainer extends StatefulWidget {
  final String phone;

  const OTPContainer({Key? key, required this.phone}) : super(key: key);

  @override
  State<OTPContainer> createState() => _OTPContainerState();
}

class _OTPContainerState extends State<OTPContainer> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  bool showError = false;

  static const length = 5;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 22,
    ),
    decoration: BoxDecoration(
      color: helperColor,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
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
        if (state.isVerified) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainContainer()));
        }
      },
      builder: (context, state) {
        return Material(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Center(
                    child: SizedBox(
                      height: 68,
                      child: Pinput(
                        length: length,
                        controller: controller,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          height: 68,
                          width: 64,
                          decoration: defaultPinTheme.decoration!.copyWith(
                            border: Border.all(color: mainColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyWith(
                          decoration: BoxDecoration(
                            color: disableColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MyText(
                    l10n?.enterConfirmationCodeText ?? '',
                    color: mainColor,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text('${l10n?.didNotReceiveCode}'),
                      TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(ResendCodeEvent(context, AppConst.pHONENUMBER));
                          },
                          child: Text(
                            '${l10n?.resendCode}',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    l10n?.next ?? '',
                    isLoading: state.isVerifying,
                    onTap: () {
                      var code = controller.text;
                      bloc.add(VerifyEvent(context, VerifyRequest(phone: AppConst.pHONENUMBER, code: code)));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
