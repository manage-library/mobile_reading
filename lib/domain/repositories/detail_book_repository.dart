import 'package:book_reading_mobile_app/domain/entities/book.dart';
import 'package:book_reading_mobile_app/domain/entities/category.dart';
import 'package:book_reading_mobile_app/domain/entities/chapter.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../favourite_logic/set_favourite_model.dart';
import '../../screens/widget_home_screen/filter_screen.dart';

abstract class DetailBookRepository {
  Future<Book?> getBookById({String? id});
  Future<List<Book?>> getBooks({bool? isVip, int? sortBy, String? sortType, int? categoryId});
  Future<Chapter?> getContentByChapter({String? chapterId, String? bookId});
  Future<List<Book?>> getBookFilter({FilterParam? filterParam});
  Stream<int?> setFavourite(FavouriteModel favouriteModel, int id);
  Future<List<Category?>> getCategory();
}
