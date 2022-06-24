import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/book_overview_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/comment.dart';
import 'package:get/get.dart';

class BookOverViewController extends GetxController {
  var bookOverView = Book().obs;
  RxList<Comment?> commentList = RxList();
  final BookOverViewImpl _bookOverViewImpl = BookOverViewImpl();
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      bookOverView.value = Get.arguments;
    }
    getComment();
  }

  void getComment() async {
    List<Comment?> listComment = await _bookOverViewImpl.getComment(bookOverView.value.id ?? 0);
    commentList.value = listComment;
  }
}
