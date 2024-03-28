import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/meet_creation/step_1.dart';
import 'package:mydudes/meet_creation/step_2.dart';
import 'package:mydudes/screens/home_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AppLinks.MAP, page: () => HomeScreen()),
    GetPage(name: MeetCreationLinks.STEP_1, page: () => MeetCreationStep1()),
    GetPage(name: MeetCreationLinks.STEP_2, page: () => MeetCreationStep2()),
    GetPage(name: MeetCreationLinks.STEP_3, page: () => HomeScreen()),
  ];
}
