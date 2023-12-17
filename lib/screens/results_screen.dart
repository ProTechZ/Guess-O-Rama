import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.numToGuess});
  final int numToGuess;

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
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                  snapshot.data!.last == 1
                      ? 'You took $snapshot.data attempt to guess my number.'
                      : 'You took $snapshot.data attempts to guess my number.',
                  textAlign: TextAlign.center,
                );
              }
              return const Text('');
            },
            future: Utils().getNumOfGuessesList(),
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
