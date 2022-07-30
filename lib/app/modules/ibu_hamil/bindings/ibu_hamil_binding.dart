import 'package:get/get.dart';

import '../controllers/ibu_hamil_controller.dart';

class IbuHamilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IbuHamilController>(
      () => IbuHamilController(),
    );
  }
}
