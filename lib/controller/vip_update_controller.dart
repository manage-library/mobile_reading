import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/vip_update_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/vip_model.dart';
import 'package:get/get.dart';

import '../core/util/alert_utils.dart';
import '../src/routes.dart';

class VipUpdateController extends GetxController {
  final VipUpdateRepositoryImp _vipRepositoryImpl = VipUpdateRepositoryImp();
  RxList<int> vip = [1, 2, 3].obs;
  RxInt selectedIndex = 0.obs;
  RxList<double> fee = [30.0, 60.0, 90.0].obs;

  void updateVipFromId() async {
    VipModel vipModel = VipModel(status: true, vipId: (selectedIndex.value + 1).toString());
    var response = _vipRepositoryImpl.upgradeVip(vipModel: vipModel);

    if (response != null) {
      AlertUtils.showError(
          titleError: 'Thành công',
          desc: 'Bạn đã nâng Vip thành công !',
          okButtonTitle: 'Đồng ý',
          onOkButtonPressed: () async {
            Get.back();
          });
    } else {
      AlertUtils.showError(titleError: 'Đã lỗi', desc: 'Xin lời nhập lại', okButtonTitle: 'Thử lại');
    }
  }
}
