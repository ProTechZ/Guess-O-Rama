import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:guess_o_rama/screens/results_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/widgets/custom_button.dart';

// TODO make conservational
// TODO highscore
// TODO complete design
class PlayingScreen extends ConsumerStatefulWidget {
  const PlayingScreen({super.key});

  @override
  ConsumerState<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends ConsumerState<PlayingScreen> {
  final _guessController = TextEditingController();
  String temperature = '';
  late int numToGuess;
  List<int> listOfGuesses = [];
  int numOfGuesses = 0;
  int? prevGuess;

  @override
  void initState() {
    super.initState();
    numToGuess = Utils().createNumToGuess(ref);
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }

  void calculateTemperature() {
    final userGuess = int.parse(_guessController.text);

    if (userGuess > numToGuess - 5 && userGuess <= numToGuess + 5) {
      temperature = ' SUPER INSANELY ULTRA EXTRA MAX HOT';
    } else if (userGuess > numToGuess - 10 && userGuess <= numToGuess + 10) {
      temperature = ' SUPER DUPER HOT';
    } else if (userGuess > numToGuess - 20 && userGuess <= numToGuess + 20) {
      temperature = ' VERY VERY HOT';
    } else if (userGuess > numToGuess - 30 && userGuess <= numToGuess + 30) {
      temperature = ' REALLY HOT ';
    } else if (userGuess > numToGuess - 40 && userGuess <= numToGuess + 40) {
      temperature = 'HOT';
    } else if (userGuess > numToGuess - 50 && userGuess <= numToGuess + 50) {
      temperature = ' COLD';
    } else if (userGuess > numToGuess - 60 && userGuess <= numToGuess + 60) {
      temperature = ' REALLY COLD';
    } else if (userGuess > numToGuess - 70 && userGuess <= numToGuess + 70) {
      temperature = ' VERY VERY COLD';
    } else if (userGuess > numToGuess - 80 && userGuess <= numToGuess + 80) {
      temperature = ' SUPER DUPER COLD';
    } else if (userGuess > numToGuess - 99 && userGuess <= numToGuess + 99) {
      temperature = ' SUPER INSANELY ULTRA EXTRA MAX COLD';
    }
  }

  void userGuessesCorrectly() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ResultsScreen(numToGuess: numToGuess),
    ));
    Utils().getNumOfGuessesList(ref).add(numOfGuesses);
  }

  void submitGuess() {
    final userGuess = int.tryParse(_guessController.text);

    if (userGuess == null) {
      Utils().showErrorDialog(
        context,
        'My Title',
        'Maybe try guessing a number first',
      );
    } else if (userGuess < 1 || userGuess > 100) {
      Utils().showErrorDialog(
        context,
        'My Title',
        "Please enter a value from 1-100!",
      );
    } else if (prevGuess != null && userGuess == prevGuess) {
      Utils().showErrorDialog(
        context,
        'My Title',
        "Same number",
      );
    } else {
      setState(() {
        numOfGuesses++;

        if (userGuess == numToGuess) {
          userGuessesCorrectly();
        } else {
          calculateTemperature();
        }

        prevGuess = userGuess;
        _guessController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(temperature),
          TextField(
            autofocus: true,
            controller: _guessController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              label: Text('Take a Guess!'),
            ),
          ),
          Text('You have taken $numOfGuesses tries to guess my number'),
          CustomButton(
            text: 'Guess!',
            onPressed: submitGuess,
          ), // TODO:  implement restart game and go home btn
        ],
      ),
    );
  }
}
