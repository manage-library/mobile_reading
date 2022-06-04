import 'package:book_reading_mobile_app/constants.dart';
import 'package:flutter/material.dart';

class ListOfAuthors extends StatelessWidget {
  const ListOfAuthors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, bottom: 15, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  children: [
                    TextSpan(text: "Popular "),
                    TextSpan(
                      text: "Authors",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                "View all",
                style: const TextStyle(fontSize: 16, color: kBlackColor, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 15.0, left: 14),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        backgroundColor: kProgressIndicator,
                        backgroundImage: AssetImage("assets/images/book-1.png"),
                      ),
                    ),
                  ),
                  Text('Jame')
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
