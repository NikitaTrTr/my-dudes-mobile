import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/services/auth_service.dart';

class AuthGuard extends GetMiddleware {
  final AuthService authService = Get.find<AuthService>();

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (!authService.isAuthenticated) {
      return const RouteSettings(name: AuthLinks.LOGIN);
    }
    return null;
  }
}
