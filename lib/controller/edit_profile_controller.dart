import 'package:book_reading_mobile_app/core/util/alert_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/util/functions.dart';
import '../data/rest_api/repositories_impl/sign_up_repository_impl.dart';
import '../domain/entities/user.dart';
import '../src/routes.dart';

class EditProfileController extends GetxController {
  final SignUpRepositoryImpl _signUpRepositoryImpl = SignUpRepositoryImpl();
  List<String> gender = ['Nam', 'Nữ', 'Khác'];
  RxString genderSelected = "Nam".obs;
  List<String> vipName = ['Vàng', 'Bạc', 'Đồng', 'Chưa đăng kí Vip'];
  RxString vipIdSelected = 'Vàng'.obs;
  String name = "";
  var userInfor = User().obs;
  int genderId = 1;

  Rx<DateTime?> selectDate = Rx(DateTime.now());

  @override
  void onInit() {
    if (Get.arguments != null) {
      userInfor.value = Get.arguments;
    }
    genderSelected.value = (userInfor.value.gender == 1) ? 'Nam' : 'Nữ';
  }


  RxString get updateVipValue {
    if (userInfor.value.vip_id == 6) {
      return 'Vàng'.obs;
    } else if (userInfor.value.vip_id == 3) {
      return 'Bạc'.obs;
    } else if (userInfor.value.vip_id == 1) {
      return 'Đồng'.obs;
    }

    return 'Chưa đăng kí Vip'.obs;
  }

  void updateGender(String value) {
    genderSelected.value = value;
    if (value == "Nam") {
      genderId = 1;
    } else if (value == "Nữ") {
      genderId == 2;
    } else {
      genderId == 3;
    }
  }

  void updateVip(String value) {
    vipIdSelected.value = value;
  }

  void updateName(String value) {
    name = value;
  }

  Future<void> selectBirthday({required BuildContext context}) async {
    final date = await FunctionUtils.selectDate(context);
    selectDate.value = date;
  }

  void confirm(
      {required String email,
      required String fullName,
      required DateTime dateOfBirth,
      required int gender,
      required int vipId}) async {
    User _user = User(
      full_name: fullName,
      date_of_birth: dateOfBirth,
      vip_id: userInfor.value.vip_id,
      gender: genderId,
      avatar: '',
    );
    var response = await _signUpRepositoryImpl.updateInfo(user: _user);
    if (response != null) {
      Get.back(result: 'change profile');
      AlertUtils.showError(
        titleError: 'Thành công',
        desc: 'Thay đổi thông tin thành công',
        okButtonTitle: 'Đồng ý',
      );
      
    } else {
      AlertUtils.showError(titleError: 'Xảy ra lỗi', desc: 'Sửa đổi thông tin thất bại', okButtonTitle: 'Thử lại');
    }
  }
}
