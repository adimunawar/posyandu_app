import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:posyandu_app/app/utils/helpers/http_request_error_helper.dart';

class HttpRequestHelper {
  Future<http.Response> deleteRequest(
      {required String url, required Map<String, String> headers}) async {
    Uri address = Uri.parse(url);
    try {
      return await http
          .delete(
        address,
        headers: headers,
      )
          .timeout(const Duration(seconds: 12), onTimeout: () {
        return httpRequestErrorHelper(
            httpMethod: 'DELETE', error: 'Koneksi keserver habis', url: url);
      });
    } on SocketException {
      return httpRequestErrorHelper(
          httpMethod: 'DELETE', error: 'Koneksi internet mati', url: url);
    } catch (e) {
      return httpRequestErrorHelper(
          httpMethod: 'DELETE', error: 'Server sedang sibuk', url: url);
    }
  }

  Future<http.Response> getRequest(
      {required String url, required Map<String, String> headers}) async {
    Uri address = Uri.parse(url);
    try {
      return await http
          .get(
        address,
        headers: headers,
      )
          .timeout(const Duration(seconds: 12), onTimeout: () {
        return httpRequestErrorHelper(
            httpMethod: 'GET', error: 'Koneksi keserver habis', url: url);
      });
    } on SocketException {
      return httpRequestErrorHelper(
          httpMethod: 'GET', error: 'Koneksi internet mati', url: url);
    } catch (e) {
      return httpRequestErrorHelper(
          httpMethod: 'GET', error: 'Server sedang sibuk', url: url);
    }
  }

  Future<http.Response> multipartDeleteRequest(
      {required String url,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartDeleteRequest
    throw UnimplementedError();
  }

  Future<http.Response> multipartPostRequest(
      {required String url,
      required File image,
      required String fileBodyKey,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartPostRequest
    throw UnimplementedError();
  }

  Future<http.Response> multipartPostRequestWithoutImage(
      {required String url,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartPostRequestWithoutImage
    throw UnimplementedError();
  }

  Future<http.Response> postRequest(
      {required String url, required Map<String, String> headers, body}) async {
    Uri address = Uri.parse(url);
    try {
      return await http
          .post(address, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 16), onTimeout: () {
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

  Future<http.Response> putRequest(
      {required String url, required Map<String, String> headers, body}) async {
    Uri address = Uri.parse(url);
    try {
      return await http
          .put(address, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 12), onTimeout: () {
        return httpRequestErrorHelper(
            httpMethod: 'PUT', error: 'Koneksi keserver habis', url: url);
      });
    } on SocketException {
      return httpRequestErrorHelper(
          httpMethod: 'PUT', error: 'Koneksi internet mati', url: url);
    } catch (e) {
      return httpRequestErrorHelper(
          httpMethod: 'PUT', error: 'Server sedang sibuk', url: url);
    }
  }
}
