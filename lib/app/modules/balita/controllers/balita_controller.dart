import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/repositories/balita_repository.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/error_hendler.dart';

class BalitaController extends GetxController {
  Future<List<Balita>> getListBalita() async {
    List<Balita> results = [];
    await BalitaRepository().getBalita(Constanta.userId).then((value) {
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
