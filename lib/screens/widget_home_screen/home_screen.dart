import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/home_continue_reading.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/home_list_authors.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/lhome_list_category.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import 'package:get/get.dart';
import 'home_book_item.dart';
import 'home_search_text_field.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController(viewportFraction: 0.8, keepPage: true);
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<ImagePath> listImage = [];
    listImage.add(ImagePath(
        url: 'https://daibieunhandan.vn/van-hoa/Day-van-kieu-My-i253103/', imgPath: 'assets/images/3png.png'));
    listImage.add(ImagePath(
        imgPath: 'assets/images/magic_book.jpg', url: 'https://daibieunhandan.vn/van-hoa/Day-van-kieu-My-i253103/'));
    listImage.add(ImagePath(
        imgPath: 'assets/images/2.jpg',
        url: 'https://sachhay24h.com/nhung-truyen-co-tich-ve-tinh-ban-hay-va-y-nghia-nhat-a989.html'));
    listImage.add(ImagePath(
        imgPath: 'assets/images/4.jpg',
        url:
            'https://www.ybox.vn/vien-sach-bookademy/review-sach-ban-dat-gia-bao-nhieu-de-tro-thanh-mot-co-gai-hanh-phuc-5cdcbab7824c197ab7b738f9'));
    listImage.add(
        ImagePath(imgPath: 'assets/images/6.jpg', url: 'https://revisach.com/khi-chat-bao-nhieu-hanh-phuc-bay-nhieu/'));
    listImage.add(ImagePath(
        imgPath: 'assets/images/van-mau-tong-quan-van-hoc-viet-nam.jpg',
        url: 'https://hoctotnguvan.vn/van-10/van-mau-10/tong-quan-ve-van-hoc-viet-nam.html'));

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
                        () => SearchHomeScreen(
                          name: controller.userInfor.value.full_name,
                          vipId: controller.getVipId(controller.userInfor.value.vip_id!),
                          onPressed: () async {
                            final result =
                                await Get.toNamed(AppRoutes.menuProfile, arguments: controller.userInfor.value);
                            if (result != null) {
                              controller.loadData();
                            }
                          },
                        ),
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
                                itemCount: listImage.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () async {
                                      openBrowerURL(url: listImage[index].url, inApp: true);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: Colors.grey.shade300,
                                      ),
                                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                                        height: 280,
                                        child: Image.asset(listImage[index].imgPath, fit: BoxFit.fill),
                                      ),
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
                                rate: controller.bestOfBook.value.rate?.rate,
                                pressDetails: () => controller.goToDetailScreen(controller.bestOfBook.value),
                              ),
                            ),
                            Obx(() => (controller.listHistoryBook.value.length) > 0
                                ? RichText(
                                    text: const TextSpan(
                                      style: TextStyle(fontSize: 25, color: Colors.black),
                                      children: [
                                        TextSpan(text: "Tựa sách "),
                                        TextSpan(
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

  Future openBrowerURL({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: inApp, forceWebView: inApp, enableJavaScript: true);
    }
  }
}

class ImagePath {
  final String url;
  final String imgPath;
  ImagePath({required this.imgPath, required this.url});
}
