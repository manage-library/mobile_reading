import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:get/get.dart';

import '../data/rest_api/repositories_impl/detail_repository_impl.dart';

class ReadingChapterController extends GetxController {
  final DetailBookImpl _detailBookImpl = DetailBookImpl();
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

  goToPreviousChapter({String? bookId, String? chapterId}) async {
     Chapter? previousChapter = await _detailBookImpl.getContentByChapter(chapterId: (int.parse(chapterId ?? '0') - 1).toString(), bookId: bookId);
     Get.back();
    Get.toNamed(AppRoutes.readingChapter, arguments: previousChapter);
  }

    goToNextChapter({String? bookId, String? chapterId}) async {
     Chapter? previousChapter = await _detailBookImpl.getContentByChapter(chapterId: (int.parse(chapterId ?? '0') + 1).toString(), bookId: bookId);
     Get.back();
    Get.toNamed(AppRoutes.readingChapter, arguments: previousChapter);
  }

  
}
