import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LogByMethodIntercreptor extends LogInterceptor {
  List<String> disabledLogMethods;
  List<String> disabledLogPaths = [];
  
  LogByMethodIntercreptor({this.disabledLogMethods = const ['GET'], disabledLogPaths = const []}) {
    requestHeader = true;
    requestBody = false;
    responseHeader = false;
    responseBody = true;
    logPrint = _logPrint;
  }

  void _logPrint(Object object) {
    try {
      print("class dio_provider: " + object.runtimeType.toString());
      var json = jsonDecode(object.toString());
      JsonEncoder encoder = const JsonEncoder.withIndent('    ');
      String prettyLog = encoder.convert(json);
      log(prettyLog);
    } catch (e) {
      print(object);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler responseInterceptorHandler) async {
    if (disabledLogMethods.contains(response.requestOptions.method.toUpperCase())) {
      //return null;
    }
    for (var path in disabledLogPaths) {
      if (response.requestOptions.path.startsWith(path)) {
        //return null;
      }
    }

    return super.onResponse(response, responseInterceptorHandler);
  }
}