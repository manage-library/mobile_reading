import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/screens/details_screen.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Icon(
                Icons.arrow_back,
                color: kBlackColor,
                size: 30,
              ),
            ),
            title: Text(
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
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    // border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                    color: kProgressIndicatorTextField,
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.visiblePassword,
                    //    onChanged: (value) => authController.updatePassword(value),

                    //controller: controlPassword,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(fontSize: 10, height: 0.3),
                      border: InputBorder.none,
                      hintText: 'Search ...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: [
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
