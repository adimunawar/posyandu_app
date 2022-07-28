import 'package:get/get.dart';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/repositories/balita_repository.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/error_hendler.dart';

class BalitaController extends GetxController {
  var dataBalita = <Balita>[
    Balita(
        id: 0,
        childName: 'Pacan',
        idStaf: 0,
        birthDate: DateTime.now(),
        weight: 3,
        height: 3,
        gender: 'Laki-laki',
        category: 'Sesar',
        birthPlace: 'Cikarang',
        motherName: 'Lena',
        createdAt: DateTime.now(),
        helper: 'yuli')
  ].obs;

  addBalitaDummy(Balita balita) async {
    balita.id = dataBalita.length;
    dataBalita.add(balita);

    update();
  }

  updateBalitaDummy(Balita balita) async {
    var data = dataBalita.singleWhere(
      (element) => element.id == balita.id,
    );
    data = balita;
    update();
  }

  hapusBalitaDummy(Balita balita) async {
    dataBalita.removeAt(balita.id! - 1);
    update();
  }

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
    await BalitaRepository.tambahBalita(balita, Constanta.userId).then((value) {
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
    await BalitaRepository.ubahBalita(balita, Constanta.userId).then((value) {
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
