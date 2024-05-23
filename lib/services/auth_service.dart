import 'package:get/get.dart';

class AuthService extends GetxService {
  late bool isAuthenticated;

  @override
  void onInit() {
    isAuthenticated = false;
    return super.onInit();
  }
}
