import 'package:flutter/material.dart';
import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/widgets/default_button.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultScreen(
      screen: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is how you play.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
            SizedBox(
              height: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(
                          'The computer will generate a number from 1-${snapshot.data}.',
                          textAlign: TextAlign.left,
                          style: textTheme.bodyMedium,
                        );
                      }
                      return const Text('');
                    },
                    future: Utils().getMaxGuess(),
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
            DefaultButton(
              onPressed: () => Utils().moveToNewScreen(
                context,
                const PlayingScreen(),
              ),
              text: "Let's Go!",
              textStyle: textTheme.displayMedium!,
              icon: Icons.start,
            ),
          ],
        ),
      ),
    );
  }
}
