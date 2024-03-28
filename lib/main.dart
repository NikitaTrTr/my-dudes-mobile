import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/app_routes.dart';
import 'package:mydudes/constants/theme.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      theme: AppTheme.darkTheme,
      initialRoute: AppLinks.MAP,
      getPages: AppRoutes.pages,
    ));
