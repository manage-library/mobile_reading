import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../core/util/functions.dart';

class EditProfileController extends GetxController{
  List<String> gender = ['Nam', 'Nữ'];
  RxString genderSelected = "Nam".obs;
  String name = "";
  String email = "";
  String dateOfBirth = "";
  Rx<DateTime?> selectDate = Rx(DateTime.now());

  void updateGender(String value){
    genderSelected.value = value;
  }

  void updateName(String value){
    name = value;
  }

  void updateEmail(String value){
    email = value;
  }

   Future<void> selectBirthday() async {
    final date = await FunctionUtils.selectDate(Get.context!);
    selectDate.value = date ?? DateTime.now();
  }
  void updateDateOfBirth(String value){
    dateOfBirth = value;
  }

  void confirm(){

  }

}