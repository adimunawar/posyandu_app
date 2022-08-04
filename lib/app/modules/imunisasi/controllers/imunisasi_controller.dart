import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/imunisasi.dart';
import 'package:posyandu_app/app/data/repositories/balita_repository.dart';

import '../../../data/models/balita.dart';
import '../../../utils/constants.dart';
import '../../../utils/errors/error_hendler.dart';

class ImunisasiController extends GetxController {
  Future<List<Balita>> getListImunisasiBalita() async {
    List<Balita> results = [];
    await BalitaRepository().getListImunisasi(Constanta.user.id!).then((value) {
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

  Future<List<Imunisasi>> getRiwayatImunisasi(int idBalita) async {
    List<Imunisasi> results = [];
    await BalitaRepository().getRiwayatImunisasi(idBalita).then((value) {
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
