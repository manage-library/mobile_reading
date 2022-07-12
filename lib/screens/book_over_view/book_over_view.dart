// ignore_for_file: prefer_const_constructors
import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/book_overview_controller.dart';
import 'package:book_reading_mobile_app/domain/entities/comment.dart';
import 'package:book_reading_mobile_app/screens/book_over_view/comment_item.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../style/app_colors.dart';

class BookOverView extends StatelessWidget {
  BookOverView({Key? key}) : super(key: key);
  final BookOverViewController controller = Get.put(BookOverViewController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
        init: this.controller,
        global: false,
        builder: (detail) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.refresh();
              controller.refreshData();
            },
            child: DefaultTabController(
              initialIndex: 1,
              length: 2,
              child: Scaffold(
                body: NestedScrollView(
                  body: TabBarView(
                    children: [
                      Obx(() => AuthorTab(
                            description: controller.bookOverView.value.description,
                            authorDescription: controller.bookOverView.value.author_description,
                          )),
                      Obx(() => CommentTab())
                    ],
                  ),
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        leading: Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              icon: const Icon(
                                Icons.arrow_back_sharp,
                                color: kProgressIndicator,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                            );
                          },
                        ),
                        actions: [
                          IconButton(
                            icon: const Icon(
                              Icons.download,
                              color: kProgressIndicator,
                            ),
                            tooltip: 'Show Snackbar',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(content: Text('This is a snackbar')));
                            },
                          )
                        ],
                        expandedHeight: size.height * .65,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: size.height * .24),
                                    height: size.height * .6,
                                    child: Column(children: [
                                      Obx(() => Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Image.network(
                                                controller.bookOverView.value.image ?? '',
                                                height: 200,
                                              ),
                                            ),
                                          )),
                                      Obx(() => Padding(
                                            padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
                                            child: Text(
                                              controller.bookOverView.value.name ?? '---',
                                              style: TextStyle(color: Colors.black, fontSize: 12),
                                            ),
                                          )),
                                      Obx(() => Text(controller.bookOverView.value.author?.full_name ?? '---',
                                          style: TextStyle(
                                              color: Colors.black26, fontSize: 12, fontWeight: FontWeight.w300))),
                                      GestureDetector(
                                        onTap: () {
                                          showCommentBottomSheet(context);
                                          shape:
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 20.0),
                                          child: Center(
                                            child: Text(
                                              'Hãy đánh giá ngay!',
                                              style: TextStyle(color: kProgressIndicator, fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ])),
                              ),
                            ],
                          ),
                          centerTitle: true,
                        ),
                        floating: true,
                        backgroundColor: Colors.white,
                        snap: true,
                        pinned: true,
                        bottom: TabBar(
                            indicatorColor: kProgressIndicator,
                            labelStyle: TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'Family Name',
                                color: Color.fromARGB(255, 209, 158, 158)), //For Selected tab
                            unselectedLabelStyle:
                                TextStyle(fontSize: 10.0, fontFamily: 'Family Name'), //For Un-selected Tabs

                            // controller: TabController() ,
                            tabs: [
                              Tab(
                                icon: Icon(
                                  Icons.cloud_outlined,
                                  color: Colors.black,
                                ),
                                //  text: 'Cloud',
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.beach_access_sharp,
                                  color: Colors.black,
                                ),
                                //  text: 'Umbrella',
                              ),
                            ]),
                      ),
                    ];
                  },
                ),
              ),
            ),
          );
        });
  }

  Future<void> showCommentBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        barrierColor: AppColors.colorDarkBackground,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: AppColors.colorDarkBackground,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                decoration: BoxDecoration(
                    color: kProgressIndicatorTextField,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                height: Get.height * 0.4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Đánh giá sách",
                            style:
                                AppStyles.styleAppBarTitle.copyWith(color: Colors.black, fontWeight: FontWeight.w800),
                          ),
                          // SizedBox(
                          //   width: 50,
                          // ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.close,
                                  size: 30,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Vui lòng đánh giá sách",
                        style: AppStyles.styleAppBarTitle.copyWith(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    Center(
                      child: RatingBar(
                        initialRating: controller.bookOverView.value.rate?.rate ?? 0.0,
                        itemSize: 50,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        ratingWidget: RatingWidget(
                          full: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          empty: Icon(
                            Icons.star,
                            color: Colors.black12,
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          controller.updateRating(rating);
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.0),
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     height: 100,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                    //       color: const Color(0xffFAFAFA),
                    //     ),
                    //     child: TextFormField(
                    //       keyboardType: TextInputType.multiline,
                    //       maxLines: 3,
                    //       maxLength: 200,
                    //       onChanged: (value) => {controller.updateComment(value)},
                    //       decoration: const InputDecoration(
                    //         errorStyle: TextStyle(fontSize: 10, height: 0.3),
                    //         border: InputBorder.none,
                    //         hintText: 'Hãy nhập bình luận của bạn',
                    //         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        controller.submitComment();
                      },
                      child: Container(
                          //  height: 45,
                          width: 150,
                          decoration: BoxDecoration(
                            color: kProgressIndicator,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Đánh giá',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),
                          )),
                    )
                  ],
                )),
          );
        },
        context: context);
  }

  Widget CommentTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Đánh giá',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  controller.commentList.value.length != 0
                      ? Obx(() => Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                controller.bookOverView.value.rate?.rate.toString() ?? '4.9',
                                style:
                                    TextStyle(color: kProgressIndicator, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                '(${controller.commentList.value.length} đánh giá)',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ))
                      : Container()
                ],
              ),
            ),
            controller.commentList.value.length != 0
                ? Obx(() => Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 15.0, left: 14, bottom: 15),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.commentList.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          Comment comment = controller.commentList.value.elementAt(index) ?? Comment();
                          return CommentItem(
                            userName: comment.user?.full_name,
                            time: comment.createdAt,
                            comment: comment.content,
                            deleteComment: () {
                              controller.deleteComment(controller.commentList.value.elementAt(index)!.id);
                            },
                          );
                        },
                      ),
                    ))
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Hãy là người bình luận đầu tiên!',
                      style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                      color: const Color(0xffFAFAFA),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      maxLength: 200,
                      onChanged: (value) => {controller.updateComment(value)},
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 10, height: 0.3),
                        border: InputBorder.none,
                        hintText: 'Hãy nhập bình luận của bạn',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        controller.submitCommentWithoutRate();
                      },
                      child: Container(
                          //  height: 45,
                          width: 100,
                          decoration: BoxDecoration(
                            color: kProgressIndicator,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Đánh giá',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}

class AuthorTab extends StatelessWidget {
  final String? authorDescription;
  final String? description;
  AuthorTab({
    this.authorDescription,
    this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Tác giả : ",
            style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500, height: 1.5),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              authorDescription ?? 'Chưa có mô tả về tác giả',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Mô tả tác phẩm : ",
            style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              description ?? 'Chưa có mô tả về tác phẩm',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
            ),
          )
        ]),
      ),
    );
  }
}
