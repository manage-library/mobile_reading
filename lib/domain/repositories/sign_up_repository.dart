import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/screens/forgot_password_page/change_pass_screen.dart';

abstract class SignUpRepository {
  Future<int?> register({required User user});
  Future<int?> updateInfo({required User user});
  Future<int?> changePassword({required String oldPass, required String newPass});
}
