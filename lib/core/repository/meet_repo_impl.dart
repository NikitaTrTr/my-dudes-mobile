import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/data/meet_data.dart';
import 'package:mydudes/core/model/data/short_meet_data.dart';
import 'package:mydudes/core/repository/meet_repo.dart';
import 'package:mydudes/core/model/data/create_meet_form_data.dart';
import 'package:mydudes/services/dio_service.dart';

class MeetRepoImpl extends MeetRepo {
  final DioService _dioService = Get.find<DioService>();

  @override
  Future<List<ShortMeetData>> getMeetsAround(Location position) async {
    dio.Response response;
    try {
      response = await _dioService.dio.post("/api/mydudes/geo/party/around",
          data: {
            "latitude": position.latitude.toDouble(),
            "longitude": position.longitude.toDouble()
          },
          options: Options(headers: {"AllowCredentials": true}),
          queryParameters: {'radius': 5});
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }

    return response.data
        .map<ShortMeetData>(
            (json) => ShortMeetData.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> createMeet(CreateMeetFormData meetData) async {
    try {
      await _dioService.dio.post("/api/mydudes/geo/party",
          data: meetData.toJson(),
          options: Options(headers: {"AllowCredentials": true}));
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
    return true;
  }

  @override
  Future<MeetData> getMeet(int id) async {
    dio.Response response;
    try {
      response = await _dioService.dio.get("/api/mydudes/geo/party",
          options: Options(headers: {"AllowCredentials": true}),
          queryParameters: {'id': id});
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
    return MeetData.fromJson(response.data);
  }

  Future kickUser(int id, String userId) async {
    try {
      await _dioService.dio.put("/api/mydudes/geo/party/kick",
          options: Options(headers: {"AllowCredentials": true}),
          queryParameters: {"username": userId, "id": id});
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
  }

  Future createMeetFromDobro(String link) async {
    try {
      await _dioService.dio.post("/api/mydudes/geo/party/integrations/dobro/ru",
          options: Options(headers: {"AllowCredentials": true, "url": link}));
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
  }

  Future joinMeet(int id) async {
    try {
      var response = await _dioService.dio.put("/api/mydudes/geo/party/join",
          options: Options(headers: {"AllowCredentials": true}),
          queryParameters: {"id": id});
      print(response);
    } on DioException catch (exception) {
      print(exception);
      throw Exception(exception.message);
    }
  }

  Future leaveMeet(int id) async {
    try {
      await _dioService.dio.put("/api/mydudes/geo/party/leave",
          options: Options(headers: {"AllowCredentials": true}),
          queryParameters: {"id": id});
    } on DioException catch (exception) {
      throw Exception(exception.message);
    }
  }
}
