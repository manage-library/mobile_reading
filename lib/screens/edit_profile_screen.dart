
import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/edit_profile_controller.dart';
import 'package:book_reading_mobile_app/style/app_colors.dart';
import 'package:book_reading_mobile_app/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget{
  EditProfileController controller;
  EditProfilePage(this.controller);
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
          child: const Icon(
            Icons.arrow_back,
            color: kBlackColor,
            size: 30,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                color: const Color(0xffFAFAFA),
              ),
              child: TextFormField(
                //controller: controlEmail,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Your name',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // },
                onChanged: (name) => controller.updateName(name)
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                color: const Color(0xffFAFAFA),
              ),
              child: TextFormField(
                //controller: controlEmail,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'youremail@example.com',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // },
                onChanged: (email) => controller.updateEmail(email)
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: const Color(0xffDBDBDB), width: 1),
                color: const Color(0xffFAFAFA),
              ),
              child: TextFormField(
                //controller: controlEmail,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Date of Birth',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // },
                onChanged: (date) => controller.updateDateOfBirth(date)
              ),
            ),
            const SizedBox(height: 20),
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
                  items: controller.gender
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => controller.updateGender(value as String))),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                  backgroundColor: MaterialStateProperty.all(
                      AppColors.colorDepositIcon
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(Get.width - 40, 54)
                  )
              ),
              onPressed: () => controller.confirm(),
              child: Text(
                  "Xác nhận",
                  style: AppStyles.styleTextTitleMethod.copyWith(color: AppColors.colorTextTitleMethod)
              ),
            ),
          ],
        )
      ),
    );
  }

}