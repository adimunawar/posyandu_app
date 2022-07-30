import 'dart:convert';

import 'package:posyandu_app/app/data/models/ibu_hamil.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/http_request_helper.dart';
import 'package:intl/intl.dart';

class IbuHamilRepository {
  static HttpRequestHelper server = HttpRequestHelper();
  static var datetimeFormat = DateFormat('dd-MM-yyyy');
  static Future<List<IbuHamil>> getIbuHamil(int id) async {
    String url = '${Constanta.baseUrl}mothers/ibuHamilByStaf/$id';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<IbuHamil> results = [];
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
      results = datas.map((e) => IbuHamil.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  static Future<bool> tambahIbuHamil(IbuHamil ibu, int stafId) async {
    String url = '${Constanta.baseUrl}mothers/addIbuHamil';
    var headers = {'Accept': 'application/json'};
    var body = {
      "id_ibu": ibu.idIbu,
      "hamil_ke": ibu.hamilKe,
      "umur_kehamilan": ibu.umurKehamilan,
      "tempat_periksa": ibu.tempatPeriksa,
      "haid_terakhir": ibu.haidTerakhir!.toIso8601String(),
      "status_ekonomi": ibu.statusEkonomi ?? "",
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

  static Future<bool> ubahIbuHamil(
    IbuHamil ibu,
    int stafId,
  ) async {
    String url = '${Constanta.baseUrl}mothers/updateIbuHamil';
    var headers = {'Accept': 'application/json'};
    var body = {
      "id": ibu.id,
      "id_ibu": ibu.idIbu,
      "hamil_ke": ibu.hamilKe,
      "umur_kehamilan": ibu.umurKehamilan,
      "tempat_periksa": ibu.tempatPeriksa,
      "haid_terakhir": ibu.haidTerakhir!.toIso8601String(),
      "status_ekonomi": ibu.statusEkonomi,
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

  static Future<bool> hapusIbuHamil(int ibuId) async {
    String url = '${Constanta.baseUrl}mothers/deleteIbuHamil/$ibuId';
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
        message: data['message'] ?? 'Delete Error',
        code: response.statusCode,
      );
    }
  }
}
