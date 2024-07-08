import 'package:get/get.dart';

import 'package:mydudes/core/model/user.dart';
import 'package:mydudes/core/repository/user_repo_impl.dart';

class ProfileController extends GetxController {
  Rx<User?> user = Rx<User?>(null);

  final UserRepoImpl _userRepo = Get.find();

  Rx<bool> isLoading = true.obs;

  Future fetchUser(String nickname) async {
    isLoading.value = true;
    try {
      user.value = await _userRepo.getUser(nickname);
    } finally {
      isLoading.value = false;
    }
  }
}