import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = BASE_URL;
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
  }

  CustomDio.withAuthentication() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
    onRequest: _onRequest, onResponse: _onRespose, onError: _onError));
  }

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = await prefs.get('token');
    //print("USANDO $TOKEN");
    options.headers["Authorization"] = "Bearer " + TOKEN;
  }

  _onRespose(Response e) {
    //print("######### RESPONSE: " + e.data.toString());
  }

  _onError(DioError e) {
    print("######### ERRO LOG: " + e.toString());
    return e;
  }
}
