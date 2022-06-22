import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/screens/widget_home_screen/filter_screen.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterParam filterParam = FilterParam();

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
              "Search screen",
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
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(fontSize: 10, height: 0.3),
                      border: InputBorder.none,
                      hintText: 'Search ...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            await Get.to(FilterScreen(filterParam: filterParam,),);
                            //call api here
                            Map<String, String> apiParam = filterParam.buildParams();
                          },
                          child: Icon(Icons.filter))
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: const [
                    Text("Total 10 items"),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 15.0, left: 14),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ReadingListCard(
                        image: "assets/images/book-1.png",
                        title: "Crushing & Influence",
                        auth: "Gary Venchuk",
                        rating: 4.9,
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
                )
              ],
            ),
          )),
    );
  }
}
