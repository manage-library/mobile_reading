
///NOTE
///All api urls (get, post) will not have '/' at the final of the string
///All api urls (put, delete) will have '/' at the final of the string

class ApiConfig {
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  ///Users
  static const String getInfoUser = '/users/profile';
  static const String changePassword = '/users/change-password';

  ///Books
  static const String getBooks = '/books';
  static const String createBooks = '/books';
  static const String getBookById = '/books/';
  static const String updateBookById = '/books/';

  ///Chapter
  static const String createChapter = '/chapters';
  static const String getChapterById = '/chapters/';
  static const String updatedChapterById = '/chapters/';
  static const String deleteChapterByid = '/chapters/';

  ///Comment
  static const String getComment = '/comments';
  static const String addNewComment = '/comments';
  static const String changeCommentById = '/comments/';
  static const String deleteCommentById = '/comments/';

  /// Category
  static const String getCategory = '/categories';
}