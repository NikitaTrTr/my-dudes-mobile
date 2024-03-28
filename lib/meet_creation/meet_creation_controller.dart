import 'package:get/get.dart';

class MeetCreationController extends GetxController {
  RxInt currentStep = 1.obs;

  void nextStep() {
    currentStep.value = currentStep.value + 1;
  }

  void prevStep() {
    currentStep.value = currentStep.value - 1;
  }
}