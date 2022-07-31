import 'package:get/get.dart';

import '../controllers/timbangan_controller.dart';

class TimbanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimbanganController>(
      () => TimbanganController(),
    );
  }
}
