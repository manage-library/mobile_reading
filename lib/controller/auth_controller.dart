import 'package:book_reading_mobile_app/screens/widget_home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/util/alert_utils.dart';
import '../data/rest_api/repositories_impl/auth_repository_impl.dart';
import '../data/shared_preferences/authentication_storage.dart';
import '../domain/entities/security.dart';
import '../domain/entities/user.dart';

class AuthController extends GetxController {
  final AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();
  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();
  final isDisabled = true.obs;
  final email = "".obs;
  final password = "".obs;
  RxBool isObscureText = true.obs;

  void updateEmail(String? value) {
    email.value = value?.trim() ?? '';
    isDisabled.value = !_isValidated;
  }

  void updatePassword(String? value) {
    password.value = value ?? '';
    isDisabled.value = !_isValidated;
  }

  bool get _isValidated {
    // return true;
    return (validateEmail == null && validatePassword == null);
  }

  String? get validateEmail {
    final email = this.email.value;
    if (email.isEmpty) {
      return 'sign_up_email_empty'.tr;
    } else {
      return isValidEmail(email) ? null : 'sign_up_email_error'.tr;
    }
  }

  bool isValidEmail(String emailString) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailString);
  }

  String? get validatePassword {
    final password = this.password.value;
    if (password.isEmpty) {
      return 'sign_up_password_empty'.tr;
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    User _user = User(
      email: email,
      password: password,
    );
    Security? security = await _authRepositoryImpl.login(user: _user);
    // Security? security = await _authRepositoryImpl.login(user: User.fakeUser);
    if (security != null) {
      _authenticationStorage.updateToken(security.accessToken!);
      Get.to(() => HomeScreen());
    } else {
      //   Get.snackbar('title', ' message');
      AlertUtils.showError(titleError: 'Error', desc: 'Email or password is incorrect', okButtonTitle: 'Try again');
    }
  }

  void setObsecureText() {
    isObscureText.value = !isObscureText.value;
  }
}

class LoginStatus {
  static const String LOGIN_SUCCESS = "login success";
  static const String LOGIN_FAILED = "login failed";
}
