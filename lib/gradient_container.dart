import 'package:dice/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
          Color.fromARGB(255, 122, 11, 122),
          Color.fromARGB(255, 73, 5, 73),
        ]),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
