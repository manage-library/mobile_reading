import 'package:book_reading_mobile_app/core/api_const.dart';
import 'package:book_reading_mobile_app/screens/home_screen.dart';
import 'package:book_reading_mobile_app/screens/sign_in_screen.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'constants.dart';

void main() {
  APIConst.setBaseUrl(Enviroment.LOCAL);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      initialRoute: AppRoutes.introScreen,
      routes: listRoutes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
            ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bitmap.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.displayMedium,
                  children: const [
                    TextSpan(
                      text: "flamin",
                    ),
                    TextSpan(
                      text: "go.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.signInScreen),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xff51C1B0),
                          Color(0xff4FC1B4),
                          Color(0xff4BC1BE),
                          Color(0xff42C2CF),
                          Color(0xff2BAFCC),
                        ],
                        begin: FractionalOffset(
                          0.0,
                          0.0,
                        ),
                        end: FractionalOffset(
                          0.0,
                          0.0,
                        ),
                        stops: [0.5, 1.0, 0.5, 1.0, 0.5],
                        tileMode: TileMode.clamp),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.signUpScreen),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border:
                        Border.all(color: const Color(0xffDBDBDB), width: 1),
                    color: const Color(0xffFAFAFA),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xff5A6273)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
