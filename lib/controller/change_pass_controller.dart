import 'package:get/get.dart';

import '../core/util/alert_utils.dart';
import '../data/rest_api/repositories_impl/sign_up_repository_impl.dart';
import '../src/routes.dart';

class ChangePasswordController extends GetxController {
  final SignUpRepositoryImpl _signUpRepositoryImpl = SignUpRepositoryImpl();
  var oldPass = ''.obs;
  var newPass = ''.obs;
  var isDisabled = true.obs;
  var isObscureText = true.obs;
  void updateOldPass(String? value) {
    oldPass.value = value?.trim() ?? '';
 
  }

  void updateNewPass(String? value) {
    newPass.value = value ?? '';
 
  }

  bool get _isValidated {
    return (oldPass.value == null && newPass.value == null);
  }

  void setObsecureText() {
    isObscureText.value = !isObscureText.value;
  }

  void verify() async {
    var response = await _signUpRepositoryImpl.changePassword(oldPass: oldPass.value, newPass: newPass.value);
    if (response != null) {
      AlertUtils.showError(
          titleError: 'Thành công',
          desc: 'Chúc mừng bạn thay đổi mật khẩu thành công',
          okButtonTitle: 'Chấp nhận',
          onOkButtonPressed: () async {
            await Get.toNamed(AppRoutes.signInScreen);
          });
    } else {
      AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Thay đổi mật khẩu thất bại', okButtonTitle: 'Thử lại');
    }
  }
}
