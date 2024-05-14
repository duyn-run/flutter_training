import 'package:flutter/material.dart';
import 'package:quizapp/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

void rollDice() {}

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 26, 2, 80),
          Color.fromARGB(255, 45, 7, 98)
        ], begin: startAlignment, end: endAlignment),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(),
              child: const StyledText('Roll Dice', 18.5),
            )
          ],
        ),
      ),
    );
  }
}
