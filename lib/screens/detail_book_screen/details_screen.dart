import 'package:book_reading_mobile_app/controller/detail_book_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../constants.dart';
import '../../widgets/book_rating.dart';
import '../../widgets/rounded_button.dart';

class DetailsScreen extends StatelessWidget {
  final DetailBookController controller = DetailBookController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
        init: this.controller,
        global: false,
        builder: (detailController) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: kProgressIndicator,
            //   leading: Builder(
            //     builder: (BuildContext context) {
            //       return IconButton(
            //         icon: const Icon(Icons.arrow_back),
            //         onPressed: () {
            //           Get.back();
            //         },
            //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            //       );
            //     },
            //   ),
            //   title: const Center(child: Text("Book Detail")),
            //   actions: [],
            // ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topCenter,
                          padding:
                              EdgeInsets.only(top: size.height * .08, left: size.width * .1, right: size.width * .02),
                          height: size.height * .4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/bg.png"),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Obx(() => BookInfo(
                                size: size,
                                book: controller.bookItem.value,
                              ))),
                    ],
                  ),
                  Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(8),
                      itemCount: ((controller.bookItem.value.chapters?.length ?? 1 - 1)),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller.goToChapterReadingBook(
                                bookId: controller.bookItem.value.id.toString(),
                                chapterId: controller.bookItem.value.chapters?.elementAt(index).id.toString());
                          },
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                bottomLeft: Radius.circular(32),
                              ),
                              child: ListTile(
                                title: Text(
                                    "Chapter ${index + 1} : ${controller.bookItem.value.chapters?.elementAt(index).name ?? '---'}"),
                                subtitle: controller.bookItem.value.chapters?.elementAt(index).description != null
                                    ? Text('${controller.bookItem.value.chapters?.elementAt(index).description}')
                                    : Text('---'),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: [
                              TextSpan(
                                text: "You might also ",
                              ),
                              TextSpan(
                                text: "like….",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        //          SizedBox(height: 20),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Obx(() => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: RelatedBook(
                          bookTitle: controller.bookWithCategory.value.name,
                          authorName: controller.bookWithCategory.value.author?.full_name,
                          imgPath: controller.bookWithCategory.value.image,
                          onPressed: () {
                            Get.back();
                            Get.toNamed(AppRoutes.detailBook, arguments: controller.bookWithCategory.value);
                          },
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class RelatedBook extends StatelessWidget {
  String? bookTitle;
  String? authorName;
  String? imgPath;
  double? rate;
  VoidCallback? onPressed;

  RelatedBook({Key? key, this.bookTitle, this.authorName, this.imgPath, this.onPressed, this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 180,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(left: 24, top: 24, right: 150),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: Color(0xFFFFF8F9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: kBlackColor),
                    children: [
                      TextSpan(
                        text: bookTitle ?? "How To Win \nFriends & Influence \n",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: '\n${authorName}',
                        style: TextStyle(color: kBlackColor, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    BookRating(
                      score: rate ?? 0.0,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: onPressed,
                        child: RoundedButton(
                          text: "Read",
                          verticalPadding: 10,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.network(
            imgPath ?? "assets/images/book-3.png",
            width: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}

class ChapterCard extends StatelessWidget {
  final String? name;
  final String? tag;
  final int? chapterNumber;
  final VoidCallback? press;
  const ChapterCard({
    Key? key,
    this.name,
    this.tag,
    this.chapterNumber,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      margin: EdgeInsets.only(bottom: 16),
      width: size.width - 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(.84),
          ),
        ],
      ),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chapter $chapterNumber : $name \n",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tag ?? 'description : ---',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: kLightBlackColor),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onPressed: press,
          )
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  final Book? book;
  const BookInfo({
    this.book,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      book?.name ?? '---',
                      style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 28),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: this.size.height * .005),
                  //   alignment: Alignment.centerLeft,
                  //   padding: EdgeInsets.only(top: 0),
                  //   child: Text(
                  //     "Influence",
                  //     style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  //           fontSize: 25,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //   ),
                  // ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: this.size.width * .3,
                            padding: EdgeInsets.only(top: this.size.height * .02),
                            child: Text(
                              book?.description ??
                                  "When the earth was flat andeveryone wanted to win the gameof the best and people and winning with an A game with all the things you have.",
                              maxLines: 5,
                              style: TextStyle(
                                fontSize: 10,
                                color: kLightBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: this.size.height * .015),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Read",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: book?.isLike == 0
                                ? Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                    color: Colors.grey,
                                  )
                                : SvgPicture.asset(
                                    'assets/images/ic_nft_heart_fill.svg',
                                    color: Colors.red,
                                  ),
                            onPressed: () {},
                          ),
                          BookRating(score: book?.rate?.value ?? 0.0),
                        ],
                      )
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Image.network(
                  book?.image ?? '---',
                  width: 200,
                  height: 200,
                ),
              )),
        ],
      ),
    );
  }
}
