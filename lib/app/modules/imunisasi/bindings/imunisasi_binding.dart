import 'package:get/get.dart';

import '../controllers/imunisasi_controller.dart';

class ImunisasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImunisasiController>(
      () => ImunisasiController(),
    );
  }
}
