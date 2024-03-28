import 'package:get/get.dart';
import 'package:mydudes/controllers/sliding_up_panel_state.dart';
import 'package:mydudes/widgets/meet_sliding_up_panel.dart';
import 'package:mydudes/widgets/search_sliding_up_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingUpPanelController extends GetxController {
  Rx<SlidingUpPanelState> slidingUpPanelState = SlidingUpPanelState(
      minHeight: 0.12,
      maxHeight: 0.8,
      panelBuilder: ((scrollController) =>
          SearchPanelWidget(scrollController: scrollController))).obs;
  PanelController panelController = PanelController();

  void switchSlidingUpPanels(String slidingUpPanel) {
    switch (slidingUpPanel) {
      case "globalSearchPanel":
        slidingUpPanelState.value = SlidingUpPanelState(
            minHeight: 0.12,
            maxHeight: 0.8,
            panelBuilder: ((scrollController) =>
                SearchPanelWidget(scrollController: scrollController)));
        break;
      case "meetPanel":
        slidingUpPanelState.value = SlidingUpPanelState(
            minHeight: 0.4,
            maxHeight: 0.8,
            panelBuilder: ((scrollController) =>
                MeetPanelWidget(scrollController: scrollController)));
        break;
      default:
        slidingUpPanelState.value = SlidingUpPanelState(
            minHeight: 0.12,
            maxHeight: 0.8,
            panelBuilder: ((scrollController) =>
                SearchPanelWidget(scrollController: scrollController)));
    }
  }

  void openSearchPanel() {
    panelController.open();
  }

  void closeSearchPanel() {
    panelController.close();
  }
}
