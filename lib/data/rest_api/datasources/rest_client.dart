import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/api_const.dart';
import '../../shared_preferences/authentication_storage.dart';

class RestClient {
  final Dio _dio = Dio();

  final AuthenticationStorage _authenticationStorage = AuthenticationStorage();

  static const int TIME_OUT = 10000;

  RestClient() {
    _dio.options
      ..baseUrl = APIConst.baseUrl
      ..responseType = ResponseType.json
      ..connectTimeout = TIME_OUT
      ..sendTimeout = TIME_OUT
      ..receiveTimeout = TIME_OUT;
  }

  Future<void> _configRequestHeaders() async {
    _dio.options.headers = {
      "Accept": "application/json",
      "content-type": Headers.jsonContentType,
    };

    final String? accessToken = await _authenticationStorage.getToken();
    if (accessToken != null) {
      _dio.options.headers["Bearer"] = accessToken;
    }
  }

  Future<Response<T>> getMethod<T>(String uri, {required Map<String, dynamic> params}) async {
    await _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + params.toString());
    return await _dio.get(uri, queryParameters: params);
  }

  Future<Response<T>> postMethod<T>(String uri, {dynamic data}) async {
    await _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + data.toString());
    return await _dio.post(uri, data: data);
  }

  Future<Response<T>> putMethod<T>(String uri, {dynamic data}) async {
    await _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + data.toString());
    return await _dio.put(uri, data: data);
  }

  Future<Response<T>> deleteMethod<T>(String uri, {required Map<String, dynamic> params}) async {
    await _configRequestHeaders();
    log('rest_client.dart', error: 'REQUEST: ' + params.toString());
    return await _dio.delete(uri, queryParameters: params);
  }
}
