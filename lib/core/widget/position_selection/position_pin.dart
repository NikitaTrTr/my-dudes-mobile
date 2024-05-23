import 'package:flutter/material.dart';

class PositionPin extends StatelessWidget {
  final Widget head;

  const PositionPin({super.key, required this.head});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        head,
        Container(
          width: 4,
          height: 25,
          color: Colors.black,
        ),
      ],
    );
  }
}
