import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/home_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/category.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final HomeRepositoryImpl _homeRepositoryImpl = HomeRepositoryImpl();
  var userInfor = User().obs;
  RxList<Category?> bookCategory = RxList();
   RxList<Book?> listBooks = RxList();

  @override
  void onInit() {
    getInfoUser();
    getCategory();
    getBooks();
    super.onInit();
  }
  void getInfoUser() async {
    User? user = await _homeRepositoryImpl.getUserInfo();
    userInfor.value = user ?? User();
    print('userInfor: ${user?.toJson()}');
  }

  void getCategory() async {
    List<Category?> category = await _homeRepositoryImpl.getCategory();
    bookCategory.value = category;
  }

  void getBooks() async {
    List<Book?> bookList = await _homeRepositoryImpl.getBooks();
    listBooks.value = bookList;
  }
}