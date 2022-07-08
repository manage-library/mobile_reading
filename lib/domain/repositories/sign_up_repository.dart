import 'package:book_reading_mobile_app/domain/entities/user.dart';

abstract class SignUpRepository {
  Future<int?> register({required User user});
  Future<int?> updateInfo({required User user});
}
