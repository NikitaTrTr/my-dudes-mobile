import 'package:flutter/material.dart';

import 'action.dart';

class OptionsBottomSheet extends StatelessWidget {
  final List<OptionsBottomSheetAction> actions;

  const OptionsBottomSheet(this.actions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1B1B1B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFF363636)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _addDividers(actions),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _addDividers(List<Widget> widgets) {
    return widgets
        .expand((element) => [
              element,
              const Divider(
                height: 0,
                color: Color(0xFF525252),
              )
            ])
        .toList()
      ..removeLast();
  }
}
