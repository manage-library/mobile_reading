import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ListOfAuthors extends StatelessWidget {
  final List<User?>? userName;
  const ListOfAuthors({Key? key, this.userName}) : super(key: key);

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
                    TextSpan(text: "Người dùng "),
                    TextSpan(
                      text: "nổi bật",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: userName?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        _exampleRandomColor(name: userName?.elementAt(index)?.full_name),
                      ],
                    ),
                  );
                })),
      ],
    );
  }
}

TableRow _exampleRandomColor({String? name}) {
  return TableRow(
    children: <Widget>[
      Container(
        // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // set random = true
        // default is false
        child: ProfilePicture(
          name: name ?? 'Aditya Dharmawan Saputra',
          // role: name,
          radius: 35,
          fontsize: 21,
          random: true,
          tooltip: true,
        ),
      ),
    ],
  );
}
