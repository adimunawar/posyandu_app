import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:posyandu_app/app/utils/helpers/http_request_error_helper.dart';

class HttpRequestHelper {
  @override
  Future<http.Response> deleteRequest(
      {required String url, required Map<String, String> headers}) {
    // TODO: implement deleteRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> getRequest(
      {required String url, required Map<String, String> headers}) {
    // TODO: implement getRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> multipartDeleteRequest(
      {required String url,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartDeleteRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> multipartPostRequest(
      {required String url,
      required File image,
      required String fileBodyKey,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartPostRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> multipartPostRequestWithoutImage(
      {required String url,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartPostRequestWithoutImage
    throw UnimplementedError();
  }

  @override
  Future<http.Response> postRequest(
      {required String url, required Map<String, String> headers, body}) async {
    Uri address = Uri.parse(url);
    try {
      return await http
          .post(address, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 12), onTimeout: () {
        return httpRequestErrorHelper(
            httpMethod: 'POST', error: 'Koneksi keserver habis', url: url);
      });
    } on SocketException {
      return httpRequestErrorHelper(
          httpMethod: 'POST', error: 'Koneksi internet mati', url: url);
    } catch (e) {
      return httpRequestErrorHelper(
          httpMethod: 'POST', error: 'Server sedang sibuk', url: url);
    }
  }
}
