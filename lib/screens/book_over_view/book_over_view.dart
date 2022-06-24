import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/book_overview_controller.dart';
import 'package:book_reading_mobile_app/screens/detail_book_screen/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
          return DefaultTabController(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bình luận :',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                height: 90,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kProgressIndicatorTextField, //                   <--- border color
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(20))),
                                //  color: kProgressIndicatorTextField,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Row(children: [
                                    ProfilePicture(
                                      name: 'Aditya Dharmawan Saputra',
                                      // role: name,
                                      radius: 35,
                                      fontsize: 21,
                                      random: true,

                                      tooltip: true,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      //  mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                                          child: RichText(
                                            text: const TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
                                              children: [
                                                TextSpan(text: "Gợi ý "),
                                                TextSpan(
                                                  text: "tốt nhất",
                                                  style: TextStyle(fontWeight: FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                        
                                        ),
                                        Container(
                                          width: 250,
                                          child: Text(
                                            'Comment Comment CommentCommentCommentCommentComment Comment Comment CommentCommentCommentCommentCommentComment Comment CommentCommentCommentCommentComment',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        )
                                      ],
                                    )
                                  ]),
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: size.height * .65,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(top: size.height * .28),
                                height: size.height * .65,
                                child: Column(
                                  children: [
                                    Obx(() => Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Obx(
                                          () => Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: controller.bookOverView.value.rate?.value != null
                                                ? RatingBar(
                                                    initialRating: controller.bookOverView.value.rate?.value ?? 0.0,
                                                    itemSize: 16,
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
                                                    // itemBuilder: (context, _) => Icon(
                                                    //   Icons.star,
                                                    //   color: Colors.amber,
                                                    // ),
                                                    onRatingUpdate: (rating) {
                                                      // print(rating);
                                                    },
                                                  )
                                                : Center(
                                                    child: Text(
                                                      'Chưa có đánh giá.',
                                                      style: TextStyle(color: Colors.black54, fontSize: 10),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        Obx(() => controller.bookOverView.value.rate?.value != null
                                            ? Padding(
                                                padding: EdgeInsets.only(top: 10.0, left: 3.0),
                                                child: Text(
                                                    (controller.bookOverView.value.rate?.value ?? 0.0).toString(),
                                                    style: TextStyle(
                                                        color: Colors.black26,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400)),
                                              )
                                            : SizedBox())
                                      ],
                                    )
                                  ],
                                )),
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
                              fontSize: 22.0, fontFamily: 'Family Name', color: Colors.black), //For Selected tab
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
          );
        });
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
              authorDescription ??
                  'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights furnished to do so, subject to the following conditions:',
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
              description ??
                  'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights furnished to do so, subject to the following conditions:',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.w400, height: 1.5),
            ),
          )
        ]),
      ),
    );
  }
}
