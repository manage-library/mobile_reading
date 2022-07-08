import 'package:book_reading_mobile_app/domain/entities/comment.dart';
import 'package:book_reading_mobile_app/domain/entities/rate.dart';

abstract class BookOverViewRepository {
  Future<List<Comment?>> getComment(int bookId);
  Future<int?> addNewComment(int bookId, BookRatingModel rate);
}
