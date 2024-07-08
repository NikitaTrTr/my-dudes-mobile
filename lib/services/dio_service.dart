import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

const BASE_URL = "http://147.45.111.91:8080";

class DioService {
  late Dio _dio;

  DioService() {
    _dio = Dio(BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3)));
    initializeInterceptors();
  }

  Dio get dio => _dio;

  initializeInterceptors() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cookieJar = PersistCookieJar(
      storage: FileStorage('$appDocPath/.cookies/'),
    );
    _dio.interceptors.addAll([
      InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
        if (kDebugMode) {
          print(error);
        }
      }, onRequest: (request, requestInterceptorHandler) {
        if (kDebugMode) {
          print(request);
        }
        requestInterceptorHandler.next(request);
      }, onResponse: (response, responseInterceptorHandler) {
        if (kDebugMode) {
          print(response);
        }
        responseInterceptorHandler.next(response);
      }),
      CookieManager(cookieJar)
    ]);
  }
}
