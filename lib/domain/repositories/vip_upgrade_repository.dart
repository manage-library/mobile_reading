import 'package:book_reading_mobile_app/domain/entities/vip_model.dart';

abstract class VipUpdateRepository {
  Future<int?> upgradeVip({required VipModel vipModel});
}