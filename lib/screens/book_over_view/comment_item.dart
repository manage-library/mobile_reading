import 'dart:ui';

import 'package:book_reading_mobile_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class CommentItem extends StatelessWidget {
  String? userName;
  String? time;
  String? comment;
  String? rate;
  CommentItem({Key? key, this.comment, this.time, this.userName, this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(bottom: 20),
      height: 130,
      decoration: BoxDecoration(
          color: kProgressIndicator,
          border: Border.all(
            color: kProgressIndicatorTextField, //                   <--- border color
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  ProfilePicture(
                    name: userName ?? 'Độc giả',

                    // role: name,
                    radius: 24,
                    fontsize: 12,
                    random: true,
                    tooltip: true,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
                            children: [
                              TextSpan(text: userName ?? "Độc giả "),
                              TextSpan(
                                text: time ?? '\nDec 10 2014',
                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(45))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      rate ?? '5',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              )
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              comment ?? 'Comment ',
              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
