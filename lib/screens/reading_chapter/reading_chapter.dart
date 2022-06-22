import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/reading_chapter_controller.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReadingChapter extends StatelessWidget {
  String? chapterName;
  String? content;
  final ReadingChapterController controller = ReadingChapterController();
  ReadingChapter({Key? key, this.chapterName, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          //   title: Center(child: Text("title")),
          //   actions: [
          //     Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 20.0),
          //       child: Icon(Icons.more_vert_outlined),
          //     )
          //   ],
          // ),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            body: Stack(children: [
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 18, right: 18, top: 20, bottom: controller.isButtonDown.value ? 200 : 40),
                  child: Obx(() => SingleChildScrollView(
                        child: EasyRichText(
                          controller.chapter.value.content ?? '',
                          textAlign: TextAlign.justify,
                          defaultStyle: TextStyle(
                            fontSize: controller.fontSize.value,
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            letterSpacing: 1.0,
                          ),
                          patternList: [
                            EasyRichTextPattern(
                              targetString: controller.chapter.value.content?.split(' ').first,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: controller.fontSize.value),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              Obx(() => Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    //top: 2,
                    child: Container(
                      height: controller.isButtonDown.value ? 200 : 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, right: 18, left: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(
                                      controller.isButtonDown.value ? 'Font Size' : 'Setting',
                                      style: TextStyle(color: Colors.black, fontSize: 18),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    controller.isButtonDown.value = !controller.isButtonDown.value;
                                  },
                                  child: Icon(
                                    controller.isButtonDown.value
                                        ? Icons.arrow_drop_down_circle_outlined
                                        : Icons.arrow_drop_up_sharp,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                )
                              ],
                            ),
                          ),
                          controller.isButtonDown.value
                              ? Slider(
                                  value: controller.fontSize.value,
                                  max: 40,
                                  min: 15,
                                  divisions: 25,
                                  label: controller.fontSize.value.round().toString(),
                                  onChanged: controller.fontSizeChange,
                                  activeColor: kProgressIndicator,
                                  inactiveColor: kProgressIndicatorTextField,
                                  thumbColor: Colors.white,
                                )
                              : SizedBox(
                                  height: 0,
                                ),
                          controller.isButtonDown.value
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0, right: 18, left: 18),
                                  child: Text(
                                    'Go to',
                                    style: TextStyle(color: Colors.black, fontSize: 18),
                                  ),
                                )
                              : Container(),
                          controller.isButtonDown.value
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10.0, right: 18, left: 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                           Get.toNamed(AppRoutes.readingChapter, arguments: controller.chapter.value);
                                        },
                                        child: Container(
                                          height: 50,
                                          //    width: 100,
                                          decoration: BoxDecoration(color: kProgressIndicator),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Previous chapter',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){

                                        },
                                        child: Container(
                                          height: 50,
                                          //    width: 150,
                                          decoration: BoxDecoration(color: kProgressIndicator),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                                child: Text(
                                              'Next chapter',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  width: 0,
                                )
                        ],
                      ),
                    ),
                  ))
            ]),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 56,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Obx(() => Text(
                          controller.chapter.value.name ?? '',
                          style: TextStyle(color: Colors.white),
                        )),
                    centerTitle: true,
                  ),
                  floating: true,
                  backgroundColor: kProgressIndicator,
                  snap: true,
                  //pinned: true,
                ),
              ];
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {

          //   },
          //   backgroundColor: Colors.green,
          //   child: const Icon(Icons.navigation),
          // ),
        );
      },
    );
  }
}
