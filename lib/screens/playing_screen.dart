import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart'; // package used to create temperature scale

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
  double temperatureMarkerPosition = 50;
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

  // calculates new temperatureScale value to update temperature scale marker position.
  void calculateTemperatureScale() {
    // get user guess
    final userGuess = int.parse(_guessController.text);

    // calculate difference between
    final difference = (numToGuess - userGuess).abs();

    // if difference is low then temperatureScale is low -> red
    // if difference is high then temperatureScale is high -> blue
    temperatureMarkerPosition = difference / Utils().getMaxGuess(ref) * 100;
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
          calculateTemperatureScale();
        }

        prevGuess = userGuess;
        _guessController.text = '';
      });
    }
  }

  // builds temperature scale widget
  Widget buildTemperatureScale(BuildContext context) {
    return SfLinearGauge(
      showTicks: false,
      showLabels: false,
      showAxisTrack: false,
      ranges: [
        // this controls the temperature scale itself
        LinearGaugeRange(
          // startWidth and endWith control size of the color bar, increase to make taller
          startWidth: 10,
          endWidth: 10,
          // do not change startValue and endValue
          startValue: 0,
          endValue: 100,
          shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              // change colours if you want
              colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 255, 191, 0),
                Color.fromARGB(255, 0, 255, 128),
                Color.fromARGB(255, 0, 94, 255)
              ]).createShader(bounds),
        ),
      ],
      markerPointers: [
        // this controls the marker which is rendered on the scale
        LinearShapePointer(
          // temperatureMarkerPosition controls the position of marker
          // should be value between 0 and 100
          value: temperatureMarkerPosition,
          shapeType: LinearShapePointerType.circle,
          elevation: 10,
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // add in the temperature scale widget
          buildTemperatureScale(context),
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
