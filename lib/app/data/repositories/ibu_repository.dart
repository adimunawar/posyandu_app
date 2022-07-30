import 'dart:convert';

import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/http_request_helper.dart';
import 'package:intl/intl.dart';

import '../models/ibu.dart';

class IbuRepository {
  static HttpRequestHelper server = HttpRequestHelper();
  static var datetimeFormat = DateFormat('dd-MM-yyyy');
  static Future<List<Ibu>> getIbu(int id) async {
    String url = '${Constanta.baseUrl}mothers/getByStaf/$id';
    Map<String, String> headers = {'Accept': 'application/json'};
    List<Ibu> results = [];
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
      results = datas.map((e) => Ibu.fromJson(e)).toList();
      return results;
    } else {
      throw ServerException(
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  static Future<bool> tambahIbu(Ibu ibu, int stafId) async {
    String url = '${Constanta.baseUrl}mothers/store';
    var headers = {'Accept': 'application/json'};
    var body = {
      "nama": ibu.nama,
      "tgl_lahir": ibu.tglLahir!.toIso8601String(),
      "nama_suami": ibu.namaSuami,
      "alamat": ibu.alamat,
      "gol_darah": ibu.golDarah,
      "id_staf": stafId,
      "posyandu": ibu.posyandu,
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

  static Future<bool> ubahIbu(
    Ibu ibu,
    int stafId,
  ) async {
    String url = '${Constanta.baseUrl}mothers/update';
    var headers = {'Accept': 'application/json'};
    var body = {
      "id": ibu.id,
      "nama": ibu.nama,
      "tgl_lahir": ibu.tglLahir!.toIso8601String(),
      "nama_suami": ibu.namaSuami,
      "alamat": ibu.alamat,
      "gol_darah": ibu.golDarah,
      "id_staf": stafId,
      "posyandu": ibu.posyandu,
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

  static Future<bool> hapusIbu(int ibuId) async {
    String url = '${Constanta.baseUrl}mothers/delete/$ibuId';
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
