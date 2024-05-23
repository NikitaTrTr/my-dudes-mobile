import 'dart:math';

import 'package:flutter/material.dart';

class RandomGradientImage extends StatelessWidget {
  const RandomGradientImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: getRandomGradient(),
      ),
    );
  }

  LinearGradient getRandomGradient() {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];
    final Random random = Random();
    final color1 = colors[random.nextInt(colors.length)];
    final color2 = colors[random.nextInt(colors.length)];
    return LinearGradient(
      colors: [color1, color2],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
