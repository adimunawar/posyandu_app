import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/models/history_baby.dart';
import 'package:posyandu_app/app/data/repositories/balita_repository.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/error_hendler.dart';

class BalitaController extends GetxController {
  Future<List<Balita>> getListBalita() async {
    List<Balita> results = [];
    await BalitaRepository().getBalita(Constanta.user.id!).then((value) {
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

//gethistory balita
  Future<List<Historybaby>> getHistoryBalita(int idBalita) async {
    List<Historybaby> results = [];
    await BalitaRepository().getHistoryBalita(idBalita).then((value) {
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

//hapus balita
  Future<bool> hapusBalita(int id) async {
    showLoading();
    bool result = false;
    await BalitaRepository.hapusBalita(id).then((value) {
      if (value) {
        hideLoading();
        result = value;
        getListBalita();
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return result;
  }

  Future<bool> tambahBalita(Balita balita) async {
    showLoading('Mohon tunggu');
    bool result = false;
    await BalitaRepository.tambahBalita(balita, Constanta.user.id!)
        .then((value) {
      if (value) {
        hideLoading();
        result = value;
        getListBalita();
      }
    });
    return result;
  }

  Future<bool> ubahBalita(
    Balita balita,
  ) async {
    bool result = false;
    showLoading('Mohon tunggu');
    await BalitaRepository.ubahBalita(balita, Constanta.user.id!).then((value) {
      if (value) {
        result = value;
        getListBalita();
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return result;
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
