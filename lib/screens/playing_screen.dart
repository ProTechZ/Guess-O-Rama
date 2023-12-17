import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:guess_o_rama/widgets/default_screen.dart';
import 'package:guess_o_rama/screens/results_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guess_o_rama/functions/utility_functions.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({super.key});

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  final _guessController = TextEditingController();
  double temperatureMarkerPosition = 50;
  Future<int> numToGuessFuture = Utils().createNumToGuess();
  int numOfGuesses = 0;
  int? prevGuess;

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }

  void userGuessesCorrectly() async {
    Utils().moveToNewScreen(
        context, ResultsScreen(numToGuess: await numToGuessFuture));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('numOfGuessList', numOfGuesses);
  }

  void createSnackBar(String snackBarMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.all(10),
        content: Text(snackBarMsg),
      ),
    );
  }

  void submitGuess() async {
    final userGuess = int.tryParse(_guessController.text);
    final numToGuess = await numToGuessFuture;
    var snackBarMsg = '';

    if (userGuess == null) {
      snackBarMsg = 'Maybe you should try guessing a number first?';
    } else if (userGuess < 1 || userGuess > await Utils().getMaxGuess()) {
      snackBarMsg = 'Please enter a value from 1-${Utils().getMaxGuess()}.';
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
      createSnackBar(snackBarMsg);
    }
  }

  void calculateTemperatureScale() async {
    final userGuess = int.parse(_guessController.text);
    final difference = (await numToGuessFuture - userGuess).abs();

    temperatureMarkerPosition = difference / await Utils().getMaxGuess() * 100;
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
