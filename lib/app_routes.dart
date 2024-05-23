import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/feature/login/binding/login_binding.dart';
import 'package:mydudes/feature/login/login_page.dart';
import 'package:mydudes/feature/map/binding/map_binding.dart';
import 'package:mydudes/feature/meet_creation/binding/meet_creation_binding.dart';
import 'package:mydudes/feature/meet_creation/binding/step_3_binding.dart';
import 'package:mydudes/feature/meet_creation/view/step_1.dart';
import 'package:mydudes/feature/meet_creation/view/step_2.dart';
import 'package:mydudes/feature/map/view/map_page.dart';
import 'package:mydudes/feature/profile/binding/profile_binding.dart';
import 'package:mydudes/feature/profile/widget/progile_page.dart';
import 'package:mydudes/guards/auth_guard.dart';

import 'feature/meet_creation/view/step_3.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: AppLinks.MAP,
        page: () => MapPage(),
        binding: MapBinding(),
        middlewares: [AuthGuard()]),
    GetPage(
        name: AuthLinks.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: MeetCreationLinks.STEP_1,
        page: () => MeetCreationStep1(),
        binding: MeetCreationBinding(),
        middlewares: [AuthGuard()]),
    GetPage(
        name: MeetCreationLinks.STEP_2,
        page: () => MeetCreationStep2(),
        middlewares: [AuthGuard()]),
    GetPage(
        name: MeetCreationLinks.STEP_3,
        page: () => MeetCreationStep3(),
        binding: Step3Binding(),
        middlewares: [AuthGuard()]),
    GetPage(
        name: AppLinks.PROFILE,
        page: () => ProfilePage(),
        middlewares: [AuthGuard()],
        binding: ProfileBinding()),
  ];
}
