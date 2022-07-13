import 'package:book_reading_mobile_app/controller/forgot_password_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/routes.dart';

class ForgotPasswordPage extends StatelessWidget {
  final ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
  TextEditingController emailController = TextEditingController();
  ForgotPasswordPage({Key? key}) : super(key: key);

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
          'Quên mật khẩu',
          style: TextStyle(color: Color(0xff151718), fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(children: [
          Text(
            'Hãy nhập email của bạn để reset mật khẩu. Bạn cần kiểm tra thư mục spam để nhận mã code.',
            style: TextStyle(color: Color(0xff151718), fontWeight: FontWeight.w400, fontSize: 17),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 32,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const Text(
                    'Email',
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    ' *',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )),
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
                 controller: emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'youremail@example.com',
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: (value) {
                     forgotPasswordController.updateEmail(value);
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
         Obx(() =>  InkWell(
              onTap: () {
                if (!forgotPasswordController.isDisabled.value) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  forgotPasswordController.forgotPassword(email: emailController.text);
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: !forgotPasswordController.isDisabled.value
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
        ),  const SizedBox(
            height: 20,
          ),
          Center(
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              const TextSpan(
                  text: 'Bạn chưa có tài khoản? ',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
              TextSpan(
                  text: 'Đăng ký',
                  style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 16, fontWeight: FontWeight.w500),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, AppRoutes.signUpScreen);
                    }),
            ])),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              onTap:
              () {
                Navigator.pushNamed(context, AppRoutes.signInScreen);
              };
            },
            child: Center(
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                const TextSpan(
                    text: 'Bạn đã có tài khoản? ',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
                TextSpan(
                    text: 'Đăng nhập',
                    style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 16, fontWeight: FontWeight.w500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, AppRoutes.signInScreen);
                      }),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}
