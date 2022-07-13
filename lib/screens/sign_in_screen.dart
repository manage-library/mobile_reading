import 'package:book_reading_mobile_app/controller/auth_controller.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/widgets/svg_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/entities/user.dart';
import '../style/app_colors.dart';
import '../style/app_icons.dart';

// validate in form login with Global key is not beautyfull -> use enable login button when email and pass is filled
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController controlEmail = TextEditingController();
  final TextEditingController controlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
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
          'Đăng nhập',
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
                    controller: controlEmail,
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
                    onChanged: (value) {
                      authController.updateEmail(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text('Password'),
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
                  child: Obx(() => TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
                    // },

                    onChanged: (value) => authController.updatePassword(value),
                    obscureText: authController.isObscureText.value ,
                    controller: controlPassword,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 10, height: 0.3),
                      border: InputBorder.none,
                      hintText: 'Mật khẩu',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      suffixIcon: IconButton(icon: SvgIconWidget(
                                        name: authController.isObscureText.value
                                            ? AppIcons.iconEyeOpen
                                            : AppIcons.iconEyeClose,
                                        size: 16,
                                        color: AppColors.labelColor,
                                      ), onPressed: () {
                                        authController.setObsecureText();
                                       },)
                    ),
                  ),
             )   ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                  child: const Text(
                    'Quên mật khẩu',
                    style: TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Obx(() {
                  return InkWell(
                      onTap: () {
                        if (!authController.isDisabled.value) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          authController.signIn(email: controlEmail.text, password: controlPassword.text);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        decoration: !authController.isDisabled.value
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
                          'Đăng nhập',
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ));
                }),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                      text: TextSpan(children: <TextSpan>[
                    const TextSpan(text: 'Bạn chưa có tài khoản? ', style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: 'Đăng ký',
                        style: const TextStyle(color: Colors.deepPurpleAccent),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoutes.signUpScreen);
                          }),
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
