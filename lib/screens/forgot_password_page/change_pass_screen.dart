import 'package:book_reading_mobile_app/controller/change_pass_controller.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/style/app_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/app_colors.dart';
import '../../widgets/svg_icon.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController controlEmail = TextEditingController();

  final TextEditingController controlPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final ChangePasswordController authController = Get.put(ChangePasswordController());
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controlEmail.dispose();
    controlPassword.dispose();
  }

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
          'Thay đổi mật khẩu',
          style: TextStyle(color: Color(0xff151718)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text('Mật khẩu cũ'),
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
                    // controller: controlEmail,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mật khẩu cũ',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onChanged: (value) {
                      authController.updateOldPass(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text('Mật khẩu mới'),
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
                    child: Obx(
                      () => TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) => authController.updateNewPass(value),
                        obscureText: authController.isObscureText.value,
                        // controller: controlPassword,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 10, height: 0.3),
                            border: InputBorder.none,
                            hintText: 'Mật khẩu mới',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            suffixIcon: IconButton(
                              icon: SvgIconWidget(
                                name: authController.isObscureText.value ? AppIcons.iconEyeOpen : AppIcons.iconEyeClose,
                                size: 16,
                                color: AppColors.labelColor,
                              ),
                              onPressed: () {
                                authController.setObsecureText();
                              },
                            )),
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 32,
                ),
                InkWell(
                    onTap: () {
                      if (!authController.isDisabled.value) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        authController.verify();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: true
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
                    )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
