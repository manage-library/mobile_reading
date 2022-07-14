import 'package:book_reading_mobile_app/constants.dart';
import 'package:book_reading_mobile_app/controller/verify_pin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/app_colors.dart';
import '../../style/app_icons.dart';
import '../../style/app_style.dart';
import '../../widgets/pin_code_fields.dart';
import '../../widgets/pin_theme.dart';
import '../../widgets/svg_icon.dart';

class VerifyCodePage extends StatelessWidget {
  final TextEditingController controlPassword = TextEditingController();
  final VerifyCodeController controller = Get.put(VerifyCodeController());
  VerifyCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff151718),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Xác nhận mã Pin',
          style: TextStyle(color: Color(0xff151718)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: AppStyles.paddingNormal, right: AppStyles.paddingNormal, top: 20),
          child: Obx(
            () => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text("Vui lòng nhập mã gồm 6 số được gửi tới Gmail đã đăng kí.",
                      style: AppStyles.styleAppBarTitle.copyWith(color: Colors.black))),
              const Text('Email'),
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
                  enabled: false,
                  initialValue: controller.email.value,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    // hintText: ,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text('Mật khẩu mới'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
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
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => controller.updatePassword(value),
                  obscureText: controller.isObscureText.value,
                  //    controller: controlPassword,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 10, height: 0.3),
                      border: InputBorder.none,
                      hintText: 'Mật khẩu',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      suffixIcon: IconButton(
                        icon: SvgIconWidget(
                          name: controller.isObscureText.value ? AppIcons.iconEyeOpen : AppIcons.iconEyeClose,
                          size: 16,
                          color: AppColors.labelColor,
                        ),
                        onPressed: () {
                          controller.setObsecureText();
                        },
                      )),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Row(
                children: [const Text('Mã Pin'), const Text(' *', style: TextStyle(color: Colors.red))],
              ),
              const SizedBox(
                height: 8,
              ),
              PinCodeTextField(
                  backgroundColor: Colors.white,
                  appContext: context,
                  autoFocus: true,
                  length: 6,
                  obscureText: false,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  textStyle:
                      TextStyle(color: AppColors.colorOverlayLighter, fontSize: 30, fontWeight: FontWeight.normal),
                  pinTheme: PinTheme(
                      //    shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(6),
                      borderWidth: 1,
                      fieldHeight: 60,
                      fieldWidth: 46,
                      activeFillColor: AppColors.labelColor,
                      activeColor: AppColors.labelColor,
                      selectedColor: AppColors.labelColor,
                      selectedFillColor: AppColors.labelColor,
                      inactiveColor: AppColors.labelColor,
                      inactiveFillColor: AppColors.labelColor,
                      errorBorderColor: AppColors.labelColor // Nếu không set thì mặc định màu đỏ
                      ),
                  cursorColor: kProgressIndicator,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    controller.updateCode(value);
                  }),
              // // OTPView(
              // //   length: 6,
              // //   width: MediaQuery.of(context).size.width - AppStyles.paddingNormal*2,
              // //   spacing: 12.0,
              // //   onChanged: (pin) { controller.updateCode(pin);},
              // //   onCompleted: (pin) {},
              // ),
              const SizedBox(
                height: 32,
              ),

              InkWell(
                  onTap: () {
                    // if (controller.isButtonDisabled.value) {
                    //   // If the form is valid, display a snackbar. In the real world,
                    //   // you'd often call a server or save the information in a database.
                    controller.verifyForgotPassword();
                    // }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: true
                        // controller.isButtonDisabled.value
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xff51C1B0),
                                  Color(0xff4FC1B4),
                                  Color(0xff4BC1BE),
                                  Color(0xff42C2CF),
                                  Color(0xff2BAFCC),
                                ],
                                begin: FractionalOffset(
                                  0.0,
                                  0.0,
                                ),
                                end: FractionalOffset(
                                  0.0,
                                  0.0,
                                ),
                                stops: [0.5, 1.0, 0.5, 1.0, 0.5],
                                tileMode: TileMode.clamp),
                          )
                        : BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.black26),
                    child: const Text(
                      'Xác nhận',
                      style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ))
            ]),
          )),
    );
  }
}
