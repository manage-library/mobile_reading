import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/search_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    FilterParam filterParam = FilterParam();
    return GetBuilder(
      init: controller,
      global: false,
      builder: (GetxController controllerSearch) {
        final List<String> tabs = <String>['Tác phẩm', 'Tác giả'];
        return GestureDetector(
          onTap: Get.focusScope?.unfocus,
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: kBlackColor,
                    size: 30,
                  ),
                ),
                title: const Text(
                  "Tìm kiếm",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        // border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                        color: kProgressIndicatorTextField,
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        //    onChanged: (value) => authController.updatePassword(value),

                        //controller: controlPassword,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            errorStyle: const TextStyle(fontSize: 10, height: 0.3),
                            border: InputBorder.none,
                            hintText: 'Tìm kiếm ...',
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  await Get.to(
                                    FilterScreen(
                                      filterParam: filterParam,
                                    ),
                                  );
                                  //call api here
                                  Map<String, String> apiParam = filterParam.buildParams();
                                },
                                child: const Icon(Icons.filter_list_outlined, color: Colors.white70, size: 30,))),
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      children: [
                        Obx(
                              () => RichText(
                            text: TextSpan(
                              style: const TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                const TextSpan(
                                  text: "Tổng ",
                                ),
                                TextSpan(
                                  text: controller.listFilterBook.length.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: " tựa sách",
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Obx(() => Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 15.0, left: 14, right: 30),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.listFilterBook.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          Book bookElement = controller.listFilterBook.value.elementAt(index) ?? Book();
                          return ReadingListCard(
                            image: bookElement.image,
                            title: bookElement.name,
                            //     auth: bookElement.author,
                            rating: bookElement.rate?.value,
                            pressDetails: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsScreen();
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ))
                  ],
                ),
              )),
        );
      },
    );
  }
}
