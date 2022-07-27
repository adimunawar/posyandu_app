import 'dart:convert';

import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/http_request_helper.dart';
import 'package:http/http.dart' as http;

class BalitaRepository {
  static HttpRequestHelper server = HttpRequestHelper();

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
    String url = 'http://192.168.43.39:8081/childrens/store';
    var headers = {'Accept': 'application/json'};
    var body = {
      "child_name": balita.childName ?? "",
      "birth_date": "2022-07-27",
      "weight": balita.weight,
      "height": balita.height,
      "gender": "Laki-laki",
      "category": 0,
      "id_staf": stafId
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
    String url = 'http://192.168.43.39:8081/childrens/update';
    var headers = {'Accept': 'application/json'};
    var body = {
      "id": balita.id,
      "child_name": balita.childName,
      "birth_date": "2022-07-24",
      "weight": balita.weight,
      "height": balita.height,
      "gender": balita.gender,
      "category": 0,
      "id_staf": stafId
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
}
