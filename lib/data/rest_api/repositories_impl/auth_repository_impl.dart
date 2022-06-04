import 'dart:async';

import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_response.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/rest_client.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

import '../../../configs/api_config.dart';
import '../../../domain/entities/security.dart';
import '../datasources/models/api_result.dart';
import 'sign_up_repository_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RestClient _restClient = RestClient();

  @override
  Future<Security?> login({required User user}) async {
    try {
      var response = await _restClient.postMethod(ApiConfig.login, data: user.toJson());
      print("response login : ${response.toString()}");
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<Security>(
          json: json,
          jsonConverter: (json) => Security.fromJson(json),
        ),
      ).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error: ${apiResponse.error.toString()}');
    }
    return null;
  }

  @override
  Future<User?> autoLogin({required User user}) {
    // TODO: implement autoLogin
    throw UnimplementedError();
  }
}
