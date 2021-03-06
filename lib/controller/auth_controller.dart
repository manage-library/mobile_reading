import 'package:book_reading_mobile_app/screens/home_screen.dart';
import 'package:get/get.dart';

import '../data/rest_api/repositories_impl/auth_repository_impl.dart';
import '../data/shared_preferences/authentication_storage.dart';
import '../domain/entities/security.dart';
import '../domain/entities/user.dart';

class AuthController extends GetxController {
  final AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();
  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();

  void signIn({
    required String email,
    required String password,
  }) async {
    User _user = User(
      email: email,
      password: password,
    );
    Security? security = await _authRepositoryImpl.login(user: _user);
    if (security != null) {
      _authenticationStorage.updateToken(security.accessToken!);
    }
    if (security != null) {
      Get.to(HomeScreen());
    }
  }
}

class LoginStatus {
  static const String LOGIN_SUCCESS = "login success";
  static const String LOGIN_FAILED = "login failed";
}
