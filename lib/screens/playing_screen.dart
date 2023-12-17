import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_o_rama/main.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:guess_o_rama/screens/results_screen.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class PlayingScreen extends ConsumerStatefulWidget {
  const PlayingScreen({super.key});

  @override
  ConsumerState<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends ConsumerState<PlayingScreen> {
  final _guessController = TextEditingController();
  double temperatureMarkerPosition = 50;
  late int numToGuess;
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

  void userGuessesCorrectly() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ResultsScreen(numToGuess: numToGuess),
    ));
    Utils().getNumOfGuessesList(ref).add(numOfGuesses);
  }

  void submitGuess() {
    final userGuess = int.tryParse(_guessController.text);
    var snackBarMsg = '';

    if (userGuess == null) {
      snackBarMsg = 'Maybe you should try guessing a number first?';
    } else if (userGuess < 1 || userGuess > Utils().getMaxGuess(ref)) {
      snackBarMsg = 'Please enter a value from 1-${Utils().getMaxGuess(ref)}.';
    } else if (prevGuess != null && userGuess == prevGuess) {
      snackBarMsg = 'You guessed that number last time!';
    } else {
      setState(() {
        numOfGuesses++;

        if (userGuess == numToGuess) {
          userGuessesCorrectly();
          FocusManager.instance.primaryFocus?.unfocus();
        } else {
          calculateTemperatureScale();
        }

        prevGuess = userGuess;
      });
    }

    if (snackBarMsg != '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          padding: const EdgeInsets.all(10),
          content: Text(snackBarMsg),
        ),
      );
    }
  }

  void calculateTemperatureScale() {
    final userGuess = int.parse(_guessController.text);
    final difference = (numToGuess - userGuess).abs();

    temperatureMarkerPosition = difference / Utils().getMaxGuess(ref) * 100;
  }

  Widget buildTemperatureScale(BuildContext context) {
    return SfLinearGauge(
      showTicks: false,
      showLabels: false,
      showAxisTrack: false,
      ranges: [
        LinearGaugeRange(
          startWidth: 20,
          endWidth: 20,
          startValue: 0,
          endValue: 100,
          shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 255, 149, 0),
                Color.fromARGB(255, 0, 72, 255),
                Color.fromARGB(255, 255, 255, 255)
              ]).createShader(bounds),
        ),
      ],
      markerPointers: [
        LinearShapePointer(
          width: 20,
          height: 20,
          value: temperatureMarkerPosition,
          shapeType: LinearShapePointerType.circle,
          elevation: 1,
          color: Colors.white,
          borderColor: Colors.black,
          borderWidth: 2,
          position: LinearElementPosition.outside,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DefaultScreen(
      useRestart: true,
      body: Column(
        children: [
          buildTemperatureScale(context),
          SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('HOT'), Text('COLD')],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 40),
            child: TextField(
              style: textTheme.labelMedium,
              autofocus: true,
              controller: _guessController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                label: Text(
                  'Guess my number!',
                  style: textTheme.labelSmall,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: submitGuess,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                'Guess!',
                style: textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
