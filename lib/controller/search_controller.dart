import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/detail_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  var listFilterBook = <Book?>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBookInCategory();
  }
  final DetailBookImpl _detailBookImpl = DetailBookImpl();
    void getBookInCategory() async {
    List<Book?> listBook = await _detailBookImpl.getBooks();
    listFilterBook.value = listBook;
  }
}