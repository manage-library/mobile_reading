import 'package:book_reading_mobile_app/screens/search_screen.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchHomeScreen extends StatelessWidget {
  String? name;
  SearchHomeScreen({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 40, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.menuProfile);
                },
                child: Container(
                  height: 41,
                  width: 41,
                  decoration: BoxDecoration(
                      color: kBlackColor,
                      border: Border.all(
                        color: kBlackColor,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Hello, " + (name ?? 'reader'),
                    style: const TextStyle(color: kBlackColor, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "Keep Exploring",
            style: AppStyles.styleTextTitleMethodClever,
          ),
        ),
        GestureDetector(
          onTap: (() => Navigator.push(context, new MaterialPageRoute(builder: (context) => new SearchScreen()))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24.0),
            child: Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  // border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                  color: kProgressIndicatorTextField,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Search ... ",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
                // TextFormField(
                //   style: TextStyle(color: Colors.white),
                //   keyboardType: TextInputType.visiblePassword,
                //   //    onChanged: (value) => authController.updatePassword(value),

                //   //   controller: controlPassword,
                //   decoration: const InputDecoration(
                //     hintStyle: TextStyle(color: Colors.white),
                //     errorStyle: TextStyle(fontSize: 10, height: 0.3),
                //     border: InputBorder.none,
                //     hintText: 'Search ...',
                //     contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //   ),
                // ),
                ),
          ),
        ),
      ],
    );
  }
}
