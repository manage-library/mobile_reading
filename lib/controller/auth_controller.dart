import 'package:book_reading_mobile_app/screens/home_screen.dart';
import 'package:get/get.dart';

import '../data/rest_api/repositories_impl/auth_repository_impl.dart';
import '../data/shared_preferences/authentication_storage.dart';
import '../domain/entities/security.dart';
import '../domain/entities/user.dart';

class AuthController extends GetxController {
  final AuthRepositoryImpl _authRepositoryImpl = AuthRepositoryImpl();
  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();

  String _loginStatus = '';

  void signIn({
    required String email,
    required String password,
  }) async {
    User _user = User(
      email: email,
      password: password,
    );
    Security? apiResponse = await _authRepositoryImpl.login(
        user: _user);
    if (apiResponse != null) {
      Get.to(HomeScreen());
    }
    print('apiResponse?.result?.data: ${apiResponse?.toJson()}');
  }

  Future<bool> autoLogin() async {
    LoginInfo? loginInfo = await _authenticationStorage.getLoginInfo();
    print(loginInfo.toString());
    if (loginInfo != null) {
      User? user = await _authRepositoryImpl.autoLogin(
        user: User(
          email: loginInfo.loginEmail,
        ),);

      if (user != null) {
        _loginStatus = LoginStatus.LOGIN_SUCCESS;
        return true;
      }
    }
    return false;
  }
}

class LoginStatus {
  static const String LOGIN_SUCCESS = "login success";
  static const String LOGIN_FAILED = "login failed";
}
