
import 'package:book_reading_mobile_app/main.dart';
import 'package:book_reading_mobile_app/screens/book_over_view/book_over_view.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/screens/edit_profile_screen.dart';
import 'package:book_reading_mobile_app/screens/profile_screen.dart';
import 'package:book_reading_mobile_app/screens/reading_chapter/reading_chapter.dart';
import 'package:book_reading_mobile_app/screens/search_screen.dart';
import 'package:book_reading_mobile_app/screens/sign_in_screen.dart';
import 'package:book_reading_mobile_app/screens/sign_up_screen.dart';
import 'package:book_reading_mobile_app/screens/vip_update_screen.dart';
import 'package:flutter/widgets.dart';
import '../screens/forgot_password_page/forgot_password_page.dart';
import '../screens/forgot_password_page/verify_pin_code.dart';
import '../screens/qr_code.dart';

class AppRoutes {
  AppRoutes._internal();

  static const introScreen = '/';
  static const signInScreen = '/sign_in';
  static const signUpScreen = '/sign_up';
  static const menuProfile = '/menuProfile';
  static const searchScreen = '/search';
  static const detailBook = '/detail_book';
  static const readingChapter = '/reading_chapter';
  static const bookOverView = '/book_over_view';
  static const eidtProfile = '/edit_profile';
  static const vipUpdate = '/vip_update';
  static const forgotPassword = '/forgotPassword';
  static const verifyPin = '/verifyPin';
  static const qrCode = '/qrCode';
}

Map<String, Widget Function(BuildContext)> listRoutes = {
  AppRoutes.introScreen: (context) => WelcomeScreen(),
  AppRoutes.signInScreen: (context) => SignInScreen(),
  AppRoutes.signUpScreen: (context) => SignUpScreen(),
  AppRoutes.menuProfile: (context) => MenuProfile(),
  AppRoutes.searchScreen: (context) => SearchScreen(),
  AppRoutes.detailBook: (context) => DetailsScreen(),
  AppRoutes.readingChapter: (context) => ReadingChapter(),
  AppRoutes.bookOverView: (context) => BookOverView(),
  AppRoutes.eidtProfile: (context) => EditProfilePage(),
  AppRoutes.vipUpdate: (context) => VipUpdatePage(),
  AppRoutes.forgotPassword : (context) => ForgotPasswordPage(),
  AppRoutes.verifyPin : (context) => VerifyCodePage(),
   AppRoutes.qrCode : (context) => QrCodePage(),
};
