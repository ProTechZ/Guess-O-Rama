import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGuess = Utils().getMaxGuess(ref);
    final bodyMediumTheme = Theme.of(context).textTheme.bodyMedium!;
    final bodyLargeTheme = Theme.of(context).textTheme.bodyLarge!;

    return DefaultScreen(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is how you play.',
              textAlign: TextAlign.center,
              style: bodyLargeTheme,
            ),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'The computer will generate a number from 1-$maxGuess.',
                    textAlign: TextAlign.left,
                    style: bodyMediumTheme,
                  ),
                  const Text(
                    'You try to guess what this number.',
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Then we let you know how close you are.',
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Utils().moveToNewScreen(
                context,
                const PlayingScreen(),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Text(
                  'Let\'s Go!',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
