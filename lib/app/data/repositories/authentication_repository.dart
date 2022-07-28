import 'dart:convert';
import 'package:posyandu_app/app/utils/errors/exceptions.dart';
import 'package:posyandu_app/app/utils/helpers/http_request_helper.dart';

import '../../utils/constants.dart';
import '../models/user.dart';

class AuthRepository {
  HttpRequestHelper server = HttpRequestHelper();

  Future<User> loginWithUsernamePassword(
      String username, String password) async {
    String url = '${Constanta.baseUrl}users/login';
    Map<String, String> headers = {'Accept': 'application/json'};
    Map<String, String> body = {
      'email': username,
      'password': password,
    };
    final response =
        await server.postRequest(url: url, headers: headers, body: body);
    Map<String, dynamic> result = json.decode(response.body);
    if (result['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (result['status']) {
      User user = User.fromJson(result['data']);
      return user;
    } else {
      throw ServerException(
        message: result['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }
}
