import 'package:book_reading_mobile_app/controller/home_controller.dart';
import 'package:book_reading_mobile_app/data/rest_api/repositories_impl/vip_update_repository_impl.dart';
import 'package:book_reading_mobile_app/domain/entities/vip_model.dart';
import 'package:get/get.dart';

import '../core/util/alert_utils.dart';
import '../domain/entities/transaction_model.dart';
import '../domain/entities/user.dart';
import '../src/routes.dart';

class VipUpdateController extends GetxController {
  final VipUpdateRepositoryImp _vipRepositoryImpl = VipUpdateRepositoryImp();
  RxList<int> vip = [1, 2, 3].obs;
  RxInt selectedIndex = 0.obs;
  RxList<double> fee = [99.000, 199.000, 399.000].obs;

  RxList<int> month = [1, 3, 6].obs;
  var code = ''.obs;

  Rx<User?> currentUser = Get.find<HomeController>().userInfor;

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

  int getValue() {
    if (selectedIndex.value == 0) {
      return 1;
    } else if (selectedIndex.value == 1) {
      return 3;
    }
    return 6;
  }

  void postTransaction() async {
    TransactionModel? user = await _vipRepositoryImpl.postTransaction(vipId: getValue());
    code.value = user?.code ?? '';
    Get.toNamed(AppRoutes.qrCode, arguments: user);
  }
}
