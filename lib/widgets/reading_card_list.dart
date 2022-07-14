import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/widgets/book_rating.dart';
import 'package:book_reading_mobile_app/widgets/svg_icon.dart';
import 'package:book_reading_mobile_app/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/app_colors.dart';
import '../style/app_icons.dart';

class ReadingListCard extends StatefulWidget {
  final Book book;
  final VoidCallback? pressDetails;
  final VoidCallback? pressRead;
  final Function()? onTapFavorite;
  final HomeController controller = Get.put(HomeController());
  ReadingListCard({Key? key, this.pressDetails, this.pressRead, required this.book, this.onTapFavorite})
      : super(key: key);

  @override
  State<ReadingListCard> createState() => _ReadingListCard();
}

class _ReadingListCard extends State<ReadingListCard> {
  void onTapHeartButton() async {
    widget.onTapFavorite?.call();
    // widget.controller.updateFavouriteForItem(
    //      onSuccess: () {}, bookId: widget.book.id ?? 1);
    //widget.controller.setFavouriteItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
          ),
          Image.network(
            widget.book.image!,
            width: 150,
            height: 150,
          ),
          Positioned(
            top: 55,
            right: 10,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    onTapHeartButton();
                    setState(() {});
                  },
                  child: SvgIconWidget(
                    name: widget.book.isFavourite ? AppIcons.iconNFTHeartFill : AppIcons.icHeart,
                    color: widget.book.isFavourite ? AppColors.redColor : AppColors.labelColor,
                  ),
                ),
                BookRating(score: widget.book.rate?.rate ?? 4.9),
              ],
            ),
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: kBlackColor),
                        children: [
                          TextSpan(
                            text: "${widget.book.name}\n",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.book.author?.full_name,
                            style: const TextStyle(
                              color: kLightBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: widget.pressDetails,
                        child: Container(
                          width: 101,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Đọc sách"),
                        ),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          text: "Đánh giá",
                          press: widget.pressRead,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
