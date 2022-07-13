import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/forgot_password_repository_impl.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:get/get.dart';

import '../core/util/alert_utils.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordRepositoryImpl _forgotPasswordRepositoryImpl = ForgotPasswordRepositoryImpl();
  RxBool isDisabled = true.obs;
  RxString email = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void updateEmail(String? value) {
    email.value = value?.trim() ?? '';
    isDisabled.value = !_isValidated;
  }

  bool get _isValidated {
    // return true;
    return (validateEmail == null);
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

  

  void forgotPassword({required String email}) async {
      var response = await _forgotPasswordRepositoryImpl.forgotPassword(email: email);
      if(response != null) {
          Get.toNamed(AppRoutes.verifyPin, arguments: email);
      } else {
        AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Vui lòng kiểm tra lại email của bạn', okButtonTitle: 'Thử lại');
      }
  }
}