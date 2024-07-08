import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mydudes/core/model/data/user.dart';
import 'package:mydudes/services/dio_service.dart';

class UserRepoImpl {
  final DioService _dioService = Get.find<DioService>();

  Future<User> getUser(String id) async {
    dio.Response response;
    try {
      response = await _dioService.dio.get("/api/mydudes/geo/user/$id",
          options: Options(headers: {"AllowCredentials": true}));
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
    return User.fromJson(response.data);
  }
}
