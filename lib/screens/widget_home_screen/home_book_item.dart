import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/widgets/book_rating.dart';
import 'package:book_reading_mobile_app/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookItems extends StatelessWidget {
  final String? title;
  final String? authorName;
  final String? description;
  final String? imageUrl;
  final VoidCallback? pressDetails;
  final double? rate;
  const BookItems({Key? key, this.title, this.authorName, this.description, this.imageUrl, this.pressDetails, this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 245,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 24,
                right: size.width * .32,
              ),
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: const Text(
                      "Việt Nam ngày -- tháng -- năm --",
                      style: TextStyle(
                        fontSize: 9,
                        color: kLightBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    title ?? 
                   "How To Win \nFriends &  Influence",
                        //  style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    authorName ?? '---',
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: BookRating(score: rate ?? 4.9),
                        ),
                        Expanded(
                          child: Text(
                            description ?? 
                            "Đây là một tác phẩm đặc biệt và xuất sắc, mang đến cho người đọc những cảm xúc thú vị….",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: kLightBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.network(
              imageUrl ?? '---',
             // "assets/images/book-3.png",
              width: size.width * .3,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSideRoundedButton(
                text: "Đọc sách",
                radious: 24,
                press: pressDetails,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
