import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/models/timbangan.dart';

import '../../../data/repositories/balita_repository.dart';
import '../../../utils/constants.dart';
import '../../../utils/errors/error_hendler.dart';

class TimbanganController extends GetxController {
  Future<List<Balita>> getListTimbanganBalita() async {
    List<Balita> results = [];
    await BalitaRepository().getListTimbangan(Constanta.user.id!).then((value) {
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

  Future<List<Timbangan>> getRiwayatTimbangan(int idBalita) async {
    List<Timbangan> results = [];
    await BalitaRepository().getRiwayatTimbangan(idBalita).then((value) {
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
