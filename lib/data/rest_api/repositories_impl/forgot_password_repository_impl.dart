import '../../../configs/api_config.dart';
import '../../../domain/entities/user.dart';
import '../datasources/models/api_response.dart';
import '../datasources/rest_client.dart';

abstract class ForgotPasswordRepository {
  Future<int?> forgotPassword({required String email});
  Future<int?> verifyPassword({required User user});
}

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final RestClient _restClient = RestClient();
  @override
  Future<int?> forgotPassword({required String email}) async {
     try {
      var responseRegister = await _restClient.postMethod(ApiConfig.forgotPassword, data: {'email' : email});
      print("response forgotpasss ${responseRegister.data['statusCode']}");
      return responseRegister.data['statusCode'];
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse password .error: ${apiResponse.error.toString()}');
    }
    return null;
  }
  
  @override
  Future<int?> verifyPassword({required User user}) async {
 try {
      var responseRegister = await _restClient.postMethod(ApiConfig.verifyPassword, data: user.toJson());
      print("response verrify pass ${responseRegister.data['statusCode']}");
      return responseRegister.data['statusCode'];
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse.error: ${apiResponse.error.toString()}');
    }
    return null;
  }

  


}