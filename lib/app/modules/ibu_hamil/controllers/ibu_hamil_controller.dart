import 'package:get/get.dart';
import 'package:posyandu_app/app/data/repositories/ibu_hamil_repository.dart';

import '../../../data/models/ibu_hamil.dart';
import '../../../utils/constants.dart';
import '../../../utils/errors/error_hendler.dart';

class IbuHamilController extends GetxController {
  Future<List<IbuHamil>> getListIbu() async {
    List<IbuHamil> results = [];
    await IbuHamilRepository.getIbuHamil(Constanta.user.id!).then((value) {
      print("ini $value");
      if (value.isNotEmpty) {
        results.clear();
        results.addAll(value);
      }
    }).onError((error, stackTrace) {
      handleError(error);
    });
    return results;
  }

  Future<bool> hapusIbuHamil(int id) async {
    showLoading();
    bool result = false;
    await IbuHamilRepository.hapusIbuHamil(id).then((value) {
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

  Future<bool> tambahIbu(IbuHamil ibu) async {
    showLoading('Mohon tunggu');
    bool result = false;
    await IbuHamilRepository.tambahIbuHamil(ibu, Constanta.user.id!)
        .then((value) {
      if (value) {
        hideLoading();
        result = value;
        getListIbu();
      }
    });
    return result;
  }

  Future<bool> ubahIbuHamil(
    IbuHamil ibu,
  ) async {
    bool result = false;
    showLoading('Mohon tunggu');
    await IbuHamilRepository.ubahIbuHamil(ibu, Constanta.user.id!)
        .then((value) {
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
