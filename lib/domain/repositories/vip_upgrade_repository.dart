import 'package:book_reading_mobile_app/domain/entities/vip_model.dart';

import '../entities/transaction_model.dart';
import '../entities/user.dart';

abstract class VipUpdateRepository {
  Future<int?> upgradeVip({required VipModel vipModel});
  Future<TransactionModel?> postTransaction({required int vipId});
}