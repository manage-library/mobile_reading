import 'package:book_reading_mobile_app/screens/search_screen.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class SearchHomeScreen extends StatelessWidget {
  String? name;
  VoidCallback? onPressed;
  SearchHomeScreen({Key? key, this.name, this.onPressed}) : super(key: key);

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
                onTap: onPressed,
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
                    "Xin chào, " + (name ?? 'reader'),
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
            "Khám phá ngay",
            style: AppStyles.styleTextTitleMethodClever,
          ),
        ),
        GestureDetector(
          onTap: (() => Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()))),
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
                  color: kProgressIndicatorTextField,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Tìm kiếm ... ",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
