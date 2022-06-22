import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/book_overview_controller.dart';
import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/category.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategory extends StatelessWidget {
  final List<Category?>? categoryName;
  final List<Book?>? listBooks;
  final HomeController? controller;
 
  ListCategory({Key? key, this.controller, this.categoryName, this.listBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: "Trending ",
                      ),
                      TextSpan(
                          text: "books",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
                const Text(
                  "View all",
                  style: TextStyle(fontSize: 16, color: kBlackColor, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
              itemCount: categoryName?.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    for(final category in categoryName!){
                       if(category?.id == categoryName?.elementAt(index)?.id) {
                            categoryName?.elementAt(index)?.isSelected = true;
                       } else {
                            category?.isSelected = false;
                       }             
                    }
                    print(categoryName?.elementAt(index)?.id);                
                    var categoryId = categoryName?.elementAt(index)?.id;
                    controller?.getBookByCategory(categoryId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 50,
                      // width: 120,
                      decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.all(const Radius.circular(40)) , 
                          color: (categoryName?.elementAt(index)?.isSelected ?? false) ? kProgressIndicator : Colors.white,
                          border: Border.all(color: kProgressIndicator)
                          ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Center(
                          child: Text(
                            '${categoryName?[index]?.name ?? ''}',
                            style: TextStyle( color: (categoryName?.elementAt(index)?.isSelected ?? false) ?Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 285,
          child: ListView.builder(
              itemCount: listBooks?.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 30),
              itemBuilder: (BuildContext context, int index) {
                return ReadingListCard(
                  isFavorite: listBooks?[index]?.isLike == 1 ? true : false,
                  image: listBooks?[index]?.image ?? "assets/images/book-1.png",
                  title: listBooks?[index]?.name ?? "Crushing & Influence",
                  auth: listBooks?[index]?.author?.fullName ?? "Gary Venchuk",
                  rating: 4.9,
                  pressDetails: () {
                    Get.toNamed(AppRoutes.detailBook,arguments: listBooks?.elementAt(index));
                    // goToDetailScreen;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return DetailsScreen();
                    //     },
                    //   ),
                    // );
                  },
                  pressRead : () {
                    Get.toNamed(AppRoutes.bookOverView, arguments: listBooks?.elementAt(index));
                  }
                );
              }),
        ),
      ],
    );
  }
}
