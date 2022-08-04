import 'dart:convert';
import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/data/models/imunisasi.dart';
import 'package:posyandu_app/app/data/models/timbangan.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/http_request_helper.dart';
import 'package:intl/intl.dart';

import '../models/history_baby.dart';

class BalitaRepository {
  static HttpRequestHelper server = HttpRequestHelper();
  static var datetimeFormat = DateFormat('dd-MM-yyyy');
  Future<List<Balita>> getBalita(int id) async {
    String url = '${Constanta.baseUrl}childrens/getByStaf/$id';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<Balita> results = [];
    final response = await server.getRequest(
      url: url,
      headers: headers,
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      List datas = data['data'];
      results = datas.map((e) => Balita.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  static Future<bool> tambahBalita(Balita balita, int stafId) async {
    String url = '${Constanta.baseUrl}childrens/store';

    var headers = {'Accept': 'application/json'};
    var body = {
      "child_name": balita.childName ?? "",
      "birth_date": balita.birthDate!.toIso8601String(),
      "weight": balita.weight,
      "height": balita.height,
      "gender": balita.gender,
      "category": balita.category,
      "id_staf": stafId,
      "mother_name": balita.motherName,
      "birth_place": balita.birthPlace,
      "helper": balita.helper,
    };

    bool results = false;
    final response =
        await server.postRequest(url: url, headers: headers, body: body);
    var data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      results = true;
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'Tambah data Error',
        code: response.statusCode,
      );
    }
  }

  static Future<bool> ubahBalita(
    Balita balita,
    int stafId,
  ) async {
    String url = '${Constanta.baseUrl}childrens/update';

    var headers = {'Accept': 'application/json'};
    var body = {
      "id": balita.id,
      "child_name": balita.childName ?? "",
      "birth_date": balita.birthDate!.toIso8601String(),
      "weight": balita.weight,
      "height": balita.height,
      "gender": balita.gender,
      "category": balita.category,
      "id_staf": stafId,
      "mother_name": balita.motherName ?? "",
      "birth_place": balita.birthPlace,
      "helper": balita.helper,
    };

    bool results = false;
    final response =
        await server.putRequest(url: url, headers: headers, body: body);
    var data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      results = true;
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  static Future<bool> hapusBalita(int balitaId) async {
    String url = '${Constanta.baseUrl}childrens/delete/$balitaId';
    var headers = {'Accept': 'application/json'};
    bool results = false;
    final response = await server.deleteRequest(
      url: url,
      headers: headers,
    );
    var data = json.decode(response.body);
    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      results = true;
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  // //get history timbangan
  // Future<List<Historybaby>> getHistoryBalita(int id) async {
  //   String url = '${Constanta.baseUrl}childrens/getRiwayatTimbangan/$id';
  //   Map<String, String> headers = {'Accept': 'application/json'};
  //   List<Historybaby> results = [];
  //   final response = await server.getRequest(
  //     url: url,
  //     headers: headers,
  //   );
  //   Map<String, dynamic> data = json.decode(response.body);

  //   if (data['status'] == null) {
  //     throw ServerException(
  //       message: 'Server Response Null, please contact Customer Service',
  //       code: response.statusCode,
  //     );
  //   }
  //   if (data['status']) {
  //     List datas = data['data'];
  //     results = datas.map((e) => Historybaby.fromJson(e)).toList();
  //     return results;
  //   } else {
  //     throw ServerException(
  //       message: data['message'] ?? 'gagal ngambil data Error',
  //       code: response.statusCode,
  //     );
  //   }
  // }

  //getlist timbangan
  Future<List<Balita>> getListTimbangan(int id) async {
    String url = '${Constanta.baseUrl}childrens/getListTimbangan/$id';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<Balita> results = [];
    final response = await server.getRequest(
      url: url,
      headers: headers,
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      List datas = data['data'];
      results = datas.map((e) => Balita.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  //getlist imunisasi
  Future<List<Balita>> getListImunisasi(int id) async {
    String url = '${Constanta.baseUrl}childrens/getListImunisasi/$id';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<Balita> results = [];
    final response = await server.getRequest(
      url: url,
      headers: headers,
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      List datas = data['data'];
      results = datas.map((e) => Balita.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  //getlist riwayat timbangan
  Future<List<Timbangan>> getRiwayatTimbangan(int idBalita) async {
    String url = '${Constanta.baseUrl}childrens/getRiwayatTimbangan/$idBalita';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<Timbangan> results = [];
    final response = await server.getRequest(
      url: url,
      headers: headers,
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      List datas = data['data'];
      results = datas.map((e) => Timbangan.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  //getlist riwayat timbangan
  Future<List<Imunisasi>> getRiwayatImunisasi(int idBalita) async {
    String url = '${Constanta.baseUrl}childrens/getDetailImunisasi/$idBalita';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<Imunisasi> results = [];
    final response = await server.getRequest(
      url: url,
      headers: headers,
    );
    Map<String, dynamic> data = json.decode(response.body);

    if (data['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (data['status']) {
      List datas = data['data'];
      results = datas.map((e) => Imunisasi.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }
}
