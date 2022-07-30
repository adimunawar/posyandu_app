import 'package:get/get.dart';

import '../../../data/models/ibu.dart';
import '../../../data/repositories/ibu_repository.dart';
import '../../../utils/constants.dart';
import '../../../utils/errors/error_hendler.dart';

class IbuController extends GetxController {
  Future<List<Ibu>> getListIbu() async {
    List<Ibu> results = [];
    await IbuRepository.getIbu(Constanta.user.id!).then((value) {
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
        Constanta.listIbu.clear();
        Constanta.listIbu.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

  Future<bool> hapusIbu(int id) async {
    showLoading();
    bool result = false;
    await IbuRepository.hapusIbu(id).then((value) {
      if (value) {
        hideLoading();
        result = value;
        getListIbu();
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return result;
  }

  Future<bool> tambahIbu(Ibu ibu) async {
    showLoading('Mohon tunggu');
    bool result = false;
    await IbuRepository.tambahIbu(ibu, Constanta.user.id!).then((value) {
      if (value) {
        hideLoading();
        result = value;
        getListIbu();
      }
    });
    return result;
  }

  Future<bool> ubahIbu(
    Ibu ibu,
  ) async {
    bool result = false;
    showLoading('Mohon tunggu');
    await IbuRepository.ubahIbu(ibu, Constanta.user.id!).then((value) {
      if (value) {
        result = value;
        getListIbu();
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
