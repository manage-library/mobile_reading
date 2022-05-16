import 'package:book_reading_mobile_app/main.dart';
import 'package:book_reading_mobile_app/screens/sign_in_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  AppRoutes._internal();

  static const introScreen = '/';
  static const signInScreen = '/sign_in';
}

Map<String, Widget Function(BuildContext)> listRoutes = {
  AppRoutes.introScreen: (context) => WelcomeScreen(),
  AppRoutes.signInScreen: (context) => const SignInScreen(),
};