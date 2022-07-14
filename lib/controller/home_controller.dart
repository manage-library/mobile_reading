// ignore_for_file: unused_local_variable

import 'package:book_reading_mobile_app/controller/base_controller.dart';
import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/home_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/category.dart';
import 'package:book_reading_mobile_app/domain/entities/enum.dart';
import 'package:book_reading_mobile_app/domain/entities/history_chapter.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/event/favorite_change_event.dart';
import 'package:book_reading_mobile_app/favourite_logic/stream_subcrptions_mixins.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';

class HomeController extends BaseController with StreamSubscriptionsMixin {
  final HomeRepositoryImpl _homeRepositoryImpl = HomeRepositoryImpl();
  var userInfor = User().obs;
  RxList<Category?> bookCategory = RxList();
  RxList<Book?> listBooks = RxList();
  RxList<User?> authorList = RxList();
  RxList<HistoryBook?> listHistoryBook = RxList();
  var bestOfBook = Book().obs;
  var isSelect = false.obs;
  var selectedCategoryId = 0.obs;
  var bookById = Book().obs;
  int currentSelectedIndex = 0;

  final eventBus = Get.find<EventBus>();
  @override
  void onInit() {
    getInfoUser();
    getCategory();
    getBooks();
    getBestOfBook();
    getListAthor();
    super.onInit();
    getHistory();
    eventBus.on<BookFavoriteChangeEvent>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      print("${runtimeType} ==> ${event.book.toJson()}");
      final tmp = listBooks.toList();
      for (int i = 0; i < tmp.length; i++) {
        if (tmp[i]?.id == event.book?.id) {
          tmp[i] = event.book;
        }
      }
      listBooks.value = tmp;
    });
  }

  String getVipId(int vipId) {
    if (vipId == 0) {
      return ' ';
    } else if (vipId == 1) {
      return 'Vip 1';
    } else if (vipId == 3) {
      return 'Vip 2';
    } else
      return 'Vip 3';
  }

  void loadData() {
    getInfoUser();
    getCategory();
    getBooks();
    getBestOfBook();
    getListAthor();
    getHistory();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    bag.dispose;
    super.onClose();
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

  void getBestOfBook() async {
    List<Book?> bookList = (await _homeRepositoryImpl.getBooks(
        isVip: userInfor.value.vip_id == 0 ? false : true,
        sortBy: ESortBy.like.eSortByteNumber,
        sortType: ESortType.asc.eSortType));
    bestOfBook.value = bookList.isNotEmpty
        ? bookList.first!
        : Book(
            id: 17,
            name: "Việt Nam sử lược",
            description: "– xuất bản năm 1919 của",
            image: "https://www.sachhayonline.com/data/book-photos/14.jpg");
  }

  void getBookByCategory(int? categoryId) async {
    if (categoryId != null) {
      List<Book?> bookList = await _homeRepositoryImpl.getBooks(categoryId: categoryId);
      listBooks.value = bookList;
    } else {
      getBooks();
    }
  }

  void getListAthor() async {
    List<User?> listAuthor = await _homeRepositoryImpl.getListAuthor();
    authorList.value = listAuthor;
  }

  void getBookById({String? bookId, id}) async {
    Book? book = await _homeRepositoryImpl.getBookById(id: bookId.toString());
    bookById.value = book ?? Book();
  }

  void getHistory() async {
    List<HistoryBook?> listHistoryBookValue = await _homeRepositoryImpl.getHistory();
    listHistoryBook.value = listHistoryBookValue;
  }

  void goToDetailScreen(Book book) async {
    currentSelectedIndex = book.id ?? 1;
    final result = await Get.toNamed(AppRoutes.detailBook, arguments: book);
    if (result == 'go back to home') {
      loadData();
    } else {
      //Get.toNamed()
    }
    // Get.toNamed(AppRoutes.detailBook, arguments: listBooks?.elementAt(index));
  }

  //call back to handle request reload state listview from another page
  void handleRequestReloadState(bool favState) {
    if (favState) {
      listBooks.elementAt(currentSelectedIndex)?.setFavourite();
    } else {
      listBooks.elementAt(currentSelectedIndex)?.unsetFavourite();
    }
    reloadListViewState.add(true);
  }
}
