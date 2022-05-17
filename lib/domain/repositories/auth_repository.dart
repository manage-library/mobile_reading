import 'dart:async';
import 'package:book_reading_mobile_app/domain/entities/security.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  //Future<ApiResponse<User>>? signUp({required user});
  Future<Security?> login({required User user});
  Future<User?> autoLogin({required User user});
}