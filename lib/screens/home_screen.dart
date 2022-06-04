import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/home_continue_reading.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/home_list_authors.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/lhome_list_category.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import '../widgets/book_rating.dart';
import '../widgets/reading_card_list.dart';
import '../widgets/two_side_rounded_button.dart';
import 'details_screen.dart';
import 'package:get/get.dart';

import 'widget_home_screen/home_book_item.dart';
import 'widget_home_screen/home_search_text_field.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController(viewportFraction: 0.8, keepPage: true);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> assetImage = [
      "assets/images/magic_book.jpg",
      "assets/images/magic_book.jpg",
      "assets/images/magic_book.jpg",
      "assets/images/magic_book.jpg",
      "assets/images/magic_book.jpg",
      "assets/images/magic_book.jpg",
    ];

    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/main_page_bg.png"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () => SearchHomeScreen(name: controller.userInfor.value.fullName),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 200,
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: assetImage.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.grey.shade300,
                                  ),
                                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                                    height: 280,
                                    child: Image.asset(assetImage[index], fit: BoxFit.fill),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Center(
                              child: SmoothPageIndicator(
                                controller: pageController,
                                count: 6,
                                axisDirection: Axis.horizontal,
                                effect: const JumpingDotEffect(
                                  activeDotColor: kProgressIndicator,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  jumpScale: .7,
                                  verticalOffset: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListOfAuthors(),
                    Obx(() => ListCategory(
                        categoryName: controller.bookCategory.value, listBooks: controller.listBooks.value)),
                    // const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(text: "Best of the "),
                                TextSpan(
                                  text: "day",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          BookItems(),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: 25, color: Colors.black),
                              children: [
                                TextSpan(text: "Continue "),
                                TextSpan(
                                  text: "reading...",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ContinueReading(),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
