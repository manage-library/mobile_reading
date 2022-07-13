import 'package:book_reading_mobile_app/data/rest_api/datasources/models/api_result.dart';
import 'package:book_reading_mobile_app/domain/entities/user.dart';
import 'package:book_reading_mobile_app/domain/entities/vip_model.dart';

import '../../../configs/api_config.dart';
import '../../../domain/entities/transaction_model.dart';
import '../../../domain/repositories/vip_upgrade_repository.dart';
import '../datasources/models/api_response.dart';
import '../datasources/rest_client.dart';

class VipUpdateRepositoryImp extends VipUpdateRepository {
  final RestClient _restClient = RestClient();
  @override
  Future<int?> upgradeVip({required VipModel vipModel}) async{
    try {
      var responseRegister = await _restClient.postMethod(ApiConfig.updateVip, data: vipModel.toJson());
      print("response updateInfor ${responseRegister.data['statusCode']}");
      return responseRegister.data['statusCode'];
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse updateVip.error: ${apiResponse.error.toString()}');
    }
    return null;
  }

  @override
  Future<TransactionModel?> postTransaction({required int vipId}) async {
     try {
      var response = await _restClient.postMethod(ApiConfig.postTransaction, data : {'vipId' : vipId});
      print('response transaction: $response');
      return ApiResponse.withResult(
          response: response.data,
          resultConverter: (json) => ApiResultSingle<TransactionModel>(
                json: json,
                jsonConverter: (json) => TransactionModel.fromJson(json),
              )).result?.data;
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.withError(error);
      print('apiResponse transaction.error : ${apiResponse.error}');
    }
    return null;
  }

}