import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:get/get.dart';

class BookOverViewController extends GetxController {
  var bookOverView = Book().obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      bookOverView.value = Get.arguments;
    }
  }
}