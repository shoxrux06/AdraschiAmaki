import 'package:afisha_market/core/bloc/add/create_bloc.dart';
import 'package:afisha_market/core/bloc/adv/adv_bloc.dart';
import 'package:afisha_market/core/bloc/auth/authBloc.dart';
import 'package:afisha_market/core/bloc/gallery/gallery_bloc.dart';
import 'package:afisha_market/core/bloc/language/language_bloc.dart';
import 'package:afisha_market/core/bloc/language/language_event.dart';
import 'package:afisha_market/core/constants/app_pages.dart';
import 'package:afisha_market/core/constants/app_routes.dart';
import 'package:afisha_market/core/data/models/language_model.dart';
import 'package:afisha_market/generated/codegen_loader.g.dart';
import 'package:afisha_market/pages/utils/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/home/home_bloc.dart';
import 'core/bloc/productDetail/product_detail_bloc.dart';
import 'core/di/dependency_manager.dart';
import 'core/utils/local_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: mainColor, // navigation bar color
      statusBarColor: mainColor, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setUpDependencies();
  await LocalStorage.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("uz"),
        Locale("ru"),
        Locale("en"),
      ],
      path: 'assets/tr',
      fallbackLocale: const Locale("en"),
      assetLoader: const CodegenLoader(),
      startLocale: const Locale("en"),
      child: const MyApp(),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: mainColor,
    systemNavigationBarColor: mainColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    String appLang = LocalStorage.instance.getLanguage();

    final token = LocalStorage.instance.getToken();
    print('token >> $token');
    print('UserID --> ${LocalStorage.instance.getUserId()??0}');
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc(homeRepository, filterRepository)),
        BlocProvider<AdvBloc>(create: (context) => AdvBloc(advRepository)),
        BlocProvider<GalleryBloc>(create: (context) => GalleryBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
        BlocProvider<CreateBloc>(create: (context) => CreateBloc(productRepository)),
        BlocProvider<ProductDetailBloc>(
            create: (context) => ProductDetailBloc(productRepository)),
        BlocProvider<LanguageBloc>(create:(_)=> LanguageBloc()..add(GetLanguage()))
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates:const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: Languages.languages.map((lang) => Locale(lang.code)).toList(),
            locale: state.locale,
            onGenerateRoute: AppPages.generateRoute,
            initialRoute: LocalStorage.instance.getToken().isNotEmpty? AppRoutes.main: AppRoutes.signIn,
            theme: ThemeData(
              useMaterial3: true,
              appBarTheme: Theme.of(context).appBarTheme.copyWith(
                color: mainColor,
              ),
            ),
          );
        },
      )
    );
  }
}
