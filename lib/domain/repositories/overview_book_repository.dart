

import 'package:book_reading_mobile_app/domain/entities/comment.dart';

abstract class BookOverViewRepository {
   Future<List<Comment?>> getComment(int bookId);
}