import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  void moveToNewScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  Future<List<int>> getNumOfGuessesList() async {
    final prefs = await SharedPreferences.getInstance();
    final numOfGuess = prefs.get('numOfGuessList') ?? [];
    return numOfGuess as List<int>;
  }

  Future<int> getMaxGuess() async {
    final prefs = await SharedPreferences.getInstance();
    final maxGuess = prefs.getInt('maxGuess') ?? 100;

    return maxGuess;
  }

  Future<int> createNumToGuess() async {
    final maxGuess = await getMaxGuess();
    return Random().nextInt(maxGuess);
  }
}
