import 'package:get/get.dart';

import '../controllers/ibu_controller.dart';

class IbuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IbuController>(
      () => IbuController(),
    );
  }
}
