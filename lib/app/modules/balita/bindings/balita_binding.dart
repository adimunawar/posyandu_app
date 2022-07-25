import 'package:get/get.dart';

import '../controllers/balita_controller.dart';

class BalitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BalitaController>(
      () => BalitaController(),
    );
  }
}
