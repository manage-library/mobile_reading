import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/book_overview_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/comment.dart';
import 'package:book_reading_mobile_app/domain/entities/rate.dart';
import 'package:get/get.dart';

import '../core/util/alert_utils.dart';
import '../src/routes.dart';

class BookOverViewController extends GetxController {
  var bookOverView = Book().obs;
  var star = 0.0;
  var comment = '';
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
  void postRateAndComment() {
    
  }

  void updateRating(double value) {
    star = value;
  }

  void updateComment(String value) {
    comment = value;
  }

  void submitComment() async {
    BookRatingModel rate = BookRatingModel(comment: comment, value: star);
    var response = _bookOverViewImpl.addNewComment(bookOverView.value.id!, rate);
      if (response == 200) {
      AlertUtils.showError(titleError: 'Thành công', desc: 'Cảm ơn bạn đã đánh giá !', okButtonTitle: 'Đồng ý', onOkButtonPressed : () async {
          Get.back(result: 'comment');
      }); 
    } else {
      AlertUtils.showError(titleError: 'Lỗi', desc: 'Xin lời nhập đầy đủ đánh giá', okButtonTitle: 'Thử lại');
    }
  }
  }
