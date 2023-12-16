import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/screens/playing_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/custom_button/custom_button.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGuess = Utils().getMaxGuess(ref);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('This is trials a world full of magic.....'),
          Text('You are guessing a number from 1-$maxGuess'),
          CustomButton(
            onPressed: () => Utils().moveToNewScreen(
              context,
              const PlayingScreen(),
            ),
            text: 'Play',
          )
        ],
      ),
    );
  }
}
