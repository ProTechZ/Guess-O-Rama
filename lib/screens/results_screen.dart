import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/default_button.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.numToGuess,
    required this.numOfGuesses,
  });
  final int numToGuess;
  final int numOfGuesses;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "That's right!\nMy number was $numToGuess.",
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          Text(
            numToGuess == 1
                ? 'You took $numOfGuesses attempt to guess my number.'
                : 'You took $numOfGuesses attempts to guess my number.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
          DefaultButton(
            onPressed: () => Utils().moveToNewScreen(
              context,
              const PlayingScreen(),
            ),
            text: 'Play Again',
            textStyle: textTheme.displayMedium!,
            icon: Icons.fast_forward,
          ),
        ],
      ),
    );
  }
}
