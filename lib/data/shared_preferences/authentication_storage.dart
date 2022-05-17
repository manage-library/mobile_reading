import '../../../core/util/secure_storage.dart';

class LoginInfo {
  final String loginEmail;
  final String loginPassword;

  LoginInfo({required this.loginEmail, required this.loginPassword});

  @override
  String toString() {
    return 'LoginInfo{loginEmail: $loginEmail, loginPassword: $loginPassword}';
  }
}

class AuthenticationStorage {
  static const String KEY_ACCESS_TOKEN = 'access_token';
  static const String KEY_LOGIN_EMAIL = 'login_email';
  static const String KEY_LOGIN_PASSWORD = 'login_password';

  final SecureStorageUtil _secureStorageUtil = SecureStorageUtil();

  Future<String?> getToken() async => _secureStorageUtil.read(KEY_ACCESS_TOKEN);

  Future<void> updateToken(String newToken) async =>
      _secureStorageUtil.write(KEY_ACCESS_TOKEN, newToken);

  Future<void> deleteToken() async =>
      _secureStorageUtil.delete(KEY_ACCESS_TOKEN);

  Future<LoginInfo?> getLoginInfo() async {
    String? loginEmail = await _secureStorageUtil.read(KEY_LOGIN_EMAIL);
    String? loginPassword = await _secureStorageUtil.read(KEY_LOGIN_PASSWORD);
    if (loginEmail != null && loginPassword != null) {
      return LoginInfo(loginEmail: loginEmail, loginPassword: loginPassword);
    }
    return null;
  }

  Future<void> updateLoginInfo({String? email, String? password}) async {
    await _secureStorageUtil.write(KEY_LOGIN_EMAIL, email);
    await _secureStorageUtil.write(KEY_LOGIN_PASSWORD, password);
  }

  Future<void> deleteLoginInfo() async {
    await _secureStorageUtil.delete(KEY_LOGIN_EMAIL);
    await _secureStorageUtil.delete(KEY_LOGIN_PASSWORD);
  }
}
