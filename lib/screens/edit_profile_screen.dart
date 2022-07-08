import 'dart:io';

import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/edit_profile_controller.dart';
import 'package:book_reading_mobile_app/core/util/date_time.dart';
import 'package:book_reading_mobile_app/core/util/file_utils.dart';
import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:book_reading_mobile_app/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_avatar.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  final EditProfileController controller = Get.put(EditProfileController());
  static final TextEditingController controlFullName = TextEditingController();

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
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: kBlackColor,
                  size: 30,
                ),
              ),
              title: const Text(
                "Sửa thông tin",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 200,
                          child: Container(
                            alignment: Alignment.center,
                            child: CustomAvatar(
                              sizeAvatar: 120.w,
                              showCameraIcon: true,
                              assetWidget: SvgIconWidget(name: 'assets/images/ic_camera.svg'),
                              //  file: controller.selectFingerprintFile.value,
                              onTap: () async {
                                final File? photo = await FileUtils.chooseImage();
                              },
                            ),
                          ),
                        ),
                        const Text('Họ và tên '),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                            color: const Color(0xffFAFAFA),
                          ),
                          child: TextFormField(
                              controller: controlFullName,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Tên của bạn',
                                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              ),
                              onChanged: (name) {
                                controller.updateName(name);
                              }),
                        ),
                        const SizedBox(height: 20),
                        const Text('Email '),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                            color: const Color(0xffFAFAFA),
                          ),
                          child: TextFormField(
                            initialValue: controller.userInfor.value.email,
                            enabled: false,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Ngày sinh '),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => controller.selectBirthday(context: context),
                          child: Obx(() => Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                                  color: const Color(0xffFAFAFA),
                                ),
                                child: TextFormField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: DateTimeUtils.getStringDate(controller.selectDate.value,
                                        pattern: Pattern.ddMMyyyy_vi),
                                    hintStyle: TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(height: 20),
                        const Text('Giới tính'),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                            color: const Color(0xffFAFAFA),
                          ),
                          child: Obx(() => DropdownButton(
                              value: controller.genderSelected.value,
                              isExpanded: true,
                              underline: Container(),
                              items: controller.gender.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) => controller.updateGender(value as String))),
                        ),
                        const SizedBox(height: 20),
                        const Text('Vip'),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                            color: const Color(0xffFAFAFA),
                          ),
                          child: Obx(() => DropdownButton(
                              value: controller.updateVipValue.value,
                              isExpanded: true,
                              underline: Container(),
                              items: controller.vipName.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: null
                              //     onChanged: (value) => controller.updateVip(value as String)
                              )),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))),
                              backgroundColor: MaterialStateProperty.all(AppColors.colorDepositIcon),
                              minimumSize: MaterialStateProperty.all(Size(Get.width - 40, 54))),
                          onPressed: () => controller.confirm(
                              dateOfBirth: controller.selectDate.value!,
                              email: controller.userInfor.value.email ?? '',
                              fullName: controlFullName.text,
                              gender: controller.genderSelected.value,
                              vipId: controller.userInfor.value.vip_id ?? 0),
                          child: Text("Xác nhận",
                              style: AppStyles.styleTextTitleMethod.copyWith(color: AppColors.colorTextTitleMethod)),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}
