import 'package:book_reading_mobile_app/core/util/alert_utils.dart';
import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/sign_up_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final SignUpRepositoryImpl _signUpRepositoryImpl = SignUpRepositoryImpl();
  final isDisabled = true.obs;
  final email = "".obs;
  final password = "".obs;
  final fullName = "".obs;
  RxBool isObscureText = true.obs;

  void updateFullName(String? value) {
    fullName.value = value?.trim() ?? '';
    isDisabled.value = !_isValidated;
  }

  void updateEmail(String? value) {
    email.value = value?.trim() ?? '';
    isDisabled.value = !_isValidated;
  }

  void updatePassword(String? value) {
    password.value = value?.trim() ?? '';
    isDisabled.value = !_isValidated;
  }


  bool get _isValidated {
    return (validateEmail == null && validatePassword == null && validateFullName == null);
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
    } else {
      return null;
    }
  }

  String? get validateFullName {
    final fullName = this.fullName.value;
    if (fullName.isEmpty) {
      return 'sign_up_password_empty'.tr;
    } else {
      return null;
    }
  }

  void signUp({required String email, required String password, required String fullName}) async {
    User _user = User(email: email, password: password, full_name: fullName);
    var response = await _signUpRepositoryImpl.register(user: _user);
    if (response != null) {
      AlertUtils.showError(titleError: 'Thành công', desc: 'Chúc mừng bạn đãng kí thành công', okButtonTitle: 'Chấp nhận', onOkButtonPressed : () async {
          await  Get.toNamed(AppRoutes.signInScreen);
      }); 
    } else {
      AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Đăng kí thất bại', okButtonTitle: 'Thử lại');
    }
  }

  void setObsecureText() {
    isObscureText.value = !isObscureText.value;
  }
}
