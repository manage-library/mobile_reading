import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventBus(), permanent: true);
  }
}
