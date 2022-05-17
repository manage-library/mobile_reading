import 'package:book_reading_mobile_app/data/rest_api/datasources/rest_client.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/domain/repositories/user_repository.dart';

import '../../../configs/api_config.dart';
import '../datasources/models/api_response.dart';
import '../datasources/models/api_result.dart';

class UserRepositoryImpl extends UserRepository {
  final RestClient _restClient = RestClient();

  @override
  Future<User?> getInfoUser() async {
    try {
      var response = await _restClient.getMethod(ApiConfig.getInfoUser, params: {});
      print('response: $response');
      return ApiResponse.withResult(
        response: response.data,
        resultConverter: (json) => ApiResultSingle<User>(
          json: json,
          jsonConverter: (json) => User.fromJson(json),
        ),
      ).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error: ${apiResponse.error}');
    }
    return null;
  }

}