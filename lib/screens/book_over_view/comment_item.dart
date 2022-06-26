import 'package:book_reading_mobile_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class CommentItem extends StatelessWidget {
  String? userName;
  String? time;
  String? comment;
  CommentItem({Key? key, this.comment, this.time, this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      //   padding: EdgeInsets.symmetric(horizontal: ),
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
            name: userName ?? 'Độc giả',
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
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(text: userName ?? "Độc giả "),
                      TextSpan(
                        text: time,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                comment ?? 'Comment ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              )
            ],
          )
        ]),
      ),
    );
  }
}
