import 'package:book_reading_mobile_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuProfile extends StatelessWidget {
  const MenuProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kProgressIndicatorTextField,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: kBlackColor,
              size: 30,
            ),
          ),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
        child: Column(
          children: [
            Container(
              height: 100,
              width: Get.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 13,
                    color: Color(0xFFD3D3D3).withOpacity(.40),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nguyễn Thị Thanh Tâm",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "tamntt2710@gmail.com",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 28),
            SizedBox(
              height: 550,
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 86,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 13,
                          color: Color(0xFFD3D3D3).withOpacity(.40),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: kProgressIndicator,
                            borderRadius: BorderRadius.all(Radius.circular(45)),
                          ),
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "My profile",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                        )
                      ]),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
