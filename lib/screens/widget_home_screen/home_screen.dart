import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/home_continue_reading.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/home_list_authors.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/lhome_list_category.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants.dart';
import '../../widgets/book_rating.dart';
import '../../widgets/reading_card_list.dart';
import '../../widgets/two_side_rounded_button.dart';
import '../detail_book_screen/details_screen.dart';
import 'package:get/get.dart';

import 'home_book_item.dart';
import 'home_search_text_field.dart';

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

    return RefreshIndicator(
      color: kProgressIndicator,
      onRefresh: () async {
        controller.loadData();
      },
      child: GestureDetector(
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
                        () => SearchHomeScreen(name: controller.userInfor.value.full_name, onPressed: (){
                           Get.toNamed(AppRoutes.menuProfile, arguments: controller.userInfor.value);
                        },),
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
                      Obx(() => ListOfAuthors(
                            userName: controller.authorList.value,
                          )),
                      Obx(() => ListCategory(
                            categoryName: controller.bookCategory.value,
                            listBooks: controller.listBooks.value,
                            controller: controller,
                          )),
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
                                  TextSpan(text: "Gợi ý "),
                                  TextSpan(
                                    text: "tốt nhất",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Obx(
                              () => BookItems(
                                title: controller.bestOfBook.value.name,
                                description: controller.bestOfBook.value.description,
                                imageUrl: controller.bestOfBook.value.image,
                                authorName: controller.bestOfBook.value.author?.full_name,
                                rate: controller.bestOfBook.value.rate?.value,
                                pressDetails: () {
                                  Get.toNamed(AppRoutes.detailBook, arguments: controller.bestOfBook.value);
                                },
                              ),
                            ),
                            Obx(() => (controller.listHistoryBook.value.length) > 0
                                ? RichText(
                                    text: const TextSpan(
                                      style: const TextStyle(fontSize: 25, color: Colors.black),
                                      children: [
                                        const TextSpan(text: "Tựa sách "),
                                        const TextSpan(
                                          text: "đang đọc ...",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container()),
                            const SizedBox(height: 20),
                            Obx(
                              () => (controller.listHistoryBook.value.length) > 0
                                  ? ContinueListReading(controller: controller)
                                  : Container(),
                            ),
                            const SizedBox(height: 40),
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
      ),
    );
  }
}
