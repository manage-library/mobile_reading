import 'package:book_reading_mobile_app/domain/entities/vip_model.dart';

import '../../../configs/api_config.dart';
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

}