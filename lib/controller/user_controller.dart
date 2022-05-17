import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/user_repository_impl.dart';

import '../domain/entities/user.dart';

class UserController {
  final UserRepositoryImpl _userRepositoryImpl = UserRepositoryImpl();

  void getInfoUser() async {
    User? user = await _userRepositoryImpl.getInfoUser();
    print('userInfo: ${user?.toJson()}');
  }
}