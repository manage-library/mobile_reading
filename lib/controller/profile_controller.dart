import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
 var userInfor = User().obs;
  // @override
  // void onInit() {
  //   if(Get.arguments != null) {
  //     userInfor.value = Get.arguments;
  //   }
  //   super.onInit();
  // }

   @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      userInfor.value = Get.arguments;
    }
  }
}