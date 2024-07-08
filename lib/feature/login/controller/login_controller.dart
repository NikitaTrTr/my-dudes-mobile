import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/controllers/user_controller.dart';
import 'package:mydudes/core/repository/auth_repo_impl.dart';
import 'package:mydudes/services/auth_service.dart';

class LoginController extends GetxController {
  Rx<String> login = "".obs;
  Rx<String> password = "".obs;
  Rx<bool> isLoading = false.obs;

  final AuthRepoImpl authRepo = Get.find<AuthRepoImpl>();
  final AuthService authService = Get.find<AuthService>();
  final UserController userController = Get.find<UserController>();

  Future loginUser() async {
    isLoading.value = true;
    try {
      bool isAuthenticated = await authRepo.login(login.value, password.value);
      if (isAuthenticated) {
        userController.setNickname(login.value);
        authService.isAuthenticated = true;
        Get.toNamed(AppLinks.MAP);
      } else {
        authService.isAuthenticated = false;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
