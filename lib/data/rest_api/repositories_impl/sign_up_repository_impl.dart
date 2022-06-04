import 'package:book_reading_mobile_app/configs/api_config.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_response.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_result.dart';
import 'package:book_reading_mobile_app/data/rest_api/datasources/rest_client.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/domain/repositories/sign_up_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final RestClient _restClient = RestClient();
  @override
  Future<int?> register({required User user}) async {
    try {
      var responseRegister = await _restClient.postMethod(ApiConfig.register, data: user.toJson());
      print("response register ${responseRegister.data['statusCode']}");
      return responseRegister.data['statusCode'];
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error: ${apiResponse.error.toString()}');
    }
    return null;
  }
}
