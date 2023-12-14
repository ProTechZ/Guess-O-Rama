import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/screens/playing_screen.dart';

class TrialsLoadingScreen extends ConsumerWidget {
  const TrialsLoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxGuess = Utils().getMaxGuess(ref);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            'This is trials a world full of magic.....',
          ),
          Text(
            'You are guessing a number from 1-$maxGuess',
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TrialsPlayingScreen(),
                ));
              },
              child: const Text('Play!'))
        ],
      ),
    );
  }
}
