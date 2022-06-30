import 'package:get/get.dart';

class EditProfileController extends GetxController{
  List<String> gender = ['Nam', 'Nữ'];
  RxString genderSelected = "Nam".obs;
  String name = "";
  String email = "";
  String dateOfBirth = "";

  void updateGender(String value){
    genderSelected.value = value;
  }

  void updateName(String value){
    name = value;
  }

  void updateEmail(String value){
    email = value;
  }

  void updateDateOfBirth(String value){
    dateOfBirth = value;
  }

  void confirm(){

  }

}