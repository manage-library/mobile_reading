
///NOTE
///All api urls (get, post) will not have '/' at the final of the string
///All api urls (put, delete) will have '/' at the final of the string

class ApiConfig {
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  
  static const String verifyPassword = '/auth/verify-forgot-password';

  ///Users
  static const String getInfoUser = '/users/profile';
  static const String getListUser = '/users';
  static const String updateInfor = '/users';
  static const String changePassword = '/users/change-password';

  ///Books
  static const String getBooks = '/books';
  static const String createBooks = '/books';
  static const String getBookById = '/books/%s';
  static const String updateBookById = '/books/';

  ///Chapter
  static const String createChapter = '/chapters';
  static const String getChapterById = '/books/%s/chapters/%s';
  static const String updatedChapterById = '/chapters/';
  static const String deleteChapterByid = '/chapters/';

  ///Comment
  static const String getComment = '/books/%s/comments';
  static const String addNewComment = '/books/%s/rate';
  static const String changeCommentById = '/comments/';
  static const String deleteCommentById = '/books/%s/comments/%s';

  /// Category
  static const String getCategory = '/categories';

  //// History
  static const String getHistory = '/histories';

  /// Like and favorite
   static const String setFavourite = '/books/%s/like';
   
   static const String updateVip = '/users/upgrade-vip';
   
   static const String postTransaction = '/transactions';
   
   static const String download = '/books/%s/download';


  
}