import 'package:afisha_market/pages/auth/newPassword/NewPasswordScreen.dart';
import 'package:afisha_market/pages/auth/signUp/SignUpScreen.dart';
import 'package:afisha_market/pages/home/home_page.dart';
import 'package:afisha_market/pages/introduction/languageScreen.dart';
import 'package:afisha_market/pages/main_container.dart';
import 'package:flutter/material.dart';

import '../../pages/auth/forgotPassword/ForgotPasswordScreen.dart';
import '../../pages/auth/otp/OTPScreen.dart';
import '../../pages/auth/signIn/SignInScreen.dart';
import '../../pages/product_detail/ProductDetailPage.dart';
import 'app_routes.dart';

abstract class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      case AppRoutes.chooseLang:
        return MaterialPageRoute(
          builder: (_) => const ChooseLanguageScreen(),
        );
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case AppRoutes.otp:
        return MaterialPageRoute(
          builder: (_) => const OTPScreen(),
        );
      case AppRoutes.newPassword:
        return MaterialPageRoute(
          builder: (_) => const NewPasswordScreen(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const MainContainer(),
        );
      case AppRoutes.productDetail:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Page not found'),
                  ),
                ));
    }
  }
}
