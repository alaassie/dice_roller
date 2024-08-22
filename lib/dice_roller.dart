import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

// Roll Dice Function
class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();
  int counter = 1;
  var currentDiceRoll = 1;
  final player = AudioPlayer();

//Build when execute
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.rotate(
          angle: randomizer.nextDouble() * 180,
          child: Image.asset(
            'assets/images/dice-$currentDiceRoll.png',
            width: 180,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () async {
            await player.setAsset('assets/audios/rolling-dice.mp3');
            player.play();
            Timer.periodic(const Duration(milliseconds: 80), (timer) {
              counter++;
              rollDice();

              if (counter >= 13) {
                timer.cancel();
                setState(() {
                  counter = 1;
                });
              }
            });
          },
          child: const Text('Roll Dice'),
        )
      ],
    );
  }

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }
}
