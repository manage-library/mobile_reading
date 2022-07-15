import 'package:book_reading_mobile_app/configs/api_config.dart';
import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/book_overview_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/comment.dart';
import 'package:book_reading_mobile_app/domain/entities/rate.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

import '../core/util/alert_utils.dart';

class BookOverViewController extends GetxController {
  var bookOverView = Book().obs;
  var star = 0.0.obs;
  var comment = '';
  RxList<Comment?> commentList = RxList();

  final BookOverViewImpl _bookOverViewImpl = BookOverViewImpl();
  Rx<Book?> currentBook = Get.find<HomeController>().bookById;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      bookOverView.value = Get.arguments;
    }
    getComment();
  }

  void refreshData() {
    getComment();
  }

  void getComment() async {
    List<Comment?> listComment = await _bookOverViewImpl.getComment(bookOverView.value.id ?? 0);
    commentList.value = listComment;
  }

  void updateRating(double value) {
    star.value = value;
  }

  void updateComment(String value) {
    comment = value;
  }

  void submitComment() async {
    BookRatingModel rate = BookRatingModel(comment: 'string', rate: star.value, content: 'string');
    var response = await _bookOverViewImpl.addRate(bookOverView.value.id!, rate);
    if (response != null) {
      AlertUtils.showError(
          titleError: 'Thành công',
          desc: 'Cảm ơn bạn đã đánh giá !',
          okButtonTitle: 'Đồng ý',
          onOkButtonPressed: () async {
            Get.back(result: 'comment');
          });
    } else {
      AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Xin lời nhập đầy đủ đánh giá', okButtonTitle: 'Thử lại');
    }
  }

  void deleteComment(int? id) async {
    Comment? deleteComment = await _bookOverViewImpl.deleteComment(bookOverView.value.id!, id!);
    if (deleteComment != null) {
      getComment();
    }
  }

  void submitCommentWithoutRate() async {
    if (comment != null) {
      BookRatingModel rate = BookRatingModel(comment: comment, rate: star.value, content: comment);
      Comment? resultComment = await _bookOverViewImpl.addComment(bookOverView.value.id!, rate);
      if (resultComment?.content != "") {
        getComment();
      } else {
        AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Xin lời nhập đầy đủ đánh giá', okButtonTitle: 'Thử lại');
      }
    } else {
      AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Xin lời nhập đầy đủ đánh giá', okButtonTitle: 'Thử lại');
    }
  }

  String get fileUrl {
    String urlFile = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';

    //   String urlFile = 'http://34.211.57.240:3000/api/books/${bookOverView.value.id}/download';
    return urlFile;
  }
}
