import 'package:book_reading_mobile_app/controller/base_controller.dart';
import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/detail_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:book_reading_mobile_app/event/favorite_change_event.dart';
import 'package:book_reading_mobile_app/src/routes.dart';
import 'package:book_reading_mobile_app/style/app_icons.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import '../favourite_logic/stream_subcrptions_mixins.dart';

class DetailBookController extends BaseController with StreamSubscriptionsMixin {
  final DetailBookImpl _detailBookImpl = DetailBookImpl();
  Book? bookId;
  var bookItem = Book().obs;
  RxInt numberOfPage = 10.obs;
  RxInt currentPage = 0.obs;
  var bookWithCategory = Book().obs;
  var parseChapter = Chapter().obs;
  RxString imgFavoriteIcon = AppIcons.icHeart.obs;
  int page = 1;
  int perPage = 4;

  // var page =
  final eventBus = Get.find<EventBus>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      bookId = Get.arguments;
      getBookById();
      getBookInCategory();
    }
    eventBus.on<BookFavoriteChangeEvent>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      print(event.book);
    });
  }

  @override
  void dispose() {
    Get.delete<DetailBookController>();
    super.dispose();
  }

  void getBookById() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    Book? book = await _detailBookImpl.getBookById(id: bookId?.id.toString());
    page += 1;
    perPage = 2;
    bookItem.value = book ?? Book();
  }

  void getBookInCategory() async {
    List<Book?> listBook = await _detailBookImpl.getBooks(categoryId: bookId?.bookCategory?.first.category_id);
    bookWithCategory.value = listBook.firstWhereOrNull((element) => element?.name != bookItem.value.name)!;
  }

  void goToChapterReadingBook({String? bookId, String? chapterId}) async {
    Chapter? chapter = await _detailBookImpl.getContentByChapter(chapterId: chapterId, bookId: bookId);
    //   Get.toNamed(AppRoutes.detailBook, arguments: bookWithCategory.value);
    parseChapter.value = chapter ?? Chapter();
    Get.toNamed(AppRoutes.readingChapter, arguments: parseChapter.value);
    //   Get.to();
  }

  void onTapFavouriteButton() {
    bookItem.value.toggleFavourite();
    imgFavoriteIcon.value = currentBook.value.isFavourite ? AppIcons.iconNFTHeartFill : AppIcons.icHeart;
    eventBus.fire(BookFavoriteChangeEvent(bookItem.value));
    updateFavouriteForItem(
        bookId: bookItem.value.id ?? 1,
        onSuccess: () {
          _updateFavoriteState();
        });
  }

  void _updateFavoriteState() {
    // logic reload state is detail screen

    if (Get.isRegistered<HomeController>()) {
      HomeController homeController = Get.find();
      homeController.handleRequestReloadState(currentBook.value.isFavourite);
    }
  }
}
