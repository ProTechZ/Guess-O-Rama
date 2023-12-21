import 'dart:math';

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
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _numToGuess;

  final _guessController = TextEditingController();
  double temperatureMarkerPosition = 50;

  int numOfGuesses = 0;
  int? prevGuess;

  @override
  void initState() {
    super.initState();
    _numToGuess = _prefs.then((SharedPreferences prefs) {
      final maxGuess = prefs.getInt('maxGuess') ?? 100;
      return Random().nextInt(maxGuess);
    });
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }

  void moveToResultsScreen() async {
    Utils().moveToNewScreen(
      context,
      ResultsScreen(
        numToGuess: await _numToGuess,
        numOfGuesses: numOfGuesses,
      ),
    );
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
    final currGuess = int.tryParse(_guessController.text);
    final numToGuess = await _numToGuess;
    var snackBarMsg = '';

    if (currGuess == null) {
      snackBarMsg = 'Maybe you should try guessing a number first?';
    } else if (currGuess < 1 || currGuess > await Utils().getMaxGuess()) {
      snackBarMsg =
          'Please enter a value from 1-${await Utils().getMaxGuess()}.';
    } else if (prevGuess != null && currGuess == prevGuess) {
      snackBarMsg = 'You guessed that number last time!';
    } else {
      setState(() {
        numOfGuesses++;

        if (currGuess == numToGuess) {
          moveToResultsScreen();
          FocusManager.instance.primaryFocus?.unfocus();
        } else {
          calculateTemperatureScale();
        }

        prevGuess = currGuess;
      });
    }

    if (snackBarMsg != '') {
      createSnackBar(snackBarMsg);
    }
  }

  void calculateTemperatureScale() async {
    final currGuess = int.parse(_guessController.text);
    final difference = (await _numToGuess - currGuess).abs();

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
      appBarActions: [
        IconButton(
          icon: const Icon(Icons.restart_alt, color: Colors.white),
          onPressed: () => Utils().moveToNewScreen(
            context,
            const PlayingScreen(),
          ),
        )
      ],
      screen: Column(
        children: [
          FutureBuilder(
            future: Utils().getMaxGuess(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                case ConnectionState.done:
                  return Text(
                    'Guess my number from 1-${snapshot.data}!',
                    style: textTheme.bodyLarge!.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  );
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 5,
            ),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 255, 149, 0),
                Color.fromARGB(255, 0, 72, 255),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255)
              ]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: buildTemperatureScale(context),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('HOT'), Text('COLD')],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 40),
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: textTheme.labelMedium,
              controller: _guessController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
