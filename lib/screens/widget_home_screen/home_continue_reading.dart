import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/book.dart';

class ContinueListReading extends StatelessWidget {
  final HomeController? controller;
  const ContinueListReading({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: controller?.listHistoryBook.value.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (controller?.listHistoryBook.value.elementAt(index)?.chapter != null) {
                Chapter? chapter = controller?.listHistoryBook.value.elementAt(index)?.chapter;
                  Book? book = controller?.listHistoryBook.value.elementAt(index)?.book;
                Get.toNamed(AppRoutes.readingChapter, arguments: chapter);
              } else {
                Book? book = controller?.listHistoryBook.value.elementAt(index)?.book;
                Get.toNamed(AppRoutes.detailBook, arguments: book );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0), //khoảng cách 2 item
              child: ClipRRect(
                borderRadius: BorderRadius.circular(38.5),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(38.5),

                    // border: Border.all(color: kProgressIndicator),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 33,
                        color: Color(0xFFD3D3D3).withOpacity(.84),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 20),
                    child: ClipRRect(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 180,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: controller?.listHistoryBook.value.elementAt(index)?.book?.name ??
                                              "tên tác phẩm",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller?.listHistoryBook.value.elementAt(index)?.book?.author_description ??
                                            "tên tác giả",
                                        style: const TextStyle(
                                          color: kLightBlackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Image.network(
                                    controller?.listHistoryBook.value.elementAt(index)?.book?.image ?? '',
                                    width: 70,
                                    height: 70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Chapter ${controller?.listHistoryBook.value.elementAt(index)?.chapter?.id}",
                              style: const TextStyle(
                                fontSize: 10,
                                color: kLightBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            height: 7,
                            width: size.width * .65,
                            decoration: BoxDecoration(
                              color: kProgressIndicator,
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
