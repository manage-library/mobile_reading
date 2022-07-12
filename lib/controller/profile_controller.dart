import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:get/get.dart';

import '../data/rest_api/repositories_impl/user_repository_impl.dart';

class ProfileController extends GetxController {
 final UserRepositoryImpl _repositoryImpl = UserRepositoryImpl();
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

  void loadData() {
    getInfoUser();
  }

  void getInfoUser() async {
    User? user = await _repositoryImpl.getInfoUser();
    userInfor.value = user ?? User();
    print('userInfo: ${user?.toJson()}');
  }
}