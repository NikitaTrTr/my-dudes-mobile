import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mydudes/services/dio_service.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final DioService _dioService = Get.find<DioService>();

  @override
  Future<bool> login(String login, String password) async {
    dio.Response response;
    try {
      response = await _dioService.dio.post("/api/user/login",
          data: {'login': login, 'password': password});
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
    return response.data;
  }

  @override
  Future logout() async {
    dio.Response response;
    try {
      response = await _dioService.dio.post("/api/user/logout",
          data: {});
    } on DioException catch (exception) {
      print(exception);
      throw Exception(exception.message);
    }
    print(response.data);
  }

  @override
  Future register(String nickname, String firstName, String lastName, String password) async {
    dio.Response response;
    try {
      response = await _dioService.dio.post("/api/user/register",
          data: {});
    } on DioException catch (exception) {
      print(exception);
      throw Exception(exception.message);
    }
    print(response.data);
  }
}
