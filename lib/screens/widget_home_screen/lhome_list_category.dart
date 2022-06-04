import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/category.dart';
import 'package:book_reading_mobile_app/screens/details_screen.dart';
import 'package:book_reading_mobile_app/widgets/reading_card_list.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  List<Category?>? categoryName;
  List<Book?>? listBooks;
  ListCategory({Key? key, this.categoryName, this.listBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    style: const TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w400),
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
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 50,
                    // width: 120,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)), color: kProgressIndicator),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Center(
                        child: Text(
                          '${categoryName?[index]?.name ?? ''}',
                          style: const TextStyle(color: Colors.white),
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
                  image: listBooks?[index]?.image ?? "assets/images/book-1.png",
                  title: listBooks?[index]?.name ?? "Crushing & Influence",
                  auth: listBooks?[index]?.author?.fullName ?? "Gary Venchuk",
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
              }),
        ),
      ],
    );
  }
}
