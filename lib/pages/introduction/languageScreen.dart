import 'package:afisha_market/core/bloc/language/language_bloc.dart';
import 'package:afisha_market/core/utils/local_storage.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:afisha_market/pages/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/bloc/language/language_event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              const Spacer(),
              MyText(
                "${AppLocalizations.of(context)?.welcome}",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: mainColor,
              ),
              const Spacer(),
              MyButtonTwo(
                "Русский",
                onTap: () async {
                  context.read<LanguageBloc>().add(const ChangeLanguage(langCode: 'ru'));
                  await LocalStorage.instance.setLanguage('ru');
                  Navigator.of(context).pop();
                },
              ),
              MyButtonTwo(
                'O\'zbek',
                onTap: () async{
                  context.read<LanguageBloc>().add(const ChangeLanguage(langCode: 'uz'));
                  await LocalStorage.instance.setLanguage('uz');
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      );
    });
  }
}
