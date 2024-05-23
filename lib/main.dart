import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydudes/app_binding.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/app_routes.dart';
import 'package:mydudes/constants/theme.dart';
import 'package:get/get.dart';
import 'package:mydudes/services/auth_service.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppTheme.darkTheme.primaryColor,
    statusBarColor: Colors.black.withOpacity(0.2),
  ));

  Get.put(AuthService());
  runApp(DefaultTextStyle(
      style: const TextStyle(fontFamily: 'Inter'),
      child: GetMaterialApp(
        initialBinding: AppBinding(),
        theme: AppTheme.darkTheme,
        initialRoute: AppLinks.MAP,
        getPages: AppRoutes.pages,
      )));
}
