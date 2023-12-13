import 'package:flutter/material.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class TrialsPlayingScreen extends StatefulWidget {
  const TrialsPlayingScreen({super.key});

  @override
  State<TrialsPlayingScreen> createState() => _TrialsPlayingScreenState();
}

class _TrialsPlayingScreenState extends State<TrialsPlayingScreen> {
  final _guessController = TextEditingController();
  final List<int> listOfGuesses = [];
  // final numToGuess = generateNumToGuess();
  int numOfGuesses = 0;

  void submitGuess() {
    final userGuess = int.tryParse(_guessController.text);

    if (userGuess == null) {
      Utils().showErrorDialog(context, 'My Title', 'Maybe try guessing a number first');
    } else if (listOfGuesses.isNotEmpty && userGuess == listOfGuesses.last) {
      // if the users current guess is the same as their previous guess
      // just to make sure they dont use up too many tries
      Utils().showErrorDialog(
        context,
        'My Title',
        "I could have let you guess the same number and let you have another 'try' added to your count, but I'm nice, so I'm telling you to GUESS ANOTHER NUMBER!!",
      );
    } else {
      setState(() {
        numOfGuesses++;
        listOfGuesses.add(userGuess);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _guessController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Take a Guess!'),
            ),
          ),
          Text('You have taken $numOfGuesses tries to guess my number'),
          ElevatedButton(onPressed: submitGuess, child: const Text('Guess!'))
        ],
      ),
    );
  }
}
