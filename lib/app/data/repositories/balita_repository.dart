import 'dart:convert';

import 'package:posyandu_app/app/data/models/balita.dart';
import 'package:posyandu_app/app/utils/constants.dart';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/http_request_helper.dart';

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
    String url = '${Constanta.baseUrl}childrens/store';
    var headers = {'Accept': 'application/json'};
    var body = {
      {
        "child_name": balita.childName,
        "birth_date": balita.birthDate,
        "weight": balita.weight,
        "height": balita.height,
        "gender": balita.gender,
        "category": 0,
        "id_staf": stafId
      }
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
        message: data['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  static Future<bool> ubahBalita(
      Balita balita, int stafId, int balitaId) async {
    String url = '${Constanta.baseUrl}childrens/store';
    var headers = {'Accept': 'application/json'};
    var body = {
      {
        "id": balitaId,
        "child_name": balita.childName,
        "birth_date": balita.birthDate,
        "weight": balita.weight,
        "height": balita.height,
        "gender": balita.gender,
        "category": 0,
        "id_staf": stafId
      }
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
