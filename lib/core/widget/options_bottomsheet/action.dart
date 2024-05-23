import 'package:flutter/material.dart';

class OptionsBottomSheetAction extends StatelessWidget {
  final IconData icon;
  final String actionName;
  final VoidCallback actionFunction;

  const OptionsBottomSheetAction({
    super.key,
    required this.icon,
    required this.actionName,
    required this.actionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          actionFunction();
        },
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 17),
          leading: Icon(icon, size: 25,),
          title: Text(actionName),
        ),
      ),
    );
  }
}
