import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:flutter/material.dart';

class Utils {
  List<int> getNumOfGuessesList(WidgetRef ref) =>
      ref.read(numOfGuessesListProvider.notifier).state;

  int getMaxGuess(WidgetRef ref) => ref.read(maxGuessProvider.notifier).state;

  int createNumToGuess(WidgetRef ref) {
    final maxGuess = ref.read(maxGuessProvider.notifier).state;
    return Random().nextInt(maxGuess);
  }

  void showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
