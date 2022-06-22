import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:get/get.dart';

class ReadingChapterController extends GetxController {
  var chapter = Chapter().obs;
  RxDouble fontSize = 16.0.obs;
  RxBool isButtonDown = false.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      chapter.value = Get.arguments;
      print("chapter id  : ${chapter.value.id}");
    }
  }

  fontSizeChange(double value) {
    fontSize.value = value;
    print('current slider : ${fontSize.value}');
  }

  
}
