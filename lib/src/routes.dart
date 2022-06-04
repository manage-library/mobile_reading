import 'package:book_reading_mobile_app/main.dart';
import 'package:book_reading_mobile_app/screens/profile_screen.dart';
import 'package:book_reading_mobile_app/screens/search_screen.dart';
import 'package:book_reading_mobile_app/screens/sign_in_screen.dart';
import 'package:book_reading_mobile_app/screens/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  AppRoutes._internal();

  static const introScreen = '/';
  static const signInScreen = '/sign_in';
  static const signUpScreen = '/sign_up';
  static const menuProfile = '/menuProfile';
  static const searchScreen = '/search';
}

Map<String, Widget Function(BuildContext)> listRoutes = {
  AppRoutes.introScreen: (context) => WelcomeScreen(),
  AppRoutes.signInScreen: (context) => SignInScreen(),
  AppRoutes.signUpScreen: (context) => SignUpScreen(),
  AppRoutes.menuProfile: (context) => MenuProfile(),
  AppRoutes.searchScreen: (context) => SearchScreen(),
};
