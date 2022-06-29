

import 'package:book_reading_mobile_app/controller/edit_profile_controller.dart';
import 'package:book_reading_mobile_app/controller/vip_update_controller.dart';
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
}

Map<String, Widget Function(BuildContext)> listRoutes = {
  AppRoutes.introScreen: (context) => WelcomeScreen(),
  AppRoutes.signInScreen: (context) => SignInScreen(),
  AppRoutes.signUpScreen: (context) => SignUpScreen(),
  AppRoutes.menuProfile: (context) => MenuProfile(),
  AppRoutes.searchScreen: (context) => SearchScreen(),
  AppRoutes.detailBook : (context) => DetailsScreen(),
  AppRoutes.readingChapter : (context) => ReadingChapter(),
  AppRoutes.bookOverView : (context) => BookOverView(),
  AppRoutes.eidtProfile: (context) => EditProfilePage(EditProfileController()),
  AppRoutes.vipUpdate: (context) => VipUpdatePage(VipUpdateController()),

};
