import 'package:get/get.dart';

class UserController extends GetxController {
  late RxString nickname = RxString('');

  void setNickname(String nickname) {
    this.nickname.value = nickname;
  }

  String getUserNickname() {
    return nickname.value;
  }
}
