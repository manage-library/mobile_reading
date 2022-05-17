import 'package:book_reading_mobile_app/controller/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController controlEmail = TextEditingController();
  final TextEditingController controlPassword = TextEditingController();

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
          'Sign in',
          style: TextStyle(color: Color(0xff151718)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                child: TextField(
                  controller: controlEmail,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'youremail@example.com',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
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
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: controlPassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Forgot your password',
                style: TextStyle(fontSize: 12, color: Colors.deepPurpleAccent),
              ),
              const SizedBox(
                height: 32,
              ),
              InkWell(
                onTap: () {
                  authController.signIn(email: controlEmail.text, password: controlPassword.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
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
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  const TextSpan(text: 'Don\'t have an account? ', style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(color: Colors.deepPurpleAccent),
                      recognizer: TapGestureRecognizer()..onTap = () {}),
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
