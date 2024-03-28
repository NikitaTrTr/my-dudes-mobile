import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

class MeetBottomSheet extends StatefulWidget {
  const MeetBottomSheet({super.key});
  @override
  _MeetBottomSheetState createState() => _MeetBottomSheetState();
}

class _MeetBottomSheetState extends State<MeetBottomSheet> {
  SlidingUpPanelController controller = Get.find();
  bool isMeetBottomSheetOpen = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    final width = MediaQuery.of(context).size.width;
    void hideWidget() {
      setState(() {
        isMeetBottomSheetOpen = false;
      });
    }

    return isMeetBottomSheetOpen
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF272727),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: hideWidget,
                            icon: Icon(Icons.arrow_back),
                          ),
                          Text('Some Text'),
                          //IconButton(onPressed: onPressed, icon: icon),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
