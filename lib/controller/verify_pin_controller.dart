import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/forgot_password_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:get/get.dart';

import '../core/util/alert_utils.dart';
import '../src/routes.dart';

class VerifyCodeController extends GetxController {
  final ForgotPasswordRepositoryImpl _forgotPasswordRepositoryImpl = ForgotPasswordRepositoryImpl();
  var email = ''.obs;
  var password = ''.obs;
  final model = User();
  RxBool isButtonDisabled = true.obs;
  RxBool isObscureText = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      email.value = Get.arguments;
    }
  }

  void updatePassword(String? value) {
    password.value = value ?? '';
    isButtonDisabled.value = !_isValidated;
  }

  bool get _isValidated {
    return (password.value == null && model.code?.length != 6);
  }

  void updateCode(String? value) {
    isButtonDisabled.value = !_isValidated;
    model.code = value;
  }

  void setObsecureText() {
    isObscureText.value = !isObscureText.value;
  }

  void verifyForgotPassword() async {
    User user = User(code: model.code, email: email.value, password: password.value);
    var response = await _forgotPasswordRepositoryImpl.verifyPassword(user: user);
    if (response != null) {
      AlertUtils.showError(
          titleError: 'Thành công',
          desc: 'Chúc mừng bạn đổi mật khẩu thành công',
          okButtonTitle: 'Chấp nhận',
          onOkButtonPressed: () async {
            await Get.toNamed(AppRoutes.signInScreen);
          });
    } else {
      AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Đổi mật khẩu thất bại', okButtonTitle: 'Thử lại');
    }
  }
}
