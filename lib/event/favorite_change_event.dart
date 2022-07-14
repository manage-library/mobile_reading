import '../domain/entities/book.dart';

class BookFavoriteChangeEvent {
  final Book book;

  BookFavoriteChangeEvent(this.book);
}
