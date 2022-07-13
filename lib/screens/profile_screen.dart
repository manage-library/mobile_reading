import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/screens/bottom_sheet/app_bottom_sheet.dart';
import 'package:book_reading_mobile_app/widgets/logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';
import '../src/routes.dart';

class MenuProfile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  MenuProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: this.controller,
      global: false,
      builder: (GetxController profileController) {
        return Scaffold(
          backgroundColor: kProgressIndicatorTextField,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Get.back(result: 'profile screen');
              },
              child: const Icon(
                Icons.arrow_back,
                color: kBlackColor,
                size: 30,
              ),
            ),
            title: const Text(
              "Hồ sơ",
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
                        const CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.userInfor.value.full_name ?? 'Tên người dùng',
                                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller.userInfor.value.email ?? 'user@gmail.com',
                                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.grey),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                SizedBox(
                  height: 550,
                  child: Column(
                    children: [
                      ProfileItem(
                          title: 'Sửa thông tin',
                          onClick: () async {
                            final result =
                                await Get.toNamed(AppRoutes.eidtProfile, arguments: controller.userInfor.value);
                            if (result == 'change profile') {
                              controller.loadData();
                            }
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      ProfileItem(
                        title: 'Nâng cấp VIP',
                        onClick: () => Get.toNamed(AppRoutes.vipUpdate),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ProfileItem(
                        title: 'Đăng xuất',
                        onClick: () => AppBottomSheet(
                          title: "Đăng xuất",
                          contentSize: 200,
                          content: LogoutPage(),
                        ).show(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String? icon;
  final String? title;
  final Function onClick;
  const ProfileItem({this.title, this.icon, required this.onClick});
  @override
  Widget build(BuildContext context) {
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
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Row(children: [
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: kProgressIndicator,
                borderRadius: BorderRadius.all(Radius.circular(45)),
              ),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              title ?? '',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }
}
