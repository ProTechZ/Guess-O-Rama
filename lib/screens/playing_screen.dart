import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';
import 'package:guess_o_rama/screens/results_screen.dart';

class PlayingScreen extends ConsumerStatefulWidget {
  const PlayingScreen({super.key});

  @override
  ConsumerState<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends ConsumerState<PlayingScreen> {
  final _guessController = TextEditingController();
  String temperature = '';
  late int numToGuess;
  int numOfGuesses = 0;
  int? recentGuess;

  @override
  void initState() {
    numToGuess = Utils().createNumToGuess(ref);
    super.initState();
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }

  void calculateUserGuessCloseness() {
    final userGuess = int.parse(_guessController.text);
    final closeness = (userGuess - numToGuess).abs();

    if (userGuess > numToGuess - 25 && userGuess <= numToGuess + 25) {
      print('hi');
      temperature = 'HOOT';
    } else {
      print('bye');
      temperature = 'COOLD';
    }
  }

  void userGuessesCorrectly() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ResultsScreen(),
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
    }
    //  else if (recentGuess != null && userGuess == recentGuess) {
    //   Utils().showErrorDialog(
    //     context,
    //     'My Title',
    //     "Same number",
    //   );
    // }
    else {
      setState(() {
        numOfGuesses++;
        recentGuess = userGuess;

        if (userGuess == numToGuess) {
          userGuessesCorrectly();
        } else {
          calculateUserGuessCloseness();
        }

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
          Text(numToGuess.toString()),
          TextField(
            controller: _guessController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              label: Text('Take a Guess!'),
            ),
          ),
          Text('You have taken $numOfGuesses tries to guess my number'),
          ElevatedButton(onPressed: submitGuess, child: const Text('Guess!')),
          // TODO:  implement restart game and go home btn
        ],
      ),
    );
  }
}
