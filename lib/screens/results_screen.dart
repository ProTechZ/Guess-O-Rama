import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key, required this.numToGuess});
  final int numToGuess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numOfGuessesForRecentGame = Utils().getNumOfGuessesList(ref).last;
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
            numOfGuessesForRecentGame == 1
                ? 'You took $numOfGuessesForRecentGame attempt to guess my number.'
                : 'You took $numOfGuessesForRecentGame attempts to guess my number.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
          ElevatedButton.icon(
            onPressed: () => Utils().moveToNewScreen(
              context,
              const PlayingScreen(),
            ),
            icon: const Icon(Icons.fast_forward),
            label: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Text(
                'Play Again',
                style: textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
