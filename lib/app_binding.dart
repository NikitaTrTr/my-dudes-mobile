import 'package:get/get.dart';
import 'package:mydudes/controllers/navigation_bar_controller.dart';
import 'package:mydudes/controllers/user_controller.dart';
import 'package:mydudes/core/repository/auth_repo_impl.dart';
import 'package:mydudes/core/repository/meet_repo_impl.dart';
import 'package:mydudes/core/repository/user_repo_impl.dart';
import 'package:mydudes/services/dio_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    DioService dioService = DioService();
    Get.put(dioService);
    Get.put(BottomNavigationBarController());
    Get.put(AuthRepoImpl());
    Get.put(UserRepoImpl());
    Get.put(MeetRepoImpl());
    Get.put(UserController());
  }
}
